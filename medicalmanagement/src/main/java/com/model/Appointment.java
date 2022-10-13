package com.model;

public class Appointment {
	private int id;
	private int userId;
	private String fullName;
	private String email;
	private String number;
	private String birthDate;
	private String gender;
	private String address;
	private String city;
	private String state;
	private String zipCode;
	private String date;
	private int doctorId;
	private String description;
	private String diagnosis;
	private String treatment;
	private String notes;

	
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Appointment(int userId, String fullName, String email, String number, String birthDate, String gender,
			String address, String city, String state, String zipCode, String date, int doctorId, String description,
			String diagnosis, String treatment, String notes) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.email = email;
		this.number = number;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.date = date;
		this.doctorId = doctorId;
		this.description = description;
		this.diagnosis = diagnosis;
		this.treatment = treatment;
		this.notes = notes;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNumber() {
		return number;
	}


	public void setNumber(String number) {
		this.number = number;
	}


	public String getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getDiagnosis() {
		return diagnosis;
	}


	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}


	public String getTreatment() {
		return treatment;
	}


	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}


	public String getNotes() {
		return notes;
	}


	public void setNotes(String notes) {
		this.notes = notes;
	}
}




	