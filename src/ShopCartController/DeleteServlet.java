package ShopCartController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ShopCartModel.product;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pname = request.getParameter("Productname");
		product pdt = new product();
  	  try{
  		  
  		  
  		  pdt.setProductName(pname);
  		
  		  int status= EditDAO.Delete(pdt);
 			  if (status>0)
 	 		{
 				response.sendRedirect("AdminProductView.jsp");
 	 		}
  		  
  	  }catch(Exception e){System.out.println(e);}
		
	}
		
	}


