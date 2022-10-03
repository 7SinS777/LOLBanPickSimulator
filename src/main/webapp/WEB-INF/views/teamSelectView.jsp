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
h1 {
	margin: 40px 0;
}
h3 {
	font-size: 40px;
	font-weight: bold;
}
div#selectBlock {
	text-align: center;
}
select#blue, select#red {
	text-align: center;
	width: 200px;
	height: 40px;
	font-size: large;
	font-weight: bolder;
	border: 0;
	border-radius: 16px;
	color: white;
}
select#blue {
	background-color: blue;
}
select#red {
	background-color: red;
}
div.listBlock, div.playerBlock {
	display: inline-block;
	text-align: center;
	width: 45%;
}
div.playerBlock {
	border-radius: 30px;
	margin: 5px;
}
div#redList {
	background-color: red;
}
div#blueList {
	background-color: blue;
}
div#patchVersionBlock {
	background-color: seagreen;
	color: white;
	text-align: center;
	padding: 5px 36px;
	width: auto;
	height: auto;
	display: inline-block;
	border-radius: 36px;
	font-weight: bolder;
	margin: 20px auto;
}
input#patchVersion {
	border: 0;
	border-bottom: 1px solid white;
	background-color: seagreen;
	color: white;
	text-align: center;
	width: 120px;
}
div#submitButtonBlock {
	margin: 20px auto;
}
button#submitButton {
	border: 0;
	font-size: larger;
	font-weight: bolder;
	background-color: purple;
	color: white;
	border-radius: 12px;
	padding: 4px 12px;
}
</style>
</head>
<body>
<div class="buttonList2">
	<button type="button" class="buttons" id="teamInfoView">팀 정보</button>
	<button type="button" class="buttons" id="teamSelectView">팀 선택</button>
	<button type="button" class="buttons" id="teamRegisterView">팀 등록</button>
	<button type="button" class="buttons" id="playerRegisterView">선수 등록</button>
	<button type="button" class="buttons" id="matchRecordView">경기기록</button>
	<button type="button" class="buttons" id="matchStatsView">통계</button>
	<button type="button" class="buttons" id="menuView">메인으로</button>
</div>
<h1>팀 선택</h1>
<div id="selectBlock">
	<form action="banPickView" method="post" id="banPickView" name="banPickView" style="width: 100%;">
		<div class="listBlock" id="blueCamp">
			<h3>블루팀 선택</h3>
			<select name="blue" id="blue" class="teamSelect">
				<option selected style="display: none;">블루팀</option>
				<c:forEach var="team" items="${teamList}">
					<option value="${team.teamInitial}">${team.teamInitial}</option>
				</c:forEach>
			</select>
		</div>
		<div class="listBlock" id="redCamp">
			<h3>레드팀 선택</h3>
			<select name="red" id="red" class="teamSelect">
				<option selected style="display: none;">레드팀</option>
				<c:forEach var="team" items="${teamList}">
					<option value="${team.teamInitial}">${team.teamInitial}</option>
				</c:forEach>
			</select>
		</div>
		<div class="playerBlock" id="blueList">
			
		</div>
		<div class="playerBlock" id="redList">
			
		</div>
		<div id="patchVersionBlock">
			<span>패치 버전 : </span>
			<input type="text" name="patchVersion" id="patchVersion">
		</div>
		<div id="submitButtonBlock">
			<button type="submit" id="submitButton">선택완료</button>
		</div>
	</form>
</div>
</body>
</html>