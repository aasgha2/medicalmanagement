package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.PatientDAO;
import com.db.DBConnect;
import com.model.Patient;

@WebServlet("/userLogin")
public class PatientLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			PatientDAO dao = new PatientDAO(DBConnect.getConnection());
			Patient patient = dao.login(email, password);
			
			if(patient != null) {
				session.setAttribute("patientObj", patient);
				resp.sendRedirect("index.jsp");
			} else {
				session.setAttribute("patientLoginErrorMessage", "Wrong Credentials");
				resp.sendRedirect("login_patient.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	}
	
	
