package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.Patient;

public class PatientDAO {
	private Connection connection;

	public PatientDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean registerPatient(Patient patient) {
		boolean bool = false;
		try {
			String query = "insert into user_details(full_name,email,password) values(?,?,?) ";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, patient.getFullName());
			ps.setString(2, patient.getEmail());
			ps.setString(3, patient.getPassword());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				bool = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}
	
	public Patient login(String email, String password) {
		Patient p = null;
		
		try {
			String query = "select * from user_details where email=? and password=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet result = ps.executeQuery();
			
			while(result.next()) {
				p = new Patient();
				p.setId(result.getInt(1));
				p.setFullName(result.getString(2));
				p.setEmail(result.getString(3));
				p.setPassword(result.getString(4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}
