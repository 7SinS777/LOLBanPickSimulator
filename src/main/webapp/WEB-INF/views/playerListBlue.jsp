<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>
<title>JSP</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
h1 {
	margin: 40px 0;
}
h3 {
	font-size: 40px;
	font-weight: bold;
}
div.lane-group {
	text-align: center;
	margin: 20px auto;
	padding: 10px;
	width: 380px;
	background-color: silver;
	border-radius: 20px;
}
div.lane-margin {
	margin: auto;
}
input[name='position'] {
	text-align: center;
	width: 100px;
}
select.player {
	text-align: center;
	width: 200px;
}
input[name='position'], select.player {
	margin: 5px;
	height: 50px;
	font-size: x-large;
	font-weight: bold;
	border: 0;
	border-radius: 12px;
	background-color: lightyellow;
}
</style>
</head>
<body>
<div style="text-align: center;">
	<div class="lane-group">
		<div class="lane-margin">
			<input type="text" name="position" value="TOP" readonly="readonly">
			<select name="blueTOP" class="player" id="blueTOP">
				<c:forEach var="TOP" items="${top}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 1}">
							<option selected>${TOP}</option>
						</c:when>
						<c:otherwise>
							<option>${TOP}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="lane-group">
		<div class="lane-margin">
			<input type="text" name="position" value="JGL" readonly="readonly">
			<select name="blueJGL" class="player" id="blueJGL">
				<c:forEach var="JGL" items="${jgl}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 1}">
							<option selected>${JGL}</option>
						</c:when>
						<c:otherwise>
							<option>${JGL}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="lane-group">
		<div class="lane-margin">
			<input type="text" name="position" value="MID" readonly="readonly">
			<select name="blueMID" class="player" id="blueMID">
				<c:forEach var="MID" items="${mid}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 1}">
							<option selected>${MID}</option>
						</c:when>
						<c:otherwise>
							<option>${MID}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="lane-group">
		<div class="lane-margin">
			<input type="text" name="position" value="ADC" readonly="readonly">
			<select name="blueADC" class="player" id="blueADC">
				<c:forEach var="ADC" items="${adc}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 1}">
							<option selected>${ADC}</option>
						</c:when>
						<c:otherwise>
							<option>${ADC}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="lane-group">
		<div class="lane-margin">
			<input type="text" name="position" value="SPT" readonly="readonly">
			<select name="blueSPT" class="player" id="blueSPT">
				<c:forEach var="SPT" items="${spt}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 1}">
							<option selected>${SPT}</option>
						</c:when>
						<c:otherwise>
							<option>${SPT}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
	</div>
</div>
</body>
</html>