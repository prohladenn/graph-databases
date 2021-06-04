package research;

import data.Source;
import db.Database2;
import db.Neo4j2Impl;
import org.jgrapht.Graph;
import org.jgrapht.alg.util.Pair;
import org.jgrapht.graph.DefaultEdge;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

public class ResearchShortestPath {
    public static void main(String[] args) throws Exception {
        /*Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        var p1 = new Pair<>("1", "33");
        var p2 = new Pair<>("1712", "672");
        var p3 = new Pair<>("453", "121");
        var p4 = new Pair<>("768", "1658");*/

        /*Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        var p1 = new Pair<>("540", "7808");
        var p2 = new Pair<>("8579", "8794");
        var p3 = new Pair<>("6119", "1857");
        var p4 = new Pair<>("3560", "1555");*/

        Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();
        var p1 = new Pair<>("350", "3310");
        var p2 = new Pair<>("693", "1526");
        var p3 = new Pair<>("506", "3389");
        var p4 = new Pair<>("1592", "1599");

        List<Pair<String, String>> testData = IntStream.range(0, 2000)
                .mapToObj(i -> {
                    switch (i % 4) {
                        case 0:
                            return p1;
                        case 1:
                            return p2;
                        case 2:
                            return p3;
                        default:
                            return p4;
                    }
                }).collect(Collectors.toList());

        //try (var db = new PostgresImpl()) {
        try (var db = new Neo4j2Impl()) {
        //try (var db = new ArangoDB2Impl()) {
            //db.init();
            //db.addGraph(graph);

            var sortedTime = test(db, testData).stream().mapToLong(Long::longValue).sorted().toArray();
            var mean = LongStream.of(sortedTime).average().orElseThrow();
            System.out.println(mean * 1e-6 + " мс среднее");
            var sd = Math.sqrt(LongStream.of(sortedTime)
                    .mapToDouble(l -> (l * 1e-6 - mean * 1e-6) * (l * 1e-6 - mean * 1e-6))
                    .sum() / sortedTime.length);
            System.out.println(sd + " мс отклонение");
            System.out.println(sortedTime[(int) Math.ceil(95 / 100.0 * sortedTime.length) - 1] * 1e-6 + " мс 95");
            System.out.println(sortedTime[(int) Math.ceil(98 / 100.0 * sortedTime.length) - 1] * 1e-6 + " мс 98");
        }
    }

    private static List<Long> test(Database2 db, List<Pair<String, String>> testData) throws Exception {
        var time = new ArrayList<Long>(testData.size());
        for (var p : testData) {
            var t = System.nanoTime();
            //System.out.println(db.getShortestPath(p.getFirst(), p.getSecond()).toString());
            db.getShortestPath(p.getFirst(), p.getSecond());
            time.add(System.nanoTime() - t);
        }
        return time;
    }
}
