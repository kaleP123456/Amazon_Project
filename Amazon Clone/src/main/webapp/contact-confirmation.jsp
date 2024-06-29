<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Confirmation</title>
    <%@ include file="Component/commen_css_js.jsp" %>
</head>
<body>
    <%@ include file="Component/navbar.jsp" %>

    <div class="container mt-5">
        <h2>Thank you for contacting us, <%= request.getAttribute("name") %>!</h2>
        <p>We have received your message and will get back to you at <%= request.getAttribute("email") %> soon.</p>
        <h4>Your Message:</h4>
        <p><%= request.getAttribute("message") %></p>
    </div>


</body>
</html>
