package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MainDao {
	
	public static int total = 0;
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbs","root","raghu");  
	    }catch(Exception e){System.out.println(e);}
	    return con;  
	}
	
	public static List<Main> match(String cid, String amount){
		List<Main> list=new ArrayList<Main>(); 
		int amt  = Integer.parseInt(amount);
	    try{
	        Connection con=getConnection();  
	        Statement stmt=con.createStatement();  
	        ResultSet rs=stmt.executeQuery("select tid, trdate, amount, remarks from creditcard_data where cid LIKE '%"+cid+"%' and amount >= "+amt+";");  
	        while(rs.next()){
	        	Main u=new Main();  
	            u.setTid(rs.getString("tid"));  
	            u.setTdate(rs.getString("trdate"));
	            u.setAmount(rs.getInt("amount")+""); 
	            u.setRemarks(rs.getString("remarks")); 
	            list.add(u);  
	        }
	    }catch(Exception e){System.out.println(e);}  
	    return list;
	}
}
