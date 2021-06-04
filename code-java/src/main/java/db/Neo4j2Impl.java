package db;

import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;
import org.neo4j.driver.internal.InternalPath;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class Neo4j2Impl implements Database2 {

    public static final String URI = "bolt://localhost:7687";
    public static final String USER = "neo4j";
    public static final String PASSWORD = "QWErty123";

    private final Driver driver;
    private final Session session;

    public Neo4j2Impl() {
        driver = GraphDatabase.driver(URI, AuthTokens.basic(USER, PASSWORD));
        session = driver.session();
    }

    @Override
    public void init() {
        clear();
    }

    @Override
    public void clear() {
        session.writeTransaction(tx -> tx.run("MATCH (n) DETACH DELETE n;"));
    }

    @Override
    public void addNode(String v) {
        session.writeTransaction(tx -> tx.run(String.format("CREATE (v%s:NODE {id:%s})", v, v)));
    }

    @Override
    public void addEdge(String v1, String v2) {
        session.writeTransaction(tx -> tx.run("MATCH\n" +
                "(v1:NODE), (v2:NODE)\n" +
                "WHERE v1.id = " + v1 + " AND v2.id = " + v2 + "\n" +
                "CREATE (v1)-[r:RELATED]->(v2)\n" +
                "RETURN type(r)"
        ));
    }

    @Override
    public List<Long> addGraph(Graph<Integer, DefaultEdge> graph) {
        // Check data size
        if (graph.vertexSet().size() > 10_000) throw new RuntimeException("To many nodes");
        if (graph.edgeSet().size() > 100_000) throw new RuntimeException("To many edges");

        if (true) {
            return addGraphFixed(graph);
        }

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

    public List<Long> addGraphFixed(Graph<Integer, DefaultEdge> graph) {
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

        var t = System.nanoTime();
        session.writeTransaction(tx -> tx.run("CREATE " + nodes + " CREATE " + edges));
        return List.of(System.nanoTime() - t);
    }

    @Override
    public List<?> getByNodeAttribute(String va) {
        return session.writeTransaction(tx -> tx.run("MATCH (n) -[r]-> (m) RETURN r;")
                .stream().collect(Collectors.toList()));
    }

    @Override
    public List<?> getByEdgeAttribute(String ea) {
        return session.writeTransaction(tx -> tx.run("MATCH (n) -[r]-> (m) RETURN r;")
                .stream().collect(Collectors.toList()));
    }

    private static final String SHORTEST_PATH = "" +
            "MATCH " +
            "   (v1:NODE {id: %s} )," +
            "   (v2:NODE {id: %s})," +
            "   path = shortestPath((v1)-[:RELATED*]-(v2)) " +
            "RETURN path";

    @Override
    public List<?> getShortestPath(String v1, String v2) {
        return session.writeTransaction(tx -> {
            InternalPath path = (InternalPath) tx.run(String.format(SHORTEST_PATH, v1, v2))
                    .single().asMap().get("path");
            return StreamSupport.stream(path.spliterator(), false)
                    .map(segment -> String.format("(%s : %s)",
                            segment.start().asMap().get("id"),
                            segment.end().asMap().get("id")))
                    .collect(Collectors.toList());
        });
    }

    private static final String NEAREST_NEIGHBORS = "" +
            "MATCH (m) -[*1..%d]-> (:NODE{id: %s}) -[*1..%d]-> (n) \n" +
            "RETURN m, n;";

    @Override
    public List<?> getNearestNeighbors(String v, int level) {
        return session.writeTransaction(tx ->
                tx.run(String.format(NEAREST_NEIGHBORS, level, v, level)).stream()
                        .flatMap(record -> Stream.of(
                                record.get("m").asMap().get("id"),
                                record.get("n").asMap().get("id")))
                        .distinct()
                        .sorted()
                        .collect(Collectors.toList())
        );
    }

    @Override
    public void close() {
        session.close();
        driver.close();
    }
}
