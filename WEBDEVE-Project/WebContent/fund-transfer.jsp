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
	<title>Insert title here</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script src="jquery-2.1.1.js"></script>
	<script>
			function home() {
				location.href='HomePage.jsp';
			}
	</script>
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
							<a class="btn btn-primary active" href="fundTransferAccts">Fund Transfer</a>
							<a class="btn btn-default" href="BillsPayment">Bills Payment</a>
							<a class="btn btn-default" href="sendMoneyAccts">Send Money</a>
							<a class="btn btn-default" href="manageaccounts">Manage Accounts</a>
					</div>
			</div>
		</div>
		
		<div class="container-fluid" style="padding-top: 10px;">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						<h1>Fund Transfer</h1>
						<form action="fundtransfer" method="POST" role="form">
							<span>Source Account:</span>
							<select name="sendingAcct" class="form-control">
								<option>Select an account</option>
								<c:forEach var="a" items="${userAccts }" varStatus="counter">
									<option>
										<c:out value="${a.name }" />
									</option>
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
							<select name="destAcct" class="form-control">
								<option>Select an account</option>
								<c:forEach var="a" items="${userAccts }" varStatus="counter">
									<option>
										<c:out value="${a.name}" />
									</option>
								</c:forEach>
							</select>
							
							<br>
							
							<button type="submit" class="btn btn-primary btn-lg right" type="button">Send Money</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>