/**
 * 
 */
$(document).on("click", "#add", function() {
	let labelGroup = $("div.label-group").html();
	let label = $("div.label-group").length;
	if(label >= 10) {
		alert("한 번에 최대 10명까지 등록할 수 있습니다.");
		return false;
	}
	let divLabel = '<div class="label-group">'+labelGroup+'</div>';
	$("#teamPlayerBlock").append(divLabel);
});
$(document).on("click", "button.delete", function(event) {
	let label = $("div.label-group").length;
	if(label == 1) {
		alert("등록은 최소 1명부터 등록할 수 있습니다.");
		return false;
	}
	$(event.target).parent().remove();
});
$(document).on("click", "#register", function() {
	let teamInitial = $("select.teamInitial");
	let position = $("select.position");
	let player = $("input.player");
	for(let i=0; i<teamInitial.length; i++) {
		if(teamInitial.eq(i).val() == "" || teamInitial.eq(i).val() == "소속팀") {
			alert("소속팀을 골라주세요.");
			return false;
		}
	}
	for(let i=0; i<position.length; i++) {
		if(position.eq(i).val() == "" || position.eq(i).val() == "포지션") {
			alert("포지션을 골라주세요.");
			return false;
		}
	}
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
	return true;
});
$(document).on("submit", "#playerRegister", function(event) {
	event.preventDefault();
	$.ajax({
		url : $("#playerRegister").attr("action"),
		type : $("#playerRegister").attr("method"),
		data : $("#playerRegister").serialize(),
		success : function(data) {
			if(data.search("register-success") > -1) {
				alert("선수를 등록하였습니다.");
				$("#menuView").trigger("click");
			} else if(data.search("register-failed same nickName") > -1) {
				alert("중복된 닉네임을 선수가 이미 등록되어 있습니다.");
			} else {
				alert("선수를 등록하지 못했습니다.");
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
});