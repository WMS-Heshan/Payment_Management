package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class payment {

	// connection to database
	
	private Connection DBConnect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// database details: DBServer , DBName, user_name , password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/payment", "root", "root");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	// Insert payment details
	
	public String insertPayment(String payment_id, String fullname, String email, String mobile, String adderss,
			String zipcode, String paymenttype, String Date, String amount) {
		String output = "";
		try {
			Connection con = DBConnect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}

			String query = "INSERT INTO `paymentdetails`(`payment_id`, `fullname`, `email`, `mobile`, `adderss`, `zipcode`, `paymenttype`, `Date`, `amount`) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, fullname);
			preparedStmt.setString(3, email);
			preparedStmt.setString(4, mobile);
			preparedStmt.setString(5, adderss);
			preparedStmt.setString(6, zipcode);
			preparedStmt.setString(7, paymenttype);
			preparedStmt.setString(8, Date);
			preparedStmt.setString(9, amount);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";

		} catch (Exception e) {

			output = "{\"status\":\"error\", \"data\":\"Error while inserting the Payment.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	// Read Payment Details
	
	public String readPayment() {
		String output = "";
		try {
			Connection con = DBConnect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			// Prepare the HTML table to be displayed
			output = "<table border='1' class='table table-info table-bordered table-striped table-hover table-warning' >"
					+ "<tr >" + "<th >Full Name</th>" + "<th >Email</th>" + "<th>Mobile</th>" + "<th>Address</th>"
					+ "<th>Zip-Code</th>" + "<th>Payment_Type</th>" + "<th>Date</th>" + "<th>Amount</th>"
					+ "<th>Update</th>" + "<th>Remove</th>" +

					"</tr>";

			String query = "select * from `paymentdetails`";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {

				String payment_id = Integer.toString(rs.getInt("payment_id"));
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");
				String mobile = rs.getString("mobile");
				String adderss = rs.getString("adderss");
				String zipcode = rs.getString("zipcode");
				String paymenttype = rs.getString("paymenttype");
				String Date = rs.getString("Date");
				String amount = rs.getString("amount");

				// Add into the html table

				output += "<td>" + fullname + "</td>";
				output += "<td>" + email + "</td>";
				output += "<td>" + mobile + "</td>";
				output += "<td>" + adderss + "</td>";
				output += "<td>" + zipcode + "</td>";
				output += "<td>" + paymenttype + "</td>";
				output += "<td>" + Date + "</td>";
				output += "<td>" + amount + "</td>";

				// buttons

				output += "<td><input name='btnUpdate' type='button' value='Update' "
						+ "class='btnUpdate btn btn-secondary' data-userid='" + payment_id + "'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' "
						+ "class='btnRemove btn btn-danger' data-userid='" + payment_id + "'></td></tr>";
			}
			con.close();

			// Complete the html table
			output += "</table>";

		} catch (Exception e) {

			output = "Error while reading the Payment Details.";
			System.err.println(e.getMessage());
		}
		return output;

	}

	// Update Payment Details
	
	public String updatePayment(String payment_id, String fullname, String email, String mobile, String adderss,
			String zipcode, String paymenttype, String Date, String amount) {
		String output = "";
		try {
			Connection con = DBConnect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}

			// create a prepared statement
			String query = "UPDATE `paymentdetails` SET `fullname`=?,`email`=?,`mobile`=?,`adderss`=?,`zipcode`=?,`paymenttype`=?,`Date`=?,`amount`=? WHERE `payment_id`=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values

			preparedStmt.setString(1, fullname);
			preparedStmt.setString(2, email);
			preparedStmt.setString(3, mobile);
			preparedStmt.setString(4, adderss);
			preparedStmt.setString(5, zipcode);
			preparedStmt.setString(6, paymenttype);
			preparedStmt.setString(7, Date);
			preparedStmt.setString(8, amount);
			preparedStmt.setString(9, payment_id);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";

		} catch (Exception e) {

			output = "{\"status\":\"error\", \"data\": \"Error while updating the Payment.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	// Delete Payment Details
	
	public String deletePayment(String payment_id) {
		String output = "";
		try {
			Connection con = DBConnect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "DELETE FROM `paymentdetails` WHERE payment_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(payment_id));

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";

		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the Payment.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

}
