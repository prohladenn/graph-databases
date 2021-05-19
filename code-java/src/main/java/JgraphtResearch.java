import org.jgrapht.Graph;
import org.jgrapht.Graphs;
import org.jgrapht.alg.shortestpath.BellmanFordShortestPath;
import org.jgrapht.alg.shortestpath.DijkstraShortestPath;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.SimpleDirectedGraph;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class JgraphtResearch {

    //https://snap.stanford.edu/data/amazon0302.html
    public static final Source AMAZON = new Source("AMAZON", new File("db/bigdata/amazon0302.txt"), 262111, 1234877);

    // https://snap.stanford.edu/data/web-Google.html
    public static final Source GOOGLE = new Source("GOOGLE", new File("db/bigdata/web-Google.txt"), 875713, 5105039);

    public static void main(String[] args) throws IOException {
        final Graph<Integer, DefaultEdge> graphAmazon;
        final Graph<Integer, DefaultEdge> graphGoogle;

        // LOAD GRAPHS
        {
            // Time~2.8 sec
            System.out.println("Start load AMAZON graph");
            var t1a = System.nanoTime();
            graphAmazon = loadGraph(AMAZON);
            var t2a = System.nanoTime();
            System.out.println("Finish load AMAZON graph\nTotal time " + ((t2a - t1a) / 1e9) + " sec\n");

            // Time~15 sec
            System.out.println("Start load GOOGLE graph");
            var t1g = System.nanoTime();
            graphGoogle = loadGraph(GOOGLE);
            var t2g = System.nanoTime();
            System.out.println("Finish load GOOGLE graph\nTotal time " + ((t2g - t1g) / 1e9) + " sec\n");
        }

        // FIND NEIGHBORS
        {
            // Time~1 sec
            findNeighbors(AMAZON, graphAmazon);

            // Time~2 sec
            findNeighbors(GOOGLE, graphGoogle);
        }

        // SHORTEST PATH DIJKSTRA
        {
            // Time~
            findDijkstraShortestPath(AMAZON, graphAmazon);

            // Time~
            findDijkstraShortestPath(GOOGLE, graphGoogle);
        }

        // SHORTEST PATH BELLMAN FORD
        {
            // Time~
            findBellmanFordShortestPath(AMAZON, graphAmazon);

            // Time~
            findBellmanFordShortestPath(GOOGLE, graphGoogle);
        }
    }

    private static Graph<Integer, DefaultEdge> loadGraph(Source source) throws IOException {
        if (!source.file.exists()) {
            throw new FileNotFoundException("File" + source.file.getAbsolutePath() + " not found");
        }

        if (!source.file.isFile()) {
            throw new FileNotFoundException("File" + source.file.getAbsolutePath() + " is not a file");
        }

        Graph<Integer, DefaultEdge> graph = new SimpleDirectedGraph<>(DefaultEdge.class);
        try (BufferedReader br = new BufferedReader(new FileReader(source.file))) {
            String line;
            while ((line = br.readLine()) != null) {
                int separator = line.indexOf(9);

                int v1 = Integer.parseInt(line.substring(0, separator));
                int v2 = Integer.parseInt(line.substring(separator + 1));

                graph.addVertex(v1);
                graph.addVertex(v2);

                graph.addEdge(v1, v2);
            }
        }

        if (graph.vertexSet().size() != source.nodes) {
            throw new IllegalStateException("Nodes expected count " + source.nodes + " but actual count " + graph.vertexSet().size());
        }

        if (graph.edgeSet().size() != source.edges) {
            throw new IllegalStateException("Edges expected count " + source.edges + " but actual count " + graph.edgeSet().size());
        }

        return graph;
    }

    private static void findNeighbors(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.nodes + 1);

        System.out.println("Start find neighbors for each " + source.name + " vertex");

        var global_start = System.nanoTime();
        for (Integer vertex : graph.vertexSet()) {
            var time = System.nanoTime();
            Graphs.neighborListOf(graph, vertex);
            vertexToTime.put(vertex, System.nanoTime() - time);
        }
        var global_finish = System.nanoTime();

        System.out.println("Finish find neighbors for each " + source.name + " vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop100(vertexToTime);
    }

    private static void findDijkstraShortestPath(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.nodes + 1);

        System.out.println("Start find shortest path (Dijkstra) for each " + source.name + " vertex to last vertex");

        var global_start = System.nanoTime();
        for (Integer vertex : graph.vertexSet()) {
            var time = System.nanoTime();
            new DijkstraShortestPath<>(graph).getPath(vertex, source.nodes - 1);
            vertexToTime.put(vertex, System.nanoTime() - time);
        }
        var global_finish = System.nanoTime();

        System.out.println("Finish find shortest path (Dijkstra) for each " + source.name + " vertex to last vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop100(vertexToTime);
    }

    private static void findBellmanFordShortestPath(Source source, Graph<Integer, DefaultEdge> graph) {
        HashMap<Integer, Long> vertexToTime = new HashMap<>(source.nodes + 1);

        System.out.println("Start find shortest path (BellmanFord) for each " + source.name + " vertex to last vertex");

        var global_start = System.nanoTime();
        for (Integer vertex : graph.vertexSet()) {
            var time = System.nanoTime();
            new BellmanFordShortestPath<>(graph).getPath(vertex, source.nodes - 1);
            vertexToTime.put(vertex, System.nanoTime() - time);
        }
        var global_finish = System.nanoTime();

        System.out.println("Finish find shortest path (BellmanFord) for each " + source.name + " vertex to last vertex\nTotal time " + ((global_finish - global_start) / 1e9) + " sec");

        reportTop100(vertexToTime);
    }

    private static void reportTop100(HashMap<Integer, Long> vertexToTime) {
        System.out.println("Most expensive (nano sec : vertex):");
        vertexToTime.entrySet().stream()
                .sorted(Collections.reverseOrder(Comparator.comparingLong(Map.Entry::getValue)))
                .limit(100)
                .forEach(entry -> System.out.println(entry.getValue() + " : " + entry.getKey()));
        System.out.println();
    }

    static class Source {
        private final String name;
        private final File file;
        private final int nodes;
        private final int edges;

        public Source(String name, File file, int nodes, int edges) {
            this.name = name;
            this.file = file;
            this.nodes = nodes;
            this.edges = edges;
        }
    }
}
