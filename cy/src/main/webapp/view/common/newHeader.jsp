<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="common.jsp"%>

	<%
	LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
	if (session.getAttribute("logIn") == null) {
		response.sendRedirect("../user/logIn.jsp");
	}
	int user_no = logInSession.getUser_no();
	String user_id = logInSession.getUser_id();
	%>

	<div class="container">
		<div class="d-flex justify-content-start" style="background: lightgrey;">
			<img class="rounded" src="../../image/cy_logo2.jpg" alt="" style="height: 100px;" />
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
				<ul class="navbar-nav mr-auto menubar">
					<li class="nav-item active"><a class="nav-link button float-shadow"
						href="newMain.jsp" rel="float-shadow">홈 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link button float-shadow" href="miniHome.jsp" rel="float-shadow">미니홈피</a></li>
					<li class="nav-item"><a class="nav-link button float-shadow" rel="float-shadow"
						href="../main/homeSkinList.jsp">스킨</a></li>
					<li class="nav-item"><a class="nav-link button float-shadow" href="#" rel="float-shadow">주크박스</a></li>
					<li class="nav-item"><a class="nav-link button float-shadow" href="#" rel="float-shadow">도토리결제</a></li>
					<li class="nav-item"><a class="nav-link button float-shadow" href="../user/myinfo.jsp" rel="float-shadow">회원정보</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="" method="get">
					<input class="form-control mr-sm-3" type="search"
						placeholder="Search" aria-label="Search" style="">
					<button class="btn btn-warning my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</nav>
	</div>
	
	
	<!-- 스크립트 효과 -->
	<script type="text/javascript">
	
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-11991680-4', 'ianlunn.github.io');
	  ga('send', 'pageview');
	</script>

</body>
</html>