package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.DonorDAO;
import com.db.DBConnect;
import com.model.Donor;

@WebServlet("/updateDonor")
public class DonorEdit extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String birthDate = req.getParameter("birthdate");
			String gender = req.getParameter("gender");
			String bloodType = req.getParameter("bloodtype");
			String donorType = req.getParameter("donortype");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Donor donor = new Donor(id, fullName, birthDate, gender, bloodType, donorType, email, phone);
			
			DonorDAO donorDAO = new DonorDAO(DBConnect.getConnection());
			HttpSession session = req.getSession();
			
			if(donorDAO.update(donor)) {
				session.setAttribute("donorUpdateSuccessMessage", "Donor Details Update Successful");
				resp.sendRedirect("admin/donor_info.jsp");
			} else {
				session.setAttribute("donorUpdateErrorMessage", "Donor Details Update Failed");
				resp.sendRedirect("admin/donor_info.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
