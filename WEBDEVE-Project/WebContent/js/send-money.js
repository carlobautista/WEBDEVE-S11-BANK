/**
 * 
 */
$(document).ready(function() {
	 $("#prepareOTP").click(function() {
		 var sendingAcct = $("#sendingAcct").val();
		 var destAcct = $("#destAcct").val();
		 var amt = $("#amt").val();
		 
		 if(sendingAcct != "" && destAcct != "" && amt != ""){
		 // open wait modal
		 // check first values
		 $('#otpWaitModal').modal('show');
		 
		 $.post('PrepareOTP', {},
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
		 }
	 }); 
	 $("#validateOTP").click(function() {
		 // validation of OTP 
		 var username = $("#username").val();
		 var OTP = $("#OTP").val();
		 
		 $.post('ValidateOTP', {"username": username, "OTP": OTP, "method": "send-money"},
				 function(data) { // on success
			 			// checker
			 			if(data){
			 				alert("OTP Validation success");
			 				var sendingAcct = $("#sendingAcct").val();
			 				var destAcct = $("#destAcct").val();
			 				var amt = $("#amt").val();
			 				 
			 				// send money
			 				$.post('sendmoney', {"sendingAcct": sendingAcct, "destAcct": destAcct, "amt": amt},
			 						 function(data) { // on success
			 					 			// checker
			 					 			if(data){
			 					 				alert("Money sent");
			 					 				document.location.href = "HomePage.jsp";
			 					 			} else {
			 					 				alert("Money not sent");
			 					 			}
			 		         			}, "json")
			 		         		 .fail(function() { // on failure
			 		         			 alert("Validation of OTP failed. Please try again.");
			 		         			 //document.location.href = "login.jsp";
			 		         		 }, "json");
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