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
      <!-- Start - Top Navigation Bar -->
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
      <!-- End - Top Navigation Bar -->

      <!-- Start - Sidebar -->
      <div id="navBar">
        <div class="list-group">
          <a href="#content" class="navbaritem list-group-item active" name="home">Home</a>
          <a href="#content" class="navbaritem list-group-item" name="view-transaction-history">View Transaction History</a>
          <a href="#content" class="navbaritem list-group-item" name="view-balance">View Balance</a>
          <a href="#content" class="navbaritem list-group-item" name="fund-transfer">Fund Transfer</a>
          <a href="#content" class="navbaritem list-group-item" name="bills-payment">Bills Payment</a>
          <a href="#content" class="navbaritem list-group-item" name="send-money">Send Money</a>
          <a href="#content" class="navbaritem list-group-item" name="manage-accounts">Manage Accounts</a>
        </div>
      </div>

      <!-- End - Sidebar-->

      <!-- Start - Content-->
      <div id="content">
        
      </div>
    </div>
    <!-- End Content -->
    
    <script src="dashboard.js">
    </script>
</body>
</html>