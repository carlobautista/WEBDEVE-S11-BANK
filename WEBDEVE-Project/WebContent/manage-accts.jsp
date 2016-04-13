<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="peso.dto.Account, java.util.*" %>
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
	<title>Manage Accounts</title>
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
		<div id="navBar">
			<div class="list-group">
				<a href="HomePage.jsp" class="list-group-item ">Home</a>
				<a href="transaction-history.jsp" class="list-group-item">View Transaction History</a>
				<a href="viewbalance" class="list-group-item">View Balance</a>
				<a href="fundTransferAccts" class="list-group-item">Fund Transfer</a>
				<a href="bills-pay.jsp" class="list-group-item">Bills Payment</a>
				<a href="sendMoneyAccts" class="list-group-item">Send Money</a>
				<a href="manageaccounts" class="list-group-item active">Manage Accounts</a>
			</div>
		</div>
		<div id="content">
			<h1>Manage Accounts</h1>
				<div class="container">
					<div class="row">
						<div class="col-md-4">Account Name</div>
						<div class="col-md-4">Account Number</div>
						<div class="col-md-4"></div>
					</div>
					<% 
						ArrayList<Account> userAccts = (ArrayList<Account>)request.getAttribute("userAccts");
					%>
					<% for(int i =0; i < userAccts.size(); i ++) { %>
					<form action="deleteaccount" method="POST" role="form">
						<div class="row">
							<div class="col-md-4">
								<%=userAccts.get(i).getName()%>
								<input type="hidden" name="acctName" id="" value="<%=userAccts.get(i).getName()%>">
							</div>
							<div class="col-md-4">PHP <%=userAccts.get(i).getBalance()%></div>
							<div class="col-md-4"><button type="submit" name="action" class="btn btn-default">Delete</button></div>
						</div>
					</form>
					<%} %>
				</div>
				<div class="container">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAccountModal">Add Savings Account</button>
				</div>
		</div>
	</div>
		
	<div class="modal fade" tabindex="-1" role="dialog" id="addAccountModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">Add Account</h4>
	      </div>
	      <form method="POST" action="AddAccount">
		      <div class="modal-body">
		        <div class="form-group">
		        	<label for="accountName">Name</label>
		        	<input name="accountName" id="accountName" type="text" class="form-control" placeholder="Input Account Name Here" required>
		        </div>
		        <div class="form-group">
		        	<label for="accountBalance">Balance</label>
		        	<div class="input-group">
						<span class="input-group-addon">PHP</span>
						<input name="accountBalance" id="accountBalance" type="text" class="form-control" placeholder="Insert Amount Here" required>
					</div>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Confirm</button>
		      </div>
	      </form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->	
		
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    	
	<script type="text/javascript">
	</script>
</body>
</html>