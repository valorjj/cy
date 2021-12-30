<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판화면</title>

<link rel="stylesheet" href="/cy/css/common/mini.css" />

</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<%
	// 검색한 사람 번호 나일때, 남일때 구분해야함
	int number = Integer.parseInt(request.getParameter("userNumber"));

	if (number != user_no) {

	} else {
		number = user_no;
	}
	String pagenum = request.getParameter("pagenum"); // 4. 클릭한 페이지번호
	if (pagenum == null) { // 클릭한 페이지번호가 없으면 [ 게시판 첫화면 ]
		pagenum = "1"; //	1페이지 설정
	}

	int lastrow = PostDao.getPostDao().postcount(); // 1. 총 게시물수 

	int listsize = 5; //2. 페이지당 화면에 표시할 게시물수 

	int lastpage = 0; // 3. 마지막페이지
	if (lastrow % listsize == 0) { // 만약에 총게시물/페이지당게시물 나머지가 없으면
		lastpage = lastrow / listsize; // * 총게시물/페이당게시물 
	} else {
		lastpage = lastrow / listsize + 1; // * 총게시물/페이당게시물+1
	}

	int currentpage = Integer.parseInt(pagenum); // 5. 현재페이지번호
	int startrow = (currentpage - 1) * listsize;
	%>

	<div class="container p-3" style="background-color: #263333;">
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10 ">
					<div id="tab-1" class="tab-content current" style="overflow: auto;">
						<div class="container" style="background-color: white;">
							<div class="row">
								<div class="col-md-2" style="">
									<img alt="" src="../../../image/m1.png"
										style="max-width: 100%;"> <img alt=""
										src="../../../image/m2.png" style="max-width: 100%;"> <img
										alt="" src="../../../image/m3.png" style="max-width: 100%;">
									<img alt="" src="../../../image/m4.png"
										style="max-width: 100%;"> <img alt=""
										src="../../../image/m5.png" style="max-width: 100%;"> <img
										alt="" src="../../../image/m6.png" style="max-width: 100%;">
									<img alt="" src="../../../image/m7.png"
										style="max-width: 100%;"> <img alt=""
										src="../../../image/m8.png" style="max-width: 100%;"> <img
										alt="" src="../../../image/m9.png" style="max-width: 100%;">
									<img alt="" src="../../../image/m10.png"
										style="max-width: 100%;"> <img alt=""
										src="../../../image/m11.png" style="max-width: 100%;"> <img
										alt="" src="../../../image/m12.png" style="max-width: 100%;">
								</div>
								<div class="col-md-10 my-4 p-3">
									<div
										style="height: 500px; box-shadow: 2px 2px 2px #eeeeee; border: 1px solid #eeeeee;">
										<div class="d-flex justify-content-center">
											<p style="color: orange;">게시판</p>
										</div>
										<table class="table">
											<tr>
												<td>선택</td>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>조회수</th>
											</tr>
											<%
											ArrayList<Post> posts = PostDao.getPostDao().postlist(startrow, listsize);
											for (Post post : posts) {
											%>
											<tr>
												<td><input type="checkbox" aria-label=""></td>
												<td><%=post.getBpost_no()%></td>
												<td><a
													href="viewPostList.jsp?bpost_no=<%=post.getBpost_no()%>&userNumber=<%=number%>"
													class="text-dark"><%=post.getTitle()%></a></td>
												<td><%=post.getWriter()%></td>
												<td><%=post.getDate()%></td>
												<td><%=post.getView()%></td>
											</tr>
											<%
											}
											%>
										</table>
										<!--  페이징 번호 -->

										<div class="row">
											<!-- 가로 배치 -->
											<div class="col-md-4 offset-4">
												<ul class="pagination">

													<!-- 첫페이지에서 이전버튼 눌렀을때 첫페이지 고정  -->
													<%
													if (currentpage == 1) {
													%>

													<li class="page-item"><a
														href="listPost.jsp?pagenum=<%=currentpage%>"
														class="page-link"> ◀ </a></li>
													<%
													} else {
													%>
													<li class="page-item"><a
														href="listPost.jsp?pagenum=<%=currentpage - 1%>"
														class="page-link"> ◀ </a></li>

													<%
													}
													%>
													<!-- 현재페이지번호 -1  -->

													<!-- 게시물의 수만큼 페이지 번호 생성 -->
													<%
													for (int i = 1; i <= lastpage; i++) {
													%>

													<li class="page-item"><a
														href="listPost.jsp?pagenum=<%=i%>" class="page-link"><%=i%>
													</a></li>

													<%
													}
													%>

													<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
													<%
													if (currentpage == lastpage) {
													%>

													<li class="page-item"><a
														href="listPost.jsp?pagenum=<%=currentpage%>"
														class="page-link"> ▶ </a></li>
													<%
													} else {
													%>
													<li class="page-item"><a
														href="listPost.jsp?pagenum=<%=currentpage + 1%>"
														class="page-link"> ▶ </a></li>

													<%
													}
													%>

												</ul>
											</div>
										</div>

										<div class="col-md-3 offset-9">
											<a href="writePost.jsp"><button type="button"
													class="form-control">글 등록</button></a>
										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
				<div class="col-md-2">
					<ul class="tabs">
						<li class="tab-link"><a
							href="/cy/view/main/test.jsp?userNumber=<%=number%>"
							class="text-white">홈</a></li>
						<li class="tab-link"><a
							href="/cy/view/user/viewUserProfile.jsp?userNumber=<%=number%>"
							class="text-white">프로필</a></li>
						<li class="tab-link current" id="folder-4"><a
							href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=number%>"
							class="text-white">게시판</a></li>
						<li class="tab-link" id="folder-5" class="text-white"><a
							href="/cy/view/mypage/gallery/listGallery.jsp?userNumber=<%=number%>">사진첩</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=number%>"
							class="text-white">방명록</a></li>
						<li class="tab-link" style="display: none;" class="text-white">관리</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>