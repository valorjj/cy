<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dto.Visitor"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 다른 계정의 홈페이지에 방명록을 작성하는 컨트롤러
	String content = request.getParameter("content");

	content = content.replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>");

	LogInSession logInSession = (LogInSession)session.getAttribute("logInSession");
	System.out.print(logInSession);
	int user_no = logInSession.getUser_no();
	
	Visitor visitor = new Visitor(user_no, content);
	
	VisitorDao.getvisitorDao().visitorwrite(visitor);
	
	response.sendRedirect("../../view/mypage/visitor/viewLogList.jsp");
	 
%>