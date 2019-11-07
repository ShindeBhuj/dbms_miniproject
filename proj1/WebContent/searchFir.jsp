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
a:hover{
color:red;
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
/*
function decrease(){
	
	var l = document.getElementById("limit").value;
	if(l>=100)
	{
		l=l-50;
		document.getElementById("limit").value=l;
		document.getElmentById("limit1").action="adminHome.jsp";
		document.getElementById("limit1").submit();
	}
	
}
function increase(){
	
	var l = document.getElementById("limit").value;
	var max = document.getElementById("max").value;
	if(l<max)
	{
		l=l+50;
		document.getElementById("limit").value=l;
		document.getElmentById("limit1").action="adminHome.jsp";
		document.getElementById("limit1").submit();
	}
	
}
*/
</script>

</head>
<body id="admin_body">
<%!Connection con=null; 
%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
String username;
if((username=(String)session.getAttribute("username"))==null && session.getAttribute("password")==null) 
{
	session.invalidate();
	response.sendRedirect("admin_login.jsp");
} %>

<%

con=proj1.connection.getConnection();
/*
String sql="select count(fir_id) as NumberOfFir from fir";
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
*/
%>
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
<div class="left">
	 <a href="fir_search.html"><i class="fa fa-arrow-left" aria-hidden="true"></i></a><a href="searchFir.jsp"><i class="fa fa-refresh"></i></a>
	 <span>
	 	 <%
	 	 /*if(rs.next()){
		int firno=rs.getInt(1);
  		out.print("<span>Total fir="+firno+"</span>");
  	 }
  	 */					
  	 %>
  	 </span> 
</div>
</div>
<!-- 
<div class="right">
  	 <div class="left">

  	 String limit=request.getParameter("limit");
	int l=50;
  	 if(limit!=null)
  	 {	 
	  	 l=Integer.parseInt(limit.trim());
	  	 out.print("<i>"+(l-50)+"-"+l+"</i>");
  	 }
  	 else
  	 {
  		out.print("<i>0-50</i>");
  	 }

-->
<!-- </div>
  	 <h4>
	  	 <span></span><button id="less" onclick="decrease()">&lt;</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	  	 <button id="more" onclick="increase()">&gt;</button></span>
  	 </h4>	 
</div> 
</div>
 -->
<%
String firId=request.getParameter("firId");
System.out.println("firId="+firId);
long fir=0;
if(firId!=null)
{
	fir=Long.parseLong(firId.trim());
	System.out.println("fir="+fir);
}
/*
String sql="select u_adhaar from user where u_name=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, name);
ResultSet rs2=pstmt.executeQuery();
if(rs2.next())
	name1=rs2.getLong(1)+"";
while(rs2.next()){
	name1=name1+","+rs2.getLong(1);	
}
*/
String sql="select * from fir where fir_id=?";// or u_id in("+name1+")";
PreparedStatement pstmt1=con.prepareStatement(sql);
pstmt1.setLong(1,fir);
ResultSet rs1=pstmt1.executeQuery();

%>

<div id="inbox">
		<!-- <div class="option"> -->
<%
int flag=0;
	while(rs1.next()) 
	{
		flag++;
		System.out.println("rs3 fir="+fir);
		System.out.println("rs1.getLong(1)="+rs1.getLong(1));
		System.out.println("rs1.getString(2)="+rs1.getString(2));
%>	
	
		<ul>
			<li>
				<a href="./firInfo.jsp?firId=<%=rs1.getLong(1)%>&table=<%=rs1.getString(2)%>&act=criminal_search.html"><%=rs1.getString(2)%></a>
				<%=rs1.getDate(5)%>
			</li>
		</ul>
	
<%} %>
<%
sql="select * from approvedFir where fir_id=?";// or u_id in("+name1+")";
PreparedStatement pstmt2=con.prepareStatement(sql);
pstmt2.setLong(1,fir);
ResultSet rs3=pstmt2.executeQuery();
	while(rs3.next()) 
	{
		flag++;
		System.out.println("rs3 fir="+fir);
		System.out.println("rs1.getLong(1)="+rs3.getLong(1));
		System.out.println("rs1.getString(2)="+rs3.getString(2));
		
%>
	
		<ul>
			<li>
				<a href="./approvedfirInfo.jsp?firId=<%=rs3.getLong(1)%>&table=<%=rs3.getString(2)%>&act=search"><%=rs3.getString(2)%></a>
				<%=rs3.getDate(5)%>
			</li>
		</ul>
	
<%} 
if(flag==0)
{
	out.print("<h2 style='color:blue'>NO FIR FOUND</h2>");
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
<!-- <form name="limit1" id="limit1" method="post" >
	  <input type="hidden" vlaue="50" name="limit" id="limit">
	  <input type="hidden" vlaue="50" name="max" id="max">
</form> -->
</body>

</html>
