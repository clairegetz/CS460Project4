import java.sql.*;
import java.util.HashMap;
import java.util.Scanner;


public class UserInterface {
	private static Statement stmt;
	private Scanner scan = new Scanner(System.in);
	private final String[] table_names = new String[] {"Employee", "Appointment", "Customer", "StateID",
			"Permit", "Registration", "License"};
	private HashMap<String, Table> tables = new HashMap<String, Table>();
	private final String table_prefix = "Name";
	
	final private String QUESTION1 = "How many schools have different names in 2021 then they were in 2017?";
    final private String QUESTION2 = "What are the district and school names of the schools that reported "
                    + "decreased percentages in level 4 and 5, and increased percentages in level 1 and 2 from 2019 to 2021?";
    final private String QUESTION3 = "What are the 5 highest combined level 4 and 5 percentage schools of a given a "
                    + "year and district number?";
    final private String QUESTION4 = "What are the percentage differences of all levels from the year 2019 to 2021 for a given school name?";
    
    
    final private static String QUERY1 = "SELECT * FROM (\n" +
			"       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName\n" +
			"       FROM Customer, License, Department\n" +
			"       WHERE Customer.customerID = License.customerID\n" +
			"       AND License.deptID = Department.deptID\n" +
			"       UNION ALL\n" +
			"       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName\n" +
			"       FROM Customer, Registration, Department\n" +
			"       WHERE Customer.customerID = Registration.customerID\n" +
			"       AND Registration.deptID = Department.deptID\n" +
			"       UNION ALL\n" +
			"       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName\n" +
			"       FROM Customer, Permit, Department\n" +
			"       WHERE Customer.customerID = Permit.customerID\n" +
			"       AND Permit.deptID = Department.deptID\n" +
			"       UNION ALL\n" +
			"       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName\n" +
			"       FROM Customer, StateID, Department\n" +
			"       WHERE Customer.customerID = StateID.customerID\n" +
			"       AND StateID.deptID = Department.deptID )\n" +
			"WHERE expireDate <= TO_DATE('%s', 'MM/DD/YYYY')";
    final private static String QUERY2 = "SELECT COUNT(apptSuccessful) AS TotalAppts, SUM(apptSuccessful) AS Successful, deptName FROM (\n" +
			"SELECT * FROM Department JOIN Appointment\n" +
			"ON Appointment.deptID = Department.deptID\n" +
			"WHERE apptTime >= add_months(sysdate, -2)\n" +
			"INTERSECT\n" +
			"SELECT * FROM Department JOIN Appointment\n" +
			"ON Appointment.deptID = Department.deptID\n" +
			"WHERE apptTime < LAST_DAY(ADD_MONTHS(sysdate, -1)))\n" +
			"GROUP BY deptName";
    final private static String QUERY3 = "SELECT a.deptID, d.deptName, a.TotleFee FROM\n"
    		+ "(SELECT deptID, SUM(fee) as TotleFee FROM\n"
    		+ "(SELECT * FROM Appointment\n"
    		+ "WHERE apptTime >= TO_DATE('%s', 'MM/DD/YYYY')\n"
    		+ "AND apptTime < ADD_MONTHS('%s', 1))\n"
    		+ "GROUP BY deptID) a\n"
    		+ "INNER JOIN Department d\n"
    		+ "ON a.deptID = d.deptID\n"
    		+ "ORDER BY a.TotleFee DESC;";
    final private static String QUERY4 = "";
	
	public UserInterface(Statement stmt) {
		this.stmt = stmt; 
		create_table_map();
	}
	
	
	public void create_table_map() {
		String[] employee = new String[] {"employeeID", "firstName", "lastName", "jobId", "deptId"};
		String[] employee_type = new String[] {"Int", "String", "String", "Int", "Int"};
		tables.put("Employee", new Table(employee, employee_type));
		String[] customer = new String[] {"customerID", "firstName", "lastName", "address", "dateOfBirth"};
		String[] customer_type = new String[] {"Int", "String", "String", "String", "Date"};
		tables.put("Customer", new Table(customer, customer_type));
		String[] appt = new String[] {"apptID", "apptTime", "apptSuccessful", "apptType", "fee", "deptID", "customerID", "employeeID"};
		String[] appt_type = new String[] {"Int", "Time", "Number", "String", "Int", "Int", "Int", "Int"};
		tables.put("Appointment", new Table(appt, appt_type));
		String[] id = new String[] {"stateIDNo", "issueDate", "expireDate", "userID", "deptID"};
		String[] id_type = new String[] {"Int", "Date", "Date", "Int", "Int"};
		tables.put("StateID", new Table(id, id_type));
		String[] permit = new String[] {"permitNo", "issueDate", "expireDate", "class", "userID", "deptID"};
		String[] permit_type = new String[] {"Int", "Date", "Date", "String", "Int", "Int"};
		tables.put("Permit", new Table(permit, permit_type));
		String[] reg = new String[] {"licensePlateNo", "issueDate", "expireDate", "VIN", "userID", "deptID"};
		String[] reg_type = new String[] {"Int", "Date", "Date", "String", "Int", "Int"};
		tables.put("Registration", new Table(reg, reg_type));
		String[] license = new String[] {"licenseNo", "issueDate", "expireDate", "class", "userID", "deptID"};
		String[] license_type = new String[] {"Int", "Date", "Date", "String", "Int", "Int"};
		tables.put("License", new Table(license, license_type));
		
	}
	
	public void run_user_interface() {
		int main_response = main_menu(true);
		while (main_response != -1) {
			try {
				if (main_response == 1) {
					insert();
				} else if (main_response == 2) {
					delete();
				} else if (main_response == 3) {
					update();
				} else {
					query();
				}
			} catch (SQLException e) {
                        System.err.println("*** SQLException:  "
                            + "Could not execute query.");
                        System.err.println("\tMessage:   " + e.getMessage());
                        System.err.println("\tSQLState:  " + e.getSQLState());
                        System.err.println("\tErrorCode: " + e.getErrorCode());
                        System.exit(-1);
             }
			main_response = main_menu(false);
		}
		
	}
	
	
	public int main_menu(boolean is_first) {
		if (is_first) {
			System.out.println("Welcome to the DMV JDBC user interface!");
		}
		System.out.println("What operation would you like to preform?");
		System.out.println("1.\tInsert into a table\n2.\tDelete from a table\n3.\tUpdate a table\n"
				+ "4.\tQuery existing tables\nOther.\tExit the program");
		String input = scan.nextLine();
		switch (input) {
			case "1":
				return 1;
			case "2":
				return 2;
			case "3":
				return 3;
			case "4":
				return 4;
			default:
				return -1;
		}
	}
	
	
	public String table_select(String command) {
		System.out.println(String.format("Please select a table to preform %s on.", command));
		while (true) {
			int i = 1;
			for (String table: table_names) {
				System.out.println(String.format("%d.\t%s", i, table));
				i++;
			}
			String input = scan.nextLine();
			switch (input) {
				case "1":
					return table_names[0];
				case "2":
					return table_names[1];
				case "3":
					return table_names[2];
				case "4":
					return table_names[3];
				case "5":
					return table_names[4];
				case "6":
					return table_names[5];
				case "7":
					return table_names[6];
				default:
					System.out.println("You must select a table from the list.");
			}
		}
	}
	
	public boolean isValidDate(String input) {
		if (input.length() != 10) {
			System.out.println("Invalid date, Ex. 0000-00-00");
			return false;
		}
		for (int i = 0; i < input.length(); i++) {
			char c = input.charAt(i);
			if (i == 4 || i == 7) {
				if (c != '-') {
					System.out.println("Invalid date, Ex. 0000-00-00");
					return false;
				}
			} else {
				if (c < 48 || c > 57) {
					System.out.println("Invalid date, Ex. 0000-00-00");
					return false;
				}
			}
		}
		return true;
	}
	
	
	public boolean isValidTime(String input) {
		if (input.length() != 19) {
			System.out.println("Invalid time, Ex. 2000-01-01 00:00:00");
			return false;
		}
		for (int i = 0; i < input.length(); i++) {
			char c = input.charAt(i);
			if (i == 4 || i == 7) {
				if (c != '-') {
					System.out.println("Invalid time, Ex. 2000-01-01 00:00:00");
					return false;
				}
			} else if (i == 13 || i == 16) {
				if (c != ':') {
					System.out.println("Invalid time, Ex. 2000-01-01 00:00:00");
					return false;
				}
			} else if (i == 10) {
				if (c != ' ') {
					System.out.println("Invalid time, Ex. 2000-01-01 00:00:00");
					return false;
				}
			} else {
				if (c < 48 || c > 57) {
					System.out.println("Invalid time, Ex. 2000-01-01 00:00:00");
					return false;
				}
			}
		}
		return true;
	}
	
	
	public boolean validate_input(String input, String type) {
		if (type.equals("Date")) {
			return isValidDate(input);
		} else if (type.equals("Time")) {
			return isValidTime(input);
		} else if (type.equals("Number")) {
			if (input.equals("0") || input.equals("1")) {
				return true;
			} else {
				System.out.println("Number must be a 0 or a 1.");
				return false;
			}
		} else if (type.equals("Int")){
			for (int i = 0; i < input.length(); i++) {
				char c = input.charAt(i);
				if (c < 48 || c > 57) {
					System.out.println("The value must be numeric.");
					return false;
				}
			}
			return true;
		} else {
			return true;
		}
	}
	
	
	public void print_select(String name, String type) {
		String field = String.format("Select a %s (%s)", name, type);
		if (type.equals("Date")) {
			 field += " Ex. 0000-00-00";
		} else if (type.equals("Time")){
			field += " Ex. 2000-01-01 00:00:00";
		} else if (type.equals("Number")){
			field += " EX. (0,1)";
		}
		System.out.println(field);
	}
	
	
	public void insert() throws SQLException {
		String table_name = table_select("Insert");
		Table table = tables.get(table_name);
		System.out.println(String.format("Insert into table %s: %s", table_name, table));
		String[] query = new String[table.field_names.length];
		String insert_query = String.format("insert into %s.%s values (", table_prefix, table_name);
		boolean first = true;
		for (int i = 0; i < table.field_names.length; i++) {
			boolean valid = false;
			String input = null;
			while (!valid) {
				print_select(table.field_names[i], table.types[i]);
				input = scan.nextLine();
				valid = validate_input(input, table.types[i]);
			}
			if (!first) {
				insert_query += ", ";
			}
			if (table.types[i].equals("Int") || table.types[i].equals("Number")) {
				insert_query += String.format("%s", input);
			} else {
				insert_query += String.format("'%s'", input);
			}
			first = false;
		}
		insert_query += ")";
		stmt.executeUpdate(insert_query);
		System.out.println("Insert Successful");
	}
	
	public void delete() throws SQLException {
		String table_name = table_select("Delete");
		Table table = tables.get(table_name);
		System.out.println(String.format("Select an %s that you want to delete from the table %s.", table.field_names[0], table_name));
		boolean valid = false;
		String input = null;
		while (!valid) {
			input = scan.nextLine();
			valid = validate_input(input, "Int");
		}
		int id = Integer.parseInt(input);
		String delete = String.format("Delete from %s.%s where %s = %d", table_prefix, table_name, table.field_names[0], id);
		stmt.executeUpdate(delete);
		System.out.println("Delete Successful");
	}
	
	public void update() throws SQLException {
		String table_name = table_select("Update");
		Table table = tables.get(table_name);
		System.out.println(String.format("Select an %s that you want to update the fields of from the table %s.", table.field_names[0], table_name));
		
		boolean valid = false;
		String input = null;
		while (!valid) {
			input = scan.nextLine();
			valid = validate_input(input, "Int");
		}
		int id = Integer.parseInt(input);
		
		String update = String.format("Update %s.%s\n", table_prefix, table_name);
		for (int i = 1; i < table.field_names.length; i++) {
			valid = false;
			input = null;
			while (!valid) {
				print_select(table.field_names[i], table.types[i]);
				System.out.println("Or enter null if you do not want to update the field");
				input = scan.nextLine();
				if (!input.equals("(null)")) {
					valid = validate_input(input, table.types[i]);
				} else {
					valid = true;
				}
			}
			if (!input.equals("null")) {
				if (table.types[i].equals("Int") || table.types[i].equals("Number")) {
					update += String.format("set %s = %s\n", table.field_names[i], input);
				} else {
					update += String.format("set %s = '%s'\n", table.field_names[i], input);
				}
			}
		}
		update += String.format("where %s = %d", table.field_names[0], id);
		stmt.executeUpdate(update);
		System.out.println("Update Successful");
	}
	
	
	public String getDate() {
		System.out.println("Please enter a date of the form mm-dd-yyyy");
		boolean valid = false;
		String input = null;
		while (!valid) {
			valid = true;
			input = scan.nextLine();
			if (input.length() != 10) {
				valid = false;
			} else {
				for (int i = 0; i < input.length(); i++) {
					char c = input.charAt(i);
					if (i == 4 || i == 7) {
						if (c != '-') {
							valid = false;
						}
					} else {
						if (c < 48 || c > 57) {
							valid = false;
						}
					}
				}
			}
			if (!valid) {
				System.out.println("Invalid date, Ex. mm-dd-yyyy");
			}
		}
		return input;
	}
	
	public void query() throws SQLException {
		System.out.println(String.format("\nWhich query would you like to run?\n"
                + "1. %s\n2. %s\n3. %s\n4. %s\nOther. exit program!\n",
                QUESTION1, QUESTION2, QUESTION3, QUESTION4));
		boolean valid = false;
		while (!valid) {
			String input = scan.next();
			if (input.equals("1")) {
				String date = getDate();
				query1(date);
			} else if (input.equals("2")) {
				query2();
			} else if (input.equals("3")) {
				query3();
			} else if (input.equals("4")) {
				query4();
			} else {
				System.out.println("You need to input a value between 1 and 4.");
			}
		}
	}
	
	
	public static void query1(String date) throws SQLException {
        String query = String.format(QUERY1, date);
        ResultSet results = stmt.executeQuery(query);
        if (results != null) {
                System.out.println("\n" + query);
                ResultSetMetaData resultsmetadata = results.getMetaData();
                if (resultsmetadata.getColumnCount() > 0) {
                	System.out.println(resultsmetadata.getColumnName(1));
                }
                for (int i = 2; i <= resultsmetadata.getColumnCount(); i++) {
                	System.out.print("  |  " + resultsmetadata.getColumnName(i));
                }
                System.out.println();
                while(results.next()) {
                	System.out.println(results.getInt("Customer.customerID"));
                	System.out.println("\t" + results.getString("firstName"));
                	System.out.println("\t" + results.getString("lastName"));
                	System.out.println("\t" + results.getDate("expireDate"));
                	System.out.println("\t" + results.getString("deptName"));
                }
        }
}
public static void query2() throws SQLException {
	String query = String.format(QUERY2);
    ResultSet results = stmt.executeQuery(query);
    if (results != null) {
            System.out.println("\n" + query);
            ResultSetMetaData resultsmetadata = results.getMetaData();
            if (resultsmetadata.getColumnCount() > 0) {
            	System.out.println(resultsmetadata.getColumnName(1));
            }
            for (int i = 2; i <= resultsmetadata.getColumnCount(); i++) {
            	System.out.print("  |  " + resultsmetadata.getColumnName(i));
            }
            System.out.println();
            while(results.next()) {
            	System.out.println(results.getInt("TotalAppts"));
            	System.out.println("\t" + results.getInt("Successful"));
            }
    }
}

public static void query3() throws SQLException {
	String query = String.format(QUERY3);
    ResultSet results = stmt.executeQuery(query);
    if (results != null) {
            System.out.println("\n" + query);
            ResultSetMetaData resultsmetadata = results.getMetaData();
            if (resultsmetadata.getColumnCount() > 0) {
            	System.out.println(resultsmetadata.getColumnName(1));
            }
            for (int i = 2; i <= resultsmetadata.getColumnCount(); i++) {
            	System.out.print("  |  " + resultsmetadata.getColumnName(i));
            }
            System.out.println();
            while(results.next()) {
            	System.out.println(results.getInt("Customer.customerID"));
            	System.out.println("\t" + results.getString("firstName"));
            	System.out.println("\t" + results.getString("lastName"));
            	System.out.println("\t" + results.getDate("expireDate"));
            	System.out.println("\t" + results.getString("deptName"));
            }
    }
}

public static void query4() throws SQLException {
	String query = String.format(QUERY4);
    ResultSet results = stmt.executeQuery(query);
    if (results != null) {
            System.out.println("\n" + query);
            ResultSetMetaData resultsmetadata = results.getMetaData();
            if (resultsmetadata.getColumnCount() > 0) {
            	System.out.println(resultsmetadata.getColumnName(1));
            }
            for (int i = 2; i <= resultsmetadata.getColumnCount(); i++) {
            	System.out.print("  |  " + resultsmetadata.getColumnName(i));
            }
            System.out.println();
            while(results.next()) {
            	System.out.println(results.getInt("Customer.customerID"));
            	System.out.println("\t" + results.getString("firstName"));
            	System.out.println("\t" + results.getString("lastName"));
            	System.out.println("\t" + results.getDate("expireDate"));
            	System.out.println("\t" + results.getString("deptName"));
            }
    }
}
	
	
	public class Table {
		
		String[] types;
		String[] field_names;
		
		public Table(String[] field_names, String[] types) {
			this.types = types;
			this.field_names = field_names;
		}
		
		
		public String toString() {
			String ret_val = field_names[0] + String.format(" (%s)", types[0]);
			
			for (int i = 1; i < field_names.length; i++) {
				ret_val +=  String.format(" | %s (%s)", field_names[i], types[i]);
			}
			return ret_val;
		}

	}
}
