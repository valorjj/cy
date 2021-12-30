<%@page import="dto.User"%>
<%@page import="dao.user.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.user.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 출력 페이지</title>
<link rel="stylesheet" href="/cy/css/common/mini.css" />
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%
	int userNo = Integer.parseInt(request.getParameter("userNumber"));

	if (userNo == user_no) {
		userNo = user_no;
	}

	// 일촌들 목록 쭉 가져오기 

	ArrayList<Integer> friends = FriendDao.getFriendDao().getMyFriend(user_no);

	User user;

	// 목록 가져와서 사진 가져오기
	%>

	<div class="container p-2" style="background-color: #263333;">
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10" style="box-shadow: 1px 1px 1px black;">
					<div id="tab-1" class="tab-content current" style="overflow: auto;">
						<div class="container" style="background-color: white;">
							<div class="row">
								<div class="col-md-2" id="">
									<button onclick="" type="button" class="btn btn-secondary"
										name="" id="questionBtn">30문 30답</button>

								</div>

								<div class="col-md-10" id="profileContainer">
									<div class="row">
										<p>나와 일촌 관계인 사람 프로필 사진</p>
									</div>
									<div class="row">
										<!-- 나와 일촌한 사람들 사진 표시하기 -->

										<%
										// 1. 프로필 사진을 클릭하면 해당하는 사람 홈페이지로 이동하게 링크를 걸어두었습니다. 

										for (Integer friend : friends) {
											System.out.println(friend);
											String pic = UserDao.getUserDao().getUserPic(friend);
											user = UserDao.getUserDao().getUser(friend);
										%>

										<div class="card" style="width: 18rem;">
											<img src="../../upload/<%=pic%>" class="card-img-top"
												alt="...">
											<div class="card-body">
												<h5 class="card-title"><%=user.getUser_id()%></h5>
												<p class="card-text"><%=user.getIntro()%></p>
												<a href="../main/test.jsp?userSearch=<%=friend%>"><button
														type="button" class="btn btn-warning btn-sm">일촌
														방문</button></a>
											</div>
										</div>

										<%
										}
										%>
									</div>
								</div>
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
							class="text-white current">프로필</a></li>
						<li class="tab-link" id="folder-4"><a
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


	</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>