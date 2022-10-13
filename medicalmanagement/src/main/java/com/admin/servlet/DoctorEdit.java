package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.model.Doctor;

@WebServlet("/updateDoctor")
public class DoctorEdit extends HttpServlet{

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
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor doctor = new Doctor(id, fullName, email, birthDate, education, address, city, state, zipCode, homePhone, mobilePhone, password);
			
			DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConnection());
			HttpSession session = req.getSession();
			
			if(doctorDAO.update(doctor)) {
				session.setAttribute("doctorUpdateSuccessMessage", "Doctor Details Update Successful");
				resp.sendRedirect("admin/doctor_info.jsp");
			} else {
				session.setAttribute("doctorUpdateErrorMessage", "Doctor Details Update Failed");
				resp.sendRedirect("admin/doctor_info.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
