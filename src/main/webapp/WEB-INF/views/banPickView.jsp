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
#banPickBlock {
	position: sticky;
	top : 0%;
}
#championBlcok {
	overflow: auto;
	height: 200px;
	border: 1px solid black;
	padding: 6px;
}
#playerList, #teamCamp, div.bluePick, div.redPick {
	border: 1px solid black;
	border-collapse: collapse;
}
#teamCamp {
	width: 100%;
	height: auto;
	display: inline-block;
	background-color: black;
}
div.camp {
	width: 44%;
	height: auto;
	display: inline-block;
}
#blueCamp {
	background-color: blue;
	float: left;
	text-align: left;
}
#redCamp {
	background-color: red;
	float: right;
	text-align: right;
}
#center {
	display: inline-block;
	width: 12%;
	height: auto;
	margin: auto;
}
span.tSpan {
	display: inline-block;
	font-size: 44px;
	font-weight: bolder;
	color: white;
	width: 100px;
	height: auto;
	margin: 10px;
}
#tBlue {
	margin-left: 40px;
}
#tRed {
	margin-right: 40px;
}
#timer {
	display: inline-block;
	font-size: 40px;
	font-weight: 500;
	color: white;
	width: 100px;
	height: auto;
}
#patch {
	display: inline-block;
	color: white;
	font-weight: 500;
	font-size: 10px;
	height: auto;
}
#playerList, #banList {
	width: 100%;
	height: auto;
	display: inline-block;
	background-color: gray;
}
div.list {
	width: 27%;
	height: auto;
}
#imgBlock {
	width: 60%;
	height: auto;
}
#blueList {
	float: left;
}
#redList {
	float: right;
}
div.bluePick, div.redPick {
	display: inline-block;
	width: 100%;
	height: 100px;
	background-size: cover;
}
div.bluePick {
	text-align: right;
}
div.redPick {
	text-align: left;
	transform: scaleX(-1);
}
#blueList span, #redList span {
	display: block;
	color: white;
	width: 100%;
}
#blueList span {
	text-align: right;
	padding-right: 8px;
	background: linear-gradient(to right, rgba(0,0,0,0) 40%, rgba(0,0,0,1));
}
#redList span {
	text-align: left;
	padding-left: 8px;
	transform: scaleX(-1);
	background: linear-gradient(to left, rgba(0,0,0,0) 40%, rgba(0,0,0,1));
}
span.bluePick, span.redPick {
	height: 60%;
	font-size: 16px;
	font-weight: normal;
}
span.bluePlayer, span.redPlayer {
	height: 40%;
	font-size: 24px;
	font-weight: bolder;
}
button.timerButton {
	width: 120px;
	height: auto;
	text-align: center;
	font-size: 20px;
	border: 0;
	border-radius: 12px;
	color: white;
}
button#gameStart {
	background-color: indianred;
}
button#gameStop {
	background-color: darkslategray;
}
button#selectButton {
	background-color: teal;
}
div.championInfo {
	display: inline-block;
	width: 9.6%;
	height: auto;
	text-align: center;
	margin: 4px 0;
}
div.selected {
	background-color: black;
}
img.championProfile {
	width: 80px;
	height: 80px;
}
span.championName {
	font-size: x-small;
}
.buttonBlock {
	margin: 30px auto;
}
img.ban {
	display: inline-block;
	width: 50px;
	height: 50px;
	margin: 10px 3px;
}
#blueBan, #redBan {
	display: inline-block;
}
#blueBan {
	float: left;
	margin-left: 2px;
	text-align: left;
}
#redBan {
	float: right;
	margin-right: 2px;
	text-align: right;
}
#championSelectBlock {
	margin: 30px 0;
}
div.selecting {
	background-color: gainsboro;
}
body {
	overflow:scroll;
}
#championSwapBlock {
	margin: 6px 0;
}
div.swapBlock {
	display: inline-block;
	width: 49%
}
#blueSwap {
	float: left;
	text-align: center;
}
#redSwap {
	float: right;
	text-align: center;
}
button.blueSwapButton, button.redSwapButton {
	margin: 2px 2px;
	border: 0;
	border-radius: 6px;
	width: 80px;
	height: 36px;
	color: white;
}
button.blueSwapButton {
	background-color: blue;
}
button.redSwapButton {
	background-color: red;
}
button.blueSelect {
	background-color: white;
	color: blue;
}
button.redSelect {
	background-color: white;
	color: red;
}
button.resultButton, button#matchComplete, button#banPickEnd {
	border: 0;
	border-radius: 8px;
	width: 100px;
	height: auto;
	padding: 4px;
	margin: 6px;
	color: white;
	background-color: black;
}
#blueWin.winSelected {
	background-color: blue;
	color: white;
}
#redWin.winSelected {
	background-color: red;
	color: white;
}
#matchComplete, #banPickEnd {
	background-color: fuchsia;
}
</style>
</head>
<body>
<input type="hidden" value="${matchNo}" id="matchNo">
<input type="hidden" value="${patchVersion}" id="patchVersion">
<div id="banPickBlock">
	<div id="teamCamp">
		<div class="camp" id="blueCamp">
			<span class="tSpan" id="tBlue">${blueTeam}</span>
		</div>
		<div id="center">
			<span id="patch">Patch ${patchVersion}</span>
			<span id="timer"></span>
		</div>
		<div class="camp" id="redCamp">
			<span class="tSpan" id="tRed">${redTeam}</span>
		</div>
	</div>
	<div id="playerList">
		<div class="list" id="blueList">
			<c:forEach var="matchList" items="${matchInfo}">
				<c:if test="${matchList.camp eq 'BLUE'}">
					<c:choose>
						<c:when test="${matchList.position eq 'TOP'}">
							<div class="bluePick">
								<span id="bluePick1" class="bluePick"></span>
								<span id="blueTOP" class="bluePlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'JGL'}">
							<div class="bluePick">
								<span id="bluePick2" class="bluePick"></span>
								<span id="blueJGL" class="bluePlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'MID'}">
							<div class="bluePick">
								<span id="bluePick3" class="bluePick"></span>
								<span id="blueMID" class="bluePlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'ADC'}">
							<div class="bluePick">
								<span id="bluePick4" class="bluePick"></span>
								<span id="blueADC" class="bluePlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'SPT'}">
							<div class="bluePick">
								<span id="bluePick5" class="bluePick"></span>
								<span id="blueSPT" class="bluePlayer">${matchList.nickName}</span>
							</div>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>
		</div>
		<div class="imgBlock" id="imgBlock">
			
		</div>
		<div class="list" id="redList">
			<c:forEach var="matchList" items="${matchInfo}">
				<c:if test="${matchList.camp eq 'RED'}">
					<c:choose>
						<c:when test="${matchList.position eq 'TOP'}">
							<div class="redPick">
								<span id="redPick1" class="redPick"></span>
								<span id="redTOP" class="redPlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'JGL'}">
							<div class="redPick">
								<span id="redPick2" class="redPick"></span>
								<span id="redJGL" class="redPlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'MID'}">
							<div class="redPick">
								<span id="redPick3" class="redPick"></span>
								<span id="redMID" class="redPlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'ADC'}">
							<div class="redPick">
								<span id="redPick4" class="redPick"></span>
								<span id="redADC" class="redPlayer">${matchList.nickName}</span>
							</div>
						</c:when>
						<c:when test="${matchList.position eq 'SPT'}">
							<div class="redPick">
								<span id="redPick5" class="redPick"></span>
								<span id="redSPT" class="redPlayer">${matchList.nickName}</span>
							</div>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>
		</div>
		<div id="banList">
			<div id="blueBan">
				<c:set var="nos" value="<%= new int[] {1,2,3,4,5} %>" />
				<c:forEach var="no" items="${nos}">
					<img src="default/black.png" class="ban" id="blueBan${no}">
				</c:forEach>
			</div>
			<div id="redBan">
				<c:set var="nos" value="<%= new int[] {5,4,3,2,1} %>" />
				<c:forEach var="no" items="${nos}">
					<img src="default/black.png" class="ban" id="redBan${no}">
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div id="championSelectBlock" style="display: none;">
	<div id="championBlcok">
		<div class="championInfo nonSelected" id="NonChampion">
			<img src="profile/NonChampionProfile.png" class="championProfile">
			<br><span class="championName">없음</span>
		</div>
		<c:forEach var="championList" items="${champions}" varStatus="kr">
			<c:forEach var="championEngList" items="${championsEng}" varStatus="eng">
				<c:if test="${kr.index eq eng.index}">
					<div class="championInfo nonSelected" id="${championEngList}">
						<img src="profile/${championEngList}Profile.png" class="championProfile">
						<br><span class="championName">${championList}</span>
					</div>
				</c:if>
			</c:forEach>
		</c:forEach>
	</div>
	<div class="buttonBlock">
		<button type="button" id="selectButton" class="timerButton">선택</button>
	</div>
</div>
<div id="championSwapBlock" style="display: none;">
	<div id="blueSwap" class="swapBlock">
		<button type="button" id="bluePick1" class="blueSwapButton">블루1픽</button>
		<button type="button" id="bluePick2" class="blueSwapButton">블루2픽</button>
		<button type="button" id="bluePick3" class="blueSwapButton">블루3픽</button>
		<button type="button" id="bluePick4" class="blueSwapButton">블루4픽</button>
		<button type="button" id="bluePick5" class="blueSwapButton">블루5픽</button>
	</div>
	<div id="redSwap" class="swapBlock">
		<button type="button" id="redPick1" class="redSwapButton">레드1픽</button>
		<button type="button" id="redPick2" class="redSwapButton">레드2픽</button>
		<button type="button" id="redPick3" class="redSwapButton">레드3픽</button>
		<button type="button" id="redPick4" class="redSwapButton">레드4픽</button>
		<button type="button" id="redPick5" class="redSwapButton">레드5픽</button>
	</div>
	<div>
		<button type="button" id="banPickEnd">완료</button>
	</div>
</div>
<div id="matchResult" style="display: none;">
	<button type="button" id="blueWin" class="resultButton">블루 승</button>
	<button type="button" id="redWin" class="resultButton">레드 승</button>
	<div>
		<button type="button" id="matchComplete">완료</button>
	</div>
</div>

<div class="buttonBlock">
	<button type="button" id="gameStart" class="timerButton">시작</button>
	<button type="button" id="gameStop" class="timerButton" style="display: none;">정지</button>
</div>
</body>
</html>