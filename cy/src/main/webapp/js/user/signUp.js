/*
	1. 아이디 중복 체크
	2. 유효성 검사
	3. 
	

*/

/*$(function() {

	$("#signId").change(function() {
		$.ajax({
			url: '../../controller/user/idCheck.jsp',
			data: { userId: document.getElementById('signUpForm').signId.value },
			success: function(result) {
				if (result == 1) {
					// 입력한 아이디가 중복이 아닌경우 
					document.getElementById('idHelp').innerHTML = '사용가능한 아이디입니다. ';
					document.getElementById('idHelp').style.color = 'green';
				} else {
					document.getElementById('idHelp').innerHTML = '현재 사용중인 아이디입니다. ';
					document.getElementById('idHelp').style.color = 'red';
				}
			}


		});

	});


});*/