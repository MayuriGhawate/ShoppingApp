<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fetching Data from the Database</title>
</head>
<body>
<%Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##orcl","orcl29");
    Statement statement = con.createStatement();

 

ResultSet resultset = statement.executeQuery("select * from Productdetail") ; 

	
	while(resultset.next()){
%>


<TABLE BORDER="1">
            
             
             <TR>
               <TH>ProductID</TH>
               <TH>ProductName</TH>
               <TH>ProductCost</TH>
              <!--  <TH>ProductQty</TH> -->
               <TH>Action</TH> 
               
           </TR> 
           <TR>
               <TD> <%= resultset.getInt(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getInt(3) %> </TD>
               <!-- <TD><input name="quantity"  id="quantity" size="10" type="text"></TD> -->
               <TD><a href="ConfirmCart.jsp?id=<%= resultset.getInt(1)%>&name=<%= resultset.getString(2)%>&cost=<%= resultset.getInt(3)%>&quantity="document.getElementById('quantity').value"">Add to cart</a></TD>
               
           </TR>
           
           
       </TABLE>
       <BR>
       <% 
           } 
       
       %>
       
       <a href="ViewCart.jsp">View Cart</a>
</body>
</html>