package db;

import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.List;

/**
 * Created by valery.kovshov on 6/10/21.
 */
public class LoggableDatabaseImpl implements Database{
    @Override
    public void init() throws Exception {

    }

    @Override
    public void clear() throws Exception {

    }

    @Override
    public void addNode(String v) throws Exception {

    }

    @Override
    public void addEdge(String v1, String v2) throws Exception {

    }

    @Override
    public List<Long> addGraph(Graph<Integer, DefaultEdge> graph) throws Exception {
        return null;
    }

    @Override
    public List<?> getByNodeAttribute(String va) throws Exception {
        return null;
    }

    @Override
    public List<?> getByEdgeAttribute(String ea) throws Exception {
        return null;
    }

    @Override
    public List<?> getShortestPath(String v1, String v2) throws Exception {
        return null;
    }

    @Override
    public List<?> getNearestNeighbors(String v, int level) throws Exception {
        return null;
    }

    @Override
    public void close() throws Exception {

    }
}
