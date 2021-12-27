function signupcheck() {

		// 1. 폼 가져오기 [ 폼에 id 존재 ]	//	document.getElementById("signupform")
		// 2. 폼내 아이디 입력 input 가져오기
		var signId = document.getElementById("signupform").signId.value;
		var signPassword = document.getElementById("signupform").signPassword.value;
		var signPasswordConfirm = document.getElementById("signupform").signPasswordConfirm.value;
		var signName = document.getElementById("signupform").signName.value;
		var signPhone = document.getElementById("signupform").signPhone.value;
		var genderCheck1 = document.getElementById("signupform").genderCheck1.checked;	// checked 유무 가져오기 
		var genderCheck2 = document.getElementById("signUpForm").genderCheck2.checked;
		var signPic = document.getElementById("signUpForm").signPic.checked;
		var signNickname = document.getElementById("signUpForm").signNickname.value;
		var signInfo = document.getElementById("signUpForm").signInfo.value;

		// 3. 유효성검사 [ 정규표현식 : 텍스트 패턴 검사 ] 
		var idj = /^[a-z0-9]{5,10}$/;		// 아이디 정규표현식	[ 소문자 숫자 5~10]
		var pwj = /^[A-Za-z0-9]{5,16}$/;	// 비밀번호 정규표현식[ 대,소문자 숫자 5~16]
		var phonej = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // 연락처
		var namej = /^[A-Za-z0-9가-힣]{1,}$/;	// 이름 정규표현식

		// 아이디 
		if (!idj.test(signId)) {
			document.getElementById("idHelp").innerHTML = "아이디는 소문자와 숫자 조합 5~10 사이만 가능 합니다";
			document.getElementById("idHelp").style.color = "red";
			return false;// form submit 불가
		} else {
			document.getElementById("idHelp").innerHTML = "사용가능한 아이디 입니다."
			document.getElementById("idHelp").style.color = "green";
		}

		// 패스워드 [ 두 패스워드 동일한지 검사 ]

		if (!pwj.test(signPassword) || !pwj.test(passwordconfirm)) {
			document.getElementById("passwordHelp").innerHTML = "대소문자 조합 5~16 사이만 가능합니다."; return false;
		} else if (password != passwordconfirm) {
			document.getElementById("passwordHelp").innerHTML = "패스워드가 동일하지 않습니다."; return false;
		} else {
			document.getElementById("passwordHelp").innerHTML = "사용가능한 패스워드 입니다.";
		}
		// 이름
		if (!namej.test(signName)) {
			document.getElementById("nameHelp").innerHTML = "이름을 입력해주세요.[특수문자는 제외]"; return false;
		} else {
			document.getElementById("nameHelp").innerHTML = "";
		}
		// 전화번호 
		if (!phonej.test(signPhone)) {
			document.getElementById("phoneHelp").innerHTML = "전화번호 형식으로 입력해주세요."; return false;
		} else {
			document.getElementById("phoneHelp").innerHTML = "";
		}
		// 성별
		if (!genderCheck1 && !genderCheck2) {  // 둘다 false 이면 // 둘다 체크를 안했으면
			document.getElementById("genderHelp").innerHTML = "성별을 선택해주세요"; return false;
		} else {
			document.getElementById("genderHelp").innerHTML = "";
		}
		//파일유무
		if (signNickname == "") {
			document.getElementById("fileHelp").innerHTML = "파일을 업로드해주세요";
			document.getElementById("fileHelp").style.color = "red";
			return false;
		} else {
			document.getElementById("fileHelp").innerHTML = "";
		}


		//홈페이지 별병
		if (signNickname == "") {
			document.getElementById("nicknameHelp").innerHTML = "별명을 입력해주세요";
			document.getElementById("nicknameHelp").style.color = "red";
			return false;
		} else {
			document.getElementById("nicknameHelp").innerHTML = "";
		}

		//홈페이지 소개글
		if (signInfo == "") {
			document.getElementById("infoHelp").innerHTML = "소개글을 입력해주세요";
			document.getElementById("infoHelp").style.color = "red";
			return false;

		} else {
			document.getElementById("infoHelp").innerHTML = "";
		}

	}