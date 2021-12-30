<%@page import="java.security.Identity"%>
<%@page import="dto.User"%>
<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글폰트 -->
<link href='https://fonts.googleapis.com/css?family=Ubuntu|Chewy|Quattrocento+Sans|Kaushan+Script|Comfortaa|Lobster+Two|Raleway|Montserrat|Titillium+Web|Josefin+Sans|Pacifico|Orbitron|Josefin+Slab|Satisfy|Economica|Courgette' rel='stylesheet' type='text/css'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Jua&display=swap" rel="stylesheet">
</head>
<style>
ul, ol, li {
	list-style: none
}

.body1 {
	background: rgb(255, 255, 255);
}

.body2 {
	background: rgb(255, 255, 255);
}

.body3 {
	background: rgb(0, 0, 0);
}

.body4 {
	background: rgb(255, 255, 255);
}

.body5 {
	background: rgb(0, 0, 0);
}
</style>
<body>
	<%@ include file="../../common/common.jsp"%>
	<!-- 메인 페이지 시작 -->
	<div class="container settingcontainer">
		<!-- 		<div class="row">
			<div class="col-md-4">
				<div class="row mainViewCount p-1" style="font-size: 0.4rem;">
					<div class="col-md-4">
						Today:
						<span style="color: red;">(?)</span>
					</div>
					<div class="col-md-4">
						Total:
						<span style="color: red;">(?)</span>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="col-md-8">
					<span>사이트 한 줄 소개</span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="col-md-8">
					<span>사이트주소</span>
				</div>
			</div>
		</div> -->
		<!-- 홈페이지 상단 종료 -->
		<!-- 메인 페이지 시작 -->
		<div class="row" style="height: auto; overflow-y: scroll;">
			<div class="col-md-12 d-flex no-gutters">
				<div class="row col-md-9 no-gutters">
					<!-- 좌측컨첸츠 -->
					<div class="col-md-3">
						<div class="accordbox">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">내정보</button>
										</h2>
									</div>
									<div id="collapseOne" class="link1 collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<a class="link1" href="#">회원정보</a>
										</div>
									</div>
									<div id="collapseOne" class="link2 collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<a class="link2" href="#">작성한 글</a>
										</div>
									</div>
									<div id="collapseOne" class="link3 collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<a class="link3" href="#">공개설정 & 회원탈퇴</a>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingTwo">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">통계보기</button>
										</h2>
									</div>
									<div id="collapseTwo" class="link4 collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<a href="#">방문자 통게</a>
										</div>
									</div>
									<div id="collapseTwo" class="link5 collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<a href="#">컨텐츠 통계</a>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingThree">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">사이트설정</button>
										</h2>
									</div>
									<div id="collapseThree" class="link6 collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
										<div class="card-body">
											<a href="#">색상 변경</a>
										</div>
									</div>
									<div id="collapseThree" class="link7 collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
										<div class="card-body">
											<a href="#">글꼴 변경</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%-- <%
						// 로그인된 아이디[세션]의 정보 호출
						User user = UserDao.getUserDao().getuser(logInId);
					%> --%>
					<!-- 우측컨첸츠 -->
					<div class="col-md-9" style="height: auto;">
						<div class="contentxbox" style="width: 100%; height: 100%; position: relative;">
							<div class="linkpage1 p-2 myself border border-dark active" style="width: 100%; height: 100%">
								<div class="h6 badge badge-success mb-3">회원정보</div>
								<div class="row col-12">
									<div class="profileleft col-3 d-flex flex-column justify-content-center align-items-center">
										<div class="profileimg border">
											<img src="https://www.ekn.kr/mnt/file/202107/2021070501000177800006692.jpg" alt="" />
										</div>
										<div class="">
											<div class="my-2">
												<label class="d-inline-block" for="">
													이름 :
													<%-- <%=user.getUser_name() %> --%>
												</label>
											</div>
											<div class="my-2">
												<label class="d-inline-block" for=""> 나이 : </label>
											</div>
										</div>
									</div>
									<div class="col-9 profileright d-flex flex-column justify-content-center align-items-center">
										<form action="" style="width: 100%">
											<table class="table text-center">
												<!-- class="table" : 부트스트랩 테이블 -->
												<thead>
													<tr>
														<th colspan="3">회원 개인 정보</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>아이디</td>
														<td colspan="2"></td>
													</tr>
													<tr>
														<td>패스워드</td>
														<td>****</td>
														<td>
															<button class="form-control">수정</button>
														</td>
													</tr>
													<tr>
														<td>회원명</td>
														<td id="tdname"></td>
														<td>
															<button onclick="namechange();" class="form-control">수정</button>
														</td>
													</tr>
													<tr>
														<td>성별</td>
														<td></td>
														<td>
															<button class="form-control">수정</button>
														</td>
													</tr>
													<tr>
														<td>나이</td>
														<td></td>
														<td>
															<button class="form-control">수정</button>
														</td>
													</tr>
													<tr>
														<td>연락처</td>
														<td></td>
														<td>
															<button class="form-control">수정</button>
														</td>
													</tr>
													<tr>
														<td>가입일</td>
														<td colspan="2"></td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
								</div>
							</div>
							<div class="linkpage2 p-2 myintroduce border border-primary" style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; display: none;">
								<div class="h6 badge badge-success mb-3">작성글</div>
								<div class="row d-flex flex-column">
									<form action=""></form>
								</div>
							</div>
							<div class="linkpage3 p-2 myintroduce border border-primary" style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; display: none;">
								<div class="h6 badge badge-success mb-3">공개설정</div>
								<div class="row d-flex flex-column justify-content-center align-items-center" style="height: auto;">
									<form action="" class="col-12">
										<ul class="d-flex justify-content-center align-items-center w-100 mx-3">
											<li class="w-100">미니홈피 공개설정
												<button class="btn btn-outline-warning btn-rounded my-1">전체공개</button>
												<button class="btn btn-outline-warning btn-rounded my-1">비공개(비공개)</button>
											</li>
											<li class="w-100">사진첩 공개설정
												<button class="btn btn-outline-warning btn-rounded my-1">전체공개</button>
												<button class="btn btn-outline-warning btn-rounded my-1">비공개(비공개)</button>
											</li>
											<li class="w-100">다이어리 공개설정
												<button class="btn btn-outline-warning btn-rounded my-1">전체공개</button>
												<button class="btn btn-outline-warning btn-rounded my-1">비공개(비공개)</button>
											</li>
											<li class="w-100">방명록 공개설정
												<button class="btn btn-outline-warning btn-rounded my-1">전체공개</button>
												<button class="btn btn-outline-warning btn-rounded my-1">비공개(비공개)</button>
											</li>
										</ul>
									</form>
								</div>
								<div class="row text-center">
									<div id="deleteresult" class="h6 p-2 col-12">회원탈퇴 하시겠습니까?</div>
									<form id="deleteform" class="col-4 offset-4" style="display: block; margin: 0 auto;">
										<br>
										<input type="password" id="password" name="password" class="form-control" placeholder="패스워드">
										<br>
										<input type="button" id="delete" value="탈퇴" class="form-control">
									</form>
								</div>
							</div>
							<div class="linkpage4 p-2 visitorchart border border-dark active" style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; display: none;">방문자통계.</div>
							<div class="linkpage5 p-2 contentschart border border-primary" style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; display: none;">컨텐츠통계</div>
							<!-- 색상변경 -->
							<div class="linkpage6 p-2 bgchange border border-dark active" style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; display: none;">
								<div class="h6 badge badge-success mb-3">배경색상</div>
								<div class="">
									<form id="bgform" action="" class="d-flex ">
										<button id="colorbg1" name="colorbg1" class="form-control col-2 mx-2" type="button" onclick="bgchange1()" style="color: black; height: auto;">화이트</button>
										<button id="colorbg2" name="colorbg2" class="form-control col-2 mx-2" type="button" onclick="bgchange2()" style="color: black; height: auto;">검정</button>
										<button id="colorbg1" name="colorbg3" class="form-control col-2 mx-2" type="button" onclick="bgchange4()" style="color: blue; height: auto;">블루</button>
										<button id="colorbg2" name="colorbg4" class="form-control col-2 mx-2" type="button" onclick="bgchange5()" style="color: green; height: auto;">그린</button>
										<button id="colorbg2" name="colorbg5" class="form-control col-2 mx-2" type="button" onclick="bgchange6()" style="color: aqua; height: auto;">아쿠아</button>
									</form>
								</div>
							</div>
							<!-- 글꼴변경 -->
							<div class="linkpage7 p-2 textchane border border-primary" style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; display: none;">
								<div class="h6 badge badge-success mb-3">글꼴변경</div>
								<div class="d-flex flex-wrap justify-content-center">
									<ul class="staticfontul" style="list-style: none;">
										<li class="staticfont">
											<button id="raleway-font" style="font-family: Satisfy !important;" class="btn btn-outline-primary mx-1 my-1">폰트 : Raleway</button>
											<button id="montserrat-font" style="font-family: Montserrat !important;" class="btn btn-outline-primary mx-1 my-1">폰트 : Montserrat</button>
											<button id="titillium-font" style="font-family: Titillium Web;" class="btn btn-outline-primary mx-1 my-1">폰트 : Titillium Web</button>
											<button id="pacifico-font" style="font-family: Pacifico;" class="btn btn-outline-primary mx-1 my-1">폰트 : Pacifico</button>
											<button id="josefin-slab-font" style="font-family: Josefin Slab;" class="btn btn-outline-primary mx-1 my-1">폰트 : Josefin Slab</button>
											<button id="orbitron-font" style="font-family: Orbitron;" class="btn btn-outline-primary mx-1 my-1">폰트 : Orbitron</button>
											<button id="comfortaa-font" style="font-family: Comfortaa;" class="btn btn-outline-primary mx-1 my-1 ">폰트 : Comfortaa</button>
											<button id="ubuntu-font" style="font-family: Ubuntu;" class="btn btn-outline-primary mx-1 my-1 ">폰트 : Ubuntu</button>
											<button id="Jua-font" style="font-family: 'Jua', sans-serif;" class="btn btn-outline-primary mx-1 my-1">폰트 : Jua</button>
											<button id="Gamja-font" style="font-family: 'Gamja Flower', cursive;" class="btn btn-outline-primary mx-1 my-1">폰트 :Gamja Flower</button>
											<button id="BlackHan-font" style="font-family: 'Black Han Sans', sans-serif;" class="btn btn-outline-primary mx-1 my-1">폰트 : Black Han Sans</button>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<ul class="tabs">
						<li class="tab-link"><a href="/cy/view/main/test.jsp">홈</a></li>
						<li class="tab-link"><a href="#">프로필</a></li>
						<li class="tab-link"><a href="../diary/viewDiary.jsp">다이어리</a></li>
						<li class="tab-link">게시판</li>
						<li class="tab-link">사진첩</li>
						<li class="tab-link">방명록</li>
						<li class="tab-link current">관리</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 페이지 종료 -->
	<!-- 페이지전환 -->
	<script>
		$(document).ready(function() {

			$(".link1").click(function() {
				$(".linkpage1").show();
				$(".linkpage2").hide();
				$(".linkpage3").hide();
				$(".linkpage4").hide();
				$(".linkpage5").hide();
				$(".linkpage6").hide();
				$(".linkpage7").hide();
			});

			$(".link2").click(function() {

				$(".linkpage2").show();
				$(".linkpage1").hide();
				$(".linkpage3").hide();
				$(".linkpage4").hide();
				$(".linkpage5").hide();
				$(".linkpage6").hide();
				$(".linkpage7").hide();
			});

			$(".link3").click(function() {

				$(".linkpage3").show();
				$(".linkpage4").hide();
				$(".linkpage5").hide();
				$(".linkpage6").hide();
				$(".linkpage1").hide();
				$(".linkpage2").hide();
				$(".linkpage7").hide();
			});

			$(".link4").click(function() {

				$(".linkpage4").show();
				$(".linkpage5").hide();
				$(".linkpage6").hide();
				$(".linkpage1").hide();
				$(".linkpage2").hide();
				$(".linkpage3").hide();
				$(".linkpage7").hide();
			});

			$(".link5").click(function() {

				$(".linkpage5").show();
				$(".linkpage6").hide();
				$(".linkpage1").hide();
				$(".linkpage2").hide();
				$(".linkpage3").hide();
				$(".linkpage4").hide();
				$(".linkpage7").hide();
			});

			$(".link6").click(function() {

				$(".linkpage6").show();
				$(".linkpage1").hide();
				$(".linkpage2").hide();
				$(".linkpage3").hide();
				$(".linkpage4").hide();
				$(".linkpage5").hide();
				$(".linkpage7").hide();
			});

			$(".link7").click(function() {

				$(".linkpage7").show();
				$(".linkpage1").hide();
				$(".linkpage2").hide();
				$(".linkpage3").hide();
				$(".linkpage4").hide();
				$(".linkpage5").hide();
				$(".linkpage6").hide();
			});
		});
	</script>
	<!-- 	<script type="text/javascript">
	$( function(){
		// $("id명").이벤트명( 함수명(){ 실행코드; } );
		$("#color2").change( bgchange2() { 
			// 비동기식 : $.ajax({ 속성명 : "값" , 속성명 : "값" , 속석명 : "값" });
			$.ajax({ 
				url : "main(kth).jsp" ,	
				/* url : 통신할 경로 페이지 */ 
				data :{ document.getElementById("bgform").color2.value } , 	
				/* 이동할 데이터 */
				success : function( result ){ 
				/* 통신이 성공했을때*/
					if( result == 1 ){ 	// js 변수는 자료형 없다
						alert('배경색이 적용됍니다.');
						document.getElementById("themechange").style.backgroundColor = "#000000";
					}
						
					}else{
						
					}
				}

	</script>
	색상변경 -->
	<script type="text/javascript">
		//버튼클릭시 javascript 호출합니다.
		function bgchange1() {
			alert("배경색을 바꾸겠습니까?")
			/* document.getElementsByClass(".themechange").style.backgroundColor = "#FFF";  //RGB코드 */
			/* document.getElementsByClass('.settingcontainer').style.backgroundColor = "#FFF"; //RGB코드 */
			document.body.style.backgroundColor = "#fff"; //RGB코드
		}

		function bgchange2() {
			alert("배경색을 바꾸겠습니까?")
			/* document.getElementsByClass(".themechange").style.backgroundColor = "#000000";  //RGB코드 */
			document.body.style.backgroundColor = "#000"; //RGB코드

		}
	</script>
	<!-- <script type="text/javascript">
		$('#colorbg1').click(function() {
			$('body').toggleClass('body1');
		});

		$('#colorbg2').click(function() {
			$('body').toggleClass('body2');
		});

		$('#colorbg3').click(function() {
			$('body').toggleClass('body3');
		});

		$('#colorbg4').click(function() {
			$('body').toggleClass('body4');
		});

		$('#colorbg5').click(function() {
			$('body').toggleClass('body5');
		});
	</script> -->
	<!-- 폰트체인지 전용 -->
	<script type="text/javascript">
		$("#raleway-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Raleway");
		});

		$("#montserrat-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Montserrat");
		});

		$("#titillium-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Titillium Web");
		});

		$("#pacifico-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Pacifico");
		});

		$("#josefin-slab-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Josefin Slab");
		});

		$("#orbitron-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Orbitron");
		});

		$("#comfortaa-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Comfortaa");
		});

		$("#courgette-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Courgette");
		});

		$("#ubuntu-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Ubuntu");
		});

		$("#chewy-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Chewy");
		});

		$("#kaushan-script-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Kaushan Script");
		});

		$("#lobster-two-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Lobster Two");
		});

		$("#economia-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Economica");
		});

		$("#Jua-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Jua");
		});

		$("#Gamja-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Gamja Flower");
		});

		$("#BlackHan-font").click(function() {
			alert("글꼴폰트를 바꾸겠습니까?")
			$('*').css("font-family", "Black Han Sans");

		});
	</script>
</body>
</html>