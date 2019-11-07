//*********VALIDATIONS FOR LOST AND FOUND**********//    
function valid()
{

   	var report_type = document.forms["lostfound"]["report_type"].value;
     var police = document.forms["lostfound"]["police"].value;
     var object_type = document.forms["lostfound"]["object_type"].value;
	 var name = document.forms["lostfound"]["name"].value;
	 var email= document.forms["lostfound"]["email"].value;
	 var contact = document.forms["lostfound"]["contact"].value;
	 var address = document.forms["lostfound"]["address"].value;
	 var Date = document.forms["lostfound"]["Date"].value;
	 var DocumentId = document.forms["lostfound"]["DocumentId"].value;
	 var Place = document.forms["lostfound"]["Place"].value;
	 var description = document.forms["lostfound"]["description"].value;
	 var adhaar = document.forms["lostfound"]["adhaar"].value;
	 var user = document.forms["lostfound"]["name"].value;

     var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/;
     var b=emailfilter.test(email);
     var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;

	if(report_type=="")
     {
		window.alert(report_type);
        document.getElementId("report_type").focus();
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
             window.alert("Enter Report name");
             document.getElementById("name").focus();
            return false;
     }
	if(!regName.test(name)){
		alert(name);
	     alert('Enter only alphabets');
	     document.getElementById("name").focus();
	     return false;
     }
    if(adhaar=="")
    {
             window.alert("Enter adhaar");
             document.getElementById("adhaar").focus();
            return false;
    }
	else if(adhaar.length!=12 )
    {
            alert("Enter 12 digit Adhaar number");
            return false;
    } 
    else if(isNaN(adhaar))
    {
            alert("Enter digits only");
            return false;
    }
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
    if(description=="")
    {
            alert("Enter Description");
            document.getElementById("description").focus();
           return false;
    } 
    else
    {
    	document.getElementById("lostfound").action="login1";
	    document.getElementById("lostfound").submit();
        return true;
    }   
	//alert("wrong")
	//return false;
}

//*******VALIDATIONS FOR STOLEN FORM******//

function validStolen()
{

	var FullName = document.forms["stolen"]["FullName"].value
	var adhaar = document.forms["stolen"]["adhaar"].value
	var contact = document.forms["stolen"]["contact"].value
	var address = document.forms["stolen"]["address"].value
	var email = document.forms["stolen"]["email"].value
	var DateRangeFrom = document.forms["stolen"]["Date"].value
	var policestation = document.forms["stolen"]["police"].value
	
   	var VehiclePhoto = document.forms["stolen"]["VehiclePhoto"].value
    var Vehiclebill = document.forms["stolen"]["Vehiclebill"].value
     
	 var vehicletype = document.forms["stolen"]["vehicleType"].value
	 var VehicleCompany = document.forms["stolen"]["VehicleCompany"].value
	 var VehicleModel = document.forms["stolen"]["VehicleModel"].value
	 
	 var NumberPlate = document.forms["stolen"]["NumberPlate"].value
	 
	 var ChassisNo = document.forms["stolen"]["ChassisNo"].value
	 var EngineNo = document.forms["stolen"]["EngineNo"].value
	 var PlaceofOccurance = document.forms["stolen"]["Place"].value
	 var description = document.forms["stolen"]["description"].value
	 


     var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/;
     var b=emailfilter.test(email);
     var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
     var phoneno = /^\d{12}$/;

	
	if(FullName=="")
    {
            window.alert("Enter  full name");
            document.getElementByName("FullName").focus();
           return false;
    }
	
	 if(adhaar=="")
	 {
	             window.alert("Enter adhaar");
	             document.getElementById("adhaar").focus();
	            return false;
	 }
	else if(adhaar.length!=12 )
	{
	            alert("Enter 12 digit Adhaar number");
	            return false;
	} 
	else if(isNaN(adhaar))
	{
	            alert("Enter digits only");
	            return false;
	}
	//validation for email
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
	if(VehiclePhoto=="")
    {
		window.alert("Upload VEHICAL PHOTO");
       document.getElementById("VehiclePhoto").focus();
       return false;
    }
	if(Vehiclebill=="")
	{
	        window.alert("UPDATE VEHICAL BILL");
	        document.getElementById("Vehiclebill").focus();
	        return false;
	}
	if(policestation=="")
	{
	        window.alert("UPDATE policestation");
	        document.getElementById("policestation").focus();
	        return false;
	}
	
	if(EngineNo=="")
    {
            window.alert("Enter EngineNo");
            document.getElementById("EngineNo").focus();
           return false;
    }
	if(ChassisNo=="")
    {
            window.alert("Enter ChassisNo");
            document.getElementById("ChassisNo").focus();
           return false;
    }
	if(vehicletype=="")
     {
             window.alert("Enter vehicletype");
             document.getElementById("vehicletype").focus();
            return false;
     }
	if(VehicleCompany=="")
    {
            window.alert("Enter VehicleCompany");
            document.getElementById("VehicleCompany").focus();
           return false;
    }
	if(NumberPlate=="")
    {
            window.alert("Enter NumberPlate");
            document.getElementById("NumberPlate").focus();
           return false;
    }
	//validation for adhar
   
     
    if(PlaceofOccurance=="")
    {
        window.alert("UPDATE PLACE OF OCCURANCE");
        document.getElementById("PlaceofOccurance").focus();
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
    	document.getElementById("stolen").action="login1";
	    document.getElementById("stolen").submit();
        return true;
    }   
	//alert("wrong")
	//return false;
}

//*****VALIDATION FOR MISSING PERSON FORM********//

function valid_missing_person()
{

   	var report_type = document.forms["missing_person"]["report_type"].value
     var police_station = document.forms["missing_person"]["police_station"].value
	 var name = document.forms["missing_person"]["name"].value
	 var email= document.forms["missing_person"]["email"].value
	 var contact_no_complainer = document.forms["missing_person"]["contact_no_complainer"].value
	 var address = document.forms["missing_person"]["address"].value
	 var Age = document.forms["missing_person"]["Age"].value
	 var Adhaar = document.forms["missing_person"]["Adhaar"].value
	 var name_mp = document.forms["missing_person"]["name_mp"].value
	 var Relation_with_Complainent = document.forms["missing_person"]["Relation_with_Complainent"].value
	 var contact_no_missing = document.forms["missing_person"]["contact_no_missing"].value
	 var address_mp = document.forms["missing_person"]["address_mp"].value
	 var Age = document.forms["missing_person"]["Age"].value
	 var Place_of_Occurance = document.forms["missing_person"]["Place_of_Occurance"].value
	 var Article_Description = document.forms["missing_person"]["Article_Description"].value;
    var photo_mp = document.forms["missing_person"]["photo_mp"].value;



     var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/;
     var b=emailfilter.test(email);
     var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;

	
     
     if(report_type=="")
     {
		window.alert(" choose report_type");
        document.getElementById("report_type").focus();
        return false;
     }
	if(police_station=="")
     {
         window.alert("Enter  Police Station");
         document.getElementById("police_station").focus();
         return false;
     }
	
	if(name=="")
     {
             window.alert("Enter  Name!!!!!");
             document.getElementById("name").focus();
            return false;
     }
	if(email=="")
     {
             window.alert("Enter email");
             document.getElementById("email").focus();
            return false;
     }
	/*if(!regName.test(name)){
		alert(name);
	     alert('Enter only alphabets');
	     document.getElementById("name").focus();
	     return false;
     }*/
    if(Adhaar=="")
    {
             window.alert("Enter adhaar");
             document.getElementById("Adhaar").focus();
            return false;
    }
	else if(Adhaar.length!=12 )
    {
            alert("Enter 12 digit Adhaar number");
            return false;
    } 
    else if(isNaN(Adhaar))
    {
            alert("Enter digits only");
            return false;
    }
    if(contact_no_complainer=="")
    {
            alert("Enter Mobile number fo");
            document.getElementById("contact_no_complainer").focus();
            return false;
    } 
   else if(contact_no_complainer.length<10 || contact_no_complainer.length>10 )
    {
            alert("Enter 10 digit Mobile number");
            return false;
    } 
    else if(isNaN(contact_no_complainer))
    {
            alert("Enter digits only");
            return false;
    }
   /* if(contact_no_missing=="")
    {
            alert("Enter Mobile number fo");
            document.getElementById("contact_no_complainer").focus();
            return false;
    } 
   else if(contact_no_missing.length==10)
    {
            alert("Enter 10 digit Mobile number");
            return false;
    } 
    else if(isNaN(contact_no_missing))
    {
            alert("Enter digits only");
            return false;
    }*/
    if(address=="")
    {
            alert("Enter Address");
            document.getElementById("address").focus();
            return false;
    } 
    if(photo_mp=="")
    {
		window.alert("UPDATE MISSING PERSON'S PHOTO");
       document.getElementById("photo_mp").focus();
       return false;
    }
    if(address_mp=="")
    {
            alert("Enter Address for missing person");
            document.getElementById("address_mp").focus();
            return false;
    }  
   
    if(Place_of_Occurance=="")
    {
            alert("Enter Place of Occurance");
            document.getElementById("Place_of_Occurance").focus();
            return false;
    } 
    else
    {
    	alert("successfully submitted");
    	document.getElementById("missing_person").action="login1";
	    document.getElementById("missing_person").submit();
        return true;
    }   
	//alert("wrong")
	//return false;
}



//*********VALIDATIONS CRIMINALS DATA**********//    
function valid_criminals()
{

   	var criminalPhoto = document.forms["criminal"]["criminalPhoto"].value;
     var report_type = document.forms["criminal"]["report_type"].value;
     var police_station = document.forms["criminal"]["police_station"].value;
	 var name = document.forms["criminal"]["name"].value;
	 var email= document.forms["criminal"]["email"].value;
	 var contactno = document.forms["criminal"]["contactno"].value;
	 var address = document.forms["criminal"]["address"].value;
	 var Age = document.forms["criminal"]["Age"].value;
	 var AdhaarNo = document.forms["criminal"]["AdhaarNo"].value;
	 var Areaofcrime = document.forms["criminal"]["Areaofcrime"].value;
	 var MethodOfCrime = document.forms["criminal"]["MethodOfCrime"].value;
	 var StatusOfcriminal = document.forms["criminal"]["StatusOfcriminal"].value;
	 var Description = document.forms["criminal"]["Description"].value;

     var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/;
     var b=emailfilter.test(email);
     var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;

	if(report_type=="")
     {
		window.alert(report_type);
        document.getElementById("report_type").focus();
        return false;
     }
	if(police_station=="")
     {
         window.alert("Enter  Police Station");
         document.getElementById("police_station").focus();
         return false;
     }
	if(name=="")
    {
            window.alert("Enter  name!!!");
            document.getElementById("name").focus();
           return false;
    }
	/*if(!regName.test(name)){
		alert(name);
	     alert('Enter only alphabets');
	     document.getElementById("name").focus();
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
	if(contactno=="")
    {
            alert("Enter Mobile number");
            document.getElementById("contactno").focus();
            return false;
    } 
	else if(contactno.length<10 || contactno.length>10  )
    {
            alert("Enter 10 digit no.r");
            return false;
    } 
    else if(isNaN(contactno))
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
	 if(AdhaarNo=="")
	    {
	             window.alert("Enter adhaar");
	             document.getElementById("AdhaarNo").focus();
	            return false;
	    }
	 else if(AdhaarNo.length<12 || AdhaarNo.length>12  )
	    {
	            alert("Enter 12 digit of adhar no.");
	            return false;
	    } 
	    else if(isNaN(AdhaarNo))
	    {
	            alert("Enter digits only");
	            return false;
	    }
	if(Areaofcrime=="")
     {
             window.alert("Enter  Areaofcrime");
             document.getElementById("Areaofcrime").focus();
            return false;
     }
	if(MethodOfCrime=="")
    {
            alert("Enter MethodOfCrime");
            document.getElementById("MethodOfCrime").focus();
            return false;
    } 
    if(StatusOfcriminal=="")
    {
            alert("Enter StatusOfcriminal");
            document.getElementById("StatusOfcriminal").focus();
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
    	document.getElementById("criminal").action="login";
	    document.getElementById("criminal").submit();
        return true;
    }   
	//alert("wrong")
	//return false;
}

