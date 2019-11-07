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
			<a href="fir2.html"><li class="id1"><pre> ADD FIR</pre></li></a>
			<a href="criminal.html"><li class="id1"><pre> ADD CRIMINAL</pre></li></a>
			<a href="lostfound1.jsp"><li class="id1"><pre> PROPERTY FOUND</pre></li></a>
			<li class="id1"  onclick="hide()"><pre> SEARCH</pre></li>
			<a href="search.html"><li class="id1"><pre> GUESS CRIMINAL</pre></li></a>
			<a href="alloted.jsp"><li class="id1"><pre> ALLOTED FIRS</pre></li></a>
		</ul>	
	</div>
<div id="contain">
	 <i class="fa fa-bars"></i><i class="fa fa-refresh"></i>
<!--	 <div class="right">
  	 <span id="limit"></span><span onclick="decrease()">&lt;</span><span onclick="increase()">&gt;</span>
	 </div>
 -->
</div>
<%!Connection con=null; 

%>
<%

con=proj1.connection.getConnection();
String sql="select fir_id,reprt_type,r_status,areaofcrime,date,method,u_id,police_station from fir order by date desc limit 20";
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
%>
<div id="inbox">
		<!-- <div class="option"> -->
<%
	while(rs.next()) 
	{
%>
	
		<ul>
			<li>
				<a href="./firInfo.jsp?firId=<%=rs.getLong("fir_id") %>&table=<%=rs.getString("reprt_type") %>"><%=rs.getString("reprt_type") %></a><%=rs.getDate("date") %>
			</li>
		</ul>
	
<%}

con.close();
%>
  
</div>	
</div>
<div id="hidden">
		<i class="fa fa-close" onclick="f1()"></i>
		<ul>
			<a href="fir2.html"><li ><pre>Search Details of A Criminal</pre></li></a>
			<!-- <a href="inbox.html"><li class="id1"><div class="right">+ Inbox</div></a></li> -->
			<a href="criminal.html"><li ><pre> Property Search</pre></li></a>
		</ul>
</div>
</body>

</html>
 