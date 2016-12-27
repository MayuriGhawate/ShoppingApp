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

@WebServlet("/ConfirmServlet")
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pid = request.getParameter("id");
    	int pid1 = Integer.parseInt(pid);
    	String pname = request.getParameter("name");
   	     int pcost = Integer.parseInt(request.getParameter("cost")) ;
		 int pqty = Integer.parseInt(request.getParameter("qty"));
		 int total = pcost*pqty;
		 HttpSession session = request.getSession(false);
		 product pdt = new product();
		 System.out.println("You are in ConfirmServlet");
		 
		 try{
	 			pdt.setProductId(pid1);
			    pdt.setProductName(pname);;
	 			pdt.setProductCost(pcost);
	 			pdt.setProductQty(pqty);
	 			pdt.setTotal(total);
	 			
	 			List<product> lp;
	 			lp = (List<product>) session.getAttribute("sessList");
	 			System.out.println("List is created");
	 			lp.add(pdt);
	 			System.out.println("Lis is :"+lp);
	 			 
	 		      {
	 					 
	  				     response.sendRedirect("ProductView.jsp");
	 				}
	 			   
	 			
	 		
	 		   }catch(Exception e){System.out.println(e);}
	 		
			
		}

	}

	


