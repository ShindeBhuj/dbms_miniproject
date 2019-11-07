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
function approve()
{
	var description=document.forms["approved"]["appr_desc"].value;
	if(description=="")
	{
		return false;	
	}
	else
	{
		document.getElementById("approved").action="approve.jsp";
		document.getElementById("approved").submit();
	}
}
</script>

</head>
<body id="admin_body">
<%
String username;
if((username=(String)session.getAttribute("username"))==null && session.getAttribute("password")==null) 
{
	session.invalidate();
	response.sendRedirect("admin_login.jsp");
} 
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
<%
Connection con=proj1.connection.getConnection();
ResultSet rs=null;
String firid=request.getParameter("firId");
String firid1=firid.trim();
long firId=Long.parseLong(firid1);
String table=request.getParameter("table");
System.out.println("table="+table);
String act=request.getParameter("act");
System.out.println("act="+act);
	//String sql="select fir.fir_id,fir.reprt_type,fir.r_status,fir.areaofcrime,fir.date,fir.method,fir.u_id,fir.police_station, from fir"
String f="fir";
	String sql="select * from "+f+" where fir_id=?;";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setLong(1,firId);
	rs=pstmt.executeQuery();
	rs.next();
	long uid=rs.getLong(7);
	int i=0;
	if((act.equals("adminHome.jsp"))){
	sql="update fir set r_status=? where fir_id=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, "Alloted to work");
	pstmt.setLong(2, firId);
	 i=pstmt.executeUpdate();
	}
	System.out.println("n="+i);
	i=0;
	ResultSet rs1=proj1.connection.getDetails(table,firId);
/*	if(rs1.next()){
		System.out.println("successfull getdetails=");
	}*/
%>
<div id="contain">
	 <i class="fa fa-lessthan"></i><a href="<%=act%>"><i class="fa fa-arrow-left" aria-hidden="true" onclick=""></i></a>
</div>
<div id="inbox">

<center><b><%=table %></b></center>
<center>
<div style="overflow-x:auto;">
<table style="border:2px solid black" style="textalign:center">

<!-- fir_id | reprt_type | r_status | areaofcrime | date       | method | u_id         | police_station  -->


<tr>
	<th>FIR ID</th>
	<td><%=rs.getString(++i)%></td>
</tr>
<tr>
	<th>REPORT TYPE</th>
	<td><%=rs.getString(++i)%></td>
</tr>
<tr>
	<th>REPORT STATUS</th>
	<td><%=rs.getString(++i)%></td>
</tr>
<tr>
	<th>AREA OF CRIME</th>
	<td><%=rs.getString(++i)%></td>
</tr>
<tr>
	<th>DATE</th>
	<td><%=rs.getDate(++i)%></td>
</tr>
<tr>
	<th>METHOD OF DOING THE CRIME</th>
	<td><%=rs.getString(++i)%></td>
</tr>
<tr>
	<th>USER ID</th>
	<td><%=rs.getString(++i)%></td>
</tr>
<tr>
	<th>NEAR POLICE STATION </th>
	<td><%=rs.getString(++i)%></td>
</tr>

	
<% 
System.out.println("in lostfound1");
if(rs1.next()){
	
System.out.println("table.equals(lostfound)="+table.equals("lostfound")+"rs1.next()=");
if(table.equals("lostfound") ){
/*	System.out.println("in lostfound2");
}
if(rs1.next()){ i=1;
System.out.println("in lostfound");*/
%>

<tr>
	<th>REPORT TYPE</th>
	<td><%=rs1.getString(2)%></td>
</tr>
<tr>
	<th>DESCRIPTION</th>
	<td><%=rs1.getString(3)%></td>
</tr>
<tr>
	<th>OBJECT ID</th>
	<%
		long oid=rs1.getLong(4);
	System.out.println("oid="+oid);
	%>
	<td><%=rs1.getString(4)%></td>
</tr>
<%
sql="select * from object1 where oid=?";
pstmt=con.prepareStatement(sql);
pstmt.setLong(1,oid);
rs=pstmt.executeQuery();
if(rs.next())
{
	i=0;
	System.out.println("rs has next");
%>
<tr>
	<th>OBJECT TYPE</th>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<th>DOCUMENT ID</th>
	<td><%=rs.getString(3)%></td>  
</tr>
<tr>
	<th>BILL PHOTO</th>
	<td><a href="image.jsp?src=./lostfound/<%=rs.getString(4)%>" target="_blank">Click here to see bill</a></td>
</tr>		
<%} 
}if(table.equals("stolen")){ %>

	<tr>
	<th>VEHICLE NUMBER</th>
	<td><%=rs1.getString(2)%></td>
</tr>
<tr>
	<th>ENGINE NUMBER</th>
	<td><%=rs1.getString(3)%></td>  
</tr>
<tr>
	<th>CHASSIS NUMBER</th>
	<td><%=rs1.getString(4)%></td>  
</tr>

<tr>
	<th>VEHICLE_MODEL</th>
	<td><%=rs1.getString(5)%></td>  
</tr>

<tr>
	<th>VEHICLE_COMPANY</th>
	<td><%=rs1.getString(6)%></td>  
</tr>

<tr>
	<th>VEHICLE_TYPE</th>
	<td><%=rs1.getString(7)%></td>  
</tr>

<tr>
	<th>VEHICLE_BILL</th>
	<td><a href="image.jsp?src=./stolen/<%=rs1.getString(8)%>" target="_blank">Click here to see vehicle bill</a></td>
</tr>
<tr>
	<th>VEHICLE_PHOTO</th>
	<td><a href="image.jsp?src=./stolen/<%=rs1.getString(9)%>" target="_blank">Click here to see photo of vehicle</a></td>
</tr>

<tr>
	<th>VEHICLE_DESCRIPTION</th>
	<td><%=rs1.getString(10)%></td>  
</tr>

<%} 


if(table.equals("missing_person")){
	%>
<tr>
	<th>PHOTO_MP</th>
	<td><a href="image.jsp?src=./missingPerson/<%=rs1.getString(6)%>" target="_blank">Click here to see photo of person</a></td>
</tr>
<tr>
	<th>NAME of PERSON</th>
	<td><%=rs1.getString(2)%></td>
</tr>	

<tr>
	<th>AGE</th>
	<td><%=rs1.getString(3)%></td>  
</tr>


<tr>
	<th>ADDRESS</th>
	<td><%=rs1.getString(4)%></td>  
</tr>


<tr>
	<th>DESCRIPTION</th>
	<td><%=rs1.getString(5)%></td>  
</tr>

 
<tr>
	<th>RELATION WITH PERSON</th>
	<td><%=rs1.getString(7)%></td>  
</tr>


<tr>
	<th>CONTACT OF PERSON</th>
	<td><%=rs1.getString(8)%></td>  
</tr>


<tr>
	<th>PLACE_OCCURANCE</th>
	<td><%=rs1.getString(9)%></td>  
</tr>


<tr>
	<th>REPORT_TYPE</th>
	<td><%=rs1.getString(10)%></td>  
</tr>	

<%}
}
con.close();
%>
	
</table>
</div>	<!-- <div class="option"> -->

<pre>



</pre>
<!-- <form name="approved" id="approved" method="post" enctype="form-data">
<textarea rows="10" cols="130" name="appr_desc" id="appr_desc"></textarea>
<br>
<button type="submit" onclick="return approve()">Approve</button>
</form>
<pre>



</pre>
 -->
</center>
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
