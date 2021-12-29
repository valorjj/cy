<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<a href="logIn.jsp">
					<img src="../../image/cl.png" alt="" style="max-width: 100%;" />
				</a>
			</div>
		</div>
		<div class="row col-8" style="display: block; margin: 0 auto;">
			<ul class="d-flex my-2 text-warning">
				<li class="mx-3" style="list-style: none;"><a href="./home.jsp" style="color: black";>홈</a></li>
				<li class="mx-3 active" style="border-bottom: solid 1px #000; list-style: none;"><a href="./signUp.jsp" style="color: orange">회원가입</a></li>
			</ul>
			<div class="title text-center" style="width: 100%;">
				<p class="my-2 h3">싸이월드에 오신 것을 환영합니다</p>
				<p class="my-2 h5">
					<span class="mr-2" style="font-weight: bold;">지금 회원가입하신 후</span>
					<span class="text-warning">싸이월드의 다양한 서비스를</span>
					만나보세요
				</p>
			</div>
		</div>
		<hr />
		<div class="row no-gutters">
			<div class="col-md-6 offset-3">
				<form action="../../controller/user/signUpController.jsp" method="post" id="signUpForm" enctype="multipart/form-data">
					<div class="text-center">
						<h3>회원가입</h3>
					</div>
					<hr />
					<div class="form-group">
						<label for="signId">아이디</label>
						<input type="text" class="form-control" id="signId" name="signId" />
						<small id="idHelp" class="" style="color: orange">아이디는 10글자를 넘을 수 없습니다.</small>
					</div>
					<div class="form-group">
						<label for="signPassword">비밀번호</label>
						<input type="password" class="form-control" id="signPassword" name="signPassword" style="font-family: '나눔';" />
						<small id="passwordHelp" class="" style="color: orange">비밀번호는 영문과 숫자만 사용가능하고 16글자 이내여야 합니다.</small>
					</div>
					<div class="form-group">
						<label for="signPasswordConfirm">비밀번호 확인</label>
						<input type="password" class="form-control" id="signPasswordConfirm" name="signPasswordConfirm" style="font-family: '나눔';" />
						<small id="passwordHelp" class="" style="color: orange"></small>
					</div>
					<div class="form-group">
						<label for="signName">이름</label>
						<input type="text" class="form-control" id="signName" name="signName" />
						<small id="nameHelp" class="" style="color: orange">이름엔 특수문자가 들어갈 수 없고 최대 10글자를 넘을 수 없습니다.</small>
					</div>
					<div class="form-group">
						<label for="signPhone">핸드폰번호</label>
						<input type="text" class="form-control" id="signPhone" name="signPhone" placeholder="핸드폰 번호를 입력하세요. " />
						<small id="phoneHelp" class="form-text text-muted">000-0000-0000 형식으로 입력해주세요.</small>
					</div>
					<div class="form-group">
						<label for="signEmail">이메일주소</label>
						<div class="input-group-append">
							<input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="이메일주소" />
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
							<input class="form-check-input" type="radio" name="genderCheck" id="genderCheck1" value="M" />
							<label for="genderCheck1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="genderCheck" id="genderCheck2" value="F" />
							<label for="genderCheck1">여성</label>
						</div>
						<small id="genderHelp" class="" style="color: orange">성별을 선택해주세요.</small>
					</div>
					<div class="row">
						<div class="col-md-7">
							<div class="form-group">
								<label for="signPic">프로필 사진</label>
								<input type="file" class="custom-file" id="signPic" name="signPic" />
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
						<select name="signAge" id="signAge" class="custom-select">
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
						<input type="text" class="form-control" id="signNickname" name="signNickname" />
						<small id="nicknameHelp" class="" style="color: orange">홈페이지에 멋진 별명을 붙여주세요 !</small>
					</div>
					<div class="form-group">
						<label for="">홈페이지 소개글</label>
						<input type="text" class="form-control" id="signInfo" name="signInfo" />
						<small id="infoHelp" class="" style="color: orange">간단한 홈페이지 소개를 적어주시면 어떨까요?</small>
					</div>
					<input type="submit" class="btn btn-warning d-flex justify-content-center w-50 col-4 offset-4" />
				</form>
			</div>
		</div>
	</div>
	<!-- 이미지 업로드 스크립트 -->
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
	<!-- 아이디체크 -->
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

	<!-- <script src="../../js/user/signUp.js"></script> -->
</body>
</html>