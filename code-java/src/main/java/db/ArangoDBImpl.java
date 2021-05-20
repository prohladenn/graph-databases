package db;

import com.arangodb.ArangoDatabase;
import com.arangodb.ArangoGraph;
import com.arangodb.entity.DocumentField;
import com.arangodb.entity.DocumentField.Type;
import com.arangodb.entity.EdgeDefinition;
import com.arangodb.entity.VertexEntity;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ArangoDBImpl implements Database, Loggable {

    private static final String DB_NAME = "graph_db";
    private static final String GRAPH_NAME = "graph";
    private static final String EDGE_COLLECTION_NAME = "edges";
    private static final String VERTEX_COLLECTION_NAME = "nodes";

    private static final EdgeDefinition EDGE_DEFINITION = new EdgeDefinition()
            .collection(EDGE_COLLECTION_NAME)
            .from(VERTEX_COLLECTION_NAME)
            .to(VERTEX_COLLECTION_NAME);

    private final com.arangodb.ArangoDB arangoDB;
    private final ArangoDatabase db;
    private ArangoGraph graph;

    public ArangoDBImpl() {
        arangoDB = new com.arangodb.ArangoDB.Builder().build();

        if (!arangoDB.db(DB_NAME).exists()) {
            arangoDB.createDatabase(DB_NAME);
        }
        db = arangoDB.db(DB_NAME);

        if (!db.graph(GRAPH_NAME).exists()) {
            db.createGraph(GRAPH_NAME, List.of(EDGE_DEFINITION), null);
        }
        graph = db.graph(GRAPH_NAME);
    }

    private <T> List<T> execute(String q, Class<T> tClass) throws Exception {
        List<T> result = new ArrayList<>();
        var arangoCursor = db.query(q, String.class);
        while (arangoCursor.hasNext()) {
            Object[] cells = arangoCursor.next().replaceAll("[\\[\\]\"]", "").split(",");
            var params = Collections.nCopies(cells.length, String.class).toArray(Class[]::new);
            result.add(tClass.getConstructor(params).newInstance(cells));
        }
        return result;
    }

    private List<Node> getAllNodes() throws Exception {
        return execute("FOR node IN nodes RETURN [node._id, node._key]", Node.class);
    }

    private List<NodeEdge> getAllEdges() throws Exception {
        return execute("FOR edge IN edges RETURN [edge._id, edge._from, edge._to]", NodeEdge.class);
    }

    @Override
    public List<?> selectAll() throws Exception {
        var nodes = getAllNodes();
        return getAllEdges(); // TODO merge with info about nodes
    }

    @Override
    public List<?> shortestPath(Integer v1, Integer v2) throws Exception {
        String q = String.format("FOR v IN OUTBOUND SHORTEST_PATH 'nodes/%d' TO 'nodes/%d' " +
                "GRAPH 'graph' RETURN [v._id, v._key]", v1, v2);
        return execute(q, Node.class);
    }

    @Override
    public List<?> nearestNeighbors(Integer v, int level) throws Exception {
        String qIn = String.format("FOR v IN 1..%d INBOUND 'nodes/%d' " +
                "GRAPH 'graph' RETURN v._key", level, v);
        String qOut = String.format("FOR v IN 1..%d OUTBOUND 'nodes/%d' " +
                "GRAPH 'graph' RETURN v._key", level, v);
        return Stream.concat(
                execute(qIn, Integer.class).stream(),
                execute(qOut, Integer.class).stream()
        ).distinct().sorted().collect(Collectors.toList());
    }

    @Override
    public void removeAll() {
        if (graph.exists()) {
            graph.drop();
            db.collection("edges").drop();
            db.collection("nodes").drop();
        }
        db.createGraph(GRAPH_NAME, List.of(EDGE_DEFINITION), null);
        graph = db.graph(GRAPH_NAME);
    }

    @Override
    public void createGraph(Graph<Integer, DefaultEdge> graph) {
        // Check data size
        if (graph.vertexSet().size() > 10_000) throw new RuntimeException("To many nodes");
        if (graph.edgeSet().size() > 100_000) throw new RuntimeException("To many edges");

        // Insert nodes
        var vertexCollection = this.graph.vertexCollection(VERTEX_COLLECTION_NAME);
        var idToVertexEntity = new HashMap<Integer, VertexEntity>(graph.vertexSet().size());
        graph.vertexSet().forEach(vertex ->
                idToVertexEntity.put(vertex, vertexCollection.insertVertex(new Node(vertex))));

        // Insert edges
        var edgeCollection = this.graph.edgeCollection(EDGE_COLLECTION_NAME);
        graph.edgeSet().forEach(edge -> {
            var v1 = graph.getEdgeSource(edge);
            var v2 = graph.getEdgeTarget(edge);
            edgeCollection.insertEdge(new NodeEdge(
                    idToVertexEntity.get(v1).getId(),
                    idToVertexEntity.get(v2).getId()));
        });
    }

    @Override
    public void close() {
        arangoDB.shutdown();
    }

    @Override
    public LoggableDatabaseImpl loggable() {
        return new LoggableDatabaseImpl(this);
    }

    private static class Node {
        @DocumentField(Type.ID)
        private String id;
        @DocumentField(Type.KEY)
        private final String value;

        @SuppressWarnings({"unused", "RedundantSuppression"}) //Used vie reflection
        public Node(String id, String value) {
            this.id = id;
            this.value = value;
        }

        public Node(Integer value) {
            this.value = String.valueOf(value);
        }

        @Override
        public String toString() {
            return value;
        }
    }

    private static class NodeEdge {
        @DocumentField(Type.ID)
        private String id;
        @DocumentField(Type.FROM)
        private final String from;
        @DocumentField(Type.TO)
        private final String to;

        @SuppressWarnings({"unused", "RedundantSuppression"}) //Used vie reflection
        public NodeEdge(String id, String from, String to) {
            this.id = id;
            this.from = from;
            this.to = to;
        }

        public NodeEdge(String from, String to) {
            this.from = from;
            this.to = to;
        }

        @Override
        public String toString() {
            return String.format("(%s : %s)", from, to);
        }
    }
}
