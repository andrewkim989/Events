<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Events Home Page</title>
	<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
		}
		#top {
			padding: 25px;
			font-size: 24px;
			background-color: lightblue;
		}
		h3 {
			display: inline-block;
		}
		#topright {
			margin-left: 700px;
			display: inline-block;
		}
		#blackline {
			height: 3px;
			background-color: black;
		}
		#main {
			padding: 25px;
		}
		#othermain {
			padding: 20px;
		}
		#main table {
			border: 1px solid black;
			border-collapse: collapse;
			margin: auto;
			margin-top: 30px;
		}
		#main th {
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 120px;
			background-color: rgb(66, 244, 223);
			font-size: 18px;
		}
		#main tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(237, 241, 248);
			font-size: 18px;
		}
		#othermain table {
			border: 1px solid black;
			border-collapse: collapse;
			margin: auto;
			margin-top: 30px;
		}
		#othermain th {
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 100px;
			background-color: rgb(127, 186, 80);
			font-size: 18px;
		}
		#othermain tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(237, 241, 248);
			font-size: 18px;
		}
		#eventcreate {
			background-color: rgb(212, 201, 219);
			padding: 30px;
			padding-left: 100px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "top">
			<h3>Welcome, ${user.firstName} ${user.lastName}!</h3>
			<div id = "topright">
				<a href = "/logout">Log Out!</a>
			</div>
		</div>
		<div id = "blackline"></div>
		<div id = "main">
			<h4>Events happening in your state</h4>
			
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th>Date</th>
			            <th>Location</th>
			            <th>Host</th>
			            <th>Action/Status</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${topevents}" var = "e">
			        <tr>
			            <td><a href = "/events/${e.id}">${e.name}</a></td>
			            <td>${e.date}</td>
			            <td>${e.city}</td>
			            <td>${e.creator.firstName} ${e.creator.lastName}</td>
			            <td>
			            <c:choose>
			            	<c:when test = "${e.creator.equals(user)}">
			            		<a href = "events/${e.id}/edit">Edit</a>
			            		<a href = "events/${e.id}/delete">Delete</a>
			            	</c:when>
			            	<c:otherwise>
			            		<c:choose>
			            			<c:when test = "${!user.getEvents().contains(e)}">
					            		<a href = "events/${e.id}/join">Join</a>
					            	</c:when>
					            	<c:otherwise>
					            		<i>Joining</i>
					            		<a href = "events/${e.id}/cancel">Cancel</a>
					            	</c:otherwise>
			            		</c:choose>
			            	</c:otherwise>
			            </c:choose>
			            </td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
		
		<div id = "othermain">
		<h4>Events happening in other states</h4>
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th>Date</th>
			            <th>Location</th>
			            <th>State</th>
			            <th>Host</th>
			            <th>Action/Status</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${bottomevents}" var = "e">
			        <tr>
			            <td><a href = "/events/${e.id}">${e.name}</a></td>
			            <td>${e.date}</td>
			            <td>${e.city}</td>
			            <td>${e.state}</td>
			            <td>${e.creator.firstName} ${e.creator.lastName}</td>
			            <td>
			            <c:choose>
			            	<c:when test = "${e.creator.equals(user)}">
			            		<a href = "events/${e.id}/edit">Edit</a>
			            		<a href = "events/${e.id}/delete">Delete</a>
			            	</c:when>
			            	<c:otherwise>
			            		<c:choose>
			            			<c:when test = "${!user.getEvents().contains(e)}">
					            		<a href = "events/${e.id}/join">Join</a>
					            	</c:when>
					            	<c:otherwise>
					            		<i>Joining</i>
					            		<a href = "events/${e.id}/cancel">Cancel</a>
					            	</c:otherwise>
			            		</c:choose>
			            	</c:otherwise>
			            </c:choose>
			            </td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
		<div id = "blackline"></div>
		<div id = "eventcreate">
			<p><c:out value = "${error}" /></p>
			<h4>Create an Event</h4>
				<form method = "POST" action = "/events/new">
					<p>Name:</p>
		            <input type = "text" name = "name"/>
		            <p>Date:</p>
		            <input type = "date" name = "date"/>
		            <p>Location:</p>
		            <input type = "text" name = "city"/>
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
		        <input type = "submit" value = "Create"/>
		    </form>
		</div>
	</div>
</body>
</html>