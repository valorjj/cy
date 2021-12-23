<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>

<style type="text/css">
	#signUpForm{
		border: 1px solid #eeeeee;
		padding: 15px;
	}
</style>
</head>
<body>
	
	<%@ include file="../common/common.jsp" %>
	
	<div class="container" id="signUpForm">
		<form action="../../controller/user/signUpController.jsp" method="post" enctype="multipart/form-data">
			<div class="text-center">
				<h3>회원가입</h3>
			</div>
			<hr />
			<div class="form-group">
				<label for="signId">아이디</label>
				<input type="text" class="form-control" id="signId" name="signId"/>
				<small id="idHelp" class="form-text text-muted">아이디는 10글자를 넘을 수 없습니다.</small>
			</div>
			
			<div class="form-group">
				<label for="signPassword">비밀번호</label>
				<input type="password" class="form-control" id="signPassword" name="signPassword"/>
				<small id="passwordHelp" class="form-text text-muted">비밀번호는 영문과 숫자만 사용가능하고 16글자 이내여야 합니다.</small>
			</div>
			
			<div class="form-group">
				<label for="signPasswordConfirm">비밀번호 확인</label>
				<input type="text" class="form-control" id="signPasswordConfirm" name="signPasswordConfirm"/>
				<small id="passwordHelp" class="form-text text-muted"></small>
			</div>
			
			<div class="form-group">
				<label for="signName">이름</label>
				<input type="text" class="form-control" id="signName" name="signName" />
				<small id="nameHelp" class="form-text text-muted">이름엔 특수문자가 들어갈 수 없고 최대 10글자를 넘을 수 없습니다.</small>
			</div>
			
			<div class="form-group">
				<label for="signPhone">핸드폰번호</label>
				<input type="text" class="form-control" id="signPhone" name="signPhone" placeholder="핸드폰 번호를 입력하세요. "/>
				<small id="phoneHelp" class="form-text text-muted">000-0000-0000 형식으로 입력해주세요.</small>
			</div>
			
			<div class="form-group">
				<label for="signEmail">이메일주소</label>
				
				<div class="input-group-append">
					<input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="이메일주소"/>
			    	<span class="input-group-text" id="basic-addon2">@</span>
			    	<select class="custom-select" name="postAddress" id="postAddress">
			    		<option value="메일을 선택하세요"></option>
			    		<option value="gmail.com">gmail.com</option>
			    		<option value="naver.com">naver.com</option>
			    		<option value="daum.net">daum.net</option>
			    		<option value="kakao.net">kakao.net</option>
			    	
			    	</select>
			  	</div>
				<small id="emailHelp" class="form-text text-muted">유효한 이메일을 입력해주세요.</small>
			</div>
			
			<div class="form-group">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="genderCheck" id="genderCheck1" value="M"/>
					<label for="genderCheck1">남성</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="genderCheck" id="genderCheck2" value="F"/>
					<label for="genderCheck1">여성</label>
				</div>
				<small id="genderHelp" class="form-text text-muted">성별을 선택해주세요.</small>
			</div>
			
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="signPic">프로필 사진</label>
						<input type="file" class="custom-file" id="signPic" name="signPic"/>
						<small id="fileHelp" class="form-text text-muted">이미지 파일을 업로드해주세요.</small>
					</div>
				</div>
				<div class="col-md-5">
					<div class="imageContainer">
						<img src="" alt="" style="max-width: 100%;" id="previewImage"/>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="">나이</label>
				<select name="signAge" id="signAge" class="custom-select">
					<% for(int i=10; i<60; i++) { %>
						<option value="<%=i%>"> <%=i %></option>
					<% } %>
				</select>
				<small id="ageHelp" class="form-text text-muted">나이를 선택해주세요. </small>
			</div>
			
			<div class="form-group">
				<label for="">홈페이지 별명</label>
				<input type="text" class="form-control" id="signNickname" name="signNickname"/>
				<small id="nicknameHelp" class="form-text text-muted">홈페이지에 멋진 별명을 붙여주세요 !</small>
			</div>
			
			<div class="form-group">
				<label for="">홈페이지 소개글</label>
				<input type="text" class="form-control" id="signInfo" name="signInfo"/>
				<small id="infoHelp" class="form-text text-muted">간단한 홈페이지 소개를 적어주시면 어떨까요?</small>
			</div>
			
			<input type="submit" class="btn btn-success"/>

		</form>
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
	
	<script src=""></script>

</body>
</html>