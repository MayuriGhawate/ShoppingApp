<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product Details</title>
</head>
<body>
<form action ="EditServlet" method = "post">
<!-- <button type="submit" class="button button-block"/>Add Products</button> -->
<a href="AddProduct.html">Add Products</a>
<!-- <button type="submit" class="button button-block"/>Delete Products</button> -->
<a href = "DeleteProduct.html">Delete Products</a>
<!-- <button type="submit" class="button button-block"/>View Users</button> -->
<a href = "ViewUsers.jsp">View Users</a>
</body>
</html>