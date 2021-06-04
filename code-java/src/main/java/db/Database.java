package db;

import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.List;

public interface Database extends AutoCloseable {

    void init() throws Exception;

    void clear() throws Exception;

    void addNode(String v) throws Exception;

    void addEdge(String v1, String v2) throws Exception;

    List<Long> addGraph(Graph<Integer, DefaultEdge> graph) throws Exception;

    List<?> getByNodeAttribute(String va) throws Exception;

    List<?> getByEdgeAttribute(String ea) throws Exception;

    List<?> getShortestPath(String v1, String v2) throws Exception;

    List<?> getNearestNeighbors(String v, int level) throws Exception;
}
