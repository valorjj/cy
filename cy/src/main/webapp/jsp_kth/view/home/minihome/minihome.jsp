<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/common.jsp"%>
	<!-- 미니홈 시작  -->
	<div class="d-flex col-12 ">
		<!-- 탭 눌렀을 때 전환될 화면 1 -->
		<div id="tab-1" class="leftcontents col-12 border no-gutters tab-content current" style="overflow: auto;">
			<div class="col-12 leftinner d-flex">
				<!-- 좌측고정 -->
				<div class="col-3 innerleft border" style="background: white; border-radius: 0 10px 10px 0;">
					<!-- 좌측박스 -->
					<div class="leftbox">
						<div class="homeimg text-center" style="position: relative;">
							<img class="my-2" src="../../../img/profileimg0.jpg" alt="" style="width: 60%;">
							<div class="edit text-left p-2">
								<a href="">
									<span style="color: orange;">▶</span>
									EDIT
								</a>
							</div>
							<div class="introtxt bg-light" style="height: 10rem; overflow-x: hidden; overflow-y: scroll; font-size: 0.8rem;">나는 송중기입니다. 나는 송중기입니다. 나는 송중기입니다. 나는 송중기입니다. 나는 송중기입니다. 나는 송중기입니다.</div>
							<div class="edit text-left mt-2" style="bottom: 0; position: absolute;">
								<a href="">
									<span style="color: orange;">▶</span>
									EDIT
								</a>
							</div>
						</div>
						<hr>
						<div class="homebot my-1">
							<ul class="d-flex justify-content-between">
								<li class="align-self-center">송중기</li>
								<li class="align-self-center">♂</li>
								<li class="align-self-center" style="font-size: 10px;">1986-10-19</li>
							</ul>
							<form action="">
								<button class="my-1 btn btn-outline-primary" type="button">일촌신청확인</button>
								<div class="form-row align-items-center">
									<div class="col-auto my-1">
										<select class="custom-select bg-primary text-light" id="inlineFormCustomSelect" style="font-size: 10px;">
											<option selected>★ 일촌파도타기</option>
											<option value="1">일촌1</option>
										</select>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 우측고정 -->
				<div class="col-9 innerright border" style="background: white; border-radius: 10px 0 0 10px;">
					<!-- 우측박스 -->
					<div id="tab-1" class="rightbox tab-content current" style="overflow: auto;">
						<div class="my-2" style="font-weight: bold;">Update Board...</div>
						<div class="righttop d-flex col-12">
							<div class="col-6 border py-3">
								<ul>
									<li>등록된 게시물이 없습니다.</li>
									<li>소식이 뜸한 친구에게 마음의 한마디를 남겨주세요.</li>
								</ul>
								<ul style="display: none;">
									<li><label for="" class="badge badge-danger mr-2 my-1">비디오</label> <a href="">제목</a></li>
									<li><label for="" class="badge badge-info mr-2 my-1">게시판</label> <a href="">제목</a></li>
									<li><label for="" class="badge badge-primary mr-2 my-1">사진첩</label> <a href="">제목</a></li>
								</ul>
							</div>
							<div class="col-6 border d-flex align-content-center">
								<ul class="d-flex flex-wrap justify-content-center align-content-center border">
									<li class="current flex-grow-1">홈 <span>0/0</span>
									</li>
									<li class="flex-grow-1">프로필 <span>0/0</span>
									</li>
									<li class="flex-grow-1">사진첩 <span>0/0</span>
									</li>
									<li class="flex-grow-1">게시판 <span>0/0</span>
									</li>
									<li class="flex-grow-1">동영상 <span>0/0</span>
									</li>
									<li  class="flex-grow-1">방명록 <span>0/0</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="rightminiroom ">
							<div class="h6 text-center">나의 미니미와 스토리룸을 소개합니다</div>
							<div class="room border">미니룸</div>
						</div>
						<div class="ilchoncomment">
							<ul class="">
								<li class="d-flex justify-content-start align-content-center"><label class="text-primary align-self-center flex-grow-0" for="">일촌평</label> <input class="align-self-center mx-3 flex-grow-1" type="text">
									<button type="button" class="align-self-center flex-grow-0">등록</button></li>
							</ul>
						</div>
					</div>
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