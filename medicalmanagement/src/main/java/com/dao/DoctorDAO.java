package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Doctor;
import com.model.Patient;

public class DoctorDAO {
	private Connection connection;

	public DoctorDAO(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean registerDoctor(Doctor doctor) {
		boolean bool = false;
		try {
			String query = "insert into doctor_details(full_name, email, birth_date, education, address, city, state, zip_code, mobile_phone, home_phone, password) values(?,?,?,?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getEmail());
			ps.setString(3, doctor.getBirthDate());
			ps.setString(4, doctor.getEducation());
			ps.setString(5, doctor.getAddress());
			ps.setString(6, doctor.getCity());
			ps.setString(7, doctor.getState());
			ps.setString(8, doctor.getZipCode());
			ps.setString(9, doctor.getMobilePhone());
			ps.setString(10, doctor.getHomePhone());
			ps.setString(11, doctor.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				bool = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}

	public List<Doctor> getDoctors() {
		List<Doctor> doctorList = new ArrayList<Doctor>();
		try {
			String query = "select * from doctor_details order by id desc";
			PreparedStatement ps = connection.prepareStatement(query);

			ResultSet result = ps.executeQuery();
			while (result.next()) {
				Doctor temp = new Doctor();
				temp.setId(result.getInt(1));
				temp.setFullName(result.getString(2));
				temp.setEmail(result.getString(3));
				temp.setBirthDate(result.getString(4));
				temp.setEducation(result.getString(5));
				temp.setAddress(result.getString(6));
				temp.setCity(result.getString(7));
				temp.setState(result.getString(8));
				temp.setZipCode(result.getString(9));
				temp.setMobilePhone(result.getString(10));
				temp.setHomePhone(result.getString(11));
				temp.setPassword(result.getString(12));
				doctorList.add(temp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctorList;
	}

	public Doctor getDoctorById(int id) {
		Doctor temp = null;

		try {

			String query = "select * from doctor_details where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet result = ps.executeQuery();
			while (result.next()) {
				temp = new Doctor();
				temp.setId(result.getInt(1));
				temp.setFullName(result.getString(2));
				temp.setEmail(result.getString(3));
				temp.setBirthDate(result.getString(4));
				temp.setEducation(result.getString(5));
				temp.setAddress(result.getString(6));
				temp.setCity(result.getString(7));
				temp.setState(result.getString(8));
				temp.setZipCode(result.getString(9));
				temp.setMobilePhone(result.getString(10));
				temp.setHomePhone(result.getString(11));
				temp.setPassword(result.getString(12));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp;
	}
	
	public boolean update(Doctor doctor) {
		boolean bool = false;
		try {
			String query = "update doctor_details set full_name=?, email=?, birth_date=?, education=?, address=?, city=?, state=?, zip_code=?, mobile_phone=?, home_phone=?, password=? where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getEmail());
			ps.setString(3, doctor.getBirthDate());
			ps.setString(4, doctor.getEducation());
			ps.setString(5, doctor.getAddress());
			ps.setString(6, doctor.getCity());
			ps.setString(7, doctor.getState());
			ps.setString(8, doctor.getZipCode());
			ps.setString(9, doctor.getMobilePhone());
			ps.setString(10, doctor.getHomePhone());
			ps.setString(11, doctor.getPassword());
			ps.setInt(12, doctor.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				bool = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}
	
	public boolean delete(int id) {
		boolean bool = false;
		try {
			String query = "delete from doctor_details where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				bool = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}
	
	public Doctor login(String email, String password) {
		Doctor d = null;
		
		try {
			String query = "select * from doctor_details where email=? and password=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet result = ps.executeQuery();
			
			while(result.next()) {
				d = new Doctor();
                d.setId(result.getInt("id"));
                d.setFullName(result.getString("full_name"));
                d.setEmail(result.getString("email"));
                d.setBirthDate(result.getString("birth_date"));
                d.setEducation(result.getString("education"));
                d.setAddress(result.getString("address"));
                d.setCity(result.getString("city"));
                d.setState(result.getString("state"));
                d.setZipCode(result.getString("zip_code"));
                d.setMobilePhone(result.getString("mobile_phone"));
                d.setHomePhone(result.getString("home_phone"));
                d.setPassword(result.getString("password"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
}
