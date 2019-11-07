<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.blur   {
    filter: blur(5px);
    -webkit-filter: blur(5px);
    -moz-filter: blur(5px);
    -o-filter: blur(5px);
    -ms-filter: blur(5px);
}
img{
width:40px;
height:50px;
text-align: center;
}
</style>
<style><%@include file="../style.css"%></style>

<script type="text/javascript">
	function hide() {
  var x = document.getElementById("hidden");
  var y = document.getElementById("container");
  
    x.style.display = "block";
    // y.style.filter= "blur(5px)";
    y.setAttribute('class', 'blur');
  
}
function f1()
{
	var x = document.getElementById("hidden");
  var y = document.getElementById("container");
    x.style.display = "none";
     // y.style.filter= "blur(0px)";
    y.setAttribute('class', null);
  
}
</script>
</head>
<body id="admin_body">
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
String username;
if((username=(String)session.getAttribute("username"))==null && session.getAttribute("password")==null) 
{
	session.invalidate();
	response.sendRedirect("admin_login.jsp");
} %>
	<div class="container1" id="container">
	<header>
		<div class="f">
			<img src="./image/p3.png" alt="logo"  width="100"height="70" id="img">
			<div class="logo"><h1><span id="G">Pune</span>Police</h1></div>
			<div class="login"><%out.print("<i>Welcome "+username+"</i>"); %></div>	
		</div>
	</header>
	<div id="navigate">
		<ul>
			<a href="index.jsp"><li class="id1"><pre> ADD FIR</pre></li></a>
			<a href="criminal.html"><li class="id1"><pre> ADD CRIMINAL</pre></li></a>
			<li class="id1"  onclick="hide()"><pre> SEARCH</pre></li>
			<a href="guessCriminal.html"><li class="id1"><pre> GUESS CRIMINAL</pre></li></a>
			<a href="allotedFir.jsp"><li class="id1"><pre> ALLOTED FIRS</pre></li></a>
			<a href="approvedFir.jsp"><li class="id1"><pre>APPROVED FIRS</pre></li></a>
		</ul>	
	</div>
<div id="contain">
<%
String act=request.getParameter("act");
String h="criminal_search.html";
if(act.equalsIgnoreCase("guessCriminal.jsp"))
	h="guessCriminal.jsp";
%>
	 <i class="fa fa-lessthan"></i><a href="<%=h%>"><i class="fa fa-arrow-left" aria-hidden="true" onclick=""></i></a>
</div>
<%!Connection con=null; %>

<div id="inbox">

<!-- <div class="option"> -->
<%
/*
 select *from criminal ;
+--------------+--------+-----+---------------------+----------------+------------------+------------+-------------+
| crId         | name   | age | address             | photo          | StatusOfcriminal | contactNo  | description |
+--------------+--------+-----+---------------------+----------------+------------------+------------+-------------+
| 123852456555 | nikhil | 45  | pune, taware bakery | o4.jpeg        | jhbu             | 7894561230 | ugu         |
| 123852456951 | nikhil | 45  | pune                | 5CD60738SD.pdf | jhbu             | 7894561230 | ugu         |
| 123852456957 | nikhil | 45  | pune                | 5CD60738SD.pdf | jhbu             | 7894561230 | ugu         |
+--------------+--------+-----+---------------------+----------------+------------------+------------+-------------+
3 rows in set (0.000 sec)

MariaDB [mydata]> select *from criminal where crId=123852456555;
+--------------+--------+-----+---------------------+---------+------------------+------------+-------------+
| crId         | name   | age | address             | photo   | StatusOfcriminal | contactNo  | description |
+--------------+--------+-----+---------------------+---------+------------------+------------+-------------+
| 123852456555 | nikhil | 45  | pune, taware bakery | o4.jpeg | jhbu             | 7894561230 | ugu         |
+--------------+--------+-----+---------------------+---------+------------------+------------+-------------+
*/


	String adhaar=request.getParameter("AdhaarNo");
	String name=request.getParameter("name");
	long crid=Long.parseLong(adhaar);
	con=proj1.connection.getConnection();
	String sql="select * from criminal where cr_id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setLong(1, crid);
	ResultSet rs=pstmt.executeQuery();

	if(rs.next())
	{
		int i=0;
		String s=rs.getString(5);
		s="./crminal/"+s;
		System.out.println("src of criminal photo="+s);
%>	
<center>
<br>
<div style="overflow-x:auto;">
<table style="border:2px solid black" style="textalign:center">

<!-- fir_id | reprt_type | r_status | areaofcrime | date       | method | u_id         | police_station  -->

<tr>
	<th>PHOTO OF CRIMINAL</th>
	<td><a href="image.jsp?src=./criminal/<%=rs.getString(5)%>" target="_blank">Click here to see criminal photo</a></td>
</tr>
<tr>
	<th>CRIMINAL ID(Adhaar no)</th>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<th>CRIMINAL NAME</th>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<th>CRIMINAL AGE</th>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<th>ADDRESS OF CRIMINAL</th>
	<td><%=rs.getString(4)%>rkjnkj ejnn </td>
</tr>
<tr>
	<th>STATUS OF CRIMINAL</th>
	<td><%=rs.getString(6)%></td>
</tr>
<tr>
	<th>CONTACT NO OF CRIMINAL</th>
	<td><%=rs.getString(7)%></td>
</tr>
<tr>
	<th>DESCRIPTION OF CRIMINAL </th>
	<td><%=rs.getString(8)%></td>
</tr>

	
</table>
</div>	<!-- <div class="option"> -->
</center>
<pre>






</pre>
</div>	

	
<% }
	else{
		out.print("<center><h3 style='color:blue'>No data Found for criminal!!!!!!!</h3></center>");
	}
con.close();
%>
  
</div>	
</div>
<div id="hidden">
		<i class="fa fa-close" onclick="f1()"></i>
		<ul>
			<a href="criminal_search.html"><li ><pre>Search Details of A Criminal</pre></li></a>
			<!-- <a href="inbox.html"><li class="id1"><div class="right">+ Inbox</div></a></li> -->
			<a href="property.html"><li ><pre> Property Search</pre></li></a>
			<a href="fir_search.html"><li ><pre> FIR Search</pre></li></a>
		</ul>
</div>
</body>

</html>
