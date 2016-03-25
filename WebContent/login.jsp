<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="styles.css">
		<script>
			function login() {
				var otp = $("#OTP").val();
				if( otp == 12345678){
					alert("Login Successful");
					location.href='HomePage.jsp';
				}
				else {
					alert("Wrong OTP Please try again.")
				}
			}
		</script>
	</head>
	<body>
		<c:if test="${message != null}">
		<div class="alert alert-warning">
			<c:out value="${message}" />
		</div>
		</c:if>
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
								<li>
								<a href="#logout" class="textLeft">Edit Profile</a>
								</li>
							</ul>
							
							<!-- <form action="login" method="POST" role="form"> -->
							<form class="form-inline">
							<ul class="nav navbar-nav navbar-right">
								<!-- <li>
								<a href="#logout" class="textLeft">Logout</a>
								</li>
								 -->
								 <li>
									<input type="text" name="username" class="loginMargin form-control" pattern="[a-zA-Z0-9\s]+" placeholder="E-Mail Address" required>
								</li>
								<li>
									<input type="password" name="password" class="loginMargin form-control" pattern="[a-zA-Z0-9\s]+" placeholder="Password" required>
								</li>
								<li>
									<button type="button" class="loginMargin btn btn-primary rightBtn" data-toggle="modal" data-target="#myModal">Login</button>
								</li>
							</ul>
							</form>
						</div>
					</div>
				</nav>
            	<!-- <form action="register" method="POST" role="form"> -->
            	<form action="Register" method="POST" role="form" class="loginContainer">
                        <legend>Sign Up</legend>
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
	                        <!--  
	                        <div>
	                        	<h4 class="margin">Birthday</h4>
	                        	<div class="row margin">
		                        	<select>
										<option value="Month">Month</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
		                        	</select>
		                        	<select>
										<option value="Day">Day</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
		                        	</select>
		                        	<select>
		                        		<option value="Year">Year</option>
		                        		<option value="2016">2016</option>
		                        		<option value="2015">2015</option>
		                        		<option value="2014">2014</option>
		                        		<option value="2013">2013</option>
		                        		<option value="2012">2012</option>
		                        		<option value="2011">2011</option>
		                        		<option value="2010">2010</option>
										<option value="2009">2009</option>
										<option value="2008">2008</option>
										<option value="2007">2007</option>
										<option value="2006">2006</option>
		                        		<option value="2005">2005</option>
										<option value="2004">2004</option>
										<option value="2003">2003</option>
										<option value="2002">2002</option>
										<option value="2001">2001</option>
										<option value="2000">2000</option>
										<option value="1999">1999</option>
										<option value="1998">1998</option>
										<option value="1997">1997</option>
										<option value="1996">1996</option>
										<option value="1995">1995</option>
										<option value="1994">1994</option>
		                        		<option value="1993">1993</option>
										<option value="1992">1992</option>
										<option value="1991">1991</option>
										<option value="1990">1990</option>
										<option value="1989">1989</option>
										<option value="1988">1988</option>
										<option value="1987">1987</option>
										<option value="1986">1986</option>
										<option value="1985">1985</option>
										<option value="1984">1984</option>
										<option value="1983">1983</option>
										<option value="1982">1982</option>
										<option value="1981">1981</option>
										<option value="1980">1980</option>
										<option value="1979">1979</option>
										<option value="1978">1978</option>
										<option value="1977">1977</option>
										<option value="1976">1976</option>
										<option value="1975">1975</option>
										<option value="1974">1974</option>
										<option value="1973">1973</option>
										<option value="1972">1972</option>
										<option value="1971">1971</option>
										<option value="1970">1970</option>
										<option value="1969">1969</option>
										<option value="1968">1968</option>
										<option value="1967">1967</option>
										<option value="1966">1966</option>
										<option value="1965">1965</option>
										<option value="1964">1964</option>
										<option value="1963">1963</option>
										<option value="1962">1962</option>
										<option value="1961">1961</option>
										<option value="1960">1960</option>
										<option value="1959">1959</option>
										<option value="1958">1958</option>
										<option value="1957">1957</option>
										<option value="1956">1956</option>
										<option value="1955">1955</option>
										<option value="1954">1954</option>
										<option value="1953">1953</option>
										<option value="1952">1952</option>
										<option value="1951">1951</option>
										<option value="1950">1950</option>
										<option value="1949">1949</option>
										<option value="1948">1948</option>
										<option value="1947">1947</option>
		                        	</select>
	                        	</div>
	                        </div>
	                        -->
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
	</body>
</html>