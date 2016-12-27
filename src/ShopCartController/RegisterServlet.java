package ShopCartController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ShopCartModel.User;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String f = request.getParameter("FirstName");
 		String l = request.getParameter("LastName");
 		String un = request.getParameter("UserName");
 		String p=request.getParameter("Password");
 		String cp = request.getParameter("Confirmpassword");
 		
 		
 		User u = new User();
 		
 		
 		try{
 			u.setFirstName(f);
 			u.setLastName(l);
 			u.setUserName(un);
 			u.setPassword(p);
 			u.setConfirmPassword(cp);
 			int status= RegisterDAO.save(u);
 			if (status>0)
 	 		{
 				response.sendRedirect("Register-Success.html");
 	 		}
 		}catch(Exception e){System.out.println(e);}
 		
 		
 			
 		
 		            	
	}

}
