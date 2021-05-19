import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.SimpleDirectedGraph;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Created by valery.kovshov on 19/05/2021.
 */
public class Jgrapht {
    public static final Source AMAZON = new Source(new File("db/bigdata/amazon0302.txt"), 262111, 1234877);
    public static final Source GOOGLE = new Source(new File("db/bigdata/web-Google.txt"), 875713, 5105039);

    public static void main(String[] args) throws IOException {

        // Time=2.807943481 sec
        System.out.println("Start load AMAZON");
        var t1a = System.nanoTime();
        var graphAmazon = loadGraph(AMAZON);
        var t2a = System.nanoTime();
        System.out.println("Finish load AMAZON; Time=" + ((t2a - t1a) / 1e9) + " sec\n");

        // Time=14.415984139 sec
        System.out.println("Start load GOOGLE");
        var t1g = System.nanoTime();
        var graphGoogle = loadGraph(GOOGLE);
        var t2g = System.nanoTime();
        System.out.println("Finish load GOOGLE; Time=" + ((t2g - t1g) / 1e9) + " sec\n");

        /*Graph<Integer, DefaultWeightedEdge> graph = new DefaultDirectedWeightedGraph<>(DefaultWeightedEdge.class);

        graph.addVertex(1);
        graph.addVertex(2);
        graph.addVertex(3);
        graph.addVertex(4);
        graph.addVertex(5);
        graph.addVertex(6);
        graph.addVertex(7);

        graph.setEdgeWeight(graph.addEdge(1, 2), 10);
        graph.setEdgeWeight(graph.addEdge(2, 3), 11);
        graph.setEdgeWeight(graph.addEdge(3, 4), 12);
        graph.setEdgeWeight(graph.addEdge(4, 5), 13);
        graph.setEdgeWeight(graph.addEdge(5, 6), 14);
        graph.setEdgeWeight(graph.addEdge(6, 7), 15);

        graph.setEdgeWeight(graph.addEdge(3, 5), 16);

        System.out.println(Graphs.neighborListOf(graph, 3));

        ShortestPathAlgorithm<Integer, DefaultWeightedEdge> dijkstra = new DijkstraShortestPath<>(graph);
        System.out.println(dijkstra.getPath(1, 7).getEdgeList());

        ShortestPathAlgorithm<Integer, DefaultWeightedEdge> bellmanFord = new BellmanFordShortestPath<>(graph);
        System.out.println(bellmanFord.getPath(1, 7).getEdgeList());*/
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

    static class Source {
        private final File file;
        private final int nodes;
        private final int edges;

        public Source(File file, int nodes, int edges) {
            this.file = file;
            this.nodes = nodes;
            this.edges = edges;
        }
    }
}
