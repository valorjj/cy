<%@page import="dto.DPost"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.mypage.DPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="../../../view/common/common.jsp"%> --%>

<%
int dsubNo = Integer.parseInt(request.getParameter("dsubNo"));
System.out.println(dsubNo);
ArrayList<DPost> dPosts = DPostDao.getdPostDao().getDPost(dsubNo);

for (DPost dpost : dPosts) {
	out.print(dpost.getContent());
}
%>
<%-- <table class="table">
	<%
	for (DPost dpost : dPosts) {
	%>
	<tr>
		<td><%=dpost.getUser_no()%></td>
		<td><%=dpost.getContent()%></td>
		<td><%=dpost.getDate()%></td>
	</tr>
	<%
	}
	%>
</table> --%>