+<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New user</title>
<%@include file="Component/commen_css_js.jsp" %>
</head>
<body>

<%@include file="Component/navbar.jsp" %>
<div class="container-fluid">
<div class="row mt-5">
<div class="col-md-4 offset-md-3">

<div class="card">
<%@include file="Component/message.jsp" %>
<div class="card-body px-6">

<div class="container text-center">
<i class="fas fa-user" style="font-size: 30px;"></i>

</div>
<h3 class="text-center my-3">SignUp</h3>
<form action="register" method="POST">
 <div class="form-group">
    <label for="name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="name"placeholder="Enter Name" aria-describedby="emailHelp" >
    </div>
    
    <div class="form-group">
    <label for="email">User Email</label>
    <input name="user_email" type="email" class="form-control" id="email"placeholder="Enter Email" aria-describedby="emailHelp" >
    </div>
    
    <div class="form-group">
    <label for="password">Password</label>
    <input name="user_pass"type="password" class="form-control" id="password"placeholder="Enter password" aria-describedby="emailHelp" >
   </div>
   
   <div class="form-group">
    <label for="phone">User Phone Number</label>
    <input name="user_phone" type="ph" class="form-control" id="phone"placeholder="Enter Number" aria-describedby="emailHelp" >
   </div>
   
   <div class="form-group">
     <label for="text" >User Address</label> 
        <input name="user_address" type="ad" class="form-control" id="address"placeholder="Enter Address" aria-describedby="emailHelp" >
    
<!--      <textarea style="height:50px;"class="form-control" placeholder="Enter your address"></textarea>
 -->   </div>
   <div class="container text-center">
   <button class="btn btn-outline-success">Register</button>
   
   
   </div>

</form>
</div>
</div>

</div>
</div>


</div>
</body>
</html>