package db;

import org.jgrapht.Graph;
import org.jgrapht.GraphPath;
import org.jgrapht.Graphs;
import org.jgrapht.alg.shortestpath.DijkstraShortestPath;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.SimpleDirectedGraph;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;

public class PostgresImpl implements Database2 {

    private static final String CREATE_IF_NOT_EXIST = "" +
            "DROP TABLE IF EXISTS entity CASCADE;\n" +
            "CREATE TABLE entity\n" +
            "(\n" +
            "    id       SERIAL PRIMARY KEY,\n" +
            "    title    varchar(30) UNIQUE NOT NULL,\n" +
            "    property jsonb\n" +
            ");\n" +
            "\n" +
            "DROP TABLE IF EXISTS predicate CASCADE;\n" +
            "CREATE TABLE predicate\n" +
            "(\n" +
            "    id    SERIAL PRIMARY KEY,\n" +
            "    title varchar(15) UNIQUE NOT NULL\n" +
            ");\n" +
            "\n" +
            "DROP TABLE IF EXISTS triple;\n" +
            "CREATE TABLE triple\n" +
            "(\n" +
            "    subject   integer NOT NULL REFERENCES entity (id),\n" +
            "    predicate integer NOT NULL REFERENCES predicate (id),\n" +
            "    object    integer NOT NULL REFERENCES entity (id),\n" +
            "    property  jsonb,\n" +
            "    PRIMARY KEY (subject, predicate, object)\n" +
            ");\n" +
            "\n" +
            "INSERT INTO predicate (title)\n" +
            "VALUES ('DEPENDENT')\n" +
            "ON CONFLICT DO NOTHING;\n;" +
            "\n" +
            "DROP FUNCTION IF EXISTS getEntity;\n" +
            "CREATE FUNCTION getEntity(varchar) RETURNS integer\n" +
            "AS 'SELECT id FROM entity WHERE title = $1;'\n" +
            "    LANGUAGE SQL\n" +
            "    IMMUTABLE\n" +
            "    RETURNS NULL ON NULL INPUT;\n";


    private static final String ADD_NODE = "" +
            "INSERT INTO entity (title)\n" +
            "VALUES ('v%s')\n" +
            "ON CONFLICT DO NOTHING;";

    private static final String ADD_EDGE = "" +
            "INSERT INTO triple (subject, predicate, object)\n" +
            "SELECT getEntity('v%s'), 1, getEntity('v%s');";

    private static final String GET_ALL_EDGES = "" +
            "SELECT\n" +
            "       es.title AS subject,\n" +
            "       es.property AS subject_property,\n" +
            "       p.title AS predicate,\n" +
            "       t.property AS predicate_property,\n" +
            "       eo.title AS object,\n" +
            "       eo.property AS object_property\n" +
            "FROM triple t\n" +
            "         JOIN predicate p ON t.predicate = p.id\n" +
            "         JOIN entity es ON t.subject = es.id\n" +
            "         JOIN entity eo ON t.object = eo.id\n";

    private static final String GET_BY_NODE_ATTRIBUTE = GET_ALL_EDGES + "" +
            "WHERE es.property::TEXT LIKE '%' || '%s' || '%' OR\n" +
            "      eo.property::TEXT LIKE '%' || '%s' || '%';";

    private static final String GET_BY_EDGE_ATTRIBUTE = GET_ALL_EDGES + "" +
            "WHERE t.property::TEXT LIKE '%' || '%s' || '%';";

    private static final String URL = "jdbc:postgresql://localhost:6666/postgres";
    private static final Properties PROPERTIES = new Properties() {{
        setProperty("user", "postgres");
        setProperty("password", "postgres");
    }};

    private final Connection connection;
    private final Statement statement;

    public PostgresImpl() throws SQLException {
        this.connection = DriverManager.getConnection(URL, PROPERTIES);
        this.statement = connection.createStatement();
    }

    @Override
    public void init() throws Exception {
        statement.execute(CREATE_IF_NOT_EXIST);
    }

    @Override
    public void clear() throws Exception {
        statement.executeUpdate("TRUNCATE triple");
        statement.executeUpdate("TRUNCATE entity");
        //statement.executeUpdate("TRUNCATE predicate");
    }

    @Override
    public void addNode(String v) throws Exception {
        statement.execute(String.format(ADD_NODE, v));
    }

    @Override
    public void addEdge(String v1, String v2) throws Exception {
        statement.execute(String.format(ADD_EDGE, v1, v2));
    }

    @Override
    public List<Long> addGraph(Graph<Integer, DefaultEdge> graph) throws Exception {
        for (var v : graph.vertexSet()) {
            addNode(v.toString());
        }

        var time = new ArrayList<Long>(graph.edgeSet().size());

        for (var e : graph.edgeSet()) {
            var v1 = graph.getEdgeSource(e);
            var v2 = graph.getEdgeTarget(e);
            var t = System.nanoTime();
            addEdge(v1.toString(), v2.toString());
            time.add(System.nanoTime() - t);
        }

        return time;
    }

    private List<List<String>> convertResult(ResultSet resultSet) throws SQLException {
        var result = new ArrayList<List<String>>(resultSet.getMetaData().getColumnCount());
        while (resultSet.next()) {
            result.add(
                    List.of(
                            Optional.ofNullable(resultSet.getString(1)).orElse(""),
                            Optional.ofNullable(resultSet.getString(2)).orElse(""),
                            Optional.ofNullable(resultSet.getString(3)).orElse(""),
                            Optional.ofNullable(resultSet.getString(4)).orElse(""),
                            Optional.ofNullable(resultSet.getString(5)).orElse(""),
                            Optional.ofNullable(resultSet.getString(6)).orElse("")
                    )
            );
        }
        return result;
    }

    public List<?> getAllEdges() throws Exception {
        var resultSet = statement.executeQuery(GET_ALL_EDGES);
        return convertResult(resultSet);
    }

    @Override
    public List<?> getByNodeAttribute(String va) throws Exception {
        var resultSet = statement.executeQuery(GET_BY_NODE_ATTRIBUTE.replaceAll("%s", va));
        return convertResult(resultSet);
    }

    @Override
    public List<?> getByEdgeAttribute(String ea) throws Exception {
        var resultSet = statement.executeQuery(GET_BY_EDGE_ATTRIBUTE.replace("%s", ea));
        return convertResult(resultSet);
    }

    private Graph<Integer, DefaultEdge> loadGraph(List<List<String>> data) {
        Graph<Integer, DefaultEdge> graph = new SimpleDirectedGraph<>(DefaultEdge.class);
        data.forEach(row -> {
            var v1 = Integer.parseInt(row.get(0).substring(1));
            var v2 = Integer.parseInt(row.get(4).substring(1));
            graph.addVertex(v1);
            graph.addVertex(v2);
            graph.addEdge(v1, v2);
        });
        return graph;
    }

    @Override
    public List<?> getShortestPath(String v1, String v2) throws Exception {
        if (v1.startsWith("v")) {
            v1 = v1.substring(1);
        }
        if (v2.startsWith("v")) {
            v2 = v2.substring(1);
        }

        var data = convertResult(statement.executeQuery(GET_ALL_EDGES));
        var graph = loadGraph(data);

        return Optional.ofNullable(new DijkstraShortestPath<>(graph)
                .getPath(Integer.parseInt(v1), Integer.parseInt(v2)))
                .map(GraphPath::getEdgeList)
                .orElse(List.of());
    }

    @Override
    public List<?> getNearestNeighbors(String v, int level) throws Exception {
        var data = convertResult(statement.executeQuery(GET_ALL_EDGES));
        var graph = loadGraph(data);

        var result = new HashSet<>(Graphs.neighborListOf(graph, Integer.parseInt(v.substring(1))));
        for (int i = 1; i < level; i++) {
            Set.copyOf(result).forEach(v1 -> result.addAll(Graphs.neighborListOf(graph, v1)));
        }
        return result.stream().distinct().sorted().collect(Collectors.toList());
    }

    @Override
    public void close() throws Exception {
        statement.close();
        connection.close();
    }
}
