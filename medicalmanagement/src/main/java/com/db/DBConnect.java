package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection connection;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(System.getenv("dbConnection"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
