<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<a href="#logout" class="textLeft">Logout</a>
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
				<a href="send-money.jsp" class="list-group-item">Send Money</a>
				<a href="manage-accts.jsp" class="list-group-item active">Manage Accounts</a>
			</div>
		</div>
		<div id="content">
			<h1>Manage Accounts</h1>
			<script>
				var acctName;
				var acctNum;
				var acctBal;
				var accounts = [];
				var i;
				
				function Account(acctName, acctNum){
					this.acctName = acctName;
					this.acctNum = acctNum;
					this.acctBal = 0;
				}
				function initializeAccounts(){
					acct1 = new Account("Carlo Bautista", 5484657920);
					acct2 = new Account("Miguel Manalac", 9763249315);
					
					accounts.push(acct1);
					accounts.push(acct2);
				}
				function displayAccounts(){
					for(i = 0; i < accounts.length; i++){
						query = "<div id=account><center><table><tr><th>Account Name: </th><td>"+accounts[i].acctName+"</td></tr><tr><th>Account Number: </th><td>"+accounts[i].acctNum+"</td></tr></table></center><button id='delete' type='button'>Delete</button></div>";
						$('#content').append(query);
					}
				}
				initializeAccounts();
				displayAccounts();
			</script>
		</div>
	</div>
		
	<script>
	</script>
</body>
</html>