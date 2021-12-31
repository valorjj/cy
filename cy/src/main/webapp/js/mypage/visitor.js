function update(no, write, date) {

	document.getElementById("no").innerHTML = no;
	document.getElementById("writer").innerHTML = write;
	document.getElementById("date").innerHTML = date;
}

function test() {

	var no = document.getElementById("no").innerHTML;
	var writer = document.getElementById("writer").innerHTML;
	var date = document.getElementById("date").innerHTML;
	var content = document.getElementById("content").value;

	$(function() {
		$.ajax({
			url: "/cy/controller/mypage/visitor/updateLogController.jsp",
			data: { content: content, no: no },
			success: function(result) {

				if (result == 1) {
					alert("수정완료");
					// location.href = "/cy/view/mypage/visitor/viewLogList.jsp?userNumber=" + no;
					location.reload();
				} else {
					alert("수정실패");
				}
			}
		});
	});
}