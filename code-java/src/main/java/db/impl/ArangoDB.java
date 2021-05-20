package db.impl;

import com.arangodb.ArangoDatabase;
import com.arangodb.ArangoGraph;
import com.arangodb.entity.DocumentField;
import com.arangodb.entity.DocumentField.Type;
import com.arangodb.entity.EdgeDefinition;
import com.arangodb.entity.VertexEntity;
import db.Database;
import db.Loggable;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ArangoDB implements Database, Loggable {

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

    public ArangoDB() {
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

    @Override
    public LoggableDatabaseImpl loggable() {
        return new LoggableDatabaseImpl(this);
    }

    @Override
    public void close() {
        arangoDB.shutdown();
    }

    @Override
    public List<?> selectAll() {
        var nodes = getAllNodes();
        return getAllEdges();
    }

    private List<String> getAllNodes() {
        List<String> result = new ArrayList<>();
        String queryString = "FOR node IN nodes RETURN node";
        var arangoCursor = db.query(queryString, String.class);
        while (arangoCursor.hasNext()) {
            result.add(arangoCursor.next());
        }
        return result;
    }

    private List<String> getAllEdges() {
        List<String> result = new ArrayList<>();
        String queryString = "FOR edge IN edges RETURN edge";
        var arangoCursor = db.query(queryString, String.class);
        while (arangoCursor.hasNext()) {
            result.add(arangoCursor.next());
        }
        return result;
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

        var vertexCollection = this.graph.vertexCollection(VERTEX_COLLECTION_NAME);
        var edgeCollection = this.graph.edgeCollection(EDGE_COLLECTION_NAME);
        var idToVertexEntity = new HashMap<Integer, VertexEntity>(graph.vertexSet().size());

        graph.vertexSet().forEach(vertex -> idToVertexEntity.put(vertex, vertexCollection.insertVertex(new Node(vertex))));
        graph.edgeSet().forEach(edge -> {
            var v1 = graph.getEdgeSource(edge);
            var v2 = graph.getEdgeTarget(edge);
            edgeCollection.insertEdge(new NodeEdge(idToVertexEntity.get(v1).getId(), idToVertexEntity.get(v2).getId()));
        });
    }

    @Override
    public List<?> shortestPath(Integer v1, Integer v2) {
        return null;
    }

    @Override
    public List<?> nearestNeighbors(Integer v, int level) {
        return null;
    }

    private static class Node {
        @DocumentField(Type.ID)
        private String id;
        @DocumentField(Type.KEY)
        private String value;

        public Node(Integer value) {
            this.value = String.valueOf(value);
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

    private static class NodeEdge {
        @DocumentField(Type.ID)
        private String id;
        @DocumentField(Type.FROM)
        private String from;
        @DocumentField(Type.TO)
        private String to;

        public NodeEdge(String from, String to) {
            this.from = from;
            this.to = to;
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getFrom() {
            return from;
        }

        public void setFrom(String from) {
            this.from = from;
        }

        public String getTo() {
            return to;
        }

        public void setTo(String to) {
            this.to = to;
        }
    }
}
