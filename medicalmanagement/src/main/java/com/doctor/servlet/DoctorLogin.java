package com.doctor.servlet;

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

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConnection());
			Doctor doctor = doctorDAO.login(email, password);
			
			if(doctor != null) {
				session.setAttribute("doctorObj", doctor);
				resp.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("doctorLoginErrorMessage", "Wrong Credentials");
				resp.sendRedirect("login_doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	}
	
	
