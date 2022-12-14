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
div.buttonList2 {
	padding-top: 30px;
	padding-bottom: 30px;
	text-align: center;
}
button.buttons {
	display: inline-block;
	height: 30px;
	width: 90px;
	border-radius: 12px;
	border-width: 0;
	background-color: dodgerblue;
	color: white;
	font-size: small;
	margin: 0 10px 0 10px;
}
#searchBar {
	padding: 8px 0;
	position: sticky;
	top: 0%;
	background-color: white;
}
#searchType, #search, #searchButton {
	border: 0;
	height: 30px;
}
#searchType, #searchButton {
	background-color: forestgreen;
	border-radius: 8px;
	color: white;
	text-align: center;
}
#search {
	border-bottom: 1px solid black;
	width: 170px;
}
#searchType {
	width: 100px;
}
#searchButton {
	width: 50px;
}
td.itinitial, th#initial {
	width: 120px;
}
</style>
</head>
<body>
<div class="buttonList2">
	<button type="button" class="buttons" id="teamInfoView">??? ??????</button>
	<button type="button" class="buttons" id="teamSelectView">??? ??????</button>
	<button type="button" class="buttons" id="teamRegisterView">??? ??????</button>
	<button type="button" class="buttons" id="playerRegisterView">?????? ??????</button>
	<button type="button" class="buttons" id="matchRecordView">????????????</button>
	<button type="button" class="buttons" id="matchStatsView">??????</button>
	<button type="button" class="buttons" id="menuView">????????????</button>
</div>
<h1 style="margin: 40px 0;">??? ??????</h1>
<div class="row">
	<div class="col-md-4" style="height: 600px; overflow: auto;">
		<div id="searchBar">
			<form action="teamInfoView" method="post" id="searchTeamInfoView" name="searchTeamInfoView">
				<select name="searchType" id="searchType">
					<option value="teamInitial">????????????</option>
					<option value="teamName">??????</option>
				</select>
				<input type="text" id="search" name="search" value="${search}">
				<button type="submit" id="searchButton">??????</button>
			</form>
		</div>
		<table style="width: 100%;" class="table table-hover table-striped">
			<tr>
				<th id="initial">????????????</th><th id="name">??????</th>
			</tr>
			<c:forEach var="teams" items="${teamList}">
				<tr class="team">
					<td class="initial" id="${teams.teamInitial}">${teams.teamInitial}</td>
					<td class="name" id="${teams.teamName}">${teams.teamName}</td>
				<tr>
			</c:forEach>
		</table>
	</div>
	<div id="playerInfoView" class="col-md-8">
		
	</div>
</div>
</body>
</html>