package db;

import db.impl.LoggableDatabaseImpl;

public interface Loggable {

    /**
     * Enable console logging for database;
     *
     * @return loggable database.
     */
    LoggableDatabaseImpl loggable();
}
