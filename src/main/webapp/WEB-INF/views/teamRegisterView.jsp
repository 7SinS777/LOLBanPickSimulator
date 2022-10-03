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
div#registerBlock {
	height: 600px;
	text-align: center;
}
div.label-group {
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 30px;
	width: 800px;
	height: 100px;
	border-color: gray;
	border-style: solid;
	border-width: 3px;
	border-radius: 20px;
}
label.label {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
}
label b {
	display: inline-block;
	width: 160px;
}
input.input {
	border: 0px;
	border-bottom: 1px solid black;
}
label b, input.input {
	font-size: x-large;
	text-align: center;
}
button.submitBtn {
	display: inline-block;
	height: 60px;
	width: 240px;
	border-radius: 40px;
	border-width: 0;
	background-color: gray;
	color: white;
	font-size: xx-large;
	margin: 0 10px 0 10px;
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
<h1>팀 등록</h1>
<div id="registerBlock">
	<form action="teamRegister" method="post" id="teamRegister" name="teamRegister">
		<div id="teamNameBlock">
			<div class="label-group">
				<label class="label"><b>팀명</b><input type="text" id="teamName" name="teamName" class="input"></label>
			</div>
			<div class="label-group">
				<label class="label"><b>팀이니셜</b><input type="text" id="teamInitial" name="teamInitial" class="input"></label>
			</div>
			<button type="submit" class="submitBtn" id="submitBtn">등록</button>
		</div>
	</form>
</div>
</body>
</html>