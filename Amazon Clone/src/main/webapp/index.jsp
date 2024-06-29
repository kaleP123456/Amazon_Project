
<%@page import="com.demo.helper.healper"%>
<%@page import="com.demo.entity.Category"%>
<%@page import="com.demo.dao.Categorydao"%>
<%@page import="com.demo.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.dao.ProductDao"%>
<%@page import="com.demo.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>MyCart - Home</title>
<%@include file="Component/commen_css_js.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>

	<div class="row mt-3">
		<%
		String cat = (String) request.getParameter("category");
		//out.println(cat);
		// Create ProductDao instance and fetch the product list
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = null;

		if (cat == null) {
			list = dao.getAllProducts();
		} else if (cat.trim().equals("all")) {
			list = dao.getAllProducts();
		} else {
			int id = Integer.parseInt(cat.trim());
			list = dao.getAllProductsById(id);
		}

		Categorydao cdao = new Categorydao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategory();
		%>


		<!-- - show categories -->
		>
		<div class="col-md-2">

			<div class="list-group mt-4">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action active"> All
					Products </a>

			</div>

			<%
			for (Category c : clist) {
			%>
			<a href="index.jsp?category=<%=c.getCategoryID()%>"
				class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

			<%
			}
			%>

		</div>

		<!-- show products -->
		<div class="col-md-8">

			<div class="row mt-6">
				<!-- -first card -->
				<div class="col-md-12">
					<div class="card-columns">
						<!-- -traversing products -->
						<%
						for (Product p : list) {
						%>
						<div class="card product-card">
							<div class="container text-center">
								<img src="img/products/<%=p.getpPhoto()%>"
									style="max-height: 180px; max-width: 180px;"
									class="card-img-top m-2" alt="...">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text">
									<%=healper.get10Words(p.getpDes())%>
								</p>
							</div>

							<div class="card-footer text-center">
								<button class="btn btn-secondary text-white"
									onclick="add_to_cart(<%=p.getpID()%>, '<%=p.getpName()%>', <%=p.getPriceAfterDiscount()%>)">Add
									to cart</button>
									<br><br>
								<button class="btn btn-outline-danger">
									&#8377;<%=p.getPriceAfterDiscount()%>
									<span class="text-success discount-label">&#8377;<%=p.getpPrice()%>,
										<%=p.getPDiscount()%>% off
									</span>
								</button>
							</div>
						</div>




						<%
						}

						if (list.size() == 0) {
						out.println("No cat");
						}
						%>
					</div>
				</div>
			</div>

		</div>


	</div>


<%@include file="Component/common_model.jsp" %>
</body>
</html>
