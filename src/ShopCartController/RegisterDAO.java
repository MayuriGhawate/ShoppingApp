package ShopCartController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ShopCartModel.User;


public class RegisterDAO {
	
	private static final long serialVersionUID = 1L;
	
	  public static Connection getConnection(){
		Connection con = null;
	     try{
	             Class.forName("oracle.jdbc.driver.OracleDriver");
	             con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","c##orcl","orcl29");
	            // System.out.println(con);
	
          }catch(Exception e){System.out.println(e);}
	        return con;
	}
	  
	  public static int save(ShopCartModel.User u) throws SQLException {
			int status=0;
			try{
				Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("insert into Registerdata (FirstName,LastName,UserName,Password,Confirmpassword) values(?,?,?,?,?)");
				pst.setString(1, u.getFirstName());
				pst.setString(2, u.getLastName());
				pst.setString(3, u.getUserName());
				pst.setString(4, u.getPassword());
				pst.setString(5, u.getConfirmPassword());
				status = pst.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			
			return status;
		}

	  public static int Validate(ShopCartModel.User u) throws SQLException {
			int status=0;
			try{
				Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from Registerdata where UserName = ? AND Password = ? ");
				pst.setString(1, u.getUserName());
				pst.setString(2, u.getPassword());
				ResultSet r = pst.executeQuery();
				while(r.next())
				{
					status =1;
				}
			}catch(Exception e){System.out.println(e);}
			
			return status;
		}
}
