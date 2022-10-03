/**
 * 
 */
$(document).on("click", "tr.team", function(event) {
	let teamInitial = $(this).find("td.initial").attr("id");
	let teamName = $(this).find("td.name").attr("id");
	event.preventDefault();
	$.ajax({
		url : "playerInfo",
		type : "get",
		data : {
			teamName : teamName,
			teamInitial : teamInitial
		},
		success : function(data) {
			$("#playerInfoView").html(data);
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});
$(document).on("submit", "#searchTeamInfoView", function(event) {
	event.preventDefault();
	$.ajax({
		url : $("#searchTeamInfoView").attr("action"),
		type : $("#searchTeamInfoView").attr("method"),
		data : $("#searchTeamInfoView").serialize(),
		success : function(data) {
			$("#mainScreen").html(data);
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});