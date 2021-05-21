package research;

import data.Source;
import org.jgrapht.Graph;
import org.jgrapht.GraphPath;
import org.jgrapht.alg.shortestpath.DijkstraShortestPath;
import org.jgrapht.graph.DefaultEdge;

import java.io.IOException;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.function.Function;

public class ResearchShortestPathData {

    public static void main(String[] args) throws IOException {
        // TESTS FOR COLLEGE GRAPH
        // 1899 * 1899 = 3_606_201 possible ways
        // Parameter selection @passRate
        // 100  37 sec  (~35k ways)
        // 50   60 sec  (~70k ways)
        // 25   105 sec (~138k ways) NICE!
        tests(Source.COLLEGE, 25);

        // TESTS FOR GNUTELLA GRAPH
        // 8846 * 8846 = 78_251_716 possible ways
        // Parameter selection @passRate
        // 10000    18 sec  (~8k ways)
        // 1000     110 sec (~78k ways) NICE!
        tests(Source.GNUTELLA, 1000);

        // TESTS FOR FACEBOOK GRAPH
        // 3483 * 3483 = 12_131_289 possible ways
        // Parameter selection @passRate
        // 5000 2 sec   (~2.5k ways)
        // 50   80 sec  (~23k ways)
        // 25   150 sec (~46k ways) NICE!
        tests(Source.FACEBOOK, 25);
    }

    private static void tests(Source source, int passRate) throws IOException {
        var t = System.nanoTime();
        Graph<Integer, DefaultEdge> graph = Source.Utils.loadGraph(source);
        Map<String, Object[]> results = new HashMap<>(graph.vertexSet().size());

        graph.vertexSet().forEach(v1 -> graph.vertexSet().forEach(v2 -> {
            if (new Random().nextInt(passRate + 1) == passRate) {
                findDijkstraShortestPathFromTo(graph, v1, v2, results);
            }
        }));
        System.out.println(String.format("Total test time for %s %f sec\nResult size %d\n", source.getName(), (System.nanoTime() - t) / 1e9, results.size()));

        report10LongestInTime(results);
        report10LongestPath(results);
        report10MiddlePath(results);
        report10ShortestPath(results);

        System.out.println("End for " + source.getName());
    }

    private static void findDijkstraShortestPathFromTo(Graph<Integer, DefaultEdge> graph, int from, int to, Map<String, Object[]> vertexToPathWithTime) {
        var time = System.nanoTime();
        var path = Optional.ofNullable(new DijkstraShortestPath<>(graph).getPath(from, to));
        vertexToPathWithTime.put(
                String.format("(%d : %d)", from, to),
                new Object[]{
                        path.map(GraphPath::getVertexList).orElse(List.of()).size(),
                        path.map(GraphPath::getVertexList).orElse(List.of()),
                        System.nanoTime() - time});
    }

    private static void report10LongestInTime(Map<String, Object[]> results) {
        System.out.println("#10 longest in time");
        results.entrySet().stream()
                .sorted(Comparator.comparing((Function<Map.Entry<String, Object[]>, Long>) entry -> (Long) (entry.getValue())[2]).reversed())
                .limit(10)
                .forEach(ResearchShortestPathData::out);
        System.out.println();
    }

    private static void report10LongestPath(Map<String, Object[]> results) {
        System.out.println("#10 longest path");
        var max = results.values().stream().map(objects -> (Integer) (objects)[0]).max(Comparator.comparing(i -> i)).orElseThrow();
        System.out.println("Max = " + max);
        filterSortLimit(results, max);
        System.out.println();
    }

    private static void report10MiddlePath(Map<String, Object[]> results) {
        System.out.println("#10 middle path");
        int max = results.values().stream().map(objects -> (Integer) (objects)[0]).max(Comparator.comparing(i -> i)).orElseThrow();
        int min = results.values().stream().map(objects -> (Integer) (objects)[0]).min(Comparator.comparing(i -> i)).orElseThrow();
        double mid = (max * 1.0 + min) / 2;
        System.out.println("Mid = " + mid);
        filterSortLimit(results, mid);
        System.out.println();
    }

    private static void report10ShortestPath(Map<String, Object[]> results) {
        System.out.println("#10 shortest path");
        int min = results.values().stream().map(objects -> (Integer) (objects)[0]).min(Comparator.comparing(i -> i)).orElseThrow();
        System.out.println("Min = " + min);
        filterSortLimit(results, min);
        System.out.println();
    }

    private static void filterSortLimit(Map<String, Object[]> results, double filter) {
        results.entrySet().stream()
                .sorted(Comparator.comparing(entry -> Math.abs((int) (entry.getValue())[0] - filter)))
                .limit(10)
                .sorted(Comparator.comparing((Function<Map.Entry<String, Object[]>, Long>) entry -> (Long) (entry.getValue())[2]).reversed())
                .forEach(ResearchShortestPathData::out);
    }

    private static void out(Map.Entry<String, Object[]> entry) {
        System.out.println(String.format("%s\t%d\t%s\t%d", entry.getKey(), entry.getValue()[0], entry.getValue()[1].toString(), entry.getValue()[2]));
    }

}
