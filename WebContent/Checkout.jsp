<%@ page import = "ShopCartModel.*,java.util.*,java.sql.*"%>
<%@ page session = "true"%>
<% 
  Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
</head>
<body>
<form action ="CheckoutServlet" method = "post">
    <TABLE>
<TR>
               <TH>ProductID</TH>
               <TH>ProductName</TH>
               <TH>ProductCost</TH>
                <TH>ProductQty</TH> 
               <!-- <TH>TotalCost</TH>  -->
               
           </TR> 
           
           <%
           List<product>lp;
           lp=(List<product>)session.getAttribute("sessList");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##orcl","orcl29");
          Statement statement = con.createStatement();
          %>
          <% 
          String name = (String) request.getSession().getAttribute("sessname");
          System.out.println("My name is : "+name);
          %>
          
         
          
         <%  int TotalBill = 0;
         StringBuffer sb = new StringBuffer();
            for(Iterator<product> iter = lp.listIterator(); iter.hasNext();)
        	  {
        	   product p = iter.next(); 
        	   String pname = p.getProductName();
        	   sb.append(pname+":");
        	   
        	   
          %>
             <TR>
               <TD> <%=p.getProductId()  %> </TD>
               <TD> <%=p.getProductName() %> </TD>
               <TD> <%= p.getProductCost() %> </TD>
               <TD> <%= p.getProductQty() %></TD>
               <%-- <TD> <%= p.getTotal() %></TD> --%>
              <%  TotalBill = TotalBill + p.getTotal();%>
              
             </TR><br><br>
             
             
  <%} %> 
  
  <%
  String productList = sb.toString();
  java.util.Date date = new java.util.Date();
  String mydate = date.toString();
  String sql = "insert into Viewuser (Username,Dated,Productlist,total) values('"
		  + name
		  +"','"
		  + date
		  +"','"
          + productList
          +"',"
          + TotalBill + ")";
  
  System.out.println("Sql Result" +sql);
  if(!lp.isEmpty())
	  statement.executeUpdate(sql);
	  
  %>        
          
       </TABLE>
       
       </form>
     Total Payment  <input type ="number" value = <%= TotalBill%> name="total" readonly>
       <a href="LogoutServlet">LogOut</a>
</body>
</html>