<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
	body {
   margin-top: 100px;
   font-family: 'Trebuchet MS', serif;
   line-height: 1.6;
   height: 500px;
}

ul.tabs {
   margin: 0px;
   padding: 0px;
   list-style: none;
}

ul.tabs li {
   background: #00a8be;
   color: #222;
   padding: 10px 15px;
   cursor: pointer;
}

ul.tabs li.current {
   background: #00a8be;
   color: #ededed;
}

.tab-content {
   display: none;
   background: #ededed;
   padding: 10px;
   height: 500px;
}

.tab-content.current {
   display: inherit;
}
	
	</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<%
	
	
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

	ArrayList<Post> posts = PostDao.getPostDao().postlist(startrow, listsize);

	for (Post post : posts) {
		System.out.println(post.getBpost_no());
	}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="row">
				<div class="col-md-2">
					<img alt="" src="">
				</div>
				<div class="col-md-10">
					<div style="height: 500px; border: 1px solid orange;">
						게시판
						<table class="table">
							<tr>
								<td>
									<button>□</button>
								</td>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							
							<%
							for (Post post : posts) {
							%>

							<tr>
								<td>□</td>
								<td><%=post.getBpost_no() %></td>
								<td><a href="viewPostList.jsp?bpost_no=<%=post.getBpost_no()%>" class="text-dark"><%=post.getTitle() %></a></td>
							
								<td><%=post.getWriter() %></td>
								<td><%=post.getDate() %></td>
								<td><%=post.getView() %></td>
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

									<li class="page-item">
										<a href="listPost.jsp?pagenum=<%=currentpage%>" class="page-link"> ◀ </a>
									</li>
									<%
									} else {
									%>
									<li class="page-item">
										<a href="listPost.jsp?pagenum=<%=currentpage-1%>" class="page-link"> ◀ </a>
									</li>

									<%
									}
									%>
									<!-- 현재페이지번호 -1  -->

									<!-- 게시물의 수만큼 페이지 번호 생성 -->
									<%
									for (int i = 1; i <= lastpage; i++) {
									%>

									<li class="page-item">
										<a href="listPost.jsp?pagenum=<%=i%>" class="page-link"><%=i%> </a>
									
									</li>

									<%
									}
									%>

									<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
									<%
									if (currentpage == lastpage) {
									%>

									<li class="page-item">
										<a href="listPost.jsp?pagenum=<%=currentpage%>" class="page-link"> ▶  </a>
									</li>
									<%
									} else {
									%>
									<li class="page-item">
										<a href="listPost.jsp?pagenum=<%=currentpage+1%>" class="page-link"> ▶ </a>
									</li>

									<%
									}
									%>

								</ul>
							</div>
						</div>

						<div class="col-md-3 offset-9">
							<a href="writePost.jsp"><button type="button" class="form-control">글 등록</button></a>
						</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
	            <ul class="tabs">
	               <li class="tab-link current">홈</li>
	               <li class="tab-link" ><a href="#">프로필</a></li>
	               <li class="tab-link" id="folder-4"><a href="#">게시판</a></li>
	               <li class="tab-link" id="folder-5">사진첩</li>
	               <li class="tab-link">방명록</li>
	               <li class="tab-link" style="display: none;">관리</li>
	            </ul>
        	 </div>
		</div>
	</div>
	

</body>
</html>