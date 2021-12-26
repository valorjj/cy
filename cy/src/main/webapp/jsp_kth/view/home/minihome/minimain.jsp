<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/common.jsp"%>
	<!-- 미니메인 시작  -->
	<div id="minihome">
		<div class="conatiner d-flex flex-column justify-content-center align-content-center">
			<div class="row col-12 d-flex justify-content-center align-content-center bc-img  p-1">
				<div class="mihomerow col-9 no-gutters border border-danger p-2 m-1 rounded" style="background: skyblue;">
					<div class="col-12 no-gutters d-flex flex-column">
						<div class="col-12 d-flex my-2">
							<div class="col-3 top d-flex justify-content-center">
								<p class="mx-2">
									today
									<span class="text-danger">1</span>
								</p>
								<p class="mx-2">|</p>
								<p class="mx-2">
									total
									<span></span>
								</p>
							</div>
							<div class="col-9">
								<label for="">ㅇㅇㅇ님의 싸이월드</label>
							</div>
						</div>
						<div class="d-flex col-12 ">
							<!-- 탭 눌렀을 때 전환될 화면 1 -->
							<div id="tab-1" class="leftcontents col-10 border no-gutters tab-content current" style="overflow: auto;">
								<!-- 메인 페이지 호출 -->
								<%-- <%@ include file="minihome.jsp"%> --%>
								<%@ include file="minihome.jsp"%>
							</div>
							<div id="tab-2" class="leftcontents col-10 border no-gutters tab-content" style="display: none;">
								<!-- 프로필 페이지 호출 -->
								<%-- <%@ include file="minihome.jsp"%> --%>
								<%@ include file="miniprofile.jsp"%>
							</div>
							<div class="rightnav col-2 border no-gutters">
								<div class="navbox tabs">
									<div class="home tab-link current" data-tab="tab-1">
										<a href="">홈</a>
									</div>
									<div class="profile tab-link" data-tab="tab-2">
										<a href="">프로필</a>
									</div>
									<div class="diary tab-link" data-tab="tab-3">
										<a href="">다이어리</a>
									</div>
									<div class="board tab-link" data-tab="tab-4">
										<a href="">게시판</a>
									</div>
									<div class="photo tab-link" data-tab="tab-5">
										<a href="">사진첩</a>
									</div>
									<div class="guesetbook tab-link" data-tab="tab-6">
										<a href="">방명록</a>
									</div>
									<div class="mysetting tab-link" data-tab="tab-7">
										<a href="">관리</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="musicrow col-2 d-flex flex-column justify-content-start border border-danger">
					<div class="content1">뮤직</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 전환 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('div.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('div.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});
		});
	</script>
</body>
</html>