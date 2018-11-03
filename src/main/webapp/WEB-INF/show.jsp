<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${event.name}</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			padding: 30px;
		}
		h1 {
			display: inline-block;
		}
		#top {
			margin-left: 100px;
		}
		#top a {
			display: inline-block;
			font-size: 25px;
			margin-left: 500px;
		}
		img {
			margin: 0px auto;
			display: block;
			padding-top: 30px;
		}
		table {
			border: 1px solid black;
			border-collapse: collapse;
			margin-top: 30px;
		}
		th {
			text-align: center;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			width: 230px;
			background-color: rgb(67, 198, 194);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
			padding: 10px;
			background-color: rgb(170, 224, 222);
			font-size: 18px;
		}
		#main {
			padding-top: 20px;
			padding-left: 100px;
			display: inline-block;
			width: 700px;
		}
		#showmessages {
			width: 500px;
			display: inline-block;
			vertical-align: top;
			padding-top: 20px;
		}
		#messages {
			background-color: rgb(196, 237, 231);
			width: 480px;
			padding: 10px;
			border-style: solid;
			border-width: 2px;
			height: 400px;
			overflow: auto;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "top">
			<h1>${event.name}</h1>
			<a href = "/events">Back to Events List</a>
		</div>
		<div id = "main">
			<h5>Host: ${event.creator.firstName} ${event.creator.lastName}</h5>
			<h5>Date: ${event.date}</h5>
			<h5>Location: ${event.city}, ${event.state}</h5>
			<h5>People who are attending the event: ${fn:length(event.users)}</h5>
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th>Location</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${joined}" var = "u">
			        <tr>
			            <td>${u.firstName} ${u.lastName}</td>
			            <td>${u.city}, ${u.state}</td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
		<div id = "showmessages">
			<h2>Message Wall</h2>
			<div id = "messages">
				<c:forEach items = "${messages}" var = "m">
					<p>${m.user.firstName} ${m.user.lastName}: ${m.comment}</p>
					<p>_______________________________________________________________</p>
			    </c:forEach>
			</div>
			<br>
			<h6>Add comment:</h6> 
			<p><c:out value = "${error}" /></p>
			<form action = "/events/${event.id}/comment" method = "POST">
				<textarea rows = "4" cols = "50" name = "comment"></textarea>
				<br>
				<input type = "submit" value = "Post Comment">
			</form>
		</div>
	</div>
</body>
</html>