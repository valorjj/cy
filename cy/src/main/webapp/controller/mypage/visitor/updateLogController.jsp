<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dto.Visitor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 작성되어있는 방명록을 작성한 사람 '만' 수정하게끔 하는 컨트롤러 
	
	int visitor_no = Integer.parseInt(request.getParameter("visitor_no"));
	String content = request.getParameter("content");
	
	content = content.replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>");
	
	Visitor visitor = new Visitor(visitor_no, content);
	
	VisitorDao.getvisitorDao().updatevisitor(visitor);
	
	response.sendRedirect("../../../view/mypage/visitor/viewLogList.jsp");
%>