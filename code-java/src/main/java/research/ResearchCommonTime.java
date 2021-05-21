package research;

import data.Source;
import org.jgrapht.Graph;
import org.jgrapht.Graphs;
import org.jgrapht.alg.shortestpath.BellmanFordShortestPath;
import org.jgrapht.alg.shortestpath.DijkstraShortestPath;
import org.jgrapht.graph.DefaultEdge;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class ResearchCommonTime {

    public static void main(String[] args) throws IOException {
        // TESTS FOR COLLEGE GRAPH
        tests(Source.COLLEGE);

        // TESTS FOR GNUTELLA GRAPH
        tests(Source.GNUTELLA);

        // TESTS FOR FACEBOOK GRAPH
        tests(Source.FACEBOOK);
    }

    private static void tests(Source source) throws IOException {
        final Graph<Integer, DefaultEdge> graph = Source.Utils.loadGraph(source);
        findNeighbors(source, graph);

        findDijkstraShortestPathToFirst(source, graph);
        findBellmanFordShortestPathToFirst(source, graph);

        findDijkstraShortestPathToMiddle(source, graph);
        findBellmanFordShortestPathToMiddle(source, graph);

        findDijkstraShortestPathToLast(source, graph);
        findBellmanFordShortestPathToLast(source, graph);
    }

    private static void findNeighbors(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);

        System.out.println("Start find neighbors for each " + source.getName() + " vertex (repeat 1000)");

        var global_start = System.nanoTime();
        for (Integer vertex : graph.vertexSet()) {
            var time = System.nanoTime();
            for (int i = 0; i < 1000; i++) {
                Graphs.neighborListOf(graph, vertex);
            }
            vertexToTime.put(vertex, System.nanoTime() - time);
        }
        var global_finish = System.nanoTime();

        System.out.println("Finish find neighbors for each " + source.getName() + " vertex (repeat 1000)\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findDijkstraShortestPathToFirst(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);
        var to = graph.vertexSet().toArray(Integer[]::new)[0];

        System.out.println("Start find shortest path (Dijkstra) for each " + source.getName() + " vertex to first vertex " + to);
        var global_start = System.nanoTime();
        findDijkstraShortestPathTo(graph, to, vertexToTime);
        var global_finish = System.nanoTime();
        System.out.println("Finish find shortest path (Dijkstra) for each " + source.getName() + " vertex to first vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findDijkstraShortestPathToMiddle(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);
        var to = graph.vertexSet().toArray(Integer[]::new)[source.getNodes() / 2];

        System.out.println("Start find shortest path (Dijkstra) for each " + source.getName() + " vertex to middle vertex " + to);
        var global_start = System.nanoTime();
        findDijkstraShortestPathTo(graph, to, vertexToTime);
        var global_finish = System.nanoTime();
        System.out.println("Finish find shortest path (Dijkstra) for each " + source.getName() + " vertex to middle vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findDijkstraShortestPathToLast(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);
        var to = graph.vertexSet().toArray(Integer[]::new)[source.getNodes() - 1];

        System.out.println("Start find shortest path (Dijkstra) for each " + source.getName() + " vertex to last vertex " + to);
        var global_start = System.nanoTime();
        findDijkstraShortestPathTo(graph, to, vertexToTime);
        var global_finish = System.nanoTime();
        System.out.println("Finish find shortest path (Dijkstra) for each " + source.getName() + " vertex to last vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findDijkstraShortestPathTo(Graph<Integer, DefaultEdge> graph, int to, Map<Integer, Long> vertexToTime) {
        for (Integer vertex : graph.vertexSet()) {
            var time = System.nanoTime();
            new DijkstraShortestPath<>(graph).getPath(vertex, to);
            vertexToTime.put(vertex, System.nanoTime() - time);
        }
    }

    private static void findBellmanFordShortestPathToFirst(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);
        var to = graph.vertexSet().toArray(Integer[]::new)[0];

        System.out.println("Start find shortest path (BellmanFord) for each " + source.getName() + " vertex to first vertex " + to);
        var global_start = System.nanoTime();
        findBellmanFordShortestPathTo(graph, to, vertexToTime);
        var global_finish = System.nanoTime();
        System.out.println("Finish find shortest path (BellmanFord) for each " + source.getName() + " vertex to first vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findBellmanFordShortestPathToMiddle(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);
        var to = graph.vertexSet().toArray(Integer[]::new)[source.getNodes() / 2];

        System.out.println("Start find shortest path (BellmanFord) for each " + source.getName() + " vertex to middle vertex " + to);
        var global_start = System.nanoTime();
        findBellmanFordShortestPathTo(graph, to, vertexToTime);
        var global_finish = System.nanoTime();
        System.out.println("Finish find shortest path (BellmanFord) for each " + source.getName() + " vertex to middle vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findBellmanFordShortestPathToLast(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.getNodes() + 1);
        var to = graph.vertexSet().toArray(Integer[]::new)[source.getNodes() - 1];

        System.out.println("Start find shortest path (BellmanFord) for each " + source.getName() + " vertex to last vertex " + to);
        var global_start = System.nanoTime();
        findBellmanFordShortestPathTo(graph, to, vertexToTime);
        var global_finish = System.nanoTime();
        System.out.println("Finish find shortest path (BellmanFord) for each " + source.getName() + " vertex to last vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop10(vertexToTime);
    }

    private static void findBellmanFordShortestPathTo(Graph<Integer, DefaultEdge> graph, int to, Map<Integer, Long> vertexToTime) {
        for (Integer vertex : graph.vertexSet()) {
            var time = System.nanoTime();
            new BellmanFordShortestPath<>(graph).getPath(vertex, to);
            vertexToTime.put(vertex, System.nanoTime() - time);
        }
    }

    private static void reportTop10(HashMap<Integer, Long> vertexToTime) {
        System.out.println("Most expensive (nano sec : vertex):");
        vertexToTime.entrySet().stream()
                .sorted(Collections.reverseOrder(Comparator.comparingLong(Map.Entry::getValue)))
                .limit(10)
                .forEach(entry -> System.out.println(entry.getValue() + " : " + entry.getKey()));
        System.out.println();
    }
}
