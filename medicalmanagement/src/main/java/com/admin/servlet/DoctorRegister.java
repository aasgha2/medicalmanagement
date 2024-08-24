package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.model.Doctor;

@WebServlet("/addDoctor")
public class DoctorRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String birthDate = req.getParameter("birthdate");
			String education = req.getParameter("education");
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String zipCode = req.getParameter("zipcode");
			String homePhone = req.getParameter("homenumber");
			String mobilePhone = req.getParameter("mobilenumber");
			String password = req.getParameter("password");
			
			Doctor doctor = new Doctor(fullName, email, birthDate, education, address, city, state, zipCode, homePhone, mobilePhone, password);
			
			DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConnection());
			HttpSession session = req.getSession();
			
			if(doctorDAO.registerDoctor(doctor)) {
				session.setAttribute("doctorInfoSuccessMessage", "Doctor Registration Successful");
				resp.sendRedirect("admin/doctor_info.jsp");
			} else {
				session.setAttribute("doctorInfoErrorMessage", "Doctor Registration Failed");
				resp.sendRedirect("admin/doctor_info.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
