/**
 * 
 */
$(document).ready(function() {
	 $("#prepareOTP").click(function() {
		 // open wait modal
		 $('#otpWaitModal').modal('show');
		 var username = $("#username").val();
		 var password = $("#password").val();
	  		
		 $.post('PrepareOTP', {"username": username, "password": password},
				 function(data) { // on success to call servlet
			 			// checker
			 			if(data){
			 				$('#otpWaitModal').modal('hide');
			 				$('#otpModal').modal('show');
			 			} else {
			 				alert("OTP Generation Fail");
			 			}
         			}, "json")
         		 .fail(function() { // on failure to call servlet
         			 alert("Request of OTP failed. Please try again.");
         			 //document.location.href = "login.jsp";
         		 }, "json");
	    	
	 }); 
	 $("#validateOTP").click(function() {
		 // validation of OTP 
		 var username = $("#username").val();
		 var OTP = $("#OTP").val();
		 
		 $.post('ValidateOTP', {"username": username, "OTP": OTP},
				 function(data) { // on success
			 			// checker
			 			if(data){
			 				alert("OTP Validation success");
			 				document.location.href = "HomePage.jsp";
			 			} else {
			 				alert("OTP Validation Fail");
			 			}
         			}, "json")
         		 .fail(function() { // on failure
         			 alert("Validation of OTP failed. Please try again.");
         			 //document.location.href = "login.jsp";
         		 }, "json");
	    	
	 });
});