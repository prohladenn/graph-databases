package research;

import data.Source;
import db.PostgresImpl;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.LongStream;

public class ResearchGetEdges {
    public static void main(String[] args) throws Exception {
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();

        try (var db = new PostgresImpl()) {
            //try (var db = new Neo4j2Impl()) {
            //try (var db = new ArangoDB2Impl()) {
            db.init();
            db.addGraph(graph);

            var sortedTime = test(db).stream().mapToLong(Long::longValue).sorted().toArray();
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

    private static List<Long> test(PostgresImpl db) throws Exception {
        var time = new ArrayList<Long>(1000);
        for (int i = 0; i < 1000; i++) {
            var t = System.nanoTime();
            System.out.println(db.getAllEdges().size());
            time.add(System.nanoTime() - t);
        }
        return time;
    }
}
