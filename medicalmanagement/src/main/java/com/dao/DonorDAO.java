package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Donor;
import com.model.Donor;
import com.model.Donor;
import com.model.Donor;

public class DonorDAO {
	private Connection connection;

	public DonorDAO(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean registerDonor(Donor donor) {
		boolean bool = false;
		try {
			String query = "insert into donor_details(full_name, birth_date, gender, blood_type, donor_type, email, phone) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, donor.getFullName());
			ps.setString(2, donor.getBirthDate());
			ps.setString(3, donor.getGender());
			ps.setString(4, donor.getBloodType());
			ps.setString(5, donor.getDonorType());
			ps.setString(6, donor.getEmail());
			ps.setString(7, donor.getPhone());

			int i = ps.executeUpdate();

			if (i == 1) {
				bool = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}

	public Donor getDonorById(int id) {
		Donor temp = null;

		try {

			String query = "select * from donor_details where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet result = ps.executeQuery();
			while (result.next()) {
				temp = new Donor();
				temp.setId(result.getInt("id"));
				temp.setFullName(result.getString("full_name"));
				temp.setBirthDate(result.getString("birth_date"));
				temp.setGender(result.getString("gender"));
				temp.setBloodType(result.getString("blood_type"));
				temp.setDonorType(result.getString("donor_type"));
				temp.setEmail(result.getString("email"));
				temp.setPhone(result.getString("phone"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp;
	}

	public List<Donor> getAllDonors() {
		List<Donor> donorList = new ArrayList<Donor>();
		try {
			String query = "select * from donor_details order by id desc";
			PreparedStatement ps = connection.prepareStatement(query);

			ResultSet result = ps.executeQuery();
			while (result.next()) {
				Donor temp = new Donor();
				temp.setId(result.getInt("id"));
				temp.setFullName(result.getString("full_name"));
				temp.setBirthDate(result.getString("birth_date"));
				temp.setGender(result.getString("gender"));
				temp.setBloodType(result.getString("blood_type"));
				temp.setDonorType(result.getString("donor_type"));
				temp.setEmail(result.getString("email"));
				temp.setPhone(result.getString("phone"));
				donorList.add(temp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return donorList;
	}

	public boolean update(Donor donor) {
		boolean bool = false;
		try {
			String query = "update donor_details set full_name=?, birth_date=?, gender=?, blood_type=?, donor_type=?, email=?, phone=? where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, donor.getFullName());
			ps.setString(2, donor.getBirthDate());
			ps.setString(3, donor.getGender());
			ps.setString(4, donor.getBloodType());
			ps.setString(5, donor.getDonorType());
			ps.setString(6, donor.getEmail());
			ps.setString(7, donor.getPhone());
			ps.setInt(8, donor.getId());

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
			String query = "delete from donor_details where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i == 1) {
				bool = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}

}
