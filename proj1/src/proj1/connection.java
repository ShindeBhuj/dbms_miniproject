package proj1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;

import javax.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class connection {
	public static Connection getConnection()
	{
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydata?useTimezone=true&serverTimezone=UTC" , "root", "");
			 return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
	public static String addUser(long uid,String uname,String email,String addr,long cont) {
		
		Connection con=connection.getConnection();
		String valid="select u_name from user where u_id=?";
		PreparedStatement pstmt;
		int n=0;
		try {
			pstmt = con.prepareStatement(valid);
		
			pstmt.setLong(1, uid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				return "duplicate record for user";
				 
			}
			else {
				String sql="insert into user values(?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setLong(1, uid);
				pstmt.setString(2, uname);
				pstmt.setString(3, email);
				pstmt.setString(4, addr);
				pstmt.setLong(5, cont);
				n=pstmt.executeUpdate();
//				return "no. of rows inserted ="+n;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "no. of rows inserted in user="+n;
	}
	
	public static long  addFir(String rt,int rstatus,String area,java.sql.Date sd,String method,Long uid,String police) {
		int n=0;
		long firId=0;
		try {
			Connection con=connection.getConnection();
			PreparedStatement pstmt=null;	
						
//			Date d=new SimpleDateFormat("YYYY-MM-DD").parse(date);
//			java.sql.Date sd=new java.sql.Date(d.getTime());
			
			String sql="insert into fir(reprt_type,r_status,areaofcrime,date,method,u_id,police_station) values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, rt);
			pstmt.setInt(2,0 );
			pstmt.setString(3, area);
			pstmt.setDate(4, sd);
			pstmt.setString(5, " ");
			pstmt.setLong(6, uid);
			pstmt.setString(7, police);
			n=pstmt.executeUpdate();
			ResultSet rs1=pstmt.getGeneratedKeys();
			if(rs1 != null && rs1.next()) {
				System.out.println("Generated Keys="+rs1.getLong(1));
				firId=rs1.getLong(1);
			}
			System.out.println("no. of rows inserted in fir="+n);
			
			
			
//			pstmt=con.prepareStatement(sql);
//			pstmt.setString(1, lf);
//			pstmt.setInt(2,0 );
//			pstmt.setString(3, area);
//			pstmt.setDate(4, sd);
//			pstmt.setString(5, " ");
//			pstmt.setLong(6, uid);
//			pstmt.setString(7, police);
//			n=pstmt.executeUpdate();
//			System.out.println("inserted rows="+n);
//			String id="selecct last_insert_id()";
//			pstmt=con.prepareStatement(id);
//			ResultSet rs=pstmt.executeQuery();
//			firId=rs.getLong(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return firId;
	}
	
	public static long addObject(String objectType,String docId,String filename )
	{
		Connection con=connection.getConnection();
		PreparedStatement pstmt=null;
		long oid=0;
		int n=0;
		String sql="insert into object1(object_type,doc_id,bill_photo) values(?,?,?)";
		try {
			pstmt=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			pstmt.setString(1, objectType);
			pstmt.setString(2, docId);
			pstmt.setString(3, filename);
			n=pstmt.executeUpdate();
		    ResultSet rs1=pstmt.getGeneratedKeys(); 
			if(rs1 != null && rs1.next()) {
				System.out.println("Generated Keys="+rs1.getLong(1));
				oid=rs1.getLong(1);
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		System.out.println("no. of rows inserted in object="+n);
		return oid;
	}
	
	public static void addStolen(long firId,String NumberPlate,String EngineNo,String ChassisNo,String VehicleModel,String VehicleCompany,String VehicleType,String bill1,String photo1,String description) {
		Connection con=connection.getConnection();
		PreparedStatement pstmt=null;
		int n=0;
		String sql="insert into stolen values(?,?,?,?,?,?,?,?,?,?)";
		System.out.println("in stolen");
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, firId);
			pstmt.setString(2, NumberPlate);
			pstmt.setString(3, EngineNo);
			pstmt.setString(4, ChassisNo);
			pstmt.setString(5, VehicleModel);
			pstmt.setString(6, VehicleCompany);
			pstmt.setString(7, VehicleType);
			pstmt.setString(8, bill1);
			pstmt.setString(9, photo1);
			pstmt.setString(10, description);
			n=pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		System.out.println("no. of rows inserted in stolen="+n);	
	}
	
	public static ResultSet getDetails(String table,long firId){
		String sql="select * from "+table+" where fir_id=?";
//		String sql;
		System.out.println("in getDetails");
		System.out.println("table="+table+"nikhil");
		System.out.println("table.equals(\"lostfound\")="+table.equals("lostfound"));
		System.out.println("table.compareTo(\"lostfound\")="+table.compareTo("lostfound"));
		if(table.compareTo("lostfound")==0) {
			System.out.println("in lostfound3");
			 sql="select * from lostfound where fir_id=?";
		}
		if(table.equals("stolen")) {
			System.out.println("in stolen");
			 sql="select * from stolen where fir_id=?";
		}
		if(table.equals("missing_person")) {
			System.out.println("in mp");
			 sql="select * from missing_person where fir_id=?";
		}
		PreparedStatement pstmt=null;
		Connection con=connection.getConnection(); 
		ResultSet rs=null;
		System.out.println("firid="+firId);
		try {
			pstmt=con.prepareStatement(sql);
			//pstmt.
			pstmt.setLong(1, firId);
			rs=pstmt.executeQuery();
//			if(rs.next())
//			{
//				System.out.println("rs has next");
//				for(int i=1;i<4;i++)
//					System.out.println(rs.getString(i));
//			}
			System.out.println("returning.......");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void addCriminal(long AdhaarNo,String name,String Age,String address,String filename,String StatusOfcriminal,String contactno,String DescriptionOfCriminal) {
		Connection con=connection.getConnection();
		PreparedStatement pstmt=null;
		int n=0;
		try {
			String sql="select cr_name from criminal where cr_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, AdhaarNo);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				System.out.println("duplicate record for criminal");
				sql="update criminal set age=? , address=? , cr_photo=? ,status_criminal=? , contact=? , description=? where cr_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, Age);
				pstmt.setString(2, address);
				pstmt.setString(3, filename);
				pstmt.setString(4, StatusOfcriminal);
				pstmt.setString(5, contactno);
				pstmt.setString(6, DescriptionOfCriminal);
				pstmt.setLong(7, AdhaarNo);
				n=pstmt.executeUpdate();
				
			}
			else {
				sql="insert into criminal values(?,?,?,?,?,?,?,?)";
				System.out.println("in criminal");
			
				pstmt=con.prepareStatement(sql);
				pstmt.setLong(1, AdhaarNo);
				pstmt.setString(2, name);
				pstmt.setString(3, Age);
				pstmt.setString(4, address);
				pstmt.setString(5, filename);
				pstmt.setString(6, StatusOfcriminal);
				pstmt.setString(7, contactno);
				pstmt.setString(8, DescriptionOfCriminal);
				n=pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		System.out.println("no. of rows inserted in criminal="+n);	
	}
	public static void addLink(long firId,long crId,String MethodOfCrime) {
		Connection con=connection.getConnection();
		PreparedStatement pstmt=null;
		int n=0;
		String sql="insert into link values(?,?)";
		System.out.println("in link");
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, firId);
			pstmt.setLong(2, crId);
			n=pstmt.executeUpdate();
			/*
			DELIMITER //
			create procedure update_method(IN firId long , IN method varchar(30))
			BEGIN

			UPDATE approvedFir 
			SET method=method 
			WHERE fir_id=firId;

			END //
			DELIMITER ;
			*/
			sql="call update_method(?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, firId);
			pstmt.setString(2, MethodOfCrime);
			n=pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		System.out.println("no. of rows inserted in link="+n);
	}
	public static void addmissing_person(long firId,String report_type,String name_mp,String age,String address,String description,String photo1,String relation_mp,String contact_mp,String place_occurance) {
		Connection con=connection.getConnection();
		PreparedStatement pstmt=null;
		int n=0;
		String sql="insert into missing_person values(?,?,?,?,?,?,?,?,?,?)";
		System.out.println("in missing_person");
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, firId);
			pstmt.setString(2, report_type);
			pstmt.setString(3, name_mp);
			pstmt.setString(4, age);
			pstmt.setString(5, address);
			pstmt.setString(6, description);
			pstmt.setString(7, photo1);
			pstmt.setString(8, relation_mp);
			pstmt.setString(9, contact_mp);
			pstmt.setString(10, place_occurance);
			n=pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		System.out.println("no. of rows inserted in mp="+n);	
	}
	public static void addApprovedFir(long firId) {
		Connection con=connection.getConnection();
		PreparedStatement pstmt=null;
		int n=0;
		String sql="insert into link values(?,?)";
		System.out.println("in link");
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, firId);
			n=pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		System.out.println("no. of rows inserted in link="+n);
	}
	public static String extractFileName(Part part) {

		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		for(String s:items) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}
		}
		return "";
	}
}
