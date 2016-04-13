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
										<input id="username" type="text" id="username" name="username" class="loginMargin form-control" placeholder="E-Mail Address" required>
									</li>
									<li>
										<input id="password" type="password" id="password" name="password" class="loginMargin form-control" placeholder="Password" required>
									</li>
									<li>
										<button id="prepareOTP" type="button" class="loginMargin btn btn-primary rightBtn">Login</button>
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
		
		<div id="otpModal" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">One-Time Password(OTP)</h4>
		      </div>
		      
		      <div class="modal-body">
		      	<div class="alert alert-success" role="alert">
		        	Your OTP has been sent to your email.
		        </div>
		        <div class="input-group">
					<span class="input-group-addon">OTP</span>
					<input id="OTP" type="text" class="form-control" placeholder="Insert OTP here"></input>
				</div>	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-warning pull-left" data-dismiss="modal">Close</button>
		        <button id="validateOTP" type="button" class="btn btn-primary">Proceed</button>
		      </div>
		      
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<div id="otpWaitModal" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Generating One Time Password Please Wait.</h4>
		      </div>
		      
		      <div class="modal-body">
		        <div>
		        <p>To further ensure the security of your Online Banking transactions, you will be receiving a One-Time Password (OTP) via your email.</p>
		        </div>
		      </div>
		      <div class="modal-footer">
		      </div>
		      
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- End of Modal -->
		<!-- jQuery -->
		<script src="jquery-2.1.1.js"></script>
		<!-- Bootstrap JavaScript -->
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
	</body>
</html>