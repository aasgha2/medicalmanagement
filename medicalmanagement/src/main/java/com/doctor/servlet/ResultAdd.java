package com.doctor.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/addResult")
public class ResultAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int doctorId = Integer.parseInt(req.getParameter("doctorId"));
			String diagnosis = req.getParameter("diagnosis");
			String treatment = req.getParameter("treatment");
			String notes = req.getParameter("notes");
			
			AppointmentDAO appointmentDAO = new AppointmentDAO(DBConnect.getConnection());
			HttpSession session = req.getSession();
			
			if(appointmentDAO.updateResults(id, doctorId, diagnosis, treatment, notes) ) {
				session.setAttribute("resultAddSuccess", "Results Updated");
				resp.sendRedirect("doctor/patient_appointment.jsp");
			} else {
				session.setAttribute("resultAddError", "Results Could Not Be Updated");
				resp.sendRedirect("doctor/patient_appointment.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
