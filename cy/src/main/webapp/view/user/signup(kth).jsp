<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
	<%@ include file="../common/header(kth).jsp"%>
	<!-- 회원가입 페이지 -->
	<div id="signup" class=wrap>
		<div class="container">
			<div class="row col-12 d-flex flex-column">
				<ul class="d-flex my-2">
					<li class="mx-3 "><a href="../common/home.jsp">홈</a></li>
					<li class="mx-3 active" style="border-bottom: solid 1px #000;"><a href="./signup(kth).jsp">회원가입</a></li>
				</ul>
				<h1 class="my-2" style="font-size: 30px;">회원가입</h1>
				<div class="row login col-12 border">
					<div class="title text-center" style="width: 100%;">
						<p class="my-2 h3">싸이월드에 오신 것을 환영합니다</p>
						<p class="my-2 h5">
							<span class="mr-2" style="font-weight: bold;">지금 회원가입하신 후</span>
							<span class="text-warning">싸이월드의 다양한 서비스를</span>
							만나보세요
						</p>
					</div>
					<div class="h5">기본정보입력</div>
					<form id="signupform" action="../../controller/user/signUpController.jsp" class="signform col-12 border border-dark pt-2 pb-2 rounded d-flex flex-column justify-content-center" action="" method="post" enctype="multipart/form-data" onsubmit="return signupcheck()" style="width: 80%">
						<div class="form-group">
							<label for="signId">아이디</label>
							<span id="idresult" style="font-size: 12px;"></span>
							<input onchange="signupcheck();" type="text" class="form-control" id="signId" name="signId" placeholder="아이디는 5~16글자 가능." />
						</div>
						<div class="form-group">
							<label for="signPassword">비밀번호</label>
							<input onchange="signupcheck();" type="password" class="form-control" id="signPassword" name="signPassword" placeholder="영문 및 숫자 포함, 5~16글자 가능." style="font-family: '나눔';" />
						</div>
						<div class="form-group">
							<label for="signPasswordConfirm">비밀번호 확인</label>
							<span id="pwresult" style="font-size: 12px;"></span>
							<input onchange="signupcheck();" type="password" class="form-control" id="signPasswordConfirm" name="signPasswordConfirm" style="font-family: '나눔';" />
						</div>
						<div class="form-group">
							<label for="signName">이름</label>
							<span id="nameresult" style="font-size: 12px;"></span>
							<input type="text" class="form-control" id="signName" name="signName" placeholder="특수문자 제외 및 최대 10글자." />
						</div>
						<div class="form-group">
							<label for="signPhone">핸드폰번호</label>
							<span id="phoneresult" style="font-size: 12px;"></span>
							<input onchange="signupcheck();" type="text" class="form-control" id="signPhone" name="signPhone" placeholder="핸드폰 번호(000-0000-0000 형식)를 입력하세요. " />
						</div>
						<div class="form-group">
							<label for="signEmail">이메일주소</label>
							<div class="input-group-append d-flex" style="width: 100%">
								<input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="유효한 이메일주소" onchange="signupcheck();" />
								<span class="input-group-text" id="basic-addon2">@</span>
								<select class="custom-select" name="postAddress" id="postAddress">
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="kakao.net">kakao.net</option>
									<option value="nate.com">nate.com</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input onchange="signupcheck();" class="form-check-input" type="radio" name="genderCheck" id="genderCheck1" value="M" />
								<label for="genderCheck1">남성</label>
							</div>
							<div class="form-check form-check-inline">
								<input onchange="signupcheck();" class="form-check-input" type="radio" name="genderCheck" id="genderCheck2" value="F" />
								<label for="genderCheck1">여성</label>
							</div>
							<small id="genderHelp" class="form-text text-muted">성별을 선택해주세요.</small>
							<span id="sexresult" style="font-size: 12px;"></span>
						</div>
						<div class="form-group d-flex">
							<div class="col-7">
								<div class="form-group">
									<label for="signPic">프로필 사진</label>
									<input onchange="signupcheck();" class="border border-lightgrey" type="file" class="custom-file" id="signPic" name="signPic">
									<small id="fileHelp" class="form-text text-muted">이미지 파일을 업로드해주세요.</small>
								</div>
							</div>
							<div class="col-5">
								<div class="imageContainer" style="border: 1px dotted lightgrey; height: 100%;">
									<img src="" alt="" style="max-width: 100%;" id="previewImage" />
								</div>
							</div>
						</div>
						<div class="form-group d-flex align-content-center" style="height: auto">
							<div class="col-6">
								<label for="signBirth" class="align-self-center">생년월일</label>
								<span id="birthresult" style="font-size: 12px;"></span>
								<p class="align-self-center mx-2">
									<input class="form-control" onchange="signupcheck();" id="signBirth" type="date" name="signBirth" style="font-family: '나눔';">
								</p>
							</div>
							<div class="col-6">
								<label for="age" class="align-self-center">나이</label>
								<select name="signAge" id="signAge" class="custom-select d-inline-block">
									<%
									for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>">
										<%=i%></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="">홈페이지 별명</label>
							<input onchange="signupcheck();" type="text" class="form-control" id="signNickname" name="signNickname" placeholder="홈페이지에 멋진 별명을 붙여주세요" />
						</div>
						<div class="form-group">
							<label for="">홈페이지 소개글</label>
							<input onchange="signupcheck();" type="text" class="form-control" id="signInfo" name="signInfo" placeholder="간단한 홈페이지 소개를 적어주시면 어떨까요?" />
						</div>
					</form>
				</div>
				<div class="row d-flex justify-content-center align-items-center my-3">
					<input type="submit" value="가입 하기 >" class="btn btn-warning">
					<a href="./login(kth).jsp">
						<button class="mx-2 btn btn-warning" type="button">돌아가기</button>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 업로드 -->
	<script type="text/javascript">
        var imagePreview = document.getElementById('imageContainer');

        function readImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    const previewImage = document.getElementById('previewImage');
                    previewImage.src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        document.getElementById('signPic').addEventListener('change', (e) => {
            readImage(e.target);
        });
    </script>
	<!-- 액티브 -->
	<script>
        const li = document.querySelector('.active');
        const li2 = document.querySelector('.active2');
        li.style.color = 'orange';
        li2.style.color = 'orange';
    </script>
	<!-- 유효성검사 -->
	<script type="text/javascript">
    function signupcheck(){
    	
		// 1. 폼 가져오기 [ 폼에 id 존재 ]	//	document.getElementById("signupform")
		// 2. 폼내 아이디 입력 input 가져오기
		var signId = document.getElementById("signupform").id.value;
		var signPassword = document.getElementById("signupform").password.value;
		var signPasswordConfirm = document.getElementById("signupform").passwordconfirm.value;
		var name = document.getElementById("signupform").name.value;
		var phone = document.getElementById("signupform").phone.value;
		var birth = document.getElementById("signupform").birth.value;
		var genderCheck1 = document.getElementById("signupform").genderCheck1.checked;	// checked 유무 가져오기 
		var genderCheck2 = document.getElementById("signupform").genderCheck2.checked;

		// 3. 유효성검사 [ 정규표현식 : 텍스트 패턴 검사 ] 
		var idj = /^[a-z0-9]{5,16}$/;		// 아이디 정규표현식	[ 소문자 숫자 5~15]
		var pwj = /^[A-Za-z0-9]{5,16}$/;	// 비밀번호 정규표현식[ 대,소문자 숫자 5~16]
		var phonej = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // 연락처
		var namej = /^[A-Za-z0-9가-힣]{1,}$/;	// 이름 정규표현식
		
		// 아이디 
		if( !idj.test( signId ) ){
			document.getElementById("idresult").innerHTML="아이디는 소문자와 숫자 조합 5~16 사이만 가능 합니다";
			document.getElementById("idresult").style.color = "red";
			return false;// form submit 불가
		}else{
			document.getElementById("idresult").innerHTML="사용가능한 아이디 입니다."
			document.getElementById("idresult").style.color = "green";
		}
		
		// 패스워드 [ 두 패스워드 동일한지 검사 ]
		
		if( !pwj.test(signPassword) || !pwj.test(passwordconfirm) ){
			document.getElementById("pwresult").innerHTML="대소문자 조합 5~16 사이만 가능합니다."; return false;
		}else if( password != passwordconfirm){
			document.getElementById("pwresult").innerHTML="패스워드가 동일하지 않습니다.";	return false;
		}else{
			document.getElementById("pwresult").innerHTML="사용가능한 패스워드 입니다.";
		}
		// 이름
		if( !namej.test(name) ){
			document.getElementById("nameresult").innerHTML="이름을 입력해주세요.[특수문자는 제외]"; return false;
		}else{
			document.getElementById("nameresult").innerHTML="";
		}
		//생년월일
		if( birth == ""){
			document.getElementById("birthresult").innerHTML="생년월일 선택해주세요"; return false;
		}else{
			document.getElementById("birthresult").innerHTML="";
		}
		// 성별
		if( !sex1 && !sex2 ){  // 둘다 false 이면 // 둘다 체크를 안했으면
			document.getElementById("sexresult").innerHTML="성별을 선택해주세요"; return false;
		}else{
			document.getElementById("sexresult").innerHTML="";
		}
		// 전화번호 
		if( !phonej.test( phone ) ){
			document.getElementById("phoneresult").innerHTML="전화번호 형식으로 입력해주세요."; return false;
		}else{
			document.getElementById("phoneresult").innerHTML="";
		}
	}
    </script>
</body>
</html>