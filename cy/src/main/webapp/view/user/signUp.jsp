<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>

<style type="text/css">
#signUpForm {
	border: 1px solid #eeeeee;
	padding: 15px;
}
</style>
</head>
<body>

	<%@ include file="../common/common.jsp"%>

	<div class="container bg-white">
		<div class="row">
			<div class="col-md-4 offset-4">
				<a href="logIn.jsp"><img src="../../image/cl.png" alt=""
					style="max-width: 100%;" /></a>
			</div>
		</div>

		<div class="row no-gutters">
			<div class="col-md-6 offset-3">
				<form action="../../controller/user/signUpController.jsp"
					method="post" id="signUpForm" enctype="multipart/form-data"
					onsubmit="return signUpFormCheck();">
					<div class="text-center">
						<h3>회원가입</h3>
					</div>
					<hr />
					<div class="form-group">
						<label for="signId">아이디</label> <input type="text"
							class="form-control" id="signId" name="signId"
							onchange="signUpFormCheck();" /> <small id="idHelp" class=""
							style="color: orange">아이디는 10글자를 넘을 수 없습니다.</small> <small
							id="idHelp2"></small>
					</div>

					<div class="form-group">
						<label for="signPassword">비밀번호</label> <input type="password"
							class="form-control" id="signPassword" name="signPassword"
							onchange="signUpFormCheck();" /> <small id="passwordHelp"
							class="" style="color: orange">비밀번호는 영문과 숫자만 사용가능하고 16글자
							이내여야 합니다.</small>
					</div>

					<div class="form-group">
						<label for="signPasswordConfirm">비밀번호 확인</label> <input
							type="text" class="form-control" id="signPasswordConfirm"
							name="signPasswordConfirm" onchange="signUpFormCheck();" /> <small
							id="passwordHelp" class="" style="color: orange"></small>
					</div>

					<div class="form-group">
						<label for="signName">이름</label> <input type="text"
							class="form-control" id="signName" name="signName"
							onchange="signUpFormCheck();" /> <small id="nameHelp" class=""
							style="color: orange">이름엔 특수문자가 들어갈 수 없고 최대 10글자를 넘을 수
							없습니다.</small>
					</div>

					<div class="form-group">
						<label for="signPhone">핸드폰번호</label> <input type="text"
							class="form-control" id="signPhone" name="signPhone"
							placeholder="핸드폰 번호를 입력하세요. " onchange="signUpFormCheck();"  /> <small
							id="phoneHelp" class="form-text text-muted">000-0000-0000
							형식으로 입력해주세요.</small>
					</div>

					<div class="form-group">
						<label for="signEmail">이메일주소</label>

						<div class="input-group-append">
							<input type="text" class="form-control" id="signEmail"
								name="signEmail" placeholder="이메일주소" /> <span
								class="input-group-text" id="basic-addon2">@</span> <select
								class="custom-select" name="postAddress" id="postAddress">
								<option value="메일을 선택하세요"></option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="kakao.net">kakao.net</option>

							</select>
						</div>
						<small id="emailHelp" class="" style="color: orange">유효한
							이메일을 입력해주세요.</small>
					</div>

					<div class="form-group">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="genderCheck"
								id="genderCheck1" value="M" /> <label for="genderCheck1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="genderCheck"
								id="genderCheck2" value="F" /> <label for="genderCheck1">여성</label>
						</div>
						<small id="genderHelp" class="" style="color: orange">성별을
							선택해주세요.</small>
					</div>

					<div class="row">
						<div class="col-md-7">
							<div class="form-group">
								<label for="signPic">프로필 사진</label> <input type="file"
									class="custom-file" id="signPic" name="signPic"
									onchange="signUpFormCheck();"  /> <small id="fileHelp" class=""
									style="color: orange">이미지 파일을 업로드해주세요.</small>
							</div>
						</div>
						<div class="col-md-5">
							<div class="imageContainer">
								<img src="" alt="" style="max-width: 100%;" id="previewImage" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="">나이</label> <select name="signAge" id="signAge"
							class="custom-select">
							<%
							for (int i = 10; i < 60; i++) {
							%>
							<option value="<%=i%>">
								<%=i%></option>
							<%
							}
							%>
						</select> <small id="ageHelp" class="" style="color: orange">나이를
							선택해주세요. </small>
					</div>

					<div class="form-group">
						<label for="">홈페이지 별명</label> <input type="text"
							class="form-control" id="signNickname" name="signNickname" /> <small
							id="nicknameHelp" class="" style="color: orange">홈페이지에 멋진
							별명을 붙여주세요 !</small>
					</div>

					<div class="form-group">
						<label for="">홈페이지 소개글</label> <input type="text"
							class="form-control" id="signInfo" name="signInfo" /> <small
							id="infoHelp" class="" style="color: orange">간단한 홈페이지 소개를
							적어주시면 어떨까요?</small>
					</div>

					<input type="submit" class="btn btn-success" />

				</form>


			</div>
		</div>

	</div>

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
	
		// 1. 아이디 중복체크 : signId 칸에 값 입력 시, change 이벤트가 발생하면 컨트롤러에 접근한다. 컨트롤러에서 db 접근 후 결과값을 리턴한다. 

		$('#signId').change(function() {
			$.ajax({
				url: '../../controller/user/idCheck.jsp',
				data: { userId: document.getElementById('signId').value },
				success: function(result) {
					if (result == 1) {
						// 입력한 아이디가 중복이 아닌경우 
						document.getElementById('idHelp').innerHTML = '중복체크 결과 : 중복 X';
						document.getElementById('idHelp').style.color = "green";
						
					} else if (result == 2){
						document.getElementById('idHelp').innerHTML = '중복체크 결과 : 중복 O';
						document.getElementById('idHelp').style.color = 'red';
					}
				}
			});
		});

		
		// 2. 회원가입 유효성 체크

/* 		function signUpCheck(){ 

			var id = document.getElementById('signUpForm').signId.value;
			var password = document.getElementById('signUpForm').signPassword.value;
			alert(id);
			alert(password);
			var passwordConfirm = document.getElementById('signPasswordConfirm').value;
			var name = document.getElementById('signName').value;
			var phone = document.getElementById('signPhone').value;
			var email = document.getElementById('signEmail').value;
			var gender1 = document.getElementById('genderCheck1').chekced; 
			var gender2 = document.getElementById('genderCheck2').chekced; 
			var age = document.getElementById('signAge').value;
			
			var regId1 = /^[A-Za-z0-9]{3,15}$/; // 아이디는 영문 대,소문자 숫자0-9, 글자 수는 3-15
			var regId2 = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g; // 특수문자 제거
			
			var regPw1 = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/ // 비밀번호는 영문 대,소문자 숫자09, 글자 수 5-15;
			
			
			if(!regId1.test(id) || !regId2.test(id) ){
				document.getElementById('idHelp2').innerHTML = '유효성 검사에서 실패했습니다. 다시 입력해주세요 ';
				document.getElementById('idHelp2').style.color = 'red';
				return false;
			} else {
				document.getElementById('idHelp').innerHTML = '사용가능한 아이디입니다. ';
				document.getElementById('idHelp').style.color = "green";
			}
			
			if(!regPw1.test(password)){
				document.getElementById('passwordHelp').innerHTML = '유효성 검사에서 실패했습니다. 다시 입력해주세요 ';
				document.getElementById('passwordHelp').style.color = 'red';
				return false;
			} else {
				document.getElementById('passwordHelp').innerHTML = '사용가능한 비밀번호 입니다. ';
				document.getElementById('passwordHelp').style.color = "green";
			}
			
		} */
			
			function signUpFormCheck() {
			
			      var id = document.getElementById("signUpForm").signId.value;
			      var password = document.getElementById("signUpForm").signPassword.value;
			      var passwordconfirm = document.getElementById("signUpForm").signPasswordConfirm.value;
			      var name = document.getElementById("signUpForm").signName.value;
			      var phone = document.getElementById("signUpForm").signPhone.value;
			      var sex1 = document.getElementById("signUpForm").genderCheck1.checked;   // checked 유무 가져오기 
			      var sex2 = document.getElementById("signUpForm").genderCheck2.checked;
			      var signpic = document.getElementById("signUpForm").signPic.checked;
			      var signnick = document.getElementById("signUpForm").signNickname.value;
			      var signinfo = document.getElementById("signUpForm").signInfo.value;
			      
			      // 유효성검사 [ 정규표현식 : 텍스트 패턴 검사 ] 
			      var idj = /^[a-z0-9]{5,10}$/;      // 아이디 정규표현식   [ 소문자 숫자 5~10]
			      var pwj = /^[A-Za-z0-9]{5,16}$/;   // 비밀번호 정규표현식[ 대,소문자 숫자 5~16]
			      var phonej = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // 연락처
			      var namej = /^[A-Za-z0-9가-힣]{1,10}$/;   // 이름 정규표현식
			      
			      // 아이디 
			      if (!idj.test(id)) {
			         document.getElementById("idHelp").innerHTML = "아이디는 소문자와 숫자 조합 5~10 사이만 가능 합니다";
			         document.getElementById("idHelp").style.color = "red";
			         return false;// form submit 불가
			      } else {
			         document.getElementById("idHelp").innerHTML = "사용가능한 아이디 입니다."
			         document.getElementById("idHelp").style.color = "green";
			      }
			      
			      // 패스워드 [ 두 패스워드 동일한지 검사 ]
			      if (!pwj.test(password) || !pwj.test(passwordconfirm)) {
			         document.getElementById("passwordHelp").innerHTML = "대소문자 조합 5~16 사이만 가능합니다."; return false;
			      } else if (password != passwordconfirm) {
			         document.getElementById("passwordHelp").innerHTML = "패스워드가 동일하지 않습니다."; return false;
			      } else {
			         document.getElementById("passwordHelp").innerHTML = "사용가능한 패스워드 입니다.";
			      }
			      // 이름
			      if (!namej.test(name)) {
			         document.getElementById("nameHelp").innerHTML = "이름을 입력해주세요.[특수문자는 제외]"; return false;
			      } else {
			         document.getElementById("nameHelp").innerHTML = "";
			      }
			      // 전화번호 
			      if (!phonej.test(phone)) {
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
			      if (signpic == "") {
			         document.getElementById("fileHelp").innerHTML = "파일을 업로드해주세요"; 
			         document.getElementById("fileHelp").style.color = "red"; return false;
			         return false;
			      } else {
			         document.getElementById("fileHelp").innerHTML = "";
			      }
			      
			      //홈페이지 별병
			      if (signnick == "") {
			         document.getElementById("nicknameHelp").innerHTML = "별명을 입력해주세요"; 
			         document.getElementById("nicknameHelp").style.color = "red"; return false;
			         return false;
			      } else {
			         document.getElementById("nicknameHelp").innerHTML = "";
			      }

			      //홈페이지 소개글
			      if (signinfo == "") {
			         document.getElementById("infoHelp").innerHTML = "소개글을 입력해주세요";
			         document.getElementById("infoHelp").style.color = "red";  return false;
			         return false;

			      } else {
			         document.getElementById("infoHelp").innerHTML = "";
			      } 
			} 
		
	</script>

</body>
</html>