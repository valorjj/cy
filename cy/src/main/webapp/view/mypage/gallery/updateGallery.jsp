<%@page import="dao.mypage.GalleryDao"%>
<%@page import="dto.Gallery"%>
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
	int userNo = Integer.parseInt(request.getParameter("userNumber"));
	%>
	<%
	int gpost_no = Integer.parseInt(request.getParameter("gpost_no"));
	Gallery gallery = GalleryDao.getGalleryDao().getGallery(gpost_no); // 수정할 게시물
	gallery.setContent(gallery.getContent().replaceAll("<br>", "\n")); // <br> => \n
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-3">
						<img src="../../upload/" alt="" class="img-thumbnail"
							style="max-width: 100%;">
						<hr>
						<div>
							<span> 홈페이지 소개글을 적고, 수정할 수 있는 부분입니다. </span>
						</div>
						<hr>
						<div class="row text-center">
							<button type="button" class="btn btn-secondary btn-sm" value="">소개글
								수정</button>

						</div>
						<hr>
						<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
						<div class="">
							<button type="button" class="btn btn-secondary btn-sm" value="">프로필
								사진 수정</button>
						</div>
						<div class="my-2">
							<h6>
								홈페이지 주소(http://cyworld/<span style="color: blue;"></span>)
							</h6>
						</div>
					</div>
					<div class="col-md-9" style="overflow: auto; height: 500px;">
						<div style="overflow: auto; height: 500px;">
							<form
								action="../../../controller/mypage/gallery/updateGalleryController.jsp"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="gpost_no" value="<%=gpost_no%>">
								<input type="hidden" name="oldphoto"
									value="<%=gallery.getPhoto()%>">
								<!-- 첨부파일 변경이 없을 경우 기존파일불러오기 -->
								제목 : <input class="form-control" type="text" name="title"
									value="<%=gallery.getTitle()%>"> <br> 내용 :
								<textarea class="form-control" rows="10" cols="20"
									name="content"><%=gallery.getContent()%></textarea>
								<br> 첨부파일 : <input type="file" name="photo">
								<%=gallery.getPhoto()%>
								<br> <input type="submit" value="등 록">
							</form>
						</div>

					</div>
				</div>
			</div>


			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link"><a
						href="/cy/view/main/test.jsp?userNumber=<%=userNo%>"
						class="text-white">홈</a></li>
					<li class="tab-link"><a
						href="/cy/view/user/viewUserProfile.jsp?userNumber=<%=userNo%>"
						class="text-white">프로필</a></li>
					<li class="tab-link current" id="folder-4"><a
						href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=userNo%>"
						class="text-white">게시판</a></li>
					<li class="tab-link" id="folder-5" class="text-white"><a
						href="/cy/view/mypage/gallery/listGallery.jsp?userNumber=<%=userNo%>">사진첩</a></li>
					<li class="tab-link"><a
						href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=userNo%>"
						class="text-white">방명록</a></li>
					<li class="tab-link" style="display: none;" class="text-white">관리</li>
				</ul>
			</div>
		</div>
	</div>




</body>
</html>