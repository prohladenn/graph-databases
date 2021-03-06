package research;

import data.Source;
import db.ArangoDBImpl;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.LongStream;

public class ResearchGetByAttribute {
    public static void main(String[] args) throws Exception {
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();

        //try (var db = new PostgresImpl()) {
        //try (var db = new Neo4jImpl()) {
        try (var db = new ArangoDBImpl()) {
            db.init();
            db.addGraph(graph);

            long[] sortedTime1 = test1(db).stream().mapToLong(Long::longValue).sorted().toArray();
            long[] sortedTime2 = test2(db).stream().mapToLong(Long::longValue).sorted().toArray();

            report(sortedTime1);
            report(sortedTime2);
        }
    }

    private static void report(long[] sortedTime) {
        var mean = LongStream.of(sortedTime).average().orElseThrow();
        System.out.println(mean * 1e-6 + " мс среднее");
        var sd = Math.sqrt(LongStream.of(sortedTime)
                .mapToDouble(l -> (l * 1e-6 - mean * 1e-6) * (l * 1e-6 - mean * 1e-6))
                .sum() / sortedTime.length);
        System.out.println(sd + " мс отклонение");
        System.out.println(sortedTime[(int) Math.ceil(95 / 100.0 * sortedTime.length) - 1] * 1e-6 + " мс 95");
        System.out.println(sortedTime[(int) Math.ceil(98 / 100.0 * sortedTime.length) - 1] * 1e-6 + " мс 98");
    }

    private static List<Long> test1(ArangoDBImpl db) throws Exception {
        var time = new ArrayList<Long>(500);
        for (int i = 0; i < 500; i++) {
            var t = System.nanoTime();
            System.out.println(i + " " + db.getByNodeAttribute("").size());
            time.add(System.nanoTime() - t);
        }
        return time;
    }

    private static List<Long> test2(ArangoDBImpl db) throws Exception {
        var time = new ArrayList<Long>(500);
        for (int i = 0; i < 500; i++) {
            var t = System.nanoTime();
            System.out.println(i + " " + db.getByEdgeAttribute("").size());
            time.add(System.nanoTime() - t);
        }
        return time;
    }
}
