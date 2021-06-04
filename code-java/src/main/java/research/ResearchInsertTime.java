package research;

import data.Source;
import db.ArangoDBImpl;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.io.IOException;
import java.util.stream.LongStream;

public class ResearchInsertTime {
    public static void main(String[] args) throws IOException {
        /*Graph<Integer, DefaultEdge> g = new SimpleDirectedGraph<>(DefaultEdge.class);
        g.addVertex(1);
        g.addVertex(2);
        g.addVertex(3);
        g.addEdge(1, 2);
        g.addEdge(1, 3);
        g.addEdge(2, 3);*/

        //Graph<Integer, DefaultEdge> g = Source.loadGraphCollege();
        //Graph<Integer, DefaultEdge> g = Source.loadGraphGnutella();
        Graph<Integer, DefaultEdge> g = Source.loadGraphFacebook();

        //try (var db = new PostgresImpl()) {
        //try (var db = new Neo4jImpl()) {
        try (var db = new ArangoDBImpl()) {
            db.init();
            db.clear();

            var sortedTime = db.addGraph(g).stream().mapToLong(Long::longValue).sorted().toArray();
            var mean = LongStream.of(sortedTime).average().orElseThrow();
            System.out.println(mean * 1e-6 + " мс среднее");
            System.out.println(sortedTime[(int) Math.ceil(95 / 100.0 * sortedTime.length) - 1] * 1e-6 + " мс 95");
            System.out.println(sortedTime[(int) Math.ceil(98 / 100.0 * sortedTime.length) - 1] * 1e-6 + " мс 98");
            System.out.println(LongStream.of(sortedTime).sum() * 1e-9 + " сек сумма");
            var sd = Math.sqrt(LongStream.of(sortedTime)
                    .mapToDouble(l -> (l * 1e-6 - mean * 1e-6) * (l * 1e-6 - mean * 1e-6))
                    .sum() / sortedTime.length);
            System.out.println(sd + " мс отклонение");
        }
    }
}
