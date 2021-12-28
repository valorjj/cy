<%@page import="dao.mypage.DPostDao"%>
<%@page import="dto.DPost"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
</head>
<body>
	<%
	// 1. viewDiary.jsp 에서 인수를 받아옵니다.
	int dsubNo = Integer.parseInt(request.getParameter("dsubNo"));
	System.out.println(dsubNo);
	ArrayList<DPost> dPosts = DPostDao.getdPostDao().getDPost(dsubNo);
	%>

	<table class="table">
		<%
		for (DPost dpost : dPosts) {
		%>
		<tr>
			<td><%=dpost.getDpost_no()%></td>
			<td><%=dpost.getContent()%></td>
			<td><%=dpost.getDate()%></td>
		</tr>
		<%
		}
		%>

	</table>

</body>
</html>
