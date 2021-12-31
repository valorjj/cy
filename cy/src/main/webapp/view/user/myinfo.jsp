<%@page import="dao.user.UserDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/newHeader.jsp"%>
	<%@ include file="../common/common.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<!-- 사이드바 -->
				<div class="nav flex-column nav-pills">
					<!-- flex-column : 세로 메뉴 정렬 	// nav-pills : 액티브[클릭] 색상  -->

					<a class="nav-link" data-toggle="pill" href="#pills-memberinfo">
						회원 정보 </a> <a class="nav-link" data-toggle="pill"
						href="#pills-memberdelete"> 회원 탈퇴 </a>
				</div>
			</div>

			<div class="col-md-9">
				<!-- 내용 -->
				<div class="tab-content" id="pills-tabcontent">
					<%
					// 로그인된 아이디[세션]의 정보 호출
					User user = UserDao.getUserDao().getUpdateUser(user_id);
					%>
					<div class="tab-pane fade show active" id="pills-memberinfo">
						<h3>회원 정보</h3>

						<div class="container">
							<table class="table">
								<!-- 부트스트랩 테이블-->
								<thead>
									<tr>
										<th colspan="3" class=" text-center">회원개인정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>아이디</td>
										<td colspan="2"><%=user.getUser_id()%></td>
									</tr>
									<tr>
										<td>패스워드</td>
										<td id="tdpassword">.....</td>
										<td>
											<button onclick="passwordchange();" class="form-control ">수정</button>
										</td>

									</tr>
									<tr>
										<td>회원명</td>
										<td id="tdname"><%=user.getUser_name()%></td>
										<td>
											<button onclick="namechange();" class="form-control">수정</button>
										</td>

									</tr>
									<tr>
										<td>연락처</td>
										<td id="tdphone"><%=user.getUser_phone()%></td>
										<td>
											<button onclick="phonechange();" class="form-control">수정</button>
										</td>
									</tr>

									<tr>
										<td>가입일</td>
										<td colspan="2"><%=user.getDate()%></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>


					<div class="tab-pane fade" id="pills-memberdelete">
						<div class="container">
							<div class="col-md-6 offset-3">
								<h3>회원탈퇴 하시겠습니까?</h3>
								<form id="deleteform">
									<br> <input type="password" id="password" name="password"
										class="form-control" placeholder="패스워드"> <br> <input
										type="button" id="delete" value="탈퇴" class="form-control">
								</form>
								<br>
								<div id="deleteresult"></div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		//회원탈퇴
		$(function() {
			$("#delete")
					.click(
							function() {
								$
										.ajax({
											url : "../../controller/user/userDeleteController.jsp",
											data : {
												password : document
														.getElementById("deleteform").password.value
											},
											success : function(result) {
												if (result == 1) {
													alert('회원탈퇴 되었습니다.');
													location.href = '../user/logIn.jsp';
												} else {
													document
															.getElementById("deleteresult").innerHTML = "회원정보가 다릅니다.";
												}
											}
										});
							});
		});

		//회원수정
		function namechange() {

			document.getElementById("tdname").innerHTML = "<input type='text' id='name' class='form-control'> <button id='namechangebtn' class='form-control'>확인</button>";

			$(function() {
				$('#namechangebtn')
						.click(
								function() {
									alert("클릭 먹힙니까?");
									$
											.ajax({
												url : "../../controller/user/userUpdateController.jsp",
												data : {
													newname : document
															.getElementById("name").value
												},
												success : function(result) {
													if (result = 1) {
														document
																.getElementById("tdname").innerHTML = document
																.getElementById("name").value;

													} else {
														alert("[수정오류 : 관리자에게 문의]")
													}
												}
											});
								});
			});

		}

		function passwordchange() {

			document.getElementById("tdpassword").innerHTML = "<input type='password' id='password' class='form-control'> <button id='passwordchangebtn' class='form-control'>확인</button>";
			$(function() {
				$('#passwordchangebtn')
						.click(
								function() {
									$
											.ajax({
												url : "../../controller/user/userUpdateController.jsp",
												data : {
													newpassword : document
															.getElementById("password").value
												},
												success : function(result) {
													if (result = 1) {
														document
																.getElementById("tdpassword").innerHTML = document
																.getElementById("password").value;

													} else {
														alert("[수정오류 : 관리자에게 문의]")
													}
												}

											});
								});
			});
		}

		function phonechange() {
			document.getElementById("tdphone").innerHTML = "<input type='text' id='phone'  class='form-control'> <button id='phonechangebtn' class='form-control'>확인</button>";
			$(function() {
				$('#phonechangebtn')
						.click(
								function() {
									$
											.ajax({
												url : "../../controller/user/userUpdateController.jsp",
												data : {
													newphone : document
															.getElementById("phone").value
												},
												success : function(result) {
													if (result = 1) {
														document
																.getElementById("tdphone").innerHTML = document
																.getElementById("phone").value;
													} else {
														alert("[수정오류 : 관리자에게 문의]")
													}
												}

											});
								});
			});
		}
	</script>
</body>
</html>