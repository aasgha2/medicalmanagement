package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.model.Patient;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			if(email.equals("admin@gmail.com") && password.equals("admin321")) {
				session.setAttribute("adminObj", new Patient());
				resp.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("adminLoginErrorMessage", "INVALID LOGIN");
				resp.sendRedirect("login_admin.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
