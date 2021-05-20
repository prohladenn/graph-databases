package db.impl;

import db.Database;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.List;

public class LoggableDatabaseImpl implements Database {

    private final Database database;

    public LoggableDatabaseImpl(Database database) {
        this.database = database;
    }

    @Override
    public void close() throws Exception {
        database.close();
    }

    @Override
    public List<?> selectAll() throws Exception {
        System.out.println("Operation 'selectAll'");
        var t = System.nanoTime();
        var result = database.selectAll();
        System.out.println("Select completed with size " + result.size() + " time " + trackTimeSec(t) + " sec \n");
        return result;
    }

    @Override
    public void removeAll() throws Exception {
        System.out.println("Operation 'removeAll'");
        var t = System.nanoTime();
        database.removeAll();
        System.out.println("Remove completed " + trackTimeSec(t) + " sec \n");
    }

    @Override
    public void createGraph(Graph<Integer, DefaultEdge> graph) throws Exception {
        System.out.println("Operation 'createGraph'");
        var t = System.nanoTime();
        database.createGraph(graph);
        System.out.println("Graph created " + trackTimeSec(t) + " sec \n");
    }

    @Override
    public List<?> shortestPath(Integer v1, Integer v2) throws Exception {
        System.out.println("Operation 'shortestPath'");
        var t = System.nanoTime();
        var result = database.shortestPath(v1, v2);
        System.out.println("Shortest path length " + result.size() + " time " + trackTimeSec(t) + " sec \n");
        return result;
    }

    @Override
    public List<?> nearestNeighbors(Integer v, int level) throws Exception {
        System.out.println("Operation 'nearestNeighbors'");
        var t = System.nanoTime();
        var result = database.nearestNeighbors(v, level);
        System.out.println("Nearest neighbors size " + result.size() + " time " + trackTimeSec(t) + " sec \n");
        return result;
    }

    private double trackTimeSec(long t) {
        return (System.nanoTime() - t) / 1e9;
    }
}
