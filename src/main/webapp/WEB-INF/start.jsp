<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Events Signup Page</title>
	<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<style>
		#wrapper {
			padding-left: 70px;
			background-color: lightgrey;
		}
		h1 {
			text-align: center;
			padding-top: 10px;
			padding-right: 50px;
		}
		#register {
			width: 500px;
			margin: 20px;
			padding: 22px;
			background-color: #87a8e7;
			border-radius: 10px;
			display: inline-block;
			vertical-align: top;
		}
		#login {
			width: 500px;
			margin: 20px;
			padding: 22px;
			background-color: #aac0eb;
			border-radius: 10px;
			display: inline-block;
			vertical-align: top;
		}
		input[type = text] {
			padding: 3px 5px;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 250px;
			box-sizing: border-box;
		}
		input[type = password] {
			padding: 3px 5px;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 250px;
			box-sizing: border-box;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Welcome! Please sign in below! </h1>
		<div id = "register">
			<h2>Register here!</h2>
    
		    <form:form method = "POST" action = "/register" modelAttribute = "user">
		    	<p>
		            <form:label path = "firstName">First Name:</form:label>
		            <form:errors path = "firstName"/><br>
		            <form:input path = "firstName"/>
		        </p>
		        <p>
		            <form:label path = "lastName">Last Name: </form:label>
		            <form:errors path = "lastName"/><br>
		            <form:input path = "lastName"/>
		        </p>
		        <p>
		            <form:label path = "email">Email:</form:label>
		            <form:errors path = "email"/><br>
		            <form:input path = "email"/>
		        </p>
		        <form:label path = "city">Location:</form:label>
		        <form:errors path = "city"/><br>
		        <form:input path = "city"/>
		        
		        <form:select path = "state">
		        	<option value="CA">California</option>
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District Of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
				</form:select>
		        <p>
		            <form:label path = "password">Password:
		            (Must be at least 6 characters long, have no white spaces, and have one more instance
		            of the following: uppercase letter, lowercase letter, and a number)</form:label>
		            <form:errors path = "password"/><br>
		            <form:password path = "password"/>
		        </p>
		        <p>
		            <form:label path = "passwordConfirmation">Password Confirmation:</form:label>
		            <form:errors path = "passwordConfirmation"/><br>
		            <form:password path = "passwordConfirmation"/>
		        </p>
		        <input type = "submit" value = "Register!"/>
		    </form:form>
		</div>
		
		<div id = "login">
			<h2>Login here!</h2>
			<p><c:out value = "${error}" /></p>
		    <form method = "POST" action = "/login">
		        <p>
		            <label for = "email">Email</label><br>
		            <input type = "text" id = "email" name = "email"/>
		        </p>
		        <p>
		            <label for = "password">Password</label><br>
		            <input type = "password" id = "password" name = "password"/>
		        </p>
		        <input type = "submit" value = "Login!"/>
		    </form>
		</div>
	</div>
</body>
</html>