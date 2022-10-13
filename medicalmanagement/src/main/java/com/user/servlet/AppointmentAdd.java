package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.model.Appointment;

@WebServlet("/bookAppointment")
public class AppointmentAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String number = req.getParameter("number");
		String birthDate = req.getParameter("birthdate");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zipCode = req.getParameter("zipcode");
		String date = req.getParameter("date");
		int doctorId = Integer.parseInt(req.getParameter("doctor"));
		String description = req.getParameter("description");

		Appointment appointment = new Appointment(userId, fullname, email, number, birthDate, gender, address, city,
				state, zipCode, date, doctorId, description, "In Progress","In Progress", "In Progress");
		AppointmentDAO apptDAO = new AppointmentDAO(DBConnect.getConnection());
		HttpSession session = req.getSession();

		if (apptDAO.bookAppointment(appointment)) {
			session.setAttribute("appointmentBookSuccessMessage", "Appointment Booked, See You Soon!");
			resp.sendRedirect("book_appointment.jsp");
		} else {
			session.setAttribute("appointmentBookErrorMessage", "Sorry, looks like something went wrong.");
			resp.sendRedirect("book_appointment.jsp");
		}

	}

}