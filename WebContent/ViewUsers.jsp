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

 

ResultSet resultset = statement.executeQuery("select * from ViewUser") ; 

	
	while(resultset.next()){
%>


<TABLE BORDER="1">
            
             
             <TR>
               <TH>Username</TH>
               <TH>Dated</TH>
               <TH>ProductList</TH>
               <TH>Total</TH>
               
               
           </TR> 
           <TR>
               <TD> <%= resultset.getString(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD><%= resultset.getInt(4) %></TD>
               
               
           </TR>
           
           
       </TABLE>
       <BR>
       <% 
           } 
       
       %>
       
</body>
</html>