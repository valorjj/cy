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
	background: #0b8eb5;
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

	<%@ include file="../common/header.jsp"%>

	<%
	int userNo = Integer.parseInt(request.getParameter("userNumber"));
	if (userNo == user_no) {
		userNo = user_no;
	}

	// 일촌들 목록 쭉 가져오기 

	ArrayList<Integer> friends = FriendDao.getFriendDao().getMyFriend(user_no);

	// 목록 가져와서 사진 가져오기
	%>

	<div class="container p-2" style="background-color: #011e21;">
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10">
					<div id="tab-1" class="tab-content current" style="overflow: auto;">
						<div class="container" style="background-color: white;">
							<div class="row">
								<div class="col-md-2" id="">
									<button onclick="" type="button" class="btn btn-secondary"
										name="" id="questionBtn">30문 30답</button>

								</div>

								<div class="col-md-10" id="profileContainer">

									<%
									for (Integer friend : friends) {
										System.out.println(friend);
										String pic = UserDao.getUserDao().getUserPic(friend);
									%>

									<div>

										<img src="../../upload/<%=pic%>" alt="" />

									</div>

									<%
									}
									%>



								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<ul class="tabs">
						<li class="tab-link current"><a
							href="test.jsp?userNumber=<%=userNo%>"></a>홈</li>
						<li class="tab-link"><a
							href="../user/viewUserProfile.jsp?userNumber=<%=userNo%>"
							class="text-white">프로필</a></li>
						<li class="tab-link"><a
							href="../mypage/post/listPost.jsp?userNumber=<%=userNo%>"
							class="text-white">게시판</a></li>
						<li class="tab-link"><a href="#" class="text-white">사진첩</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/visitor/viewLogList.jsp" class="text-white">방명록</a></li>
						<li class="tab-link"><a href="#" class="text-white">관리</a></li>
					</ul>
				</div>

			</div>
		</div>


	</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>