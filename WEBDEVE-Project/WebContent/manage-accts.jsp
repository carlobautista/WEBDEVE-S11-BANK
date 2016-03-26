<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="peso.dto.Account, java.util.*" %>
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
				<a href="${pageContext.request.contextPath}/viewbalance" class="list-group-item">View Balance</a>
				<a href="fund-transfer.jsp" class="list-group-item">Fund Transfer</a>
				<a href="bills-pay.jsp" class="list-group-item">Bills Payment</a>
				<a href="send-money.jsp" class="list-group-item">Send Money</a>
				<a href="${pageContext.request.contextPath}/manageaccounts" class="list-group-item active">Manage Accounts</a>
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
		</div>
	</div>
		
	<script>
	</script>
</body>
</html>