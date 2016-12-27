package ShopCartController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import ShopCartModel.product;

public class EditDAO {
	
	public static Connection getConnection(){
		Connection con = null;
	     try{
	             Class.forName("oracle.jdbc.driver.OracleDriver");
	             con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##orcl","orcl29");
	             System.out.println(con);
	
          }catch(Exception e){System.out.println(e);}
	        return con;
	}
	  
	public static int Insert(product pdt) throws SQLException {
		int status=0;
		try{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into Productdetail (ProductId,Productname,productcost) values(?,?,?)");
			pst.setInt(1, pdt.getProductId());
			pst.setString(2, pdt.getProductName());
			pst.setInt(3, pdt.getProductCost());
			
			status = pst.executeUpdate();
		   // ResultSet rs = pst.executeQuery();
			/*while(rs.next()){
				product pd = new product();
				pd.setProductId(rs.getInt(1));
				pd.setProductName(rs.getString(2));
				pd.setProductCost(rs.getFloat(3));
				
				
			}
		    System.out.println("Executed");*/
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	
	public static int Delete(product pdt) throws SQLException {
		int status=0;
		try{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("DELETE FROM Productdetail WHERE Productname =?");
			pst.setString(1, pdt.getProductName());
		    status = pst.executeUpdate();
		    ResultSet rs = pst.executeQuery();
			/*while(rs.next()){
				product pd = new product();
				pd.setProductId(rs.getInt(1));
				pd.setProductName(rs.getString(2));
				pd.setProductCost(rs.getFloat(3));
				
				
			}
		    System.out.println("Executed");*/
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	
	public static int SaveOrder(product pdt) throws SQLException {
		int status=0;
		try{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("Insert into Productdetail WHERE Productname =?");
			pst.setString(1, pdt.getProductName());
		    status = pst.executeUpdate();
		    ResultSet rs = pst.executeQuery();
			/*while(rs.next()){
				product pd = new product();
				pd.setProductId(rs.getInt(1));
				pd.setProductName(rs.getString(2));
				pd.setProductCost(rs.getFloat(3));
				
				
			}
		    System.out.println("Executed");*/
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}

}
