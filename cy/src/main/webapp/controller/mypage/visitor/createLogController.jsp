<%@page import="dao.user.UserDao"%>
<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dto.Visitor"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 다른 계정의 홈페이지에 방명록을 작성하는 컨트롤러
	String content = request.getParameter("content");

	content = content.replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>");

	LogInSession logInSession = (LogInSession)session.getAttribute("logIn");
	int user_no = logInSession.getUser_no();
	String user_id = UserDao.getUserDao().getid(user_no);
			
	// 내꺼 불러올 때
	// 남의 꺼 불러올 떄 
	
	
	Visitor visitor = new Visitor(user_no, content, user_id);
	
	response.sendRedirect("../../view/mypage/visitor/viewLogList.jsp");
	
	
%>