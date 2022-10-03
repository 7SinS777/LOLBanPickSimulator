/**
 * 
 */
$(document).on("click", "#submitBtn", function() {
	if($("#teamName").val().length == 0) {
		alert("팀명을 적어주세요.");
		return false;
	}
	if($("#teamName").val().length < 2 || $("#teamName").val().length > 20) {
		alert("팀명을 2자~20자 사이로 적어주세요.");
		return false;
	}
	if($("#teamInitial").val().length == 0) {
		alert("팀이니셜을 적어주세요");
		return false;
	}
	if($("#teamInitial").val().length < 2 || $("#teamInitial").val().length > 3) {
		alert("팀이니셜을 2자~3자 사이로 적어주세요.");
		return false;
	}
	return true;
});
$(document).on("submit", "#teamRegister", function(event) {
	event.preventDefault();
	$.ajax({
		url : $("#teamRegister").attr("action"),
		type : $("#teamRegister").attr("method"),
		data : $("#teamRegister").serialize(),
		success : function(data) {
			if(data.search("register-success") > -1) {
				alert("등록이 완료되었습니다.");
				$("#menuView").trigger("click");
			} else if(data.search("register-failed because teamName is same") > -1) {
				alert("같은 이름의 팀명이 존재합니다.");
			} else {
				alert("같은 이름의 팀이니셜이 존재합니다.");
			}
		},
	});
});