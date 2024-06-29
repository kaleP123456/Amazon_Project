<!DOCTYPE html>
<%@page import="com.demo.entity.User"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    .welcome-message {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: white; /* You can change this color to any color you prefer */
    margin-top: 20px;
    margin-left:350px; 
    margin-bottom:10px;
    font-size: 24px; /* Adjust the font size as needed */
}
</style>
</head>
 <%
 User user1 = (User)session.getAttribute("current-user");
 %>
 
        <nav>
            <div class="nav-left">
                <div class="nav-logo">
                    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20240326183545/amazon.png">
                </div>
                
               
            </div>
            
            
            
            

            <!-- <div class="nav-center">
                  <select class="search-dropdown">
                    <option>All</option>
                    <option>Laptop</option>
                    <option>Clothing</option>
                    <option>Grossary</option>
                    <option>Watchs & Mobiles</option>
                    <option>Books</option>
                    <option>Clothing</option>
                     
                </select>
               <input type="text" placeholder="Search Amazon">
                   
                <div class="search-icon">
                    <i class="fa-solid fa-magnifying-glass" 
                        style="color: #28416c;">
                    </i>
                    
                </div>
            </div>
             -->
             
           <div class="welcome-message">
        <h2>Welcome To Our Online Shopping !!!</h2>
    </div> 
            <!--  <div class="nav-center" style="max-width:70%; margin-left:220px">
            <input type="text" class="search-box" placeholder="Search...">
            <button class="search-icon">
                <i class="fas fa-search"></i>
            </button>
        </div>
              -->

            <div class="nav-right" style="margin-left:350px">
                <div class="language-option">
                    <div class="flag">
                        <i class="fa-regular fa-flag"></i>
                    </div>
                    <select class="select-language">
                        <option value="lan">EN</option>
                       
                    </select>
                </div>

 <!-- <nav class="nav">
        <a class="nav-link" href="returns-and-orders.jsp"><span>Return &amp; Orders</span></a>
         <div class="cart-option">
            <div class="cart-logo">
            <li class="nav-item active">
            <a class="nav-link" href="#" data-toggle="model" data-target="cart"> <i class="fa fa-cart-plus" style="font-size:20px"></i><span class="ml-0 class-items"> ( 0 )</span></a>
               </li>
            </div>
            
        </div> 
    </nav> -->
    
    <nav class="nav">
<!--     <a class="nav-link" href="returns-and-orders.jsp"><span>Return &amp; Orders</span></a> -->
    <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#cartModel">
            <i class="fa fa-cart-plus" style="font-size:20px"></i><span class="ml-0 cart-items"> ( 0 )</span>
        </a>
    </li>
</nav>
            </div>
        </nav>

        <div class="nav-options">
            <div class="all-logo">
           <!--  <i class="fa-solid fa-bars" style="margin-right:20px"></i> -->
                
            </div>
            <div class="options" style="margin-top: 10px">

           
               <a class="nav-link" style="color:white"  href="index.jsp"> <p>Home</p><span class="sr-only"></span></a> 
               <a class="nav-link" style="color:white" href="about.jsp"> <p>About Us</p><span class="sr-only"></span></a> 
                <a class="nav-link"  style="color:white"href="contact.jsp"> <p>Contact Us</p><span class="sr-only"></span></a> 
                <% 
                if(user1==null){
                	
                	%>
                	
                <a class="nav-link" style="color:white" href="login.jsp"> <p>Login</p><span class="sr-only"></span></a> 
                <a class="nav-link" style="color:white"  href="register.jsp "> <p>Register</p><span class="sr-only"></span></a> 
              
                <%	
             }else{
            	 
            	%> 
            	
            	
                <a class="nav-link" href="#!"> <p><%= user1.getUserName() %></p><span class="sr-only"></span></a> 
                <a class="nav-link" href="LogoutServlet "> <p>Logout</p><span class="sr-only"></span></a> 
              
            	
            	 
                <% 	
                }
                %>
               
                
                
               
              
             
             
               <!-- <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
            </ul> -->
            </div>
              
  
  
   <!--  <nav class="navbar navbar-expand-lg  ">
        <div >
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
            </ul>
        </div>
    </nav> -->
  </div> 
            </div>
            
        </nav>
        
        <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("location-button");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // Get the save button
        var saveBtn = document.getElementById("save-location");

        // When the user clicks on the button, open the modal
        btn.onclick = function () {
            modal.style.display = "block";
        };

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        };

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };

        // When the user clicks the save button, update the location text and close the modal
        saveBtn.onclick = function () {
            var selectedLocation = document.getElementById("location-select").value;
            document.querySelector(".location .bottom-text").textContent = selectedLocation;
            modal.style.display = "none";
        };
    </script>
        
        
        