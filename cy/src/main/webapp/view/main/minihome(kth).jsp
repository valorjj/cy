<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
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
						<div class="d-flex col-12">
							<div class="leftcontents col-10 border no-gutters">
								<div class="col-12 leftinner d-flex">
									<div class="col-3 innerleft border" style="background: white; border-radius: 0 10px 10px 0;">
										<div class="homeimg text-center" style="position: relative;">
											<img class="my-2" src="/img/profileimg0.jpg" alt="" style="width: 60%;">
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
									<div class="col-9 innerright border" style="background: white; border-radius: 10px 0 0 10px;">
										<div class="rightbox">
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
													<ul class="d-flex flex-wrap justify-content-center align-content-center">
														<li id="tab-1" class="border tab-content current flex-grow-1">홈 <span>0/0</span>
														</li>
														<li id="tab-1" class="border tab-content flex-grow-1">프로필 <span>0/0</span>
														</li>
														<li id="tab-1" class="border tab-content flex-grow-1">사진첩 <span>0/0</span>
														</li>
														<li id="tab-1" class="border tab-content flex-grow-1">게시판 <span>0/0</span>
														</li>
														<li id="tab-1" class="border tab-content flex-grow-1">동영상 <span>0/0</span>
														</li>
														<li id="tab-1" class="border tab-content flex-grow-1">방명록 <span>0/0</span>
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
							<div class="rightnav col-2 border no-gutters">
								<div class="navbox tabs">
									<div class="home tab-link current" data-tab="tab-1">
										<a href="">홈</a>
									</div>
									<div class="profile tab-link" data-tab="tab-2">
										<a href="">프로필</a>
									</div>
									<div class="photo tab-link" data-tab="tab-3">
										<a href="">사진첩</a>
									</div>
									<div class="guesetbook tab-link" data-tab="tab-4">
										<a href="">방명록</a>
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
</body>
</html>