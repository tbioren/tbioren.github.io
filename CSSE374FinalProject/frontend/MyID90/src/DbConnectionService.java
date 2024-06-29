import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
Singletons:
I made the majority of my changes in this class. I turned this class into a pseudo-singleton by creating static
methods to get the connection and make it.
 */
public class DbConnectionService {
    private static Connection connection;
    private static final String url = "jdbc:sqlserver://csse-374.database.windows.net:1433;database=MyID90;user=MyID90Admin@csse-374;password={Password123!};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    public DbConnectionService() {
        connection = null;
    }

    public static boolean connect() {
        String fullUrl = url
                .replace("${dbServer}", "golem.csse.rose-hulman.edu")
                .replace("${dbName}", "ProjectDatabaseS2G4ScriptTest")
                .replace("${user}", "MyID90Application")
                .replace("${pass}", "Password123");
        try {
            connection = DriverManager.getConnection(fullUrl);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection != null;
    }

    public static synchronized Connection getConnection() {
        return connection;
    }
}
