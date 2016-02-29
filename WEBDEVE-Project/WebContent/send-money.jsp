<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
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
						<a href="login.jsp" class="textLeft">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="navBar">
			<div class="list-group">
				<a href="HomePage.jsp" class="list-group-item ">Home</a>
				<a href="transaction-history.jsp" class="list-group-item">View Transaction History</a>
				<a href="balance.jsp" class="list-group-item">View Balance</a>
				<a href="fund-transfer.jsp" class="list-group-item">Fund Transfer</a>
				<a href="bills-pay.jsp" class="list-group-item">Bills Payment</a>
				<a href="send-money.jsp" class="list-group-item active">Send Money</a>
				<a href="manage-accts.jsp" class="list-group-item">Manage Accounts</a>
			</div>
		</div>
		<div id="content">
			<h1>Send Money</h1>
			<form>
				<span>Source Account:</span>
				<select class="form-control">
					<option>Carlo Bautista</option>
					<option>Miguel Manalac</option>
				</select>

				<br>
				<span>Amount:</span>
				<input type="text" class="form-control" placeholder="Insert amount">

				<br>
				<span>Destination Account:</span>
				<input type="text" class="form-control" placeholder="Insert account number">
				
				<br>
				<button type="button" class="btn btn-primary btn-lg">Send Money</button>
				<button type="button" class="btn btn-default btn-lg">Cancel</button>
			</form>
		</div>
	</div>
</body>
</html>