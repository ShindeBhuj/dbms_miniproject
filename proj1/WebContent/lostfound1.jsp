<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>lost found</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<!-- <script type="text/javascript" src="formValidation.js"></script> -->
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<style type="text/css">
.btn{
text-align:center;
width:5%;
}
.btn button{
	text-align: center;
	background-color:#e8491d;
	border:none;
	padding-left:15px;
	padding-right:15px;
	padding-top:8px;
	padding-bottom:8px;
	color:white;
}
</style>
 <script>
    
    function valid()
    {

    	 var report_type = document.forms["lostfound"]["report_type"].value
	      var police = document.forms["lostfound"]["police"].value
	      var object_type = document.forms["lostfound"]["object_type"].value
	      var name = document.forms["lostfound"]["name"].value
	      var email= document.forms["lostfound"]["email"].value
	      var contact = document.forms["lostfound"]["contact"].value
	      var address = document.forms["lostfound"]["address"].value
	      var Date = document.forms["lostfound"]["Date"].value
	      var DocumentId = document.forms["lostfound"]["DocumentId"].value
	      var Place = document.forms["lostfound"]["Place"].value
	      var description = document.forms["lostfound"]["description"].value
	      var adhaar = document.forms["lostfound"]["adhaar"].value
	      var user = document.forms["lostfound"]["name"].value
	      var objectbill = document.forms["lostfound"]["objectbill"].value
	      
	      
      var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/
      var b=emailfilter.test(email);
      var regName = /^[a-zA-Z]+ [a-zA-Z]+$/
      var phoneno = /^\d{12}$/;
			if(report_type=="")
          {
             window.alert("Enter Report type");
             document.getElementById("report_type").focus();
            return false;
          }
			if(police=="")
          {
             window.alert("Enter  Police Station");
             document.getElementById("police").focus();
            return false;
          }
			if(object_type=="")
          {
             window.alert("Enter  Object type");
             document.getElementById("object_type").focus();
            return false;
          }
			if(name=="")
          {
             window.alert("Enter  Name");
             document.getElementById("name").focus();
            return false;
          }
	/*		if(!regName.test(name)){
              alert('Enter only alphabets');
              document.getElementById("name").focus();
              return false;
          }*/
          if(adhaar=="")
          {
             window.alert("Enter adhaar");
             document.getElementById("adhaar").focus();
            return false;
          }
			else if(adhaar.length!=12 )
          {
            alert("Enter 12 digit Adhaar number");
            document.getElementById("adhaar").focus();
            return false;
          } 

         /* else if(!(adhaar.value.match(phoneno)))
          {
            alert("Enter digits only");
            document.getElementById("adhaar").focus();
            return false;
          }*/
          if(email=="")
          {
             window.alert("Enter email");
             document.getElementById("email").focus();
            return false;
          }
 			else if(b==false)
          {
              alert("enter valid email");
              return false;
          } 
          if(contact=="")
          {
            alert("Enter Mobile number");
            document.getElementById("contact").focus();
            return false;
          } 

          else if(contact.length<10)
          {
            alert("Enter 10 digit Mobile number");
            document.getElementById("contact").focus();
            return false;
          } 

          else if(isNaN(contact))
          {
            alert("Enter digits only");
            return false;
          }

          if(address=="")
          {
            alert("Enter Address");
            document.getElementById("address").focus();
            return false;
          }  
          if(Date=="")
          {
            alert("Enter Date");
            document.getElementById("Date").focus();
            return false;
          }

          if(DocumentId=="")
          {
            alert("Enter DocumentId");
            document.getElementById("DocumentId").focus();
            return false;
          } 
          if(Place=="")
          {
            alert("Enter Place of Occurance");
            document.getElementById("Place").focus();
            return false;
          } 
          if(objectbill=="")
          {
            alert("Enter object bill");
            document.getElementById("objectbill").focus();
            return false;
          } 
          if(description=="")
          {
            alert("Enter Description");
            document.getElementById("description").focus();
            return false;
          } 
          else
          {
            alert("successfully submitted");
            //document.lostfound.action="login";
            document.getElementById("lostfound").action="login";
		    document.getElementById("lostfound").submit();
            return true;
          }
          return false;
    }
    
   function sub(){
	   if(valid()){
		   document.getElementById("lostfound").action="login";
		   document.getElementById("lostfound").submit();
		}
   }
  </script> 

	
	
</head>
<body>


<div class="container">
	<header>
		<div class="f">
		<img src="./image/p3.png" alt="logo"  width="100"height="70" id="img">
		<div class="logo"><h1><span id="G">Pune</span>Police</h1></div>
		<div class="login">
			<ul>
			
				<a href="index.jsp"><li>Back</li></a>

			</ul>
		</div>
		
		</div>
	</header>
	</div>
	<form  name="lostfound" method="post" id="lostfound" autocomplete="on" enctype="multipart/form-data">
		<div class="container">
			<section id="lf">
			<center><h2>---Lost / Found---</h2></center>
		          <p style="text-align: center;">This application is for providing Lost or Found Information to Police. Information reported under this application is not a subject matter of enquiry/investigation. False report to Police is a punishable offence. Reporting person shall be solely responsible for any false information. Dial 100, if there is any emergency. </p>

			<br>
			<br>
			<div class="nested">
				<div> Report Type:</div>
				  <div>
				  	<select name="report_type" id="report_type">
				  		<option value="">select report type</option>
				  		<option value="lost">lost</option>
				  		<option value="found">found</option>
					</select>
				 </div>
			</div>
			<div class="nested">
				<div>Near Police Station:</div>
				
				<div>
				  	<select id="police" name="police">
				  		<option value="">select police station</option>
				  		<option value="Wakad">Wakad</option>
				  		<option value="Sangavi">Sangavi</option>
				  		<option value="Hinjewadi">Hinjewadi</option>
				  		<option value="Chaturshringi">Chaturshringi</option>
				  		<option value="Nigadi">Nigadi</option>
				  		<option value="Yerawada">Yerawada</option>
                        <option value="Khadaki">Khadaki</option>
                        <option value="Hadapsar">Hadapsar</option>
                        <option value="Kondhwa">Kondhwa</option>
                        <option value="Khadak">Khadak</option>
                          <option value="Vishrambaug">Vishrambaug</option>
  						  <option value="Shivajinagar">Shivajinagar</option>
  						 <option value="Kothrud">Kothrud</option>
  						 <option value="Deccan">Deccan</option>
  						  <option value="Sahakar Nagar">Sahakar Nagar</option>
  						   <option value="Dattawadi">Dattawadi</option>
  						    <option value="Sinhagad">Sinhagad</option>
  						     <option value="Bibvewadi">Bibvewadi</option>
  						      <option value="Swargate">Swargate</option>
  						       <option value="Koregaon Park">Koregaon Park</option>
					</select>
				 </div>
			</div>
			<div class="nested">
				<div> Object Type:</div>
				  <div>
				  	<select id="object_type" name="object_type">
				  		<option value="">select object type</option>
				  		<option value="mobile">mobile</option>
				  		<option value="other electronics">other electronics</option>
					</select>
				 </div>
			</div>
			
			
			<div class="nested">
				<div>Full Name Of Complainant:</div>
				<div class="input"><input type="text" id="name" name="FullName"></div>
			</div>
			
			<div class="nested">
				<div>Adhaar Of Complainant:</div>
				<div class="input"><input type="text" id="adhaar" name="adhaar"></div>
			</div>
			
			<div class="nested">
				<div> Email :</div>
				<div><input type="email" id="email" name="email"></div>
			</div>
			<div class="nested">
				<div> Contact no:</div>
				<div ><input type="text" id="contact" name="contact"></div>
			</div>
			<div class="nested">
				<div> Address: </div>
				<div><input type="text" id="address" name="address"></div>
			</div>
			<div class="nested">
				<div> Lost / Found Date & Time:</div>
				<div><input type="date" id="Date" name="Date"></div>
			</div>
			
			<div class="nested">
				<div> Document ID No. / IMEI no.: </div>
				<div><input type="text" id="DocumentId" name="DocumentId" placeholder=""></div>
			</div>
			<div class="nested">
				<div> Place of Occurance(If Any)*</div>
				<div><input type="text" id="Place" name="Place"></div>
			</div>
			<div class="nested">
				<div>Object bill /Object photo</div>
				<div><input type="file" name="objectbill" id="objectbill"></div>
			</div>
			<div class="nested">
				<div> Describe Theft </div>
				<div><textarea rows="8" cols="48" id="description" name="description"></textarea></div>
			</div>
			<div class="nested">
				<div><input type="hidden" name="form" value="lostfound"></div> 
			</div>
			</section>
			</div>
		<center><div class="btn"><button type="submit" value="submit" onclick="return valid()">Submit</button></div></center>
		
	</form>
	
<br>
<br><center>
<small>By continuing, you agree to Police Conditions of Use and Privacy Notice.</small></center>

	<div class="container">
	<footer>
		<p>Copyright © 2019 Pune City Police .All Rights Reserved.</p>
	</footer>
	</div>
</body>
</html> 