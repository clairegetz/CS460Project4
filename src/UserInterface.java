import java.sql.*;
import java.util.HashMap;
import java.util.Scanner;

// Comment

public class UserInterface {
	private Statement stmt;
	private Scanner scan = new Scanner(System.in);
	private final String[] table_names = new String[] {"Employee", "Appointment", "Customer", "StateID",
			"Permit", "Registration", "License"};
	private HashMap<String, Table> tables = new HashMap<String, Table>();
	private final String table_prefix = "Name";
	
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
			if (main_response == 1) {
				insert();
			} else if (main_response == 2) {
				delete();
			} else if (main_response == 3) {
				update();
			} else {
				query();
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
			System.out.println("Invalid date, Ex. 00-00-0000");
			return false;
		}
		for (int i = 0; i < input.length(); i++) {
			char c = input.charAt(i);
			if (i == 2 || i == 5) {
				if (c != '-') {
					System.out.println("Invalid date, Ex. 00-00-0000");
					return false;
				}
			} else {
				if (c < 48 || c > 57) {
					System.out.println("Invalid date, Ex. 00-00-0000");
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
			 field += " Ex. 00-00-0000";
		} else if (type.equals("Time")){
			field += " Ex. 2000-01-01 00:00:00";
		} else if (type.equals("Number")){
			field += " EX. (0,1)";
		}
		System.out.println(field);
	}
	
	
	public void insert() {
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
		System.out.println(insert_query + "\n");
	}
	
	public void delete() {
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
		String delete = String.format("Delete from %s.%s where %s = %d;", table_prefix, table_name, table.field_names[0], id);
		System.out.println(delete + "\n");
	}
	
	public void update() {
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
		update += String.format("where %s = %d;", table.field_names[0], id);
		System.out.println(update + "\n");
	}
	
	public void query() {
		//Query 1
		System.out.println("SELECT * FROM (\n" +
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
				"WHERE expireDate <= TO_DATE('%s', 'MM/DD/YYYY');");
		//Query 2
		System.out.println("SELECT COUNT(apptSuccessful) AS TotalAppts, SUM(apptSuccessful) AS Sucessful, deptName FROM (\n" +
				"SELECT * FROM Department JOIN Appointment\n" +
				"ON Appointment.deptID = Department.deptID\n" +
				"WHERE apptTime >= add_months(sysdate, -2)\n" +
				"INTERSECT\n" +
				"SELECT * FROM Department JOIN Appointment\n" +
				"ON Appointment.deptID = Department.deptID\n" +
				"WHERE apptTime < LAST_DAY(ADD_MONTHS(sysdate, -1)))\n" +
				"GROUP BY deptName;");
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
