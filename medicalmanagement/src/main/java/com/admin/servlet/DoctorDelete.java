package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDAO;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteDoctor")
public class DoctorDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConnection());
		HttpSession session = req.getSession();
		
		if(doctorDAO.delete(id)) {
			session.setAttribute("doctorDeleteSuccessMessage", "Doctor Deletion Successful");
			resp.sendRedirect("admin/doctor_info.jsp");
		} else {
			session.setAttribute("doctorDeleteErrorMessage", "Doctor Deletion Failed");
			resp.sendRedirect("admin/doctor_info.jsp");
		}
	}
	
	
}
