/**
 * 
 */
$(document).on("change", "select.teamSelect", function(event) {
	let select = $(this);
	let teamInitial = select.val();
	if(select.attr("id") == "blue") {
		if(select.val() == $("#red").val()) {
			alert("같은 팀을 상대로 설정할 수 없습니다.");
			select.val("블루팀");
			$("#blueList").html("");
			return false;
		}
		event.preventDefault();
		$.ajax({
			url : "playerList?camp=blue",
			type : "post",
			data : {
				teamInitial : teamInitial
			},
			success : function(data) {
				$("#blueList").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	} else if(select.attr("id") == "red") {
		if(select.val() == $("#blue").val()) {
			alert("같은 팀을 상대로 설정할 수 없습니다.");
			select.val("레드팀");
			$("#redList").html("");
			return false;
		}
		event.preventDefault();
		$.ajax({
			url : "playerList?camp=red",
			type : "post",
			data : {
				teamInitial : teamInitial
			},
			success : function(data) {
				$("#redList").html(data);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	}
});
$(document).on("click", "#submitButton", function() {
	let blue = $("#blue");
	let red = $("#red");
	let patchVersion = $("#patchVersion");
	if(blue.val() == "" || blue.val() == "블루팀" || blue.val() == null) {
		alert("블루팀을 선택해 주세요.");
		return false;
	}
	if(red.val() == "" || red.val() == "레드팀" || red.val() == null) {
		alert("레드팀을 선택해 주세요.");
		return false;
	}
	if(patchVersion.val() == "" || patchVersion.val() == null) {
		alert("패치 버전을 작성해 주세요.");
		return false;
	}
	return true;
});
$(document).on("submit", "#banPickView", function(event) {
	let blueTOP = $("[name='blueTOP']").val();
	event.preventDefault();
	$.ajax({
		url : $("#banPickView").attr("action"),
		type : $("#banPickView").attr("method"),
		data : $("#banPickView").serialize(),
		success : function(data) {
			$("#mainScreen").html(data);
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});