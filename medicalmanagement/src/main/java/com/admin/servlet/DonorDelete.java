package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DonorDAO;
import com.db.DBConnect;

@WebServlet("/deleteDonor")
public class DonorDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DonorDAO donorDAO = new DonorDAO(DBConnect.getConnection());
		HttpSession session = req.getSession();
		
		if(donorDAO.delete(id)) {
			session.setAttribute("donorDeleteSuccessMessage", "Donor Deletion Successful");
			resp.sendRedirect("admin/donor_info.jsp");
		} else {
			session.setAttribute("donorDeleteErrorMessage", "Donor Deletion Failed");
			resp.sendRedirect("admin/donor_info.jsp");
		}
	}
	
	
}
