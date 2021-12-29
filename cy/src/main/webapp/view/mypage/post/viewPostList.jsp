<%@page import="dao.mypage.CommentDao"%>
<%@page import="dto.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Post"%>
<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	background: #ff6400;
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
	int number = Integer.parseInt(request.getParameter("userNumber")); 
	int bpost_no = Integer.parseInt(request.getParameter("bpost_no")); // 전 페이지에서 클릭한 게시물 번호
	String postviews = loginid + ":" + bpost_no; // 현재 로그인된 id + 게시물번호 => 세션 이름 사용 예정

	if (session.getAttribute(postviews) == null) { // 현재로그인된 id+게시물의 세션명이 존재하지 않으면
		// 조회수 증가
		PostDao.getPostDao().postcount(bpost_no); // DB호출[조회수 증가]
		// 조회수 증가 방지[세션 생성 : 세션아이디, 세션값]
		String postview = loginid + ":" + bpost_no; // 세션 생성
		session.setAttribute(postview, true);
		session.setMaxInactiveInterval(60 * 60 * 24); // 세션 유효시간 : 초당[하루]
	}

	// 해당 게시물번호의 게시물 가져오기
	Post post = PostDao.getPostDao().getPost(bpost_no);
	//ArrayList<Reply> replys = ReplyDao.getReplyDao().replylist(b_num);
	%>


	<div class="container p-3" style="background-color: #263333;">
		<div class="row no-gutters">
			<div class="col-md-10">
				<div class="tab-content current" style="overflow: auto;">
					<div class="col-md-2">
						<img alt="" src="">
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="m-2">
								<a href="listPost.jsp"><button class="form-control">목록보기</button></a>
							</div>

							<div class="m-2">
								<a href="updatePost.jsp?bpost_no=<%=post.getBpost_no()%>"><button
										class="form-control">수정하기</button></a>
							</div>
							<div class="m-2">
								<a
									href="../../../controller/mypage/post/deletePostController.jsp?bpost_no=<%=post.getBpost_no()%>"><button
										class="form-control">삭제하기</button></a>
							</div>
						</div>
						<table class="table">
							<tr>
								<td style="width: 20%">작성자 <%=post.getWriter()%>
								</td>
								<td>작성일 <%=post.getDate()%>
								</td>
								<td>조회수 <%=post.getView()%>
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td colspan="2"><%=post.getTitle()%></td>
							</tr>
							<tr>
								<td style="height: 300px;">내용</td>
								<td colspan="2"><%=post.getContent()%></td>
							</tr>
						</table>
						<br>
						<hr>
						<form
							action="../../../controller/mypage/comment/bpostWriteController.jsp"
							method="post" class="row">
							<!-- 댓글 저장시 : 1.댓글내용 2.댓글작성자[세션] 3.게시물번호 -->
							<input type="hidden" name="bpost_no" value="<%=bpost_no%>">

							<div class="col-md-2">
								<h6>댓글작성</h6>
							</div>
							<div class="col-md-8">
								<textarea rows="" cols="" class="form-control" name="content"></textarea>
							</div>
							<div class="col-md-2">
								<input type="submit" value="등록" class="form-control">
							</div>
						</form>
						<br>
						<table class="table">
							<tr>
								<th>작성자</th>
								<th>내용</th>
								<th>작성일</th>
								<th>삭제여부</th>

							</tr>
							<%
							ArrayList<Comment> comments = CommentDao.getCommentDao().postCommentlist(bpost_no);
							for (Comment comment : comments) {
							%>
							<tr>
								<th><%=comment.getWriter()%></th>
								<th><%=comment.getContent()%></th>
								<th><%=comment.getDate()%></th>
								<th><a
									href="../../../controller/mypage/comment/bpostDeleteReplyController.jsp?comment_no=<%=comment.getComment_no()%>&bpost_no=<%=bpost_no%>">
										<button class="form-control">삭제</button>
								</a> <!-- 삭제버튼 눌렀을때 댓글번호 이동 -->
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-1">
				<ul class="tabs">
					<li class="tab-link "><a href="test.jsp?userNumber=<%=number%>">홈</a></li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link current" id="folder-4"><a
						href="listPost.jsp?userNumber=<%=number%>">게시판</a></li>
					<li class="tab-link" id="folder-5">사진첩</li>
					<li class="tab-link">방명록</li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>