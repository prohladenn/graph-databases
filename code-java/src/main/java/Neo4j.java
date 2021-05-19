import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

public class Neo4j implements AutoCloseable {
    private static final String SELECT_ALL = "MATCH (n) RETURN n;";
    private static final String DELETE_ALL = "MATCH (n) DETACH DELETE n;";

    private final Driver driver;

    public Neo4j(String uri, String user, String password) {
        driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }

    @Override
    public void close() {
        driver.close();
    }

    public List<?> selectAll() {
        System.out.println("Operation 'selectAll'");
        try (Session session = driver.session()) {

            var t = System.nanoTime();
            var result = session.writeTransaction(tx -> tx.run(SELECT_ALL).stream().collect(Collectors.toList()));
            System.out.println("Select size " + result.size() + " time " + (System.nanoTime() - t) / 1e9 + " sec \n");
            return result;
        }
    }

    public void removeAll() {
        System.out.println("Operation 'removeAll'");
        try (Session session = driver.session()) {

            var t = System.nanoTime();
            session.writeTransaction(tx -> tx.run(DELETE_ALL));
            System.out.println("Remove completed " + (System.nanoTime() - t) / 1e9 + " sec \n");
        }
    }

    public void createGraph(Graph<Integer, DefaultEdge> graph) {
        System.out.println("Operation 'createGraph'");
        try (Session session = driver.session()) {
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
            String queue = "CREATE " + nodes + " CREATE " + edges;

            var t = System.nanoTime();
            session.writeTransaction(tx -> tx.run(queue));
            System.out.println("Graph created " + (System.nanoTime() - t) / 1e9 + "sec \n");
        }
    }

    public static void main(String[] args) throws IOException {
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();

        try (Neo4j neo4j = new Neo4j("bolt://localhost:7687", "neo4j", "QWErty123")) {
            neo4j.selectAll();
            neo4j.removeAll();
            neo4j.selectAll();
            neo4j.createGraph(graph);
        }
    }
}
