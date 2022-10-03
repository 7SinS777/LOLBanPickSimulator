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
span.teamInitial {
	font-size: xx-large;
	padding: 0 10px;
}
td.teams {
	text-align: center;
	width: 300px;
	height: auto;
}
table#recordTable {
	border-collapse: collapse;
	border-width: 3px 0;
	border-style: solid;
	border-color: gray;
	width: 100%;
}
tr.records {
	text-align: center;
	border-width: 1px 0;
	border-style: solid;
	border-color: gray;
}
div.picks, div.bans {
	padding: 2px 4px;
}
img.bluePickImgs, img.redPickImgs {
	width: 60px;
	height: 60px;
}
img.blueBanImgs, img.redBanImgs {
	width: 40px;
	height: 40px;
	filter: grayscale(1);
}
img.bluePickImgs, img.blueBanImgs {
	transform: skew(5deg);
}
img.redPickImgs, img.redBanImgs {
	transform: skew(-5deg);
}
span.banPickSpan {
	padding: 0 5px;
}
div#recordSearchBar {
	padding: 10px;
	text-align: right;
}
div#searchPatchBar {
	display: inline-block;
}
div#searchTeamBar {
	display: inline-block;
	float: left;
}
select#searchPatch, select#searchTypeRecord {
	text-align: center;
	border: 0;
	background-color: mediumseagreen;
	color: white;
	width: 100px;
	height: 20px;
	border-radius: 8px;
	font-size: small;
}
button#patchSubmit, button#searchTeamSubmit {
	border: 0;
	background-color: mediumseagreen;
	color: white;
	width: 80px;
	height: 20px;
	border-radius: 8px;
	font-size: small;
}
input#searchTeamRecord {
	border: 0;
	border-bottom: 1px solid black;
	width: 160px;
	font-size: small;
	text-align: center;
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
<h1 style="margin: 40px 0;">경기기록</h1>
<div id="recordSearchBar">
	<div id="searchTeamBar">
		<form action="searchTeam" method="post" id="searchTeam" name="searchTeam">
			<select name="searchTypeRecord" id="searchTypeRecord">
				<option value="teamInitial">팀이니셜</option>
				<option value="teamName">팀명</option>
			</select>
			<input type="text" id="searchTeamRecord" name="searchTeamRecord" value="${searchTeamRecord}">
			<button type="submit" id="searchTeamSubmit">검색</button>
		</form>
	</div>
	<div id="searchPatchBar">
		<form action="searchPatchVersion" method="post" id="searchPatchVersion" name="searchPatchVersion">
			<select id="searchPatch" name="searchPatch">
				<option>전체</option>
				<c:forEach var="patchs" items="${patchVersions}">
					<c:choose>
						<c:when test="${searchPatch eq patchs}">
							<option selected>${patchs}</option>
						</c:when>
						<c:otherwise>
							<option>${patchs}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<button type="button" id="patchSubmit">정렬</button>
		</form>
	</div>
</div>
<table id="recordTable">
	<c:forEach var="record" items="${recordList}" varStatus="s">
		<tr class="records" id="${record.matchNo}">
			<td style="width: 20px;">${record.matchNo}</td>
			<td class="teams">
				<c:set var="doneBlue" value="false"/>
				<c:set var="doneRed" value="false"/>
				<c:forEach var="match" items="${matchList}" varStatus="status">
					<c:if test="${match.matchNo eq record.matchNo and match.camp eq 'BLUE' and doneBlue eq false}">
						<sup>${match.matchResult}</sup>
						<span class="teamInitial">${match.teamInitial}</span>
						<c:set var="doneBlue" value="true"/>
						<span class="teamInitial">VS</span>
					</c:if>
					<c:if test="${match.matchNo eq record.matchNo and match.camp eq 'RED' and doneRed eq false}">
						<span class="teamInitial">${match.teamInitial}</span>
						<sup>${match.matchResult}</sup>
						<c:set var="doneRed" value="true"/>
					</c:if>
				</c:forEach>
				<div>
					<span>Patch ${record.patchVersion}</span>
				</div>
			</td>
			<td class="banPicks">
				<div class="picks">
					<img alt="${record.bluePick1}" class="bluePickImgs" src="profile/${record.bluePick1}Profile.png">
					<img alt="${record.bluePick2}" class="bluePickImgs" src="profile/${record.bluePick2}Profile.png">
					<img alt="${record.bluePick3}" class="bluePickImgs" src="profile/${record.bluePick3}Profile.png">&nbsp;
					<img alt="${record.bluePick4}" class="bluePickImgs" src="profile/${record.bluePick4}Profile.png">
					<img alt="${record.bluePick5}" class="bluePickImgs" src="profile/${record.bluePick5}Profile.png">
					<span class="banPickSpan">PICK Phase</span>
					<img alt="${record.redPick5}" class="redPickImgs" src="profile/${record.redPick5}Profile.png">
					<img alt="${record.redPick4}" class="redPickImgs" src="profile/${record.redPick4}Profile.png">&nbsp;
					<img alt="${record.redPick3}" class="redPickImgs" src="profile/${record.redPick3}Profile.png">
					<img alt="${record.redPick2}" class="redPickImgs" src="profile/${record.redPick2}Profile.png">
					<img alt="${record.redPick1}" class="redPickImgs" src="profile/${record.redPick1}Profile.png">
				</div>
				<div class="bans">
					<img alt="${record.blueBan1}" class="blueBanImgs" src="profile/${record.blueBan1}Profile.png">
					<img alt="${record.blueBan2}" class="blueBanImgs" src="profile/${record.blueBan2}Profile.png">
					<img alt="${record.blueBan3}" class="blueBanImgs" src="profile/${record.blueBan3}Profile.png">&nbsp;
					<img alt="${record.blueBan4}" class="blueBanImgs" src="profile/${record.blueBan4}Profile.png">
					<img alt="${record.blueBan5}" class="blueBanImgs" src="profile/${record.blueBan5}Profile.png">
					<span class="banPickSpan">Ban Phase</span>
					<img alt="${record.redBan5}" class="redBanImgs" src="profile/${record.redBan5}Profile.png">
					<img alt="${record.redBan4}" class="redBanImgs" src="profile/${record.redBan4}Profile.png">&nbsp;
					<img alt="${record.redBan3}" class="redBanImgs" src="profile/${record.redBan3}Profile.png">
					<img alt="${record.redBan2}" class="redBanImgs" src="profile/${record.redBan2}Profile.png">
					<img alt="${record.redBan1}" class="redBanImgs" src="profile/${record.redBan1}Profile.png">
				</div>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>