<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("username")==null)
      response.sendRedirect("login.jsp");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Send Money</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script src="jquery-2.1.1.js"></script>
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
						<li>
						<a href="#logout" class="textLeft">Edit Profile</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
						<a href="logout" class="textLeft">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="container-fluid">
			<div class="row">
					<div class="btn-group" role="group">
						    <a class="btn btn-default" href="HomePage.jsp" >Home</a>
						    <a class="btn btn-default" href="ViewTransactionHistory">View Transaction History</a>
							<a class="btn btn-default" href="viewbalance">View Balance</a>
							<a class="btn btn-default" href="fundTransferAccts">Fund Transfer</a>
							<a class="btn btn-default" href="BillsPayment">Bills Payment</a>
							<a class="btn btn-primary active" href="sendMoneyAccts">Send Money</a>
							<a class="btn btn-default" href="manageaccounts">Manage Accounts</a>
					</div>
			</div>
		</div>
		
		<div class="container-fluid" style="padding-top: 10px;">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						<h1>Send Money</h1>
						<!--  <form action="sendmoney" method="POST" role="form"> -->
						<form>
							<span>Source Account:</span>
							<select id="sendingAcct" name="sendingAcct" class="form-control">
								<option>Select an account</option>
								<c:forEach var="a" items="${userAccts }" varStatus="counter">
									<option><c:out value="${a.name}" /></option>
								</c:forEach>
							</select>
			
							<br>
							<span>Amount:</span>
							<div class="input-group">
								<span class="input-group-addon">PHP</span>
								<input id="amt" name="amt" type="text" class="form-control" placeholder="Insert amount"></input>
							</div>	
			
							<br>
							<span>Destination Account:</span>
							<input id="destAcct" name="destAcct" type="text" class="form-control" placeholder="Insert account number">
							
							<br>
							
							<button id="prepareOTP" type="button" class="btn btn-primary btn-lg right">Send Money</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
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
		<script src="js/send-money.js"></script>
</body>
</html>