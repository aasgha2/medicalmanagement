package com.model;

public class Doctor {
	private int id;
	private String fullName;
	private String email;
	private String birthDate;
	private String education;
	private String address;
	private String city;
	private String state;
	private String zipCode;
	private String homePhone;
	private String mobilePhone;
	private String password;
	
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Doctor(String fullName, String email, String birthDate, String education, String address, String city,
			String state, String zipCode, String homePhone, String mobilePhone, String password) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.birthDate = birthDate;
		this.education = education;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.homePhone = homePhone;
		this.mobilePhone = mobilePhone;
		this.password = password;
	}
	

	public Doctor(int id, String fullName, String email, String birthDate, String education, String address,
			String city, String state, String zipCode, String homePhone, String mobilePhone, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.birthDate = birthDate;
		this.education = education;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.homePhone = homePhone;
		this.mobilePhone = mobilePhone;
		this.password = password;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
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

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
