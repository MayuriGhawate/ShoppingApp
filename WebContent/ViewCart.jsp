<%@ page import = "ShopCartModel.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cart</title>
</head>
<body>
<TABLE>
<TR>
               <TH>ProductID</TH>
               <TH>ProductName</TH>
               <TH>ProductCost</TH>
              <!--  <TH>ProductQty</TH> -->
               <TH>TotalCost</TH> 
               
           </TR> 
           
           <%
           List<product>lp;
           lp=(List<product>)session.getAttribute("sessList");
            for(Iterator<product> iter = lp.listIterator(); iter.hasNext();)
        	  {
        	   product p = iter.next(); 
        	   
          %>
             <TR>
               <TD> <%=p.getProductId()  %> </TD>
               <TD> <%=p.getProductName() %> </TD>
               <TD> <%= p.getProductCost() %> </TD>
               <TD> <%= p.getProductQty() %></TD>
               <TD> <%= p.getTotal() %></TD>
               <TD> <a href="Modified.jsp?id=<%=p.getProductId()%>&name=<%=p.getProductName() %>&cost=<%= p.getProductCost() %>&qty=<%= p.getProductQty() %> ">Modify</a>
               <TD> <a href="Deleted.jsp?id=<%=p.getProductId()%>&name=<%=p.getProductName()%>&cost=<%= p.getProductCost()%>&qty=<%=p.getProductQty() %> ">Delete</a>
              
             </TR>
             
  <%} %>         
           
       </TABLE>
       <a href="ProductView.jsp">Back</a>
       <a href="Checkout.jsp">Check Out</a><br><br><br>
       
</body>
</html>