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
div.playerInfomation {
	text-align: left;
	height: 40px;
	margin-bottom: 30px;
	margin-left: 30px;
}
div.playerInfomation span, input.player {
	display: inline-block;
	width: 160px;
	height: 40px;
	font-size: x-large;
	text-align: center;
}
input.player {
	border: 0px;
	border-bottom: 1px solid black;
}
span.lane {
	border-right: 1px solid black;
}
button.edtiButton {
	display: inline-block;
	height: 30px;
	width: 90px;
	border-radius: 12px;
	border-width: 0;
	background-color: slateblue;
	color: white;
	font-size: small;
	margin: 0 10px 0 10px;
}
select {
	border: 0;
}
input.player-d {
	display: none;
}
span.nonSelected, span.selected {
	height: 34px;
	border-width: 3px;
	border-style: solid;
	border-radius: 12px;
	border-color: black;
}
span.selected {
	background-color: slategray;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
<c:set var="posi" value='<%=new String[] {"TOP", "JGL", "MID", "ADC", "SPT"} %>' />
<div style="margin: auto; text-align: center;">
	<h2 style="margin: 20px 0;">${teamInitial}</h2>
	<div id="basic" style="display: block;">
		<div class="playerInfomation">
			<span class="lane">TOP</span>
			<c:forEach var="TOP" items="${top}">
				<span>${TOP}</span>
			</c:forEach>
		</div>
		<div class="playerInfomation">
			<span class="lane">JGL</span>
			<c:forEach var="JGL" items="${jgl}">
				<span>${JGL}</span>
			</c:forEach>
		</div>
		<div class="playerInfomation">
			<span class="lane">MID</span>
			<c:forEach var="MID" items="${mid}">
				<span>${MID}</span>
			</c:forEach>
		</div>
		<div class="playerInfomation">
			<span class="lane">ADC</span>
			<c:forEach var="ADC" items="${adc}">
				<span>${ADC}</span>
			</c:forEach>
		</div>
		<div class="playerInfomation">
			<span class="lane">SPT</span>
			<c:forEach var="SPT" items="${spt}">
				<span>${SPT}</span>
			</c:forEach>
		</div>
		<button type="button" id="goModify" class="edtiButton">수정</button>
		<button type="button" id="goDelete" class="edtiButton">삭제</button>
	</div>
	<div id="modify" style="display: none;">
		<form action="playerModify" method="post" id="playerModify" name="playerModify">
			<input type="hidden" name="selectTeamInitial" value="${teamInitial}">
			<div class="playerInfomation">
				<c:forEach var="TOP" items="${top}">
					<select name="teamInitial" class="teamInitial-m">
						<c:forEach var="team" items="${teamList}">
							<c:choose>
								<c:when test="${team.teamInitial eq teamInitial}">
									<option selected>${team.teamInitial}</option>
								</c:when>
								<c:otherwise>
									<option>${team.teamInitial}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select name="position" class="position-m">
						<c:forEach var="pos" items="${posi}">
							<c:choose>
								<c:when test="${pos eq 'TOP'}">
									<option selected>${pos}</option>
								</c:when>
								<c:otherwise>
									<option>${pos}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="text" name="player" class="player-m" value="${TOP}">
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<c:forEach var="JGL" items="${jgl}">
					<select name="teamInitial" class="teamInitial-m">
						<c:forEach var="team" items="${teamList}">
							<c:choose>
								<c:when test="${team.teamInitial eq teamInitial}">
									<option selected>${team.teamInitial}</option>
								</c:when>
								<c:otherwise>
									<option>${team.teamInitial}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select name="position" class="position-m">
						<c:forEach var="pos" items="${posi}">
							<c:choose>
								<c:when test="${pos eq 'JGL'}">
									<option selected>${pos}</option>
								</c:when>
								<c:otherwise>
									<option>${pos}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="text" name="player" class="player-m" value="${JGL}">
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<c:forEach var="MID" items="${mid}">
					<select name="teamInitial" class="teamInitial-m">
						<c:forEach var="team" items="${teamList}">
							<c:choose>
								<c:when test="${team.teamInitial eq teamInitial}">
									<option selected>${team.teamInitial}</option>
								</c:when>
								<c:otherwise>
									<option>${team.teamInitial}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select name="position" class="position-m">
						<c:forEach var="pos" items="${posi}">
							<c:choose>
								<c:when test="${pos eq 'MID'}">
									<option selected>${pos}</option>
								</c:when>
								<c:otherwise>
									<option>${pos}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="text" name="player" class="player-m" value="${MID}">
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<c:forEach var="ADC" items="${adc}">
					<select name="teamInitial" class="teamInitial-m">
						<c:forEach var="team" items="${teamList}">
							<c:choose>
								<c:when test="${team.teamInitial eq teamInitial}">
									<option selected>${team.teamInitial}</option>
								</c:when>
								<c:otherwise>
									<option>${team.teamInitial}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select name="position" class="position-m">
						<c:forEach var="pos" items="${posi}">
							<c:choose>
								<c:when test="${pos eq 'ADC'}">
									<option selected>${pos}</option>
								</c:when>
								<c:otherwise>
									<option>${pos}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="text" name="player" class="player-m" value="${ADC}">
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<c:forEach var="SPT" items="${spt}">
					<select name="teamInitial" class="teamInitial-m">
						<c:forEach var="team" items="${teamList}">
							<c:choose>
								<c:when test="${team.teamInitial eq teamInitial}">
									<option selected>${team.teamInitial}</option>
								</c:when>
								<c:otherwise>
									<option>${team.teamInitial}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select name="position" class="position-m">
						<c:forEach var="pos" items="${posi}">
							<c:choose>
								<c:when test="${pos eq 'SPT'}">
									<option selected>${pos}</option>
								</c:when>
								<c:otherwise>
									<option>${pos}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="text" name="player" class="player-m" value="${SPT}">
				</c:forEach>
			</div>
			<button type="submit" id="submitModify" class="edtiButton submitButton">확인</button>
			<button type="button" id="cancel" class="edtiButton cancelButton">취소</button>
		</form>
	</div>
	<div id="delete" style="display: none;">
		<form action="playerDelete" method="post" id="playerDelete" name="playerDelete">
			<div class="playerInfomation">
				<span class="lane">TOP</span>
				<input type="hidden" name="position" value="TOP">
				<c:forEach var="TOP" items="${top}">
					<span class="nonSelected">${TOP}</span>
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<span class="lane">JGL</span>
				<c:forEach var="JGL" items="${jgl}">
					<span class="nonSelected">${JGL}</span>
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<span class="lane">MID</span>
				<c:forEach var="MID" items="${mid}">
					<span class="nonSelected">${MID}</span>
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<span class="lane">ADC</span>
				<c:forEach var="ADC" items="${adc}">
					<span class="nonSelected">${ADC}</span>
				</c:forEach>
			</div>
			<div class="playerInfomation">
				<span class="lane">SPT</span>
				<c:forEach var="SPT" items="${spt}">
					<span class="nonSelected">${SPT}</span>
				</c:forEach>
			</div>
			<button type="submit" id="submitDelete" class="edtiButton submitButton">확인</button>
			<button type="button" class="edtiButton cancelButton">취소</button>
		</form>
	</div>
</div>
</body>
</html>