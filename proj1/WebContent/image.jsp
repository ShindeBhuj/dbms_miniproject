<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
width:80%;
margin:auto;
position:relative;
}
img{
width:70%;
height:500px	;
margin:auto;
position:absolute;
top:60px;

}
</style>
</head>
<body>
<%String s=request.getParameter("src");
System.out.println("src="+s);
out.print("<img alt='bill photo'  src="+s+">");
%>
</body>
</html>