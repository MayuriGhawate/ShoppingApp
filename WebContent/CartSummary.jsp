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

 
String pid =(String) request.getParameter("id");
String quantity =(String) request.getParameter("quantity");
System.out.println(pid +" "+quantity);
ResultSet resultset = statement.executeQuery("select * from Purchasedetail") ;

while(resultset.next()){
%>
<p>hello</p>
<TABLE BORDER="1">
            
             <form action ="CartSummaryServlet" method = "post"> 
             
         <TR>      
               <TH>ProductName</TH>
               <TH>ProductCost</TH>
               <TH>ProductQty</TH>
               
                
               
           </TR> 
           <TR>
               <TD> <%= resultset.getString(1) %> </TD>
               <TD> <%= resultset.getInt(2) %> </TD>
               <TD> <%= resultset.getInt(3) %> </TD>
               <TD><%= resultset.getInt(4) %></TD>
               
               <TD><input name="number"  value=resultSet.total size="10" type="text"></TD>
               
               </FORM>
               </TD>
                   
           </TR>
           
           
       </TABLE>
       <BR>
       <% 
           } 
       
       %>
</body>
</html>