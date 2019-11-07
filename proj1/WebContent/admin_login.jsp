<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
	<title>admin login</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
	<header>
		<div class="f">
		<img src="./image/p3.png" alt="logo"  width="100"height="70" id="img">
		<div class="logo"><h1><span id="G">Pune</span>Police</h1></div>
		</div>
	</header>
	</div>
<center>


<div class="lg">



<b>---ADMIN LOGIN DETAILS---</b>
<br><br>
<form action="adminLogin.jsp" method="post">
    User Name :<input type="text" name="NAME" placeholder="Enter User Name" >
   <br>

	Password :<input type="Password" name="Password" placeholder="Enter Your Password">	
<br>
<input type="submit" value="submit">
<br>
</form>
<div class="container">
	<footer>
		<p>Copyright © 2019 Pune City Police .All Rights Reserved.</p>
	</footer>
	</div>

</body>
</html>