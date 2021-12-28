<%@page import="dto.LogInSession"%>
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
	<%
	// 로그인[세션]이 되어 있는경우
	if (logInId != null) {
		out.print("<script>alert('로그인이 되어있습니다.');</script>");
		out.println("<script>location.href='../main(kth).jsp';</script>");
	}
	%>
	<!-- 회원가입 페이지 -->
	<div id="signup" class=wrap>
		<div class="container">
			<div class="row col-12 d-flex flex-column">
				<ul class="d-flex my-2">
					<li class="mx-3 "><a href="../common/home.jsp">홈</a></li>
					<li class="mx-3 active" style="border-bottom: solid 1px #000;"><a href="./signUp.jsp">회원가입</a></li>
				</ul>
				<h1 class="my-2" style="font-size: 30px;">회원가입</h1>
				<div class="row login col-8 border" style="display: block; margin: 0 auto;">
					<div class="title text-center" style="width: 100%;">
						<p class="my-2 h3">싸이월드에 오신 것을 환영합니다</p>
						<p class="my-2 h5">
							<span class="mr-2" style="font-weight: bold;">지금 회원가입하신 후</span>
							<span class="text-warning">싸이월드의 다양한 서비스를</span>
							만나보세요
						</p>
					</div>
					<div class="h5">기본정보입력</div>
					<form class="my-3" action="../../controller/user/signUpController.jsp" method="post" id="signUpForm" enctype="multipart/form-data" onsubmit="return signupcheck()">
						<div class="text-center">
							<h3>회원가입</h3>
						</div>
						<hr />
						<div class="form-group">
							<label for="signId">아이디</label>
							<input type="text" class="form-control" id="signId" name="signId" onchange="signupcheck();" />
							<small id="idHelp" class="" style="color: orange">아이디는 10글자를 넘을 수 없습니다.</small>
						</div>
						<div class="form-group">
							<label for="signPassword">비밀번호</label>
							<input type="password" class="form-control" id="signPassword" name="signPassword" style="font-family: '고딕';" onchange="signupcheck();" />
							<small id="passwordHelp" class="" style="color: orange">비밀번호는 영문과 숫자만 사용가능하고 16글자 이내여야 합니다.</small>
						</div>
						<div class="form-group">
							<label for="signPasswordConfirm">비밀번호 확인</label>
							<input type="password" class="form-control" id="signPasswordConfirm" name="signPasswordConfirm" style="font-family: '고딕';" onchange="signupcheck();" />
							<small id="passwordHelp" class="" style="color: orange"></small>
						</div>
						<div class="form-group">
							<label for="signName">이름</label>
							<input type="text" class="form-control" id="signName" name="signName" onchange="signupcheck();" />
							<small id="nameHelp" class="" style="color: orange">이름엔 특수문자가 들어갈 수 없고 최대 10글자를 넘을 수 없습니다.</small>
						</div>
						<div class="form-group">
							<label for="signPhone">핸드폰번호</label>
							<input type="text" class="form-control" id="signPhone" name="signPhone" placeholder="핸드폰 번호를 입력하세요. " onchange="signupcheck();" />
							<small id="phoneHelp" class="form-text text-muted">000-0000-0000 형식으로 입력해주세요.</small>
						</div>
						<div class="form-group">
							<label for="signEmail">이메일주소</label>
							<div class="input-group-append">
								<input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="이메일주소" onchange="signupcheck();" />
								<span class="input-group-text" id="basic-addon2">@</span>
								<select class="custom-select" name="postAddress" id="postAddress">
									<option value="메일을 선택하세요"></option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="kakao.net">kakao.net</option>
								</select>
							</div>
							<small id="emailHelp" class="" style="color: orange">유효한 이메일을 입력해주세요.</small>
						</div>
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="genderCheck" id="genderCheck1" value="M" onchange="signupcheck();" />
								<label for="genderCheck1">남성</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="genderCheck" id="genderCheck2" value="F" onchange="signupcheck();" />
								<label for="genderCheck2">여성</label>
							</div>
							<small id="genderHelp" class="" style="color: orange">성별을 선택해주세요.</small>
						</div>
						<div class="row">
							<div class="col-md-7">
								<div class="form-group">
									<label for="signPic">프로필 사진</label>
									<input type="file" class="custom-file" id="signPic" name="signPic" onchange="signupcheck();" />
									<small id="fileHelp" class="" style="color: orange">이미지 파일을 업로드해주세요.</small>
								</div>
							</div>
							<div class="col-md-5">
								<div class="imageContainer">
									<img src="" alt="" style="max-width: 100%;" id="previewImage" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="">나이</label>
							<select name="signAge" id="signAge" class="custom-select" onchange="signupcheck();">
								<%
								for (int i = 10; i < 60; i++) {
								%>
								<option value="<%=i%>">
									<%=i%></option>
								<%
								}
								%>
							</select> <small id="ageHelp" class="" style="color: orange">나이를 선택해주세요. </small>
						</div>
						<div class="form-group">
							<label for="">홈페이지 별명</label>
							<input type="text" class="form-control" id="signNickname" name="signNickname" onchange="signupcheck();" />
							<small id="nicknameHelp" class="" style="color: orange">홈페이지에 멋진 별명을 붙여주세요 !</small>
						</div>
						<div class="form-group">
							<label for="">홈페이지 소개글</label>
							<input type="text" class="form-control" id="signInfo" name="signInfo" onchange="signupcheck();" />
							<small id="infoHelp" class="" style="color: orange">간단한 홈페이지 소개를 적어주시면 어떨까요?</small>
						</div>
						<div class="row d-flex justify-content-center align-items-center my-3">
							<input type="submit" class="btn btn-warning" value="가입하기" />
							<a href="./login(kth).jsp">
								<button class="mx-2 btn btn-warning" type="button">돌아가기</button>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
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
    </script>
	<!-- 로그인 중복체크 스크립트 -->
	<script type="text/javascript">
    /* 아이디 중복체크 [ ajax ] */
	$( function(){
		
		$("#id").change( function() { 
			
			$.ajax({ 
				url : "idCheck.jsp" ,	
			
				data :{userid:document.getElementById("signupform").signId.value} , 	
			
				success : function( result ){ 
			
					if( result == 1 ){ 	// js 변수는 자료형 없다
						document.getElementById("idHelp").innerHTML = "사용중인 아이디";
					}else{
						
					}
				}
			});
		});
	});
/* 아이디 중복체크 end */
    </script>
	<!-- 업로드 -->
	<script type="text/javascript">
		var imagePreview = document.getElementById('imageContainer');
		function readImage(input){
			if(input.files && input.files[0]){
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
	<script type="text/javascript">
		$(function() {
			$('#signId').change(function() {
				$.ajax({
					url: '../../controller/user/idCheck.jsp',
					data: { userId: document.getElementById('signId').value },
					success: function(result) {
						if (result == 1) {
							// 입력한 아이디가 중복이 아닌경우 
							document.getElementById('idHelp').innerHTML = '사용가능한 아이디입니다. ';
							document.getElementById('idHelp').style.color = "green";
							
						} else if (result == 2){
							document.getElementById('idHelp').innerHTML = '현재 사용중인 아이디입니다. ';
							document.getElementById('idHelp').style.color = 'red';
						}
					}
				});
			});
		});

	</script>
	<!-- 액티브 -->
	<script>
        const li = document.querySelector('.active');
        const li2 = document.querySelector('.active2');
        li.style.color = 'orange';
        li2.style.color = 'orange';
    </script>
</body>
</html>