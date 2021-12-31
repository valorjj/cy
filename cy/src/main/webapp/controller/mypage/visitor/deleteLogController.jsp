<%@page import="dao.mypage.VisitorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 방명록 삭제 컨트롤러
// 방명록 게시물 번호
int visitor_no = Integer.parseInt(request.getParameter("visitor_no"));
int userNo = Integer.parseInt(request.getParameter("userNum"));

System.out.println("방명록 번호 : " + visitor_no);

boolean result = VisitorDao.getvisitorDao().deletevisitor(visitor_no);
if (result) {

	response.sendRedirect("/cy/view/mypage/visitor/viewLogList.jsp?userNumber=" + userNo);
}
%>