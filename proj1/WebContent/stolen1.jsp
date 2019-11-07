<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String photo="";
String bill="";

Part VehiclePhoto=request.getPart("VehiclePhoto");
Part Vehiclebill=request.getPart("Vehiclebill");
System.out.println("VehiclePhoto="+VehiclePhoto);
System.out.println("Vehiclebill="+Vehiclebill);
if(VehiclePhoto==null || Vehiclebill==null)
{
	
	out.println("<center><h1 style='color:blue;'> photos are necessary!!!!.</h1></center>");
	RequestDispatcher rd=request.getRequestDispatcher("stolen.jsp");
	rd.include(request,response);
}
else{
	request.setAttribute("VehiclePhoto", VehiclePhoto);
	request.setAttribute("Vehiclebill", Vehiclebill);
	response.sendRedirect("stolen.html");
	
}

%>			

</body>
</html>