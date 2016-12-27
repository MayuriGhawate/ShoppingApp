<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Page</title>
</head>
<body>
<form action ="ConfirmServlet" method = "post">
<% String pid = request.getParameter("id");
   int pid1 = Integer.parseInt(pid);
   String pnme = request.getParameter("name");
   String pcost = request.getParameter("cost");
   int pcost1 = Integer.parseInt(pcost);
%>
<center>Product ID : <input type = "number" value = <%= pid1%>  name ="id" ><br>
Product Name : <input type = "text" value = <%= pnme %> name = "name" ><br>
Product Cost : <input type = "number" value =<%= pcost%> name = "cost"><br>
Quantity : <input type = "number" name = "qty"><br><br>
<input type ="submit" value = "Confirm Order"></center>
</form>
</body>
</html>