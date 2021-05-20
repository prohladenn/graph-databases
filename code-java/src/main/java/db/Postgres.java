package db;

import org.jgrapht.Graph;
import org.jgrapht.Graphs;
import org.jgrapht.alg.shortestpath.DijkstraShortestPath;
import org.jgrapht.alg.util.Pair;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.SimpleDirectedGraph;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;

public class Postgres implements Database, Loggable {

    private static final String CREATE_IF_NOT_EXIST = "" +
            "CREATE TABLE IF NOT EXISTS triple (" +
            "    subject   integer NOT NULL," +
            "    predicate integer NOT NULL," +
            "    object    integer NOT NULL," +
            "    PRIMARY KEY (subject, predicate, object)" +
            ");";
    private static final String SELECT_ALL = "SELECT * FROM triple";
    private static final String DELETE_ALL = "TRUNCATE triple";

    private static final String URL = "jdbc:postgresql://localhost:6666/postgres";
    private static final Properties PROPERTIES = new Properties() {{
        setProperty("user", "postgres");
        setProperty("password", "postgres");
    }};

    private final Connection connection;
    private final Statement statement;

    public Postgres() throws SQLException {
        this.connection = DriverManager.getConnection(URL, PROPERTIES);
        this.statement = connection.createStatement();
        statement.execute(CREATE_IF_NOT_EXIST);
    }

    @Override
    public List<?> selectAll() throws SQLException {
        return selectAllImpl();
    }

    private List<Pair<Integer, Integer>> selectAllImpl() throws SQLException {
        var resultSet = statement.executeQuery(SELECT_ALL);
        var result = new ArrayList<Pair<Integer, Integer>>(resultSet.getMetaData().getColumnCount());
        while (resultSet.next()) {
            result.add(new Pair<>(resultSet.getInt(1), resultSet.getInt(3)));
        }
        return result;
    }

    @Override
    public void removeAll() throws SQLException {
        statement.executeUpdate(DELETE_ALL);
    }

    @Override
    public void createGraph(Graph<Integer, DefaultEdge> graph) throws SQLException {
        String values = graph.edgeSet()
                .stream()
                .map(edge -> {
                    var v1 = graph.getEdgeSource(edge);
                    var v2 = graph.getEdgeTarget(edge);
                    return String.format("(%d, 0, %d)", v1, v2);
                })
                .collect(Collectors.joining(", "));

        String query = "INSERT INTO triple VALUES " + values;
        statement.executeUpdate(query);
    }

    private Graph<Integer, DefaultEdge> loadGraph(List<Pair<Integer, Integer>> data) {
        Graph<Integer, DefaultEdge> graph = new SimpleDirectedGraph<>(DefaultEdge.class);
        data.forEach(pair -> {
            graph.addVertex(pair.getFirst());
            graph.addVertex(pair.getSecond());
            graph.addEdge(pair.getFirst(), pair.getSecond());
        });
        return graph;
    }

    @Override
    public List<?> shortestPath(Integer v1, Integer v2) throws SQLException {
        var data = selectAllImpl();
        var graph = loadGraph(data);
        return new DijkstraShortestPath<>(graph).getPath(v1, v2).getEdgeList();
    }

    @Override
    public List<?> nearestNeighbors(Integer v, int level) throws SQLException {
        var data = selectAllImpl();
        var graph = loadGraph(data);
        var result = new HashSet<>(Graphs.neighborListOf(graph, v));
        for (int i = 1; i < level; i++) {
            Set.copyOf(result).forEach(v1 -> result.addAll(Graphs.neighborListOf(graph, v1)));
        }
        return result.stream().distinct().sorted().collect(Collectors.toList());
    }

    @Override
    public LoggableDatabaseImpl loggable() {
        return new LoggableDatabaseImpl(this);
    }

    @Override
    public void close() throws Exception {
        statement.close();
        connection.close();
    }
}
