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
						    <a class="btn btn-default" href="transaction-history.jsp">View Transaction History</a>
							<a class="btn btn-default" href="viewbalance">View Balance</a>
							<a class="btn btn-default" href="fundTransferAccts">Fund Transfer</a>
							<a class="btn btn-primary active" href="BillsPayment">Bills Payment</a>
							<a class="btn btn-default" href="sendMoneyAccts">Send Money</a>
							<a class="btn btn-default" href="manageaccounts">Manage Accounts</a>
					</div>
			</div>
		</div>
		
		<div class="container-fluid" style="padding-top: 10px;">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						<h1>Bills Payment</h1>
						<form>
							<span>Pay From:</span>
							<input type="text" class="form-control" placeholder="Insert payment info"/>
			
							<br>
							<span>Pay the Company/Biller:</span>
							<select class="form-control">
								<option value="">Select a Company/Biller</option>
								<% ArrayList<Account> billersList = (ArrayList<Account>)request.getAttribute("billersList"); %>
								<% for(int i = 0; i < billersList.size(); i++) { %>
									<option value='<%=billersList.get(i).getIdAccount() %>'><%=billersList.get(i).getName() %></option>
								<% } %>
							</select>
			
							<br>
							<span>Amount:</span>
							<div class="input-group">
								<span class="input-group-addon">PHP</span>
								<input type="text" class="form-control" placeholder="Insert amount"></input>
							</div>	
			
							<br>
							<span>Account Name: </span>
							<input type="text" class="form-control" placeholder="Insert account name" />
			
							<br>
							<span>Account Number: </span>
							<input type="text" class="form-control" placeholder="Insert account number"/>
			
							<br>
							
							<button type="button" class="btn btn-default btn-lg">Cancel</button>
							<button type="button" class="btn btn-primary btn-lg right">Pay bill</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>