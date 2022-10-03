/**
 * 
 */
let turnStack;
let clock;
let x;
let turn = [
	'blueBan1', 'redBan1', 'blueBan2', 'redBan2', 'blueBan3', 'redBan3',
	'bluePick1', 'redPick1', 'redPick2', 'bluePick2', 'bluePick3', 'redPick3',
	'redBan4', 'blueBan4', 'redBan5', 'blueBan5',
	'redPick4', 'bluePick4', 'bluePick5', 'redPick5'
]
let selectChampion = [];

$(document).on("click", "#gameStart", function() {
	clock = 27;
	$("#gameStart").css("display", "none");
	$("#gameStop").css("display", "inline-block");
	$("#championSelectBlock").css("display", "block");
	$("#timer").html(clock);
	startTimer(clock);
	
	selectChampion = [];
	turnStack = 0;
	let turning = turn[turnStack];
	$("span.bluePick").removeClass("turning");
	$("span.redPick").removeClass("turning");
	$("img.ban").removeClass("turning");
	$("#"+turning).addClass("turning");
});
$(document).on("click", "#gameStop", function() {
	$("#gameStop").css("display", "none");
	$("#championSelectBlock").css("display", "none");
	$("#championSwapBlock").css("display", "none");
	$("#gameStart").css("display", "inline-block");
	$("#timer").html("");
	stopTimer();
	
	$("div.championInfo").removeClass("selecting");
	$("div.championInfo").removeClass("selected");
	$("div.championInfo").addClass("nonSelected");
	
	$("div.bluePick").css("background-image", "none");
	$("div.redPick").css("background-image", "none");
	$("img.ban").attr("src", "default/black.png");
	$("span.bluePick").removeClass("turning");
	$("span.redPick").removeClass("turning");
	$("span.bluePick").text("");
	$("span.redPick").text("");
	$("img.ban").removeClass("turning");
});
function startTimer(clock) {
	x = setInterval(function() {
		sec = parseInt(clock)-1;
		if(sec < 0) {
			$("#timer").html(0);
		} else {
			$("#timer").html(sec);
		}
		clock = sec;
		if(clock < -3) {
			alert("중지되었습니다.");
			$("#gameStop").trigger("click");
		}
	}, 1000);
}
function stopTimer() {
	clearInterval(x);
}
function startTimerLast(clock) {
	x = setInterval(function() {
		sec = parseInt(clock)-1;
		if(sec < 0) {
			$("#timer").html(0);
		} else {
			$("#timer").html(sec);
		}
		clock = sec;
		if(clock < 0) {
			
			$("#banPickEnd").trigger("click");
		}
	}, 1000);
}
$(document).on("click", "div.nonSelected", function() {
	let champion = $(this);
	$("div.selecting").addClass("nonSelected");
	$("div.selecting").removeClass("selecting");
	champion.addClass("selecting");
	champion.removeClass("nonSelected");
	if((turnStack >= 6 && turnStack <= 11) || (turnStack >= 16 && turnStack <= 19)) {
		let turning = turn[turnStack];
		let champions = champion.attr("id");
		let result = "url('champions/"+champions+".png')";
		$(".turning").parent().css("background-image", result);
		$("#"+turning).text(champions);
	}
});
$(document).on("click", "button#selectButton", function() {
	console.log($("div.selecting").length);
	if($("div.selecting").length == 0) {
		alert("챔피언 선택이 되지 않았습니다.");
		return false;
	}
	stopTimer();
	let champion = $("div.selecting").attr("id");
	selectChampion[turnStack] = champion;
	if((turnStack >= 6 && turnStack <= 11) || (turnStack >= 16 && turnStack <= 19)) {
		
	} else {
		$(".turning").attr("src", "profile/"+champion+"Profile.png");
	}
	$("div.selecting").addClass("selected");
	$("div.selecting").removeClass("nonSelected");
	$("div.selecting").removeClass("selecting");
	turnStack++;
	let turning = turn[turnStack];
	$("span.bluePick").removeClass("turning");
	$("span.redPick").removeClass("turning");
	$("img.ban").removeClass("turning");
	$("#"+turning).addClass("turning");
	if(turnStack < 20) {
		clock = 27;
		$("#timer").html(clock);
		startTimer(clock);
	} else if(turnStack == 20) {
		$("#championSwapBlock").css("display", "block");
		$("#championSelectBlock").css("display", "none");
		clock = 60;
		$("#timer").html(clock);
		startTimerLast(clock);
	}
});
$(document).on("click", ".blueSwapButton", function() {
	let select = $(this);
	if(select.attr("class").match("blueSelect")) {
		select.removeClass("blueSelect");
	} else {
		select.addClass("blueSelect");
	}
	let count = $(".blueSelect");
	if(count.length == 2) {
		let count1 = $("span#"+count.eq(0).attr("id"));
		let count2 = $("span#"+count.eq(1).attr("id"));
		let count3 = count1.text();
		count1.text(count2.text());
		count1.parent().css("background-image", "url('champions/"+count2.text()+".png')");
		count2.text(count3);
		count2.parent().css("background-image", "url('champions/"+count3+".png')");
		count.removeClass("blueSelect");
	}
});
$(document).on("click", ".redSwapButton", function() {
	let select = $(this);
	if(select.attr("class").match("redSelect")) {
		select.removeClass("redSelect");
	} else {
		select.addClass("redSelect");
	}
	let count = $(".redSelect");
	if(count.length == 2) {
		let count1 = $("span#"+count.eq(0).attr("id"));
		let count2 = $("span#"+count.eq(1).attr("id"));
		let count3 = count1.text();
		count1.text(count2.text());
		count1.parent().css("background-image", "url('champions/"+count2.text()+".png')");
		count2.text(count3);
		count2.parent().css("background-image", "url('champions/"+count3+".png')");
		count.removeClass("redSelect");
	}
});
$(document).on("click", "#banPickEnd", function() {
	stopTimer();
	$("#matchResult").css("display", "block");
	$("#championSwapBlock").css("display", "none");
});
$(document).on("click", ".resultButton", function() {
	let button = $(this);
	$(".resultButton").removeClass("winSelected");
	button.addClass("winSelected");
});
$(document).on("click", "#matchComplete", function(event) {
	let matchNo = $("#matchNo").text();
	let patchVersion = $("#patchVersion").val();
	let blueTeam = $("#tBlue").text();
	let redTeam = $("#tRed").text();
	let bluePick1 = $("#bluePick1").text();
	let bluePick2 = $("#bluePick2").text();
	let bluePick3 = $("#bluePick3").text();
	let bluePick4 = $("#bluePick4").text();
	let bluePick5 = $("#bluePick5").text();
	let redPick1 = $("#redPick1").text();
	let redPick2 = $("#redPick2").text();
	let redPick3 = $("#redPick3").text();
	let redPick4 = $("#redPick4").text();
	let redPick5 = $("#redPick5").text();
	let blueTOP = $("#blueTOP").text();
	let blueJGL = $("#blueJGL").text();
	let blueMID = $("#blueMID").text();
	let blueADC = $("#blueADC").text();
	let blueSPT = $("#blueSPT").text();
	let redTOP = $("#redTOP").text();
	let redJGL = $("#redJGL").text();
	let redMID = $("#redMID").text();
	let redADC = $("#redADC").text();
	let redSPT = $("#redSPT").text();
	let winResult = $(".winSelected").attr("id");
	if(winResult == null) {
		alert("승리팀을 선택해주세요.");
		return false;
	}
	let formData = {
			matchNo : matchNo,
			patchVersion : patchVersion,
			blueTeam : blueTeam,
			redTeam : redTeam,
			selectChampion : selectChampion,
			bluePick1 : bluePick1,
			bluePick2 : bluePick2,
			bluePick3 : bluePick3,
			bluePick4 : bluePick4,
			bluePick5 : bluePick5,
			redPick1 : redPick1,
			redPick2 : redPick2,
			redPick3 : redPick3,
			redPick4 : redPick4,
			redPick5 : redPick5,
			blueTOP : blueTOP,
			blueJGL : blueJGL,
			blueMID : blueMID,
			blueADC : blueADC,
			blueSPT : blueSPT,
			redTOP : redTOP,
			redJGL : redJGL,
			redMID : redMID,
			redADC : redADC,
			redSPT : redSPT,
			winResult : winResult
	};
	event.preventDefault();
	$.ajax({
		async : false,
		url : "matchComplete",
		type : "post",
		data : formData,
		success : function(data) {
			alert("경기가 등록되었습니다.");
			$("#mainScreen").html(data);
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});