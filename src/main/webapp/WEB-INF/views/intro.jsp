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
</head>
<body>
<div class="container text-center" id="mainScreen">
	<div style="margin-top: 30%;">
		<h3 style="margin-top: 30px; margin-bottom: 30px;">LOL 토너먼트 드래프트 밴픽 시뮬레이터</h3>
		<button type="button" class="btn btn-primary buttons" id="menuView">시작</button>
	</div>
</div>
<script>
$(document).ready(function() {
	$(document).on("click", "button.buttons", function(event) {
		let button = $(event.target);
		event.preventDefault();
		$.ajax({
			url : button.attr("id"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainScreen").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
});
</script>
<script type="text/javascript" src="js/teamInfoView.js"></script>
<script type="text/javascript" src="js/teamRegisterView.js"></script>
<script type="text/javascript" src="js/playerInfo.js"></script>
<script type="text/javascript" src="js/playerRegister.js"></script>
<script type="text/javascript" src="js/teamSelectView.js"></script>
<script type="text/javascript" src="js/banPickView.js"></script>
</body>
</html>