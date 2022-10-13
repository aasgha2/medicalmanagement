package com.model;

public class Donor {
	private int id;
	private String fullName;
	private String birthDate;
	private String gender;
	private String bloodType;
	private String donorType;
	private String email;
	private String phone;
	
	public Donor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Donor(String fullName, String birthDate, String gender, String bloodType, String donorType, String email,
			String phone) {
		super();
		this.fullName = fullName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.bloodType = bloodType;
		this.donorType = donorType;
		this.email = email;
		this.phone = phone;
	}

	public Donor(int id, String fullName, String birthDate, String gender, String bloodType, String donorType,
			String email, String phone) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.bloodType = bloodType;
		this.donorType = donorType;
		this.email = email;
		this.phone = phone;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getDonorType() {
		return donorType;
	}

	public void setDonorType(String donorType) {
		this.donorType = donorType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
