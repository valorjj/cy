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
	<!--  본인 js 호출 -->

	<%
	// 방명록 출력 페이지
	// 다른 유저가 남긴 방명록을 리스트로 보여줍니다.
	// 방명록 또한 게시판과 동일하게 등록, 수정, 삭제가 가능해야 합니다.
	// viewLogList.jsp 페이지가 로드됨과 동시에 viewLogListController.jsp 에서 DB 에 접근 후, ArrayList<Visitor> 리스트로 불러옵니다. 
	// 리스트 호출 후, 레이아웃에 맞게 [글내용] [작성자] [작성일] [수정] [삭제] 요소를 출력합니다. 
	// 헤더에 로그인 세션이 있는데 여기서도 호출해야하나 ??
	// 만약 중복되서 안된다면 user_no 또는 id를 어떻게 가져와야하나

	// ArrayList<Visitor> visitors = VisitorDao.getvisitorDao().visitorlist(user_no);

	int otherUserNo = Integer.parseInt(request.getParameter("userNumber")); // test.jsp 넘어온 정보. 내꺼 볼때 / 남의꺼 볼때[헤더에서 검색한 값]

	if (otherUserNo == user_no) {
		// 내가 내꺼 볼 때 값 스위칭
		otherUserNo = user_no;

	} else {
		// 남의 홈페이지 봤을 때는 위에 선언된 값 유지 

	}

	// 

	String pagenum = request.getParameter("pagenum"); // 클릭한 페이지번호 요청
	if (pagenum == null) { // 클릭한 페이지번호가 없으면
		pagenum = "1"; // 1페이지
	}

	int lastrow = VisitorDao.getvisitorDao().visitorcount();
	int listsize = 5;
	int lastpage = 0; //마지막 페이지
	if (lastrow % listsize == 0) { //만약에 나머지가 없다면
		lastpage = lastrow / listsize; //총 게시물/페이지당게시물
	} else {
		lastpage = lastrow / listsize + 1; //총 게시물/페이지당게시물 +1
	}
	// 현재페이지번호
	int currentpage = Integer.parseInt(pagenum);
	int startrow = (currentpage - 1) * listsize; // 현재페이지의 시작번호

	User user = UserDao.getUserDao().getUser(user_no);

	ArrayList<Visitor> visitors = VisitorDao.getvisitorDao().visitorlist(startrow, listsize, otherUserNo);
	%>


	<div class="container my-2 p-1" style="background-color: #263333;">

		<div class="row no-gutters">

			<div class="col-md-10">

				<div id="" class="tab-content current no-gutters"
					style="overflow: auto;">
					<div class="container">
						<div class="row ">
							<div class="col-md-4">
								<img src="../../../upload/<%=user.getUser_pic()%>"
									class="img-thumbnail" style="max-width: 100%;">
							</div>

							<form
								action="../../../controller/mypage/visitor/createLogController.jsp"
								method="get">
								<input type="hidden" value=<%=otherUserNo%> name="otherUserNo">
								<div class="col-md-8">
									<textarea rows="7" cols="70" class="form-control w-auto"
										style="height: 100%;" name="content"></textarea>
									<input type="submit" value="작성">
								</div>
							</form>
						</div>


						<!-- 방명록 작성 end -->
						<!-- 방명록 list -->
						<%
						for (Visitor visitor : visitors) {

							int user_n = UserDao.getUserDao().getLogInIdNo(visitor.getUser_id());
							User user2 = UserDao.getUserDao().getUser(user_n);
						%>

						<div class="container">

							<div class="row form-control">
								<span id="visitor_no">no : <%=visitor.getVisitor_no()%></span> <span>작성자
									: <%=visitor.getUser_id()%></span> <span>작성일 : <%=visitor.getDate()%></span>
							</div>

							<%
							if (loginid != null && loginid.equals(visitor.getUser_id())) {
							%>
							<div class="d-flex justify-content-end">
								<div class="col-md-2">
									<button type="button" class="btn btn-secondary" id="update"
										onclick="update(<%=visitor.getVisitor_no()%>, <%=visitor.getUser_id()%>, <%=visitor.getDate()%>)"
										data-toggle="modal" data-target="#exampleModal">
										수정
										<!-- 수정 버튼 modal -->
									</button>
								</div>
								<div class="col-md-2">
									<a
										href="../../../controller/mypage/visitor/deleteLogController.jsp?visitor_no=<%=visitor.getVisitor_no()%>">
										<button type="button" class="btn btn-danger">삭제</button>
									</a>
								</div>
							</div>
							<%
							}
							%>
							<div class="row my-2">
								<div class="col-md-4" style="height: 140px;">
									<!-- 작성자 아이디를 가지고 가져오기 -->
									<img src="../../../upload/<%=user2.getUser_pic()%>"
										class="form-control" style="height: 100%;">
								</div>
								<div class="col-md-8" style="height: 140px;">
									<textarea rows="" cols="" class="form-control"
										style="height: 100%;" disabled> <%=visitor.getContent()%>
										</textarea>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>

				</div>


				<!-- 페이징 -->
				<div class="row">
					<div class="col-md-4 offset-4 my-3">
						<ul class="pagination">
							<!--  첫 페이지이면 이전페이지 누르면 첫페이지 고정 -->
							<%
							if (currentpage == 1) {
							%>
							<li class="page-item"><a
								href="viewLogList.jsp?pagenum=<%=currentpage%>"
								class="page-link"> 이전 </a></li>
							<%
							} else {
							%>
							<li class="page-item"><a
								href="viewLogList.jsp?pagenum=<%=currentpage - 1%>"
								class="page-link"> 이전 </a></li>
							<%
							}
							%>
							<!-- 게시물의 수만큼 페이지 생성 -->
							<%
							for (int i = 1; i <= lastpage; i++) {
							%>
							<li class="page-item"><a
								href="viewLogList.jsp?pagenum=<%=i%>" class="page-link"> <%=i%>
							</a></li>
							<!-- i를 클릭했을때 현재 페이지 이동 [ 클릭한 페이지와 같이] -->
							<%
							}
							%>
							<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
							<%
							if (currentpage == lastpage) {
							%>
							<li class="page-item"><a
								href="viewLogList.jsp?pagenum=<%=currentpage%>"
								class="page-link"> 다음 </a></li>
							<%
							} else {
							%>
							<li class="page-item"><a
								href="viewLogList.jsp?pagenum=<%=currentpage + 1%>"
								class="page-link"> 다음 </a></li>
							<%
							}
							%>
						</ul>
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
	<!-- Modal -->


	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel">
						no : <span id="no"> </span> 작성자 : <span id="writer"> </span> 작성일 :
						<span id="date"> </span>
					</h6>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<textarea rows="" cols="" class="form-control" name="content"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</div>
		</div>
	</div>



</body>
</html>