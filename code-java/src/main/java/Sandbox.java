import data.Source;
import db.ArangoDBImpl;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.util.stream.LongStream;

public class Sandbox {
    public static void main(String[] args) throws Exception {
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();

        /*try (var neo4j = new Neo4jImpl().loggable()) {
            System.out.println("--- NEO4j START ---");
            neo4j.removeAll();
            neo4j.createGraph(graph);
            neo4j.selectAll();

            *//*long[] res = new long[10000];
            for (int i = 0; i < 10000; i++) {
                var t = System.nanoTime();
                neo4j.selectAll();
                res[i] = System.nanoTime() - t;
            }
            System.out.println("Max " + LongStream.of(res).max().orElseThrow() / 1e9);
            System.out.println("Avg " + LongStream.of(res).average().orElseThrow() / 1e9);
            System.out.println("Min " + LongStream.of(res).min().orElseThrow() / 1e9);*//*

         *//*var sp = neo4j.shortestPath(53, 5642);
            System.out.println(sp);
            var n = neo4j.nearestNeighbors(814, 2);
            System.out.println(n);*//*
            System.out.println("--- NEO4j FINISH ---");
        }*/

        /*try (var postgres = new PostgresImpl()) {
            System.out.println("--- POSTGRES START ---");
            //postgres.removeAll();
            //postgres.createGraph(graph);

            *//*long[] res = new long[10000];
            for (int i = 0; i < 10000; i++) {
                var t = System.nanoTime();
                postgres.selectAll();
                res[i] = System.nanoTime() - t;
            }
            System.out.println("Max " + LongStream.of(res).max().orElseThrow() / 1e9);
            System.out.println("Avg " + LongStream.of(res).average().orElseThrow() / 1e9);
            System.out.println("Min " + LongStream.of(res).min().orElseThrow() / 1e9);*//*

         *//*var sp = postgres.shortestPath(53, 5642);
            System.out.println(sp);
            var n = postgres.nearestNeighbors(814, 2);
            System.out.println(n);*//*
            System.out.println("--- POSTGRES FINISH ---");
        }*/

        try (var arangoDB = new ArangoDBImpl().loggable()) {
            System.out.println("--- ARANGO_DB START ---");
            arangoDB.removeAll();
            arangoDB.createGraph(graph);
            arangoDB.selectAll();

            long[] res = new long[100];
            for (int i = 0; i < 100; i++) {
                var t = System.nanoTime();
                arangoDB.selectAll();
                res[i] = System.nanoTime() - t;
            }
            System.out.println("Max " + LongStream.of(res).max().orElseThrow() / 1e9);
            System.out.println("Avg " + LongStream.of(res).average().orElseThrow() / 1e9);
            System.out.println("Min " + LongStream.of(res).min().orElseThrow() / 1e9);

            /*var sp = arangoDB.shortestPath(53, 5642);
            System.out.println(sp);
            var n = arangoDB.nearestNeighbors(814, 2);
            System.out.println(n);*/
            System.out.println("--- ARANGO_DB FINISH ---");
        }
    }
}
