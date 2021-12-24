<%@page import="dto.OtherSession"%>
<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 유저 id 검색 후 결과를 리턴하는 컨트롤러
	
	// text에 입력한 값 요청 및 변수저장
	// 변수로 sql에 검색 요청 
	String other = request.getParameter("other");
	
	OtherSession otherSession = new OtherSession();
			
			UserDao.getUserDao().getother(other);
	
	session.setAttribute("other", otherSession);
	
	
	
%>