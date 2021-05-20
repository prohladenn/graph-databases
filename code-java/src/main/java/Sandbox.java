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
            //neo4j.removeAll();
            //neo4j.createGraph(graph);
            neo4j.selectAll();
            var sp = neo4j.shortestPath(53, 5642);
            System.out.println(sp);
            var n = neo4j.nearestNeighbors(814, 1);
            System.out.println(n);
        }

        try (var postgres = new Postgres().loggable()) {
            //postgres.removeAll();
            //postgres.createGraph(graph);
            postgres.selectAll();
            var sp = postgres.shortestPath(53, 5642);
            System.out.println(sp);
            var n = postgres.nearestNeighbors(814, 1);
            System.out.println(n);
        }

    }
}
