<%@page import="com.demo.helper.healper"%>
<%@page import="java.util.Map"%>

<%@page import="com.demo.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.helper.FactoryProvider"%>
<%@page import="com.demo.dao.Categorydao"%>
<%@ page import="com.demo.entity.User" %>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
    session.setAttribute("message", "You are not logged in !!! Login first");
    response.sendRedirect("login.jsp");
    return;
} else {
    if (user.getUser_type().equals("normal")) {
        session.setAttribute("message", "You are not admin ! Do not access this page");
        return;
    }
}
%>

 <%
       
         Categorydao cdao= new Categorydao(FactoryProvider.getFactory());
          List<Category> list = cdao.getCategory();
          Map<String, Long> m = healper.getCounts(FactoryProvider.getFactory());
        
       %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@ include file="Component/commen_css_js.jsp" %>
</head>
<body>
    <%@ include file="Component/navbar.jsp" %>
    <div class="container">
        <div class="row mt-3">
        
        <div class ="container-fluid mt-3">
        <%@include file="Component/message.jsp"  %>
        </div>
            <!-- first col -->
            
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                        </div>
                        <h1><%= m.get("userCount") %></h1>
                        <h1 class="text-uppercase text-muted">User</h1>
                    </div>
                </div>
            </div>

            <!-- second col -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                        </div>
                        <h1><%= list.size() %></h1>
                        <h1 class="text-uppercase text-muted">Categories</h1>
                    </div>
                </div>
            </div>

            <!-- third col -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                        </div>
                        <h1><%= m.get("productCount") %></h1>
                        <h1 class="text-uppercase text-muted">Product</h1>
                    </div>
                </div>
            </div>
        </div>

        <!-- second row first col -->
        <div class="row mt-3">
            <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon">
                        </div>
                        <p class="mt-4">Click here to add new category</p>
                        <h1 class="text-uppercase text-muted">Add Category</h1>
                    </div>
                </div>
            </div>

            <!-- second row second col -->
            <div class="col-md-6">
                <div class="card">
                <div class="card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                        </div>
                        <p class="mt-4">Click here to add new Product</p>
                        <h1 class="text-uppercase text-muted">Add Product</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

<!-- Category Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form  action="product" method="post";>
       
       <input type="hidden"  name="operation" value="addcategory" >
       
        <div class="form-group">
       <input type="text" class="form-control" name="catTitle" placeholder="Enter category Title" required="required">
       
       </div>
       
       <div class="form-group">
       <textarea  style="height: 300px;"   class="form-control" placeholder="Enter category Description"  name="catDesceription"  required="required"></textarea>
    
        </div>
        
        <div class="container text-center">
        <button class="btn btn-outline-success">Add Category</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        
        </div>
        
        </form>
        
        
      </div>
      
    </div>
  </div>
</div>

<!-- end category launch modal-->


<!-- start product launch modal-->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="add-product-modal">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        
        <!-- Form -->
        
        
       
        <form action="product"  method="post"  enctype="multipart/form-data">
       <input type="hidden" name="operation" value="addproduct"/>
       
       <!-- Product Title -->
       <div class="form-group">
       <input type="text" class="form-control"  placeholder="Enter Product Title" name="pName" required="required">
       
       </div>
       
       
        <!-- Product Description -->
       <div class="form-group">
       <textarea  style="height: 300px;"   class="form-control" placeholder="Enter Product Description"  name="pDes"  required="required"></textarea>
       </div>
       
        <!-- Product Price -->
        <div class="form-group">
       <input type="number" class="form-control" placeholder="Enter Price of product" name="pPrice" required="reqired"   >
       </div>
        
         <!-- Product Discount -->
        <div class="form-group">
       <input type="number" class="form-control" placeholder="Enter Discount of product" name="pDiscount" required="reqired"   >
       </div>
       
        <!-- Product Quantity -->
       <div class="form-group">
       <input type="number" class="form-control" placeholder="Enter Quantity of product" name="pQuantity" required="reqired"   >
       </div>
       
       <!-- product Category-->
       
      
       
       <div class="form-group">
      <select name="catId" class="form-control" id="">
       <%
        for(Category c: list){
        	
       %> 
   
      
    <option value="<%= c.getCategoryID() %>">   
    <%= c.getCategoryTitle() %>
   </option>
        <%
        }
        %>
        
        
      </select>
       </div>
       
       
       <!--  -->
       
       <div class="form-group">
       <label for="pPhoto">Select Picture of Product</label>
       <br>
       
       <input type="file" id="pPhoto"  name="pPhoto" required>
       </div>
       
       
        
        
        
        <div class="container text-center">
        <button class="btn btn-outline-success">Add Product</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        
        </div>
        
        </form>
        
        
      </div>
      
    </div>
  </div>
</div>
<!-- end product launch modal-->
<%@include file="Component/common_model.jsp" %>
</body>
</html>
