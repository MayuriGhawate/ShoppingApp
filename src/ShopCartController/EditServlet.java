package ShopCartController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ShopCartModel.product;


@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   
    	  String pname = request.getParameter("Productname");
    	  int pcost = Integer.parseInt(request.getParameter("Productcost")) ;
    	  int pid = Integer.parseInt(request.getParameter("ProductId")) ;
    	   product pdt = new product();
    	   try{
    		   	pdt.setProductId(pid);
    		    pdt.setProductName(pname);
    		   	pdt.setProductCost(pcost);
    		   		int status= EditDAO.Insert(pdt);
    		   		if (status>0)
    		   		{
    		   			
    		   			response.sendRedirect("AdminProductView.jsp");
    		   		}
    		  
    	  }catch(Exception e){System.out.println(e);}
		
	}

}
