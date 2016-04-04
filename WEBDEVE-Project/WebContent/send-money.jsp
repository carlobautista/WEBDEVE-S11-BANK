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
				<a href="fundTransferAccts" class="list-group-item">Fund Transfer</a>
				<a href="bills-pay.jsp" class="list-group-item">Bills Payment</a>
				<a href="sendMoneyAccts" class="list-group-item active">Send Money</a>
				<a href="${pageContext.request.contextPath}/manageaccounts" class="list-group-item">Manage Accounts</a>
			</div>
		</div>
		<div id="content">
			<h1>Send Money</h1>
			<form action="sendmoney" method="POST" role="form">
				<span>Source Account:</span>
				<select name="sendingAcct" class="form-control">
					<option>Select an account</option>
					<c:forEach var="a" items="${userAccts }" varStatus="counter">
						<option><c:out value="${a.name}" /></option>
					</c:forEach>
				</select>

				<br>
				<span>Amount:</span>
				<div class="input-group">
					<span class="input-group-addon">PHP</span>
					<input name="amt" type="text" class="form-control" placeholder="Insert amount"></input>
				</div>	

				<br>
				<span>Destination Account:</span>
				<input name="destAcct" type="text" class="form-control" placeholder="Insert account number">
				
				<br>
				
				<button type="button" class="btn btn-default btn-lg">Cancel</button>
				<button type="submit" class="btn btn-primary btn-lg right">Send Money</button>
			</form>
		</div>
	</div>
</body>
</html>