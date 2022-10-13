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
