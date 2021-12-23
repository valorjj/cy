<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
	<div class="container d-flex flex-column align-items-center " style="height: 100vh">
		<div class="row col-12 d-flex flex-column align-items-center justify-content-center" style="height: 80vh; width: 100%">
			<form id="signupform" class="signform col-8 border border-dark pt-2 pb-2 rounded d-flex flex-column align-items-center justify-content-center" action="../../controller/user/signUpController.jsp" method="post" enctype="multipart/form-data" onsubmit="return signupcheck()" style="width: 80%">
				<div class="text-center my-2 pb-2" style="border-bottom: 1px solid grey;">
					<h3>회원가입</h3>
				</div>
				<div class="form-group">
					<label for="signId">아이디</label>
					<input type="text" class="form-control" id="signId" name="signId" placeholder="아이디는 10글자를 넘을 수 없습니다." />
					<div>
						<span id="idresult"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="signPassword">비밀번호</label>
					<input type="password" class="form-control" id="signPassword" name="signPassword" placeholder="비밀번호는 영문과 숫자만 사용가능하고 16글자 이내." />
					<div>
						<span id="idresult"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="signPasswordConfirm">비밀번호 확인</label>
					<input type="password" class="form-control" id="signPasswordConfirm" name="signPasswordConfirm" />
				</div>
				<div class="form-group">
					<label for="signName">이름</label>
					<input type="text" class="form-control" id="signName" name="signName" placeholder="특수문자 제외 및 최대 10글자." />
				</div>
				<div class="form-group">
					<label for="signPhone">핸드폰번호</label>
					<input type="text" class="form-control" id="signPhone" name="signPhone" placeholder="핸드폰 번호(000-0000-0000 형식)를 입력하세요. " />
				</div>
				<div class="form-group">
					<label for="signEmail">이메일주소</label>
					<div class="input-group-append d-flex" style="width: 100%">
						<input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="유효한 이메일주소" />
						<span class="input-group-text" id="basic-addon2">@</span>
						<select class="custom-select" name="postAddress" id="postAddress">
							<option value="메일을 선택하세요"></option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="kakao.net">kakao.net</option>
						</select>
					</div>
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
					<small id="genderHelp" class="form-text text-muted">성별을 선택해주세요.</small>
				</div>
				<div class="form-group d-flex">
					<div class="col-7">
						<div class="form-group">
							<label for="signPic">프로필 사진</label>
							<input class="border border-lightgrey" type="file" class="custom-file" id="signPic" name="signPic" style="width: 100%">
							<small id="fileHelp" class="form-text text-muted">이미지 파일을 업로드해주세요.</small>
						</div>
					</div>
					<div class="col-5">
						<div class="imageContainer" style="border: 1px dotted lightgrey; height: 100%;">
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
					</select> <small id="ageHelp" class="form-text text-muted">나이를 선택해주세요. </small>
				</div>
				<div class="form-group">
					<label for="">홈페이지 별명</label>
					<input type="text" class="form-control" id="signNickname" name="signNickname" placeholder="홈페이지에 멋진 별명을 붙여주세요" />
				</div>
				<div class="form-group">
					<label for="">홈페이지 소개글</label>
					<input type="text" class="form-control" id="signInfo" name="signInfo" placeholder="간단한 홈페이지 소개를 적어주시면 어떨까요?" />
				</div>
				<input type="submit" class="btn btn-success" style="display: block; margin: 0 auto;" />
			</form>
		</div>
	</div>
	<!--  -->
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
</body>
</html>