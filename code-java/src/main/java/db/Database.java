package db;

import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.List;

public interface Database extends AutoCloseable {

    /**
     * Get all nodes and edges from the database.
     *
     * @return all nodes and edges.
     */
    List<?> selectAll() throws Exception;

    /**
     * Find the shortest path between two nodes of a graph.
     *
     * @param v1 first node id.
     * @param v2 second node id.
     * @return shortest path.
     */
    List<?> shortestPath(Integer v1, Integer v2) throws Exception;

    /**
     * Find all nearest neighbors of the specified node on the specified level.
     *
     * @param v     node id.
     * @param level level.
     * @return nearest neighbors.
     */
    List<?> nearestNeighbors(Integer v, int level) throws Exception;

    /**
     * Remove all nodes and edges from the database.
     */
    void removeAll() throws Exception;

    /**
     * Creates in the database a graph identical to the input.
     *
     * @param graph input graph.
     */
    void createGraph(Graph<Integer, DefaultEdge> graph) throws Exception;
}
