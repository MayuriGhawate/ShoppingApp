package ShopCartController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartSummaryDAO {
	
	public static Connection getConnection(){
		Connection con = null;
	     try{
	             Class.forName("oracle.jdbc.driver.OracleDriver");
	             con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##orcl","orcl29");
	             System.out.println(con);
	
          }catch(Exception e){System.out.println(e);}
	        return con;
	}
	
	public static int SavePurchase(ShopCartModel.product pdt) throws SQLException {
		int status=0;
		try{
			Connection con = getConnection();
			
			PreparedStatement pst = con.prepareStatement("insert into Purchasedetail (ProductName,ProductCost,ProductQty,Producttotal) values(?,?,?,?)");
			pst.setString(1, pdt.getProductName());
			pst.setInt(2, pdt.getProductCost());
			pst.setInt(3, pdt.getProductQty());
			pst.setInt(4, pdt.getTotal());
			System.out.println("executed");
			status = pst.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	

}
