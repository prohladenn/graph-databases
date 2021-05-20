package db.impl;

import db.Database;
import db.Loggable;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;
import org.neo4j.driver.internal.InternalPath;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class Neo4j implements Database, Loggable {
    private static final String SELECT_ALL = "" +
            "MATCH (n) " +
            "RETURN n;";
    private static final String DELETE_ALL = "" +
            "MATCH (n) " +
            "DETACH DELETE n;";
    private static final String SHORTEST_PATH = "" +
            "MATCH " +
            "   (v1:NODE {id: %d} )," +
            "   (v2:NODE {id: %d})," +
            "   path = shortestPath((v1)-[:RELATED*]-(v2)) " +
            "RETURN path";
    private static final String NEAREST_NEIGHBORS = "" +
            "MATCH (m) -[*1..%d]-> (:NODE{id: %d}) -[*1..%d]-> (n) \n" +
            "RETURN m, n;";

    public static final String URI = "bolt://localhost:7687";
    public static final String USER = "neo4j";
    public static final String PASSWORD = "QWErty123";

    private final Driver driver;
    private final Session session;

    public Neo4j() {
        driver = GraphDatabase.driver(URI, AuthTokens.basic(USER, PASSWORD));
        session = driver.session();
    }

    @Override
    public LoggableDatabaseImpl loggable() {
        return new LoggableDatabaseImpl(this);
    }

    @Override
    public void close() {
        session.close();
        driver.close();
    }

    @Override
    public List<?> selectAll() {
        return session.writeTransaction(tx -> tx.run(SELECT_ALL).stream().collect(Collectors.toList()));
    }

    @Override
    public void removeAll() {
        session.writeTransaction(tx -> tx.run(DELETE_ALL));
    }

    @Override
    public void createGraph(Graph<Integer, DefaultEdge> graph) {
        // Check data size
        if (graph.vertexSet().size() > 10_000) throw new RuntimeException("To many nodes");
        if (graph.edgeSet().size() > 100_000) throw new RuntimeException("To many edges");

        // Render nodes
        String nodes = graph.vertexSet()
                .stream()
                .map(i -> String.format("(a%d:NODE{id:%d})", i, i))
                .collect(Collectors.joining(", "));

        // Render edges
        String edges = graph.edgeSet()
                .stream()
                .map(edge -> {
                    var v1 = graph.getEdgeSource(edge);
                    var v2 = graph.getEdgeTarget(edge);
                    return String.format("(a%d)-[:RELATED]->(a%d)", v1, v2);
                })
                .collect(Collectors.joining(", "));

        // Resulted queue
        String query = "CREATE " + nodes + " CREATE " + edges;

        session.writeTransaction(tx -> tx.run(query));
    }

    @Override
    public List<String> shortestPath(Integer v1, Integer v2) {
        return session.writeTransaction(tx -> {
            InternalPath path = (InternalPath) tx.run(String.format(SHORTEST_PATH, v1, v2)).single().asMap().get("path");
            return StreamSupport.stream(path.spliterator(), false)
                    .map(segment -> String.format("(%s : %s)", segment.start().asMap().get("id"), segment.end().asMap().get("id")))
                    .collect(Collectors.toList());
        });
    }

    @Override
    public List<?> nearestNeighbors(Integer v, int level) {
        return session.writeTransaction(tx ->
                tx.run(String.format(NEAREST_NEIGHBORS, level, v, level)).stream()
                        .flatMap(record -> Stream.of(record.get("m").asMap().get("id"), record.get("n").asMap().get("id")))
                        .distinct()
                        .sorted()
                        .collect(Collectors.toList())
        );
    }
}
