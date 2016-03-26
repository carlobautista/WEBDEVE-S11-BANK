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
				<a href="transaction-history.jsp" class="list-group-item active">View Transaction History</a>
				<a href="${pageContext.request.contextPath}/viewbalance" class="list-group-item">View Balance</a>
				<a href="fund-transfer.jsp" class="list-group-item">Fund Transfer</a>
				<a href="bills-pay.jsp" class="list-group-item">Bills Payment</a>
				<a href="send-money.jsp" class="list-group-item">Send Money</a>
				<a href="${pageContext.request.contextPath}/manageaccounts" class="list-group-item">Manage Accounts</a>
			</div>
		</div>
		<div id="content">
			<h1>Transaction History</h1>
			<table id="transTable" class="table table-striped">
				<tr>
					<th>Posting Date</th>
					<th>Transaction ID</th>
					<th>Account Name</th>
					<th>Description</th>
					<th>Debit/Credit</th>
					<th>Amount</th>
					<th>Running Balance</th>
				</tr>
			 </table>
		</div>
	</div>
	<script>
		var acctName;
		var acctNum;
		var acctBal;
		var accounts = [];
		var trans = [];
		var i;
		var date;
		var day;
		var month;
		var year;
		var transID;
		var desc;
		var dc;
		var amt;
		var rBal;
		
		function Account(acctName, acctNum){
			this.acctName = acctName;
			this.acctNum = acctNum;
			this.acctBal = 0;
		}
		function Transaction(date, transID, acctName, desc, dc, amt, rBal){
			this.date = date;
			this.transID = transID;
			this.acctName = acctName;
			this.desc = desc;
			this.dc = dc;
			this.amt = amt;
			this.rBal = rBal;
		}
		function initializeAccounts(){
			acct1 = new Account("Carlo Bautista", 5484657920);
			acct2 = new Account("Miguel Manalac", 9763249315);
			
			accounts.push(acct1);
			accounts.push(acct2);
		}
		function dateToday(){
			date = new Date();
			day = date.getDate();
			month = date.getMonth();
			year = date.getFullYear();
			
			return month+'/'+day+'/'+year;
		}
		function initializeTrans(){
			for(i=0;i<10;i++){
				transaction = new Transaction(dateToday(), i+1, "Name", "Description", "Debit", "Amount", "Running Balance");
				trans.push(transaction);
			}
		}
		function displayTrans(){
			for(i=0; i<trans.length;i++){
				query = "<tr><td>"+trans[i].date+"</td><td>"+trans[i].transID+"</td><td>"+trans[i].acctName+"</td><td>"+trans[i].desc+"</td><td>"+trans[i].dc+"</td><td>"+trans[i].amt+"</td><td>"+trans[i].rBal+"</td></tr>";
				$('#transTable tr:last').after(query);
			}
		}
		initializeAccounts();
		initializeTrans();
		displayTrans();
	</script>
</body>
</html>