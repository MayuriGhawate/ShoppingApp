<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action ="ModifyServlet" method="post">
<% String pid = request.getParameter("id");
System.out.println(pid);   
int pid1 = Integer.parseInt(pid);
   
   String pnme = request.getParameter("name");
   System.out.println(pnme);
   String pcost = request.getParameter("cost");
   //int pcost1 = Integer.parseInt(pcost);
   int pqty = Integer.parseInt(request.getParameter("qty"));
%>
<center>Product ID : <input type = "number" value = <%= pid1%>  name ="id" ><br>
Product Name : <input type = "text"  name = "name" value = <%= pnme %>><br>

Quantity : <input type = "number" name = "qty" value=<%= pqty %>><br><br>

<input type ="submit" value = "Modify"></center>
</form>
</body>
</html>

</body>
</html>