package com.myapp.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.demo.dao.Categorydao;
import com.demo.dao.ProductDao;
import com.demo.entity.Category;
import com.demo.entity.Product;
import com.demo.helper.FactoryProvider;

@WebServlet("/product")
@MultipartConfig
public class ProductOperationServlet1 extends HttpServlet {
	
	protected void processRequest (HttpServletRequest request,HttpServletResponse response) throws ServletException ,IOException{
		 response.setContentType("text/html;charset=UTF-8");
		 try (PrintWriter out = response.getWriter()){
			 //fetching catogery title
			 String op=request.getParameter("operation");
			 if(op.trim().equals("addcategory"))
			 {
				 String title=request.getParameter("catTitle");
			 String discription=request.getParameter("catDesceription");
			
			Category category= new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(discription);
			//category data save
			Categorydao categorydao= new Categorydao(FactoryProvider.getFactory());
			 
			int catId =categorydao.saveCategory(category);
			 
			 out.println("Category saved");
			 HttpSession httpsession=request.getSession(); 
			 httpsession.setAttribute("message","Category added Successfully :"+catId);
			 response.sendRedirect("admin.jsp");
			 return;
			 
			 }
			 
			 
			 else if(op.trim().equals("addproduct"))
			 {
				 
				 // add product
				 // work
				String pName= request.getParameter("pName"); 
				String pDes= request.getParameter("pDes"); 
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
                Part part= request.getPart("pPhoto");
                
                Product p = new Product();
                p.setpName(pName);               
                p.setpDes(pDes);
                p.setpPrice(pPrice);
                p.setPDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                
                
                
                // get category by id
                
                Categorydao cdao= new Categorydao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);
    
                
                // product save 
                
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
                String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                
                //uploading code
                try (FileOutputStream fos = new FileOutputStream(path);
                        InputStream is = part.getInputStream()) {

                       // Reading data
                       byte[] data = new byte[is.available()];
                       is.read(data);

                       // Writing the data
                       fos.write(data);

                   } catch (IOException e) {
                       e.printStackTrace();
                   }

                
                
                
                
                
                out.println("Product save success");
                HttpSession httpsession=request.getSession(); 
   			 httpsession.setAttribute("message","Product is added successfully");
   			 response.sendRedirect("admin.jsp");
   			 return;
                
               
                
            }
		
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
		 
		 
	 } 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

}
