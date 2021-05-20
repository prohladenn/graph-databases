package util;

import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.SimpleDirectedGraph;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

// https://snap.stanford.edu/data/
public class Source {
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

    // https://snap.stanford.edu/data/CollegeMsg.html (Temporal network)
    // [neo4j 22 sec]
    public static final Source COLLEGE = new Source("COLLEGE", new File("db/bigdata/CollegeMsg.txt"), 1899, 20296);

    // https://snap.stanford.edu/data/p2p-Gnutella05.html (Internet peer-to-peer network)
    // [neo4j 45 sec]
    public static final Source GNUTELLA = new Source("GNUTELLA", new File("db/bigdata/p2p-Gnutella05.txt"), 8846, 31839);

    // https://snap.stanford.edu/data/ego-Facebook.html (Social network)
    // [neo4j 55 sec]
    public static final Source FACEBOOK = new Source("FACEBOOK", new File("db/bigdata/facebook_combined.txt"), 3483, 50865);

    @Deprecated // To big
    // https://snap.stanford.edu/data/amazon0302.html (Product co-purchasing network)
    public static final Source AMAZON = new Source("AMAZON", new File("db/bigdata/amazon0302.txt"), 262111, 1234877);

    @Deprecated // To big
    // https://snap.stanford.edu/data/web-Google.html (Web graph)
    public static final Source GOOGLE = new Source("GOOGLE", new File("db/bigdata/web-Google.txt"), 875713, 5105039);

    public static Graph<Integer, DefaultEdge> loadGraphCollege() throws IOException {
        return Utils.loadGraph(COLLEGE);
    }

    public static Graph<Integer, DefaultEdge> loadGraphGnutella() throws IOException {
        return Utils.loadGraph(GNUTELLA);
    }

    public static Graph<Integer, DefaultEdge> loadGraphFacebook() throws IOException {
        return Utils.loadGraph(FACEBOOK);
    }

    @Deprecated // To big
    public static Graph<Integer, DefaultEdge> loadGraphAmazon() throws IOException {
        return Utils.loadGraph(AMAZON);
    }

    @Deprecated // To big
    public static Graph<Integer, DefaultEdge> loadGraphGoogle() throws IOException {
        return Utils.loadGraph(GOOGLE);
    }

    public String getName() {
        return name;
    }

    public File getFile() {
        return file;
    }

    public int getNodes() {
        return nodes;
    }

    public int getEdges() {
        return edges;
    }

    public static class Utils {
        public static Graph<Integer, DefaultEdge> loadGraph(Source source) throws IOException {

            System.out.println("Start load " + source.getName() + " graph");
            var t1 = System.nanoTime();

            if (!source.getFile().exists()) {
                throw new FileNotFoundException("File" + source.getFile().getAbsolutePath() + " not found");
            }

            if (!source.getFile().isFile()) {
                throw new FileNotFoundException("File" + source.getFile().getAbsolutePath() + " is not a file");
            }

            Graph<Integer, DefaultEdge> graph = new SimpleDirectedGraph<>(DefaultEdge.class);
            try (BufferedReader br = new BufferedReader(new FileReader(source.getFile()))) {
                String line;
                while ((line = br.readLine()) != null) {
                    line = line.replaceAll(" ", "\t");
                    var words = line.split("\t");

                    int v1 = Integer.parseInt(words[0]);
                    int v2 = Integer.parseInt(words[1]);

                    graph.addVertex(v1);
                    graph.addVertex(v2);

                    graph.addEdge(v1, v2);
                }
            }

            var t2 = System.nanoTime();
            System.out.println("Finish load " + source.getName() + " graph\nTotal time " + ((t2 - t1) / 1e9) + " sec");

            if (graph.vertexSet().size() != source.getNodes()) {
                throw new IllegalStateException("Nodes expected count " + source.getNodes() + " but actual count " + graph.vertexSet().size());
            }

            if (graph.edgeSet().size() != source.getEdges()) {
                throw new IllegalStateException("Edges expected count " + source.getEdges() + " but actual count " + graph.edgeSet().size());
            }

            System.out.println("Graph " + source.getName() + " is correct\n");

            return graph;
        }
    }
}
