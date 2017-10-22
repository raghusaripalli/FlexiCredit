package mylogin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import java.sql.Statement;

public class LoginDao {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbs","root","raghu");  
	    }catch(Exception e){System.out.println(e);}
	    return con;  
	}
	
	public static int match(String username, String password){
		int status=0;  
	    try{  
	        Connection con=getConnection();  
	        Statement stmt=con.createStatement();  
	        ResultSet rs=stmt.executeQuery("select * from login");  
	        while(rs.next()){
	        	if (rs.getString(1).equals(username) && rs.getString(1).equals(password)){
	        		status = 1;
	        		break;
	        	}
	        }
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
}
