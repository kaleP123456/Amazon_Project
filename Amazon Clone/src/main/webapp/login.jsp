<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Amazon Clone</title>
<%@include file="Component/commen_css_js.jsp" %>
</head>
<body>
<%@include file="Component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card mt-3">
<div class="card-header custom-bg text-black " >
<center><h3>Login Here !!!</h3></center>

</div>
<div class="card-body">
<%@include file="Component/message.jsp" %>
<form action="Login" method="post">
  <div class="mb-3">
    <label for="Email Address" class="form-label">Email Address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text"></div>
  </div>
  <div class="mb-3">
    <label for="Password" class="form-label">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="container text-center">
  <a href="register.jsp">If not registered click here</a>
  </div>
  <br>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
  <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
  
 </div>
 
 
</form>

</div>



</div>


</div>



</div>





</div>


</body>
</html>