package com.myapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
   
	 private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String message = request.getParameter("message");

	        // You can process the form data here, e.g., save to a database or send an email

	        // For demonstration, we simply forward the data to a confirmation JSP page
	        request.setAttribute("name", name);
	        request.setAttribute("email", email);
	        request.setAttribute("message", message);
	        request.getRequestDispatcher("contact-confirmation.jsp").forward(request, response);
	    }
	}


