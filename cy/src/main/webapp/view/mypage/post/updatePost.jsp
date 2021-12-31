<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
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
	int bpost_no = Integer.parseInt(request.getParameter("bpost_no"));
	Post post = PostDao.getPostDao().getPost(bpost_no); // 수정할 게시물
	post.setContent(post.getContent().replaceAll("<br>", "\n")); // <br> => \n
	%>


	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-2">
						<img alt="" src="">
					</div>
					<div class="col-md-10">
						<form
							action="../../../controller/mypage/post/updatePostController.jsp"
							method="post">
							<input type="hidden" name="bpost_no" value="<%=bpost_no%>">
							제목 : <input class="form-control" type="text" name="title"
								value="<%=post.getTitle()%>"> <br> 내용 :
							<textarea class="form-control" rows="10" cols="20" name="content"><%=post.getContent()%></textarea>
							<br> <input type="submit" value="등 록">
						</form>
					</div>
				</div>
			</div>


			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link current">홈</li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link" id="folder-4"><a href="listPost.jsp">게시판</a></li>
					<li class="tab-link" id="folder-5">사진첩</li>
					<li class="tab-link">방명록</li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>

			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link"><a
						href="/cy/view/main/test.jsp?userNumber=<%=user_no%>"
						class="text-white">홈</a></li>
					<li class="tab-link"><a
						href="/cy/view/user/viewUserProfile.jsp?userNumber=<%=user_no%>"
						class="text-white">프로필</a></li>
					<li class="tab-link current" id="folder-4"><a
						href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=user_no%>"
						class="text-white">게시판</a></li>
					<li class="tab-link" id="folder-5" class="text-white"><a
						href="/cy/view/mypage/gallery/listGallery.jsp?userNumber=<%=user_no%>">사진첩</a></li>
					<li class="tab-link"><a
						href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=user_no%>"
						class="text-white">방명록</a></li>
					<li class="tab-link" style="display: none;" class="text-white">관리</li>
				</ul>
			</div>



		</div>
	</div>

</body>
</html>