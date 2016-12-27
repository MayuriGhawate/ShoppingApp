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
            <form action ="EditServlet" method = "post">
             
                <TH>ProductID</TH>
               <TH>ProductName</TH>
               <TH>ProductCost</TH>
               
              </TR> 
           <TR>
                <TD> <%= resultset.getInt(1) %> </TD> 
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getInt(3) %> </TD>
                <!-- <TD><input name="name" value="" size="10" type="text"></TD>
               <TD><input type ="submit" value = "Add to " size ="20"></TD>  -->
           </TR>
           
           
       </TABLE>
       <BR>
       <% 
           } 
       
       %>
       <a href="AddProduct.html">Back</a>
</body>
</html>