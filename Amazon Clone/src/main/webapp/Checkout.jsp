<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
    session.setAttribute("message", "You are not logged in !!! Login first to access checkout page");
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Component/commen_css_js.jsp"%>


</head>
<body>
	<%@include file="Component/navbar.jsp"%>

	<%@include file="Component/common_model.jsp"%>

	<div class="container-fluid d-flex justify-content-center align-items-center centered-container">
        <div class="row mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center my-5">Your selected Items</h2>
                        <div class="cart-body"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center my-5">Your Details For Orders</h2>
                        <form action="#!">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input value="<%= user.getUserEmail()%>"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your name</label>
                                <input value="<%= user.getUserName()%>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
             
                            </div>
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your Contact</label>
                                <input value="<%= user.getUserPhone()%>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Contact Number">
             
                            </div>
                            <div class="form-group">
    <label for="exampleFormControlTextarea1">Your shipping address</label>
    <textarea value="<%= user.getUserAddress()%>"class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
  </div>
          
          <div class="container">
          
          <button class="btn btn-outline-primary">Order Now</button>
          <button class="btn btn-outline-secondary">Continue Shopping</button>
          </div>             
          
           </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>