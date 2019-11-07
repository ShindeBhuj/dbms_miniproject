<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;
con=proj1.connection.getConnection();
/*
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydata?useTimezone=true&serverTimezone=UTC" , "root", "");
} catch (Exception e) {
	e.printStackTrace();
}*/
if(con!=null)
{
	String username=request.getParameter("NAME");
	String password=request.getParameter("Password");
	PreparedStatement pstmt=con.prepareStatement("select pwd from admin where username=?");
	pstmt.setString(1, username);
	ResultSet rs=pstmt.executeQuery();
	if(rs.next())
	{
		if(rs.getString("pwd").equals(password))
		{
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			response.sendRedirect("adminHome.jsp");
		}
		else
		{
			out.println("<h1 style='color:blue; left-margin=700px;'> Entered Password is Invalid Try Again!!!.</h1>");
			RequestDispatcher rd=request.getRequestDispatcher("admin_login.jsp");
			rd.include(request,response);
		}
	}
	else
	{
		out.println("<h1 style='color:blue; left-margin=700px;'>Please fill the Proper Username and Password.</h1>");
		RequestDispatcher rd=request.getRequestDispatcher("admin_login.jsp");
		rd.include(request,response);
	}
	con.close();
}
else
{
	out.print("no connection");
}
%>
</body>
</html>