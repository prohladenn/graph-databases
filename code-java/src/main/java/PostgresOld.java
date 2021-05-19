//import javax.json.bind.Jsonb;
//import javax.json.bind.JsonbBuilder;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;
import java.util.stream.Collectors;

public class PostgresOld {

    private static final String URL = "jdbc:postgresql://localhost:6666/postgres";
    private static final Properties PROPERTIES = new Properties() {{
        setProperty("user", "postgres");
        setProperty("password", "postgres");
    }};

    private static final String SELECT_ALL_TRIPLES = "SELECT * FROM triple";
    private static final String INSERT_TRIPLES = "INSERT INTO triple VALUES %s;";

    private static final String SELECT_ALL_PROPERTIES = "SELECT * FROM property";
    private static final String INSERT_PROPERTIES = "INSERT INTO property VALUES %s;";

    //private static final Jsonb JSONB = JsonbBuilder.create();
    //private static final String EMPTY = JSONB.toJson(new EmptyClass());

    public static void main(String[] args) throws SQLException {
        final var statement = DriverManager.getConnection(URL, PROPERTIES).createStatement();
        //statement.execute("TRUNCATE triple, property");
        var res = true;

        System.out.println(getAllTriples(statement).toString());
        //res = addTriples(statement, Triple.of(1, 1, 2), Triple.of(2, 2, 1));
        //assert res;
        //System.out.println(getAllTriples(statement).toString());

        System.out.println(getAllProperties(statement).toString());
        //res = addProperties(statement, Property.of(1, EMPTY), Property.of(2, EMPTY));
        //assert res;
        //System.out.println(getAllProperties(statement).toString());
    }

    private static ArrayList<Triple> getAllTriples(final Statement statement) throws SQLException {
        var res = statement.executeQuery(SELECT_ALL_TRIPLES);
        final var ans = new ArrayList<Triple>(res.getMetaData().getColumnCount());
        while (res.next()) {
            ans.add(Triple.of(res.getInt(1), res.getInt(2), res.getInt(3)));
        }
        return ans;
    }

    private static ArrayList<Property> getAllProperties(final Statement statement) throws SQLException {
        var res = statement.executeQuery(SELECT_ALL_PROPERTIES);
        final var ans = new ArrayList<Property>(res.getMetaData().getColumnCount());
        while (res.next()) {
            ans.add(Property.of(res.getInt(1), res.getString(2)));
        }
        return ans;
    }

    private static boolean addTriples(final Statement statement, final Triple... triples) throws SQLException {
        var values = Arrays.stream(triples)
                .map(triple -> String.format("(%s,%s,%s)", triple.subject, triple.predicate, triple.object))
                .collect(Collectors.joining(","));
        var query = String.format(INSERT_TRIPLES, values);
        return statement.executeUpdate(query) == triples.length;
    }

    private static boolean addProperties(final Statement statement, final Property... properties) throws SQLException {
        var values = Arrays.stream(properties)
                .map(property -> String.format("(%s,'%s')", property.entity, property.property))
                .collect(Collectors.joining(","));
        var query = String.format(INSERT_PROPERTIES, values);
        return statement.executeUpdate(query) == properties.length;
    }

    private static class Triple {
        private final int subject;
        private final int predicate;
        private final int object;

        public Triple(int subject, int predicate, int object) {
            this.subject = subject;
            this.predicate = predicate;
            this.object = object;
        }

        public static Triple of(int subject, int predicate, int object) {
            return new Triple(subject, predicate, object);
        }

        @Override
        public String toString() {
            return "{" + subject + ", " + predicate + ", " + object + '}';
        }
    }

    private static class Property {
        private final int entity;
        private final String property;

        public Property(int entity, String property) {
            this.entity = entity;
            this.property = property;
        }

        public static Property of(final int entity, final String property) {
            return new Property(entity, property);
        }

        @Override
        public String toString() {
            return "{" + entity + ", " + property + '}';
        }
    }

    private static class EmptyClass {
    }
}
