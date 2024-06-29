package com.myapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.demo.entity.User;
import com.demo.helper.FactoryProvider;




@WebServlet("/register")
public class RegsiterServlet extends HttpServlet {
	
	public void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		res.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = res.getWriter()) {
			  
			try {
				
			String userName=req.getParameter("user_name");
			String userEmail=req.getParameter("user_email");
			String userPasssword=req.getParameter("user_pass");
			String userPhone=req.getParameter("user_phone");
			String userAddress=req.getParameter("user_address");
			String user_type = req.getParameter("userType");
			if(userName.isEmpty()) {
				out.println("Name is blank");
				return;
			}
			
		    User user =	new User(userName, userEmail, userPasssword, userPhone, "default.jpg", userAddress,"normal");
		    Session hibernateSession=	FactoryProvider.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			
			int userId=(int) hibernateSession.save(user);
			
			
			tx.commit();
			hibernateSession.close();
			
		HttpSession httpsession=	req.getSession();
		httpsession.setAttribute("message","Register Sucessfully!!  User id is:    "+userId);
			res.sendRedirect("register.jsp");
			return;
			
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} 
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req, resp);
		
	}
	}
		

