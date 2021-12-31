<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dto.Visitor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 작성되어있는 방명록을 작성한 사람 '만' 수정하게끔 하는 컨트롤러 

int visitor_no = Integer.parseInt(request.getParameter("no"));
String content = request.getParameter("content");
System.out.print("내용은 " + content);
content = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

Visitor visitor = new Visitor(visitor_no, content);

boolean result = VisitorDao.getvisitorDao().updatevisitor(visitor);

if (result) {
	out.print(1);
	// response.sendRedirect("/cy/view/mypage/visitor/viewLogList.jsp?userNumber=" + visitor_no);
}
else {
	out.print(2);
}
%>