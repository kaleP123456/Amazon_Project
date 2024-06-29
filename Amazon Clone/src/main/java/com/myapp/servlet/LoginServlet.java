package com.myapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.UserDao;
import com.demo.entity.User;
import com.demo.helper.FactoryProvider;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
    	
    	response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out=response.getWriter())
    	{
    		String email=request.getParameter("email");
    		String password=request.getParameter("password");
    		
    		//validations
    		UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);
            // System.out.println(user);
            HttpSession session=request.getSession();
            if(user==null)
            {
            	
            	session.setAttribute("message", "Invalid deatils ! try with another one");
            	response.sendRedirect("login.jsp");
            	return;
            }
            else
            {
            	out.println("<h1>welcome "+user.getUserName()+"</h1>");
            	session.setAttribute("current-user", user);
            	if(user.getUser_type().equals("admin"))
            	{
            		//admin:admin.jsp
            		response.sendRedirect("admin.jsp");
            	}
            	else if(user.getUser_type().equals("normal"))
            	{
            		//normal.jsp
            		response.sendRedirect("normal.jsp");
            	}else {
            	
            		out.println("we have not identified user type");
            	}
            	
            
    	
            	
            }
    	}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

}
