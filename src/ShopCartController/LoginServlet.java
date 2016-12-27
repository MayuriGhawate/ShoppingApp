package ShopCartController;


import ShopCartModel.User;
import ShopCartModel.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String un = request.getParameter("UserName");
 		String p = request.getParameter("Password");
 		HttpSession session = request.getSession(true);
 		User u = new User();
 		try{
 			u.setUserName(un);
 			u.setPassword(p);
 			
 			if(un.equals("Admin")&&p.equals("123"))
 			{
 				session.setAttribute("sessname", un);
 				response.sendRedirect("EditProduct.jsp");
 				
 			}
 			int status= RegisterDAO.Validate(u);
 			{
 				
 				session.setAttribute("sessname", un);
 				List<product> lp = new ArrayList<product>();
 				session.setAttribute("sessList", lp);
 				if (status>0)
 			    {
 				      response.sendRedirect("ProductView.jsp");
 				}
 			    else
 			    {
 				     response.sendRedirect("LoginFailure.jsp");
 				}
 		    }
 			
 		
 		   }catch(Exception e){System.out.println(e);}
 		
		
	}

}
