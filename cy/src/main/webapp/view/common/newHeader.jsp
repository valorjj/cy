<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="common.jsp"%>

	<%
	LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
	int user_no = logInSession.getUser_no();
	String user_id = logInSession.getUser_id();
	%>

	<div class="container">
		<div class="d-flex justify-content-start">
			<img src="../../image/cy_logo2.jpg" alt="" style="height: 150px;" />
		</div>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="newMain.jsp"> CYWORLD </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="newMain.jsp">홈 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="miniHome.jsp">미니홈피</a></li>
					<li class="nav-item"><a class="nav-link" href="../main/homeSkinList.jsp">스킨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주크박스</a></li>
					<li class="nav-item"><a class="nav-link" href="#">도토리결제</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="" method="get">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</nav>
	</div>

</body>
</html>