<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
		<script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>
		<script>
			function login() {
				location.href='dashboard.jsp';
			}
		</script>
		<style type="text/css">
            body {
                background: #fbfbfb;
            }
            * {
                font-family: "Open Sans", sans-serif;
            }
        </style>
	</head>
	<body>
			<div class = "textLeft">Login to Peso Online Bank</div>
			<br>
			<br>
			<div>
				<!-- <form action="login" method="POST" role="form"> -->
				<form>
	                <legend>Login to COSMOS</legend>
	
	                <div class="form-group">
	                    <label for="">Username</label>
	                    <input type="text" name="username" class="form-control" pattern="[a-zA-Z0-9\s]+" placeholder="Your dlsu.edu.ph email" required>
	                </div>
	
	                <div class="form-group">
	                    <label for="">Password</label>
	                    <input type="password" name="password" class="form-control" pattern="[a-zA-Z0-9\s]+" placeholder="Password" required>
	                </div>
	                
					<button type="submit" class="btn btn-primary">Login</button>
            	</form>
			</div>
			<div class = "btn">
				<button onClick="login()" type="button" class="btn btn-default">Login</button>
			</div>
		<!-- jQuery -->
		<script src="jquery-1.11.1.min.js"></script>
		<!-- Bootstrap JavaScript -->
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>