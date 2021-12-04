import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
//
public class Proj4 {

	public static void main(String[] args) {
		final String oracleURL = "jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle";

        String username = null;    // Oracle DBMS username
        String password = null;

        if (args.length == 2) {    // get username/password from cmd line args
                username = args[0];
                password = args[1];
        } else {
                System.out.println("\nUsage:  java JDBC <username> <password>\n"
                     + "    where <username> is your Oracle DBMS"
                     + " username,\n    and <password> is your Oracle"
                     + " password (not your system password).\n");
                System.exit(-1);
        }

        // load the (Oracle) JDBC driver by initializing its base
        // class, 'oracle.jdbc.OracleDriver'.
        try {

                Class.forName("oracle.jdbc.OracleDriver");

        } catch (ClassNotFoundException e) {

                System.err.println("*** ClassNotFoundException:  "
                    + "Error loading Oracle JDBC driver.  \n"
                    + "\tPerhaps the driver is not on the Classpath?");
                System.exit(-1);

        }


        // make and return a database connection to the user's
        // Oracle database

        Connection dbconn = null;

        try {
                dbconn = DriverManager.getConnection(oracleURL,username,password);

        } catch (SQLException e) {

                System.err.println("*** SQLException:  "
                    + "Could not open JDBC connection.");
                System.err.println("\tMessage:   " + e.getMessage());
                System.err.println("\tSQLState:  " + e.getSQLState());
                System.err.println("\tErrorCode: " + e.getErrorCode());
                System.exit(-1);

        }

        Statement stmt = null;
        UserInterface user = null;
        try {
        		
                stmt = dbconn.createStatement();
				user = new UserInterface(stmt);
		        user.run_user_interface();

                // Shut down the connection to the DBMS.
                stmt.close();
                dbconn.close();

        } catch (SQLException e) {

                System.err.println("*** SQLException:  "
                    + "Could not fetch query results.");
                System.err.println("\tMessage:   " + e.getMessage());
                System.err.println("\tSQLState:  " + e.getSQLState());
                System.err.println("\tErrorCode: " + e.getErrorCode());
                System.exit(-1);
        }

	}

}
