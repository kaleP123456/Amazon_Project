<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   String message=(String)session.getAttribute("message");
if(message!=null)
{
	
	//out.println(message);
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=message %></strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	
	<%
	
	session.removeAttribute("message");
	}



%>
   
</body>
</html>