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

	int user_no = logInSession.getUser_no();
	System.out.print(user_no);
	ArrayList<Visitor> visitors = VisitorDao.getvisitorDao().visitorlist(1);
	%>
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

</body>
</html>