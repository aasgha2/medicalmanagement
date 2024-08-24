package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.http.HttpSession;

import com.dao.PatientDAO;
import com.db.DBConnect;
import com.model.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user_register")
public class PatientRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			Patient patient = new Patient(fullName, email, password);

			PatientDAO patientDAO = new PatientDAO(DBConnect.getConnection());
			
			HttpSession session = req.getSession();

			boolean bool = patientDAO.registerPatient(patient);

			if (bool) {
				session.setAttribute("registerSuccessMessage", "Registration Successful");
				resp.sendRedirect("signup.jsp");
			} else {
				session.setAttribute("registerErrorMessage", "Registration Failed");
				resp.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
