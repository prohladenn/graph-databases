import db.impl.ArangoDB;
import db.impl.Neo4j;
import db.impl.Postgres;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;
import util.Source;

public class Sandbox {
    public static void main(String[] args) throws Exception {
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphCollege();
        Graph<Integer, DefaultEdge> graph = Source.loadGraphGnutella();
        //Graph<Integer, DefaultEdge> graph = Source.loadGraphFacebook();

        try (var neo4j = new Neo4j().loggable()) {
            System.out.println("--- NEO4j START ---");
            //neo4j.removeAll();
            //neo4j.createGraph(graph);
            neo4j.selectAll();
            var sp = neo4j.shortestPath(53, 5642);
            System.out.println(sp);
            var n = neo4j.nearestNeighbors(814, 2);
            System.out.println(n);
            System.out.println("--- NEO4j FINISH ---");
        }

        try (var postgres = new Postgres().loggable()) {
            System.out.println("--- POSTGRES START ---");
            //postgres.removeAll();
            //postgres.createGraph(graph);
            postgres.selectAll();
            var sp = postgres.shortestPath(53, 5642);
            System.out.println(sp);
            var n = postgres.nearestNeighbors(814, 2);
            System.out.println(n);
            System.out.println("--- POSTGRES FINISH ---");
        }

        try (var arangoDB = new ArangoDB().loggable()) {
            System.out.println("--- ARANGO_DB START ---");
            //arangoDB.removeAll();
            //arangoDB.createGraph(graph);
            arangoDB.selectAll();
            var sp = arangoDB.shortestPath(53, 5642);
            System.out.println(sp);
            var n = arangoDB.nearestNeighbors(814, 2);
            System.out.println(n);
            System.out.println("--- ARANGO_DB FINISH ---");
        }

    }
}
