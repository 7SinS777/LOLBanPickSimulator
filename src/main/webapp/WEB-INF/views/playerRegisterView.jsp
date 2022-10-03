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
	margin: 0 10px;
}
div#teamPlayerBlock {
	text-align: center;
}
div.label-group {
	padding: 15px 0;
	border-bottom: 1px solid gray;
	width: 800px;
	margin: auto;
}
select.position, select.teamInitial, input.player {
	border-width: 0;
	text-align: center;
	margin: 3px 10px;
}
select.position, select.teamInitial {
	width: 120px;
}
input.player {
	border-bottom-width: 1px;
	width: 200px;
}
button#add, button#register, button.delete {
	border: 0;
	width: 100px;
	height: 30px;
	font-size: large;
	font-weight: bold;
	border-radius: 12px;
	background-color: lightblue;
	margin: 15px 15px;
}
button.delete {
	border: 0;
	width: 60px;
	height: 24px;
	font-size: small;
	font-weight: bold;
	border-radius: 6px;
	background-color: lightblue;
}
h1 {
	margin: 40px 0;
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
<h1>선수 등록</h1>
<form action="playerRegister" method="post" id="playerRegister" name="playerRegister">
	<div id="teamPlayerBlock">
		<c:set var="posi" value='<%=new String[] {"TOP", "JGL", "MID", "ADC", "SPT"} %>' />
		<div class="label-group">
			<button type="button" class="delete">삭제</button>
			<select name="teamInitial" class="teamInitial">
				<option>소속팀</option>
				<c:forEach var="team" items="${teamList}">
					<option>${team.teamInitial}</option>
				</c:forEach>
			</select>
			<select name="position" class="position">
				<option>포지션</option>
				<c:forEach var="pos" items="${posi}">
					<option>${pos}</option>
				</c:forEach>
			</select>
			<input type="text" name="player" class="player" placeholder="닉네임">
		</div>
	</div>
	<button type="button" id="add">추가</button>
	<button type="submit" id="register">등록</button>
</form>
</body>
</html>