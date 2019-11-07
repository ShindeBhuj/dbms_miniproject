package proj1;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
//@WebServlet("/login")
@MultipartConfig(fileSizeThreshold=1024*20*1,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*60)
public class login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			PrintWriter out=resp.getWriter();
			resp.setContentType("text/html;charset=UTF-8");			
			con=connection.getConnection();
			String form=req.getParameter("form");
			System.out.println("form="+form);
			if(con!=null) {
				System.out.println("in con");


				if(form.equals("criminal"))
				{

					System.out.println("in criminal");
					String name=req.getParameter("FullName");
					String fir_id=req.getParameter("fir_id");
					String AdhaarNo=req.getParameter("AdhaarNo");

					String contactno=req.getParameter("contactno");
					String address=req.getParameter("address");
					String Date=req.getParameter("Date");
					String Age=req.getParameter("Age");
					String DescriptionOfCriminal=req.getParameter("Description");
					String StatusOfcriminal=req.getParameter("StatusOfcriminal");
					String MethodOfCrime=req.getParameter("MethodOfCrime");
					String cr_photo=req.getParameter("criminalPhoto");
					System.out.println("cr_photo="+cr_photo);
					Part criminalPhoto=req.getPart("criminalPhoto");
					System.out.println("part="+criminalPhoto);
					String filename=extractFileName(criminalPhoto);
					System.out.println("filename==="+filename);

					System.out.println("name="+name);
					System.out.println("fir_id="+fir_id);
					System.out.println("AdhaarNo="+AdhaarNo);
					System.out.println("contactno="+contactno);
					System.out.println("address="+address);
					System.out.println("Description="+DescriptionOfCriminal);
					System.out.println("StatusOfcriminal="+StatusOfcriminal);
					System.out.println("Age="+Age);
					System.out.println("MethodOfCrime="+MethodOfCrime);

					java.util.Date d=new java.util.Date();
					java.sql.Date sd=new java.sql.Date(d.getTime());
					long crId=Long.parseLong(AdhaarNo);
					long firId=Long.parseLong(fir_id);
//					cr_id        | cr_name    | age  | address          | cr_photo | status_criminal | contact    | description
					

					String filename1=crId+filename.substring(filename.indexOf("."));
					System.out.println("filename1="+filename1);
					String savepath="E:\\java\\proj1\\WebContent\\criminal\\"+filename1;
					System.out.println("savepath==="+savepath);
					File filesavedir=new File(savepath);
					criminalPhoto.write(savepath);
					
					connection.addCriminal(crId,name,Age,address,filename1,StatusOfcriminal,contactno,DescriptionOfCriminal);
					connection.addLink(firId,crId,MethodOfCrime);
//					connection.updateMethod()
//					connection.addApprovedFir(firId);
					
					
				}

				else if(form.equals("lostfound"))
					{
						
						String police=req.getParameter("police");
						String uname=req.getParameter("FullName");
						String uadhaar=req.getParameter("adhaar");
						String email=req.getParameter("email");
						String ucontact=req.getParameter("contact");
						String addr=req.getParameter("address");
						String date=req.getParameter("Date");

						System.out.println("uname="+uname);
						System.out.println("police"+police);
						System.out.println("uadhaar"+uadhaar);
						System.out.println("email"+email);
						System.out.println("ucontact"+ucontact);
						System.out.println("addr"+addr);
						System.out.println("date"+date);

						long uid=Long.parseLong(uadhaar);
						long cont=Long.parseLong(ucontact);
						String res1=connection.addUser( uid, uname, email, addr, cont);
						System.out.println(res1);
						
						String rt=req.getParameter("report_type");
						String objectType=req.getParameter("object_type");
						String docId=req.getParameter("DocumentId");
						String area=req.getParameter("Place");
						String description=req.getParameter("description");
						String bill=req.getParameter("objectbill");
						System.out.println("bill="+bill);
						Part part=req.getPart("objectbill");
						System.out.println("part="+part);
						String filename=extractFileName(part);
						System.out.println("filename==="+filename);


						System.out.println("rt"+rt);
						System.out.println("objectType"+objectType);
						System.out.println("docId"+docId);
						System.out.println("area"+area);
						System.out.println("description"+description);

						InputStream inputStream = null;
						Part filePart = req.getPart("objectbill");
						System.out.println("filePart="+filePart);
						if (filePart != null) {
							System.out.println("filePart.getName="+filePart.getName());
							System.out.println("filePart.getSize="+filePart.getSize());
							System.out.println("filePart.getContentType="+filePart.getContentType());
							inputStream = filePart.getInputStream();
						}

						java.util.Date d=new java.util.Date();
						java.sql.Date sd=new java.sql.Date(d.getTime());
						long firId=0;
						firId=connection.addFir("lostfound",0, area,sd,"", uid, police);

						String filename1=firId+filename.substring(filename.indexOf("."));
						System.out.println("filename1="+filename1);
						String savepath="E:\\java\\proj1\\WebContent\\lostfound\\"+filename1;
						System.out.println("savepath==="+savepath);
						File filesavedir=new File(savepath);
						part.write(savepath);
						
						long oid=0;
						oid=connection.addObject(objectType,docId,filename1);

						int n=0;
						String valid="insert into lostfound(fir_id,report_type,description,oid) values(?,?,?,?)";
						pstmt=con.prepareStatement(valid);
						pstmt.setLong(1, firId);
						pstmt.setString(2, rt);
						pstmt.setString(3, description);
						pstmt.setLong(4, oid);
						n=pstmt.executeUpdate();
						System.out.println("no. of rows inserted in lostfound="+n);
					}
					
					else if(form.equals("stoeln"))
					{
						
						
						System.out.println("in yyyyyyyn");
						
						String police=req.getParameter("police");
						String uname=req.getParameter("FullName");
						String uadhaar=req.getParameter("adhaar");
						String email=req.getParameter("email");
						String ucontact=req.getParameter("contact");
						String addr=req.getParameter("address");
						String date=req.getParameter("Date");

						System.out.println("uname="+uname);
						System.out.println("police"+police);
						System.out.println("uadhaar"+uadhaar);
						System.out.println("email"+email);
						System.out.println("ucontact"+ucontact);
						System.out.println("addr"+addr);
						System.out.println("date"+date);

						long uid=Long.parseLong(uadhaar);
						long cont=Long.parseLong(ucontact);
						

						String VehicleType=req.getParameter("vehicleType");
						String VehicleModel=req.getParameter("VehicleModel");
						String VehicleCompany=req.getParameter("VehicleCompany");
						String NumberPlate=req.getParameter("NumberPlate");
						String ChassisNo=req.getParameter("ChassisNo");
						String EngineNo=req.getParameter("EngineNo");
						String area=req.getParameter("Place");
						String description=req.getParameter("description");
//						Part VehiclePhoto=req.getPart("VehiclePhoto");
//						System.out.println("part="+VehiclePhoto);
//						String photo=extractFileName(VehiclePhoto);
//						System.out.println("VehiclePhoto==="+photo);
//
//						Part Vehiclebill=req.getPart("Vehiclebill");
//						System.out.println("part="+Vehiclebill);
//						String bill=extractFileName(Vehiclebill);
//						System.out.println("Vehiclebill==="+bill);


						System.out.println("vehicleType="+VehicleType);
						System.out.println("VehicleModel="+VehicleModel);

						System.out.println("NumberPlate="+NumberPlate);
						System.out.println("area"+area);
						System.out.println("ChassisNo="+ChassisNo);
						System.out.println("EngineNo="+EngineNo);
						System.out.println("description"+description);
						
						String res1=connection.addUser( uid, uname, email, addr, cont);
						System.out.println(res1);
						
						java.util.Date d=new java.util.Date();
						java.sql.Date sd=new java.sql.Date(d.getTime());
						long firId=0;
						firId=connection.addFir("stolen",0, area,sd,"", uid, police);

//						String photo1=firId+photo.substring(photo.indexOf("."));
//						System.out.println("filename1="+photo1);
//						String savepath="E:\\java\\proj1\\WebContent\\stolen\\"+photo1;
//						System.out.println("savepath==="+savepath);
//						File filesavedir=new File(savepath);
//						VehiclePhoto.write(savepath);
//
//						String bill1=firId+photo.substring(photo.indexOf("."));
//						System.out.println("filename1="+bill1);
//						String savepath1="E:\\java\\proj1\\WebContent\\stolen\\"+bill1;
//						System.out.println("savepath==="+savepath1);
//						File filesavedir1=new File(savepath1);
//						Vehiclebill.write(savepath1);

						connection.addStolen(firId,NumberPlate,EngineNo,ChassisNo,VehicleModel,VehicleCompany,VehicleType,"","",description);

					}
				}
			else
				System.out.println("no connection");
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}

		HttpSession session=req.getSession();
		if(session.getAttribute("username")==null) {
			resp.sendRedirect("index.html");
		}
		else
		{
			resp.sendRedirect("adminHome.jsp");
		}

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	private String extractFileName(Part part) {

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
