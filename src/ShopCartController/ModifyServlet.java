package ShopCartController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ShopCartModel.product;


@WebServlet("/ModifyServlet")
public class ModifyServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		 int pid = Integer.parseInt(request.getParameter("id")); 
		 String pname = request.getParameter("name");
  	     
  	     int pqty = Integer.parseInt(request.getParameter("qty"));
  	     HttpSession session = request.getSession(false);
  	     List<product>  lp=(List<product>)session.getAttribute("sessList");
  	     for(product p:lp)
  	     {
  	    	 System.out.println(p.getProductQty());
  	    	 if(p.getProductId()==pid)
  	    	 {
  	    		 p.setProductQty(pqty);
  	    		 p.setTotal(pqty*p.getProductCost());
  	    	 }
  	    	System.out.println(p.getProductQty());
  	     }
  	   response.sendRedirect("ViewCart.jsp");
		
  	     
	}

	

}
