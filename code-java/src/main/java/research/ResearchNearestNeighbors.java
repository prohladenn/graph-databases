package research;

import data.Source;
import db.ArangoDB2Impl;
import db.Database2;
import org.jgrapht.Graph;
import org.jgrapht.alg.util.Pair;
import org.jgrapht.graph.DefaultEdge;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

public class ResearchNearestNeighbors {
    public static void main(String[] args) throws Exception {
        /*Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        var v = "1712";*/

        Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        var v = "8579";

        /*Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();
        var v = "693";*/

        List<Pair<String, Integer>> testData = IntStream.range(0, 50)
                .mapToObj(i -> {
                    switch (i % 4) {
                        case 0:
                            return new Pair<>(v, 1);
                        case 1:
                            return new Pair<>(v, 2);
                        case 2:
                            return new Pair<>(v, 3);
                        case 3:
                            return new Pair<>(v, 4);
                        default:
                            return new Pair<>(v, 5);
                    }
                }).collect(Collectors.toList());

        //try (var db = new PostgresImpl()) {
        //try (var db = new Neo4j2Impl()) {
        try (var db = new ArangoDB2Impl()) {
            db.init();
            db.addGraph(graph);

            var sortedTime = test(db, testData).stream().mapToLong(Long::longValue).sorted().toArray();
            var mean = LongStream.of(sortedTime).average().orElseThrow();
            System.out.println(mean * 1e-9 + " сек среднее");
            var sd = Math.sqrt(LongStream.of(sortedTime)
                    .mapToDouble(l -> (l * 1e-9 - mean * 1e-9) * (l * 1e-9 - mean * 1e-9))
                    .sum() / sortedTime.length);
            System.out.println(sd + " сек отклонение");
            System.out.println(sortedTime[(int) Math.ceil(95 / 100.0 * sortedTime.length) - 1] * 1e-9 + " сек 95");
            System.out.println(sortedTime[(int) Math.ceil(98 / 100.0 * sortedTime.length) - 1] * 1e-9 + " сек 98");
        }
    }

    private static List<Long> test(Database2 db, List<Pair<String, Integer>> testData) throws Exception {
        var time = new ArrayList<Long>(testData.size());
        for (var p : testData) {
            var t = System.nanoTime();
            System.out.println(db.getNearestNeighbors(p.getFirst(), p.getSecond()).toString());
            //db.getNearestNeighbors(p.getFirst(), p.getSecond());
            time.add(System.nanoTime() - t);
        }
        return time;
    }
}
