package proj1;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class stolen
 */
@WebServlet("/stolen")
public class stolen extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			PrintWriter out=resp.getWriter();
			resp.setContentType("text/html;charset=UTF-8");			
			con=connection.getConnection();
//			String form=req.getParameter("form");
//			System.out.println("form="+form);
			if(con!=null) {
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
						
						Part VehiclePhoto=req.getPart("objectbill");
//						Part VehiclePhoto=(Part)req.getAttribute("VehiclePhoto");
						System.out.println("VehiclePhoto Part="+VehiclePhoto);
						String photo=extractFileName(VehiclePhoto);
						System.out.println("VehiclePhoto==="+photo);

//						Part Vehiclebill=req.getPart("Vehiclebill");
//						Part Vehiclebill=(Part)req.getAttribute("Vehiclebill");
//						System.out.println("Vehiclebill Part="+Vehiclebill);
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

						String photo1="";
						photo1=firId+"photo"+photo.substring(photo.indexOf("."));
						System.out.println("filename1="+photo1);
						String savepath="E:\\java\\proj1\\WebContent\\stolen\\"+photo1;
						System.out.println("savepath==="+savepath);
						File filesavedir=new File(savepath);
						VehiclePhoto.write(savepath);

//						String bill1="";
//						bill1=firId+"bill"+bill.substring(photo.indexOf("."));
//						System.out.println("filename1="+bill1);
//						String savepath1="E:\\java\\proj1\\WebContent\\stolen\\"+bill1;
//						System.out.println("savepath==="+savepath1);
//						File filesavedir1=new File(savepath1);
//						Vehiclebill.write(savepath1);

						connection.addStolen(firId,NumberPlate,EngineNo,ChassisNo,VehicleModel,VehicleCompany,VehicleType,"",photo1,description);

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
