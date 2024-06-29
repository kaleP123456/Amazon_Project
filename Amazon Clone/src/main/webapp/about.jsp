<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Component/commen_css_js.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f8f9fa;
	color: #333;
	margin: 0;
	padding: 0;
}

header {
	background-color: #007bff;
	color: #fff;
	padding: 10px 0;
	text-align: center;
}

.container {
	width: 80%;
	margin: auto;
	padding: 20px;
}

.about-section {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.about-section h2 {
	color: #007bff;
	margin-bottom: 1em;
}

.about-section p {
	margin-bottom: 1.5em;
}
</style>

</head>
<body>
	<%@include file="Component/navbar.jsp"%>

	<header>
		<h1>About Us</h1>
	</header>

	<div class="container">
		<div class="about-section">
			<h2>Welcome to Online Shopping!</h2>
			<p> "Welcome to our premier online destination" 
			        
			    Inspired by the best of Amazon! Discover a world of endless possibilities with our
				curated collection of mobiles, laptops, shoes, and jewelry. Whether
				you're upgrading your tech with cutting-edge smartphones and
				powerful laptops, stepping out in style with the latest footwear
				trends, or adding a touch of elegance with exquisite jewelry pieces,
				we bring you top-notch quality and unbeatable prices. Embrace
				seamless shopping with secure transactions and swift delivery,
				making every purchase a delightful experience. Explore, shop, and
				indulge in the ultimate online shopping journey with us!"</p>


		</div>
	</div>

	<footer> &copy; 2024 Online Shopping. All rights reserved. </footer>

</body>
</html>




<%@include file="Component/common_model.jsp"%>
</body>
</html>