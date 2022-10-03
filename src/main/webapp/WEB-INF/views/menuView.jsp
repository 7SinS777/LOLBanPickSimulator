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
div.buttonList1 {
	padding: 30px;
}
button.buttons {
	display: inline-block;
	height: 100px;
	width: 300px;
	border-radius: 20px;
	border-width: 0;
	background-color: dodgerblue;
	color: white;
	font-size: xx-large;
	margin: 10px 20px 10px 20px;
}
</style>
</head>
<body>
<div style="margin-top: 30%;">
	<div class="buttonList1">
		<button type="button" class="buttons" id="teamInfoView">팀 정보</button>
		<button type="button" class="buttons" id="teamSelectView">팀 선택</button>
		<button type="button" class="buttons" id="teamRegisterView">팀 등록</button>
	</div>
	<div class="buttonList1">
		<button type="button" class="buttons" id="playerRegisterView">선수 등록</button>
		<button type="button" class="buttons" id="matchRecordView">경기기록</button>
		<button type="button" class="buttons" id="matchStatsView">통계</button>
	</div>
</div>
</body>
</html>