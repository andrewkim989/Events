<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Edit Event</title>
	<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
			height: 650px;
		}
		#top {
			padding: 25px;
			padding-left: 70px;
			font-size: 24px;
			background-color: lightblue;
		}
		h1 {
			display: inline-block;
		}
		#topright {
			margin-left: 900px;
			display: inline-block;
		}
		#blackline {
			height: 3px;
			background-color: black;
		}
		#main {
			padding: 15px;
			padding-left: 70px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "top">
			<h1>Edit Event</h1>
			<div id = "topright">
				<a href = "/events">Back</a>
			</div>
		</div>
		<div id = "blackline"></div>
		<div id = "main">
			<p><c:out value = "${error}" /></p>
				<form method = "POST" action = "/events/${event.id}/edit/process">
					<p>Name:</p>
		            <input type = "text" name = "name" value = "${event.name}"/><br>
		            <p>Date:</p>
		            <input type = "date" name = "date" value = "${event.date}"/><br>
		            <p>Location:</p>
		            <input type = "text" name = "city" value = "${event.city}"/>
		            <select name = "state">
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
					</select>
				<br><br>
		        <input type = "submit" value = "Edit"/>
		    </form>
		</div>
	</div>
</body>
</html>