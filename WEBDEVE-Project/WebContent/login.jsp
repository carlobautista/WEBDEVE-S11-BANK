<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="">
	<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
	<body>
			<div class="container-fluid">
				<nav class="navbar navbar-inverse navbar-fixed-top">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">Peso</a>
						</div>
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li class="active">
								<a href="#">Home</a>
								</li>
							</ul>
							
							<form id="loginform" action="login" method="POST" role="form" class="form-inline">
								<ul class="nav navbar-nav navbar-right">
									<!-- <li>
									<a href="#logout" class="textLeft">Logout</a>
									</li>
									 -->
									 <li>
										<input type="text" id="username" name="username" class="loginMargin form-control" placeholder="E-Mail Address" required>
									</li>
									<li>
										<input type="password" id="password" name="password" class="loginMargin form-control" placeholder="Password" required>
									</li>
									<li>
										<button type="button" class="loginMargin btn btn-primary rightBtn" data-toggle="modal" data-target="#myModal">Login</button>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</nav>
			</div>

			
			<div class="container-fluid">
			
				
				
            	<!-- <form action="register" method="POST" role="form"> -->
            	<form action="register" method="POST" role="form" class="loginContainer">
                        <legend>Sign Up</legend>
                        <c:if test="${message != null}">
					<div class="alert alert-warning">
						<c:out value="${message}" />
					</div>
				</c:if>
                        <div id="regContainer" class="form-horizontal">
	                        <p class="margin">*All fields are required.</p>
	                        <div class="col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="text" name="username" class="form-control" id="" placeholder="Username" title="Alphanumeric w/ or w/o spaces" required>
	                            </div>
	                        </div>
	                        <div class="col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="text" name="fname" class="form-control" id="" placeholder="First Name" title="Alphabet" required>
	                            </div>
	                        </div>
	                        <div class="col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="text" name="lname" class="form-control" id="" placeholder="Last Name" title="Alphabet" required>
	                            </div>
	                        </div>
							
							 <div class="col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="text" name="contactNum" class="form-control" id="" placeholder="Contact Number" pattern="[0-9\s]+" title="Numeric w/o spaces, 11 digits" required>
	                            </div>
	                        </div>
	
	                        <div class= "col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="email" name="email" class="form-control" id="" placeholder="E-mail Address" required>
	                            </div>
	                        </div>
	
	                        <div class="col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="password" name="password" class="form-control" id="" placeholder="Password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Uppercase, Lowercase, Number/SpecialChar, min 8 chars" required>
	                            </div>
	                        </div>
	
	                        <div class="col-xs-6 col-md-4">
	                            <div class="form-group">
	                                <input type="password" name="vpassword" class="form-control" id="" placeholder="Verify Password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Uppercase, Lowercase, Number/SpecialChar, min 8 chars" required>
	                            </div>
	                        </div>
	                        <div class="col-xs-6 col-md-4">
	                        	<h4 class="margin">Gender</h4>
	                        	<div class="radio margin">
									<label><input type="radio" name="optradio" value="male">Male</label>
								</div>
								<div class="radio margin">
									<label><input type="radio" name="optradio" value="female">Female</label>
								</div>
	                        </div>
							<button type="submit" class="btn btn-primary right"> Sign Up</button>
						</div>
				</form>
			</div>
			
		<!-- Modal for code confirmation -->
		
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">One-Time Password(OTP)</h4>
		      </div>
		      <div class="modal-body">
		        <p>To further ensure the security of your Online Banking transactions, you will be receiving a One-Time Password (OTP) via your email.</p>
		        <div class="input-group">
					<span class="input-group-addon">OTP</span>
					<input id="OTP" type="text" class="form-control" placeholder="Insert OTP"></input>
				</div>	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick="login()">Proceed</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- End of Modal -->
		<!-- jQuery -->
		<script src="jquery-2.1.1.js"></script>
		<!-- Bootstrap JavaScript -->
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">

function login() {
				var otp = $("#OTP").val();
				if( otp == 12345678){
					alert("Login Successful");
					document.getElementById("loginform").submit();
				}
				else {
					alert("Wrong OTP Please try again.")
				}
			}

			// When the page is fully loaded...
$(document).ready(function() {
	
	// Add an event that triggers when ANY button
	// on the page is clicked...
    $("button").click(function(event) {
    	
    	// Get the button id, as we will pass it to the servlet
    	// using a GET request and it will be used to get different
    	// results (bands OR bands and albums).
    	var buttonID = event.target.id;
    	
    	// Basic JQuery Ajax GET request. We need to pass 3 arguments:
    	// 		1. The servlet url that we will make the request to.
    	//		2. The GET data (in our case just the button ID).
    	//		3. A function that will be triggered as soon as the request is successful.
    	// Optionally, you can also chain a method that will handle the possibility
    	// of a failed request.
    	$.get('DBRetrievalServlet', {"button-id": buttonID},
            function(resp) { // on sucess
    			// We need 2 methods here due to the different ways of 
    			// handling a JSON object.
    			if (buttonID === "bands")
    				printBands(resp);
    			else if (buttonID === "bands-albums")
    				printBandsAndAlbums(resp); 
            })
            .fail(function() { // on failure
                alert("Request failed.");
            });
    });  
});
		</script>
	</body>
</html>