package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection connection;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://medmanagement.csafrjk1t8e8.us-east-1.rds.amazonaws.com:3306/medical_management?user=admin&password=password");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
