<%@page import="dao.user.UserDao"%>
<%@page import="dto.User"%>
<%@page import="dto.LogInSession"%>
<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dto.Visitor"%>
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

<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<%
	// 방명록 출력 페이지
	// 다른 유저가 남긴 방명록을 리스트로 보여줍니다.
	// 방명록 또한 게시판과 동일하게 등록, 수정, 삭제가 가능해야 합니다.
	// viewLogList.jsp 페이지가 로드됨과 동시에 viewLogListController.jsp 에서 DB 에 접근 후, ArrayList<Visitor> 리스트로 불러옵니다. 
	// 리스트 호출 후, 레이아웃에 맞게 [글내용] [작성자] [작성일] [수정] [삭제] 요소를 출력합니다. 

	// 헤더에 로그인 세션이 있는데 여기서도 호출해야하나 ??
	// 만약 중복되서 안된다면 user_no 또는 id를 어떻게 가져와야하나
	
	ArrayList<Visitor> visitors = VisitorDao.getvisitorDao().visitorlist(user_no);

	User user = UserDao.getUserDao().getUser(user_no);
	%>


	<div class="container my-2 p-1" style="background-color: #263333;">

		<div class="row no-gutters">
			<div class="col-md-10">
				<div id="tab-1" class="tab-content current" style="overflow: auto;">
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<img src="../../../upload/<%=user.getUser_pic()%>"
									class="img-thumbnail" style="max-width: 100%;">
							</div>
							<form
								action="../../../controller/mypage/visitor/createLogController.jsp"
								method="get">
								<div class="col-md-8">
									<textarea rows="7" cols="70" class="form-control w-auto"
										style="height: 100%;" name="content"></textarea>
									<input type="submit" value="작성">
								</div>
							</form>
						</div>
						<hr>
						<!-- 방명록 작성 end -->
						<!-- 방명록 list -->
						

						<div class="row form-control">
						<%
						for (Visitor visitor : visitors) {
						%>
							<div class="col-md-12">
								<span>no : <%=visitor.getVisitor_no()%></span> <span>작성자 : <%=visitor.getUser_id()%></span>
								<span>작성일 : <%=visitor.getdate()%></span>
								<%if(loginid != null && loginid.equals(visitor.getUser_id() ) ) { %>
								<input type="submit" value="수정">
								<input type="submit" value="삭제">
								<%} %>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4" style="height: 140px;">
									<!-- 작성자 아이디를 가지고 가져오기 -->
									<img src="../../../upload/<%=user.getUser_pic()%>" class="form-control" style="height: 100%;">
								</div>
								<div class="col-md-8" style="height: 140px;">
									<textarea rows="" cols="" class="form-control"
										style="height: 100%;">
							<%=visitor.getContent()%>
						</textarea>
								</div>
							</div>
							<hr>
							<%}	%>
						</div>
						

					</div>
				</div>
			</div>

			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link"><a href="/cy/view/main/test.jsp">홈</a></li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link current"><a href="newDiary.jsp">다이어리</a></li>
					<li class="tab-link">게시판</li>
					<li class="tab-link">사진첩</li>
					<li class="tab-link">방명록</li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>



		</div>



	</div>

	<%-- 
	<div class="container" id="visitorcontainer" style="overflow: auto;">
		<!-- 방명록 작성 -->

		<div class="row">
			<div class="col-md-4" style="height: 140px;">
				<img src="" class="form-control" style="height: 100%;">
			</div>
			<form
				action="../../../controller/mypage/visitor/createLogController.jsp"
				method="get">
				<div class="col-md-8" style="height: 140px;">
					<textarea rows="" cols="" class="form-control"
						style="height: 100%;" id="content"></textarea>
					<input type="submit" value="작성">
				</div>
			</form>
		</div>
		<hr>

		<!-- 방명록 작성 end -->
		<!-- 방명록 list -->
		<%
		for (Visitor visitor : visitors) {
		%>

		<div class="row form-control">
			<div class="col-md-12">
				<span><%=visitor.getVisitor_no()%></span> <span><%=visitor.getUser_id()%></span>
				<span><%=visitor.getdate()%></span>
				<button>수정</button>
				<button>삭제</button>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-4" style="height: 140px;">
					<img src="" class="form-control" style="height: 100%;">
				</div>
				<div class="col-md-8" style="height: 140px;">
					<textarea rows="" cols="" class="form-control"
						style="height: 100%;">
							<%=visitor.getContent()%>
						</textarea>
				</div>
			</div>
			<hr>
		</div>
		<%
		}
		%>

	</div>
 --%>
</body>
</html>