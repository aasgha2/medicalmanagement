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
import com.model.Donor;

@WebServlet("/addDonor")
public class DonorRegister extends HttpServlet{

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
			
			Donor donor = new Donor(fullName, birthDate, gender, bloodType, donorType, email, phone);
			
			DonorDAO donorDAO = new DonorDAO(DBConnect.getConnection());
			HttpSession session = req.getSession();
			
			if(donorDAO.registerDonor(donor)) {
				session.setAttribute("donorInfoSuccessMessage", "Donor Registration Successful");
				resp.sendRedirect("admin/donor_info.jsp");
			} else {
				session.setAttribute("donorInfoErrorMessage", "Donor Registration Failed");
				resp.sendRedirect("admin/donor_info.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
