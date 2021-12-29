<%@page import="dao.mypage.VisitorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 방명록 삭제 컨트롤러


int visitor_no = Integer.parseInt(request.getParameter("visitor_no"));


boolean result = VisitorDao.getvisitorDao().deletevisitor(visitor_no);

if(result) {
	response.sendRedirect("../../../view/mypage/visitor/viewLogList.jsp");
}
%>

