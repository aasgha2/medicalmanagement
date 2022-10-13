package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Appointment;

public class AppointmentDAO {
	private Connection connection;

	public AppointmentDAO(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean bookAppointment(Appointment appt) {
		boolean bool = false;

		try {
			String query = "insert into appointments(user_id, full_name, email, number, birth_date, gender, address, city, state, zip_code, date, doctor_id, description, diagnosis, treatment, notes) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, appt.getUserId());
			ps.setString(2, appt.getFullName());
			ps.setString(3, appt.getEmail());
			ps.setString(4, appt.getNumber());
			ps.setString(5, appt.getBirthDate());
			ps.setString(6, appt.getGender());
			ps.setString(7, appt.getAddress());
			ps.setString(8, appt.getCity());
			ps.setString(9, appt.getState());
			ps.setString(10, appt.getZipCode());
			ps.setString(11, appt.getDate());
			ps.setInt(12, appt.getDoctorId());
			ps.setString(13, appt.getDescription());
			ps.setString(14, appt.getDiagnosis());
			ps.setString(15, appt.getTreatment());
			ps.setString(15, appt.getNotes());

			int i = ps.executeUpdate();

			if (i == 1) {
				bool = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}

	public Appointment getAppointmentById(int id) {
		Appointment temp = null;
		try {
			String query = "select * from appointments where id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet result = ps.executeQuery();

			while (result.next()) {
				temp = new Appointment();
				temp.setId(result.getInt(1));
				temp.setUserId(result.getInt(2));
				temp.setFullName(result.getString(3));
				temp.setEmail(result.getString(4));
				temp.setNumber(result.getString(5));
				temp.setBirthDate(result.getString(6));
				temp.setGender(result.getString(7));
				temp.setAddress(result.getString(8));
				temp.setCity(result.getString(9));
				temp.setState(result.getString(10));
				temp.setZipCode(result.getString(11));
				temp.setDate(result.getString(12));
				temp.setDoctorId(result.getInt(13));
				temp.setDescription(result.getString(14));
				temp.setDiagnosis(result.getString(15));
				temp.setTreatment(result.getString(16));
				temp.setNotes(result.getString(17));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp;
	}

	public List<Appointment> getAppointmentByUser(int userId) {
		List<Appointment> apptList = new ArrayList<Appointment>();

		Appointment temp = null;

		try {
			String query = "select * from appointments where user_id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, userId);

			ResultSet result = ps.executeQuery();

			while (result.next()) {
				temp = new Appointment();
				temp.setId(result.getInt(1));
				temp.setUserId(result.getInt(2));
				temp.setFullName(result.getString(3));
				temp.setEmail(result.getString(4));
				temp.setNumber(result.getString(5));
				temp.setBirthDate(result.getString(6));
				temp.setGender(result.getString(7));
				temp.setAddress(result.getString(8));
				temp.setCity(result.getString(9));
				temp.setState(result.getString(10));
				temp.setZipCode(result.getString(11));
				temp.setDate(result.getString(12));
				temp.setDoctorId(result.getInt(13));
				temp.setDescription(result.getString(14));
				temp.setDiagnosis(result.getString(15));
				temp.setTreatment(result.getString(16));
				temp.setNotes(result.getString(17));

				apptList.add(temp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return apptList;
	}

	public List<Appointment> getAppointmentByDoctor(int doctorId) {
		List<Appointment> apptList = new ArrayList<Appointment>();

		Appointment temp = null;

		try {
			String query = "select * from appointments where doctor_id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, doctorId);

			ResultSet result = ps.executeQuery();

			while (result.next()) {
				temp = new Appointment();
				temp.setId(result.getInt(1));
				temp.setUserId(result.getInt(2));
				temp.setFullName(result.getString(3));
				temp.setEmail(result.getString(4));
				temp.setNumber(result.getString(5));
				temp.setBirthDate(result.getString(6));
				temp.setGender(result.getString(7));
				temp.setAddress(result.getString(8));
				temp.setCity(result.getString(9));
				temp.setState(result.getString(10));
				temp.setZipCode(result.getString(11));
				temp.setDate(result.getString(12));
				temp.setDoctorId(result.getInt(13));
				temp.setDescription(result.getString(14));
				temp.setDiagnosis(result.getString(15));
				temp.setTreatment(result.getString(16));
				temp.setNotes(result.getString(17));

				apptList.add(temp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return apptList;
	}
	
	public List<Appointment> getAppointments() {
		List<Appointment> apptList = new ArrayList<Appointment>();

		Appointment temp = null;

		try {
			String query = "select * from appointments order by id desc";
			PreparedStatement ps = connection.prepareStatement(query);

			ResultSet result = ps.executeQuery();

			while (result.next()) {
				temp = new Appointment();
				temp.setId(result.getInt(1));
				temp.setUserId(result.getInt(2));
				temp.setFullName(result.getString(3));
				temp.setEmail(result.getString(4));
				temp.setNumber(result.getString(5));
				temp.setBirthDate(result.getString(6));
				temp.setGender(result.getString(7));
				temp.setAddress(result.getString(8));
				temp.setCity(result.getString(9));
				temp.setState(result.getString(10));
				temp.setZipCode(result.getString(11));
				temp.setDate(result.getString(12));
				temp.setDoctorId(result.getInt(13));
				temp.setDescription(result.getString(14));
				temp.setDiagnosis(result.getString(15));
				temp.setTreatment(result.getString(16));
				temp.setNotes(result.getString(17));

				apptList.add(temp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return apptList;
	}

	public boolean updateResults(int id, int doctorId, String diagnosis, String treatment, String notes) {
		boolean bool = false;
		try {
			String query = "update appointments set diagnosis=?, treatment=?, notes=? where id=? and doctor_id=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, diagnosis);
			ps.setString(2, treatment);
			ps.setString(3, notes);
			ps.setInt(4, id);
			ps.setInt(5, doctorId);

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
