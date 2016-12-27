<%@ page import = "java.sql.*,java.util.*,ShopCartModel.product,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Record</title>
</head>
<body>
<% 
int pid2 = Integer.parseInt(request.getParameter("id"));


  List<product>  lp=(List<product>)session.getAttribute("sessList");
  
  for (Iterator<product> iter = lp.listIterator(); iter.hasNext(); ) {
	    product p = iter.next();
	    if (p.getProductId()==pid2) {
	        iter.remove();
	    }
	}
 response.sendRedirect("ViewCart.jsp"); 
  
%>
</body>
</html>