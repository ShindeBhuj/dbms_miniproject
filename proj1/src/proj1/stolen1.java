package proj1;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/stolen1")
public class stolen1 extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Part part=req.getPart("objectbill");
		System.out.println("dsjhbusksdjvjdhgdu");
		System.out.println("part="+part);
//		String filename=extractFileName(part);
//		System.out.println("filename==="+filename);
//		
//		String filename1="11111"+filename.substring(filename.indexOf("."));
//		System.out.println("filename1="+filename1);
//		String savepath="E:\\java\\proj1\\WebContent\\stolen\\"+filename1;
//		System.out.println("savepath==="+savepath);
//		File filesavedir=new File(savepath);
//		part.write(savepath);
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
