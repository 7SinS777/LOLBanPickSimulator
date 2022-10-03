/**
 * 
 */
$(document).on("click", "#goModify", function() {
	$("#basic").attr("style", "display: none;");
	$("#modify").attr("style", "display: block;");
});
$(document).on("click", "#goDelete", function() {
	$("#basic").attr("style", "display: none;");
	$("#delete").attr("style", "display: block;");
});
$(document).on("click", "button.cancelButton", function() {
	$("#basic").attr("style", "display: block;");
	$("#modify").attr("style", "display: none;");
	$("#delete").attr("style", "display: none;");
});
$(document).on("click", "#submitModify", function() {
	let player = $("input.player-m");
	for(let i=0; i<player.length; i++) {
		if(player.eq(i).val() == "") {
			alert("플레이어의 닉네임을 적어주세요.");
			return false;
		}
		if(player.eq(i).val().length < 2 || player.eq(i).val().length > 20) {
			alert("플레이어의 닉네임을 2자~20자 사이로 적어주세요.");
			return false;
		}
		for(let j=i+1; j<player.length; j++) {
			if(player.eq(i).val() == player.eq(j).val()) {
				alert("같은 닉네임을 중복해서 등록할 수 없습니다.");
				return false;
			}
		}
	}
});
$(document).on("submit", "#playerModify", function(event) {
	event.preventDefault();
	$.ajax({
		url : $("#playerModify").attr("action"),
		type : $("#playerModify").attr("method"),
		data : $("#playerModify").serialize(),
		success : function(data) {
			if(data.search("modify-success") > -1) {
				alert("선수정보를 수정하였습니다.");
				$("#teamInfoView").trigger("click");
			} else if(data.search("modify-failed no change") > -1) {
				alert("수정된 내용이 없습니다.");
			} else if(data.search("modify-failed same nickName") > -1) {
				alert("중복된 닉네임을 선수가 이미 등록되어 있습니다.");
			} else {
				alert("선수정보를 수정하지 못했습니다.");
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});
$(document).on("click", "span.nonSelected", function() {
	$(this).attr("class", "selected");
});
$(document).on("click", "span.selected", function() {
	$(this).attr("class", "nonSelected");
});

$(document).on("click", "#submitDelete", function() {
	let selected = $("span.selected").length;
	if(selected == 0) {
		alert("삭제할 선수가 없습니다.");
		return false;
	}
	return true;
});
$(document).on("submit", "#playerDelete", function(event) {
	let player = new Array();
	let selected = $("span.selected");
	for(let i=0; i<selected.length; i++) {
		player.push(selected.eq(i).text());
	}
	let formData = {
		player : player
	};
	event.preventDefault();
	$.ajax({
		url : $("#playerDelete").attr("action"),
		type : $("#playerDelete").attr("method"),
		data : formData,
		success : function(data) {
			if(data.search("delete-success") > -1) {
				alert("선수를 삭제하였습니다.");
				$("#teamInfoView").trigger("click");
			} else {
				alert("선수를 삭제하지 못했습니다.");
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});