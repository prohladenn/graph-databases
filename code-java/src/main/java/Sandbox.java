public class Sandbox {
    public static void main(String[] args) throws Exception {
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();

        /*try (var postgres = new PostgresImpl()) {
            System.out.println("--- POSTGRES START ---");
            postgres.removeAll();
            postgres.createGraph(graph);
            //postgres.selectAll();
            //postgres.shortestPath(53, 5642);
            //postgres.nearestNeighbors(814, 2);

            long[] res = new long[100];
            for (int i = 0; i < 100; i++) {
                var t = System.nanoTime();
                // Tested operation
//                postgres.shortestPath(1, 33);       // COLLEGE LIT
//                postgres.shortestPath(1712, 672);   // COLLEGE LP
//                postgres.shortestPath(453, 121);    // COLLEGE MP
//                postgres.shortestPath(768, 1658);   // COLLEGE NP
//
//                postgres.shortestPath(540, 7808);   // GNUTELLA LIT
//                postgres.shortestPath(8579, 8794);  // GNUTELLA LP
//                postgres.shortestPath(6119, 1857);  // GNUTELLA MP
//                postgres.shortestPath(3560, 1555);  // GNUTELLA NP
//
//                postgres.shortestPath(350, 3310);   // FACEBOOK LIT
//                postgres.shortestPath(693, 1526);   // FACEBOOK LP
//                postgres.shortestPath(506, 3389);   // FACEBOOK MP
//                postgres.shortestPath(1592, 1599);  // FACEBOOK NP
//
//                postgres.nearestNeighbors(1712, 3); // COLLEGE NN
//                postgres.nearestNeighbors(8579, 3); // GNUTELLA NN
//                postgres.nearestNeighbors(693, 3);  // FACEBOOK NN

                res[i] = System.nanoTime() - t;
            }
            System.out.print(String.format("%4.5f\t", LongStream.of(res).min().orElseThrow() / 1e9));
            System.out.print(String.format("%4.5f\t", LongStream.of(res).average().orElseThrow() / 1e9));
            System.out.println(String.format("%4.5f", LongStream.of(res).max().orElseThrow() / 1e9));
            System.out.println("--- POSTGRES FINISH ---");
        }*/

        /*try (var neo4j = new Neo4jImpl()) {
            System.out.println("--- NEO4j START ---");
            neo4j.removeAll();
            neo4j.createGraph(graph);
            //neo4j.selectAll();
            //neo4j.shortestPath(53, 5642);
            //neo4j.nearestNeighbors(814, 2);

            long[] res = new long[100];
            for (int i = 0; i < 100; i++) {
                var t = System.nanoTime();
                // Tested operation
//                neo4j.shortestPath(1, 33);       // COLLEGE LIT
//                neo4j.shortestPath(1712, 672);   // COLLEGE LP
//                neo4j.shortestPath(453, 121);    // COLLEGE MP
//                neo4j.shortestPath(768, 1658);   // COLLEGE NP
//
//                neo4j.shortestPath(540, 7808);   // GNUTELLA LIT
//                neo4j.shortestPath(8579, 8794);  // GNUTELLA LP
//                neo4j.shortestPath(6119, 1857);  // GNUTELLA MP
//                neo4j.shortestPath(3560, 1555);  // GNUTELLA NP
//
//                neo4j.shortestPath(350, 3310);   // FACEBOOK LIT
//                neo4j.shortestPath(693, 1526);   // FACEBOOK LP
//                neo4j.shortestPath(506, 3389);   // FACEBOOK MP
//                neo4j.shortestPath(1592, 1599);  // FACEBOOK NP
//
//                neo4j.nearestNeighbors(1712, 3); // COLLEGE NN
//                neo4j.nearestNeighbors(8579, 3); // GNUTELLA NN
//                neo4j.nearestNeighbors(693, 3);  // FACEBOOK NN

                res[i] = System.nanoTime() - t;
            }
            System.out.print(String.format("%4.5f\t", LongStream.of(res).min().orElseThrow() / 1e9));
            System.out.print(String.format("%4.5f\t", LongStream.of(res).average().orElseThrow() / 1e9));
            System.out.println(String.format("%4.5f", LongStream.of(res).max().orElseThrow() / 1e9));
            System.out.println("--- NEO4j FINISH ---");
        }*/

        /*try (var arangoDB = new ArangoDBImpl()) {
            System.out.println("--- ARANGO_DB START ---");
            arangoDB.removeAll();
            arangoDB.createGraph(graph);
            //arangoDB.selectAll();
            //arangoDB.shortestPath(53, 5642);
            //arangoDB.nearestNeighbors(814, 2);

            long[] res = new long[100];
            for (int i = 0; i < 100; i++) {
                var t = System.nanoTime();
                // Tested operation
//                arangoDB.shortestPath(1, 33);       // COLLEGE LIT
//                arangoDB.shortestPath(1712, 672);   // COLLEGE LP
//                arangoDB.shortestPath(453, 121);    // COLLEGE MP
//                arangoDB.shortestPath(768, 1658);   // COLLEGE NP
//
//                arangoDB.shortestPath(540, 7808);   // GNUTELLA LIT
//                arangoDB.shortestPath(8579, 8794);  // GNUTELLA LP
//                arangoDB.shortestPath(6119, 1857);  // GNUTELLA MP
//                arangoDB.shortestPath(3560, 1555);  // GNUTELLA NP
//
//                arangoDB.shortestPath(350, 3310);   // FACEBOOK LIT
//                arangoDB.shortestPath(693, 1526);   // FACEBOOK LP
//                arangoDB.shortestPath(506, 3389);   // FACEBOOK MP
//                arangoDB.shortestPath(1592, 1599);  // FACEBOOK NP
//
//                arangoDB.nearestNeighbors(1712, 3); // COLLEGE NN
//                arangoDB.nearestNeighbors(8579, 3); // GNUTELLA NN
//                arangoDB.nearestNeighbors(693, 3);  // FACEBOOK NN

                res[i] = System.nanoTime() - t;
            }
            System.out.print(String.format("%4.5f\t", LongStream.of(res).min().orElseThrow() / 1e9));
            System.out.print(String.format("%4.5f\t", LongStream.of(res).average().orElseThrow() / 1e9));
            System.out.println(String.format("%4.5f", LongStream.of(res).max().orElseThrow() / 1e9));
            System.out.println("--- ARANGO_DB FINISH ---");
        }*/
    }
}
