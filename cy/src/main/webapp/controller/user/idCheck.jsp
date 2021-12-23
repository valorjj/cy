<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아이디 중복 검사 
	
	String id = request.getParameter("userId");
	boolean result = UserDao.getUserDao().isIdExist(id);
	if(!result){
		// 입력한 아이디가 중복이 아닌 경우
		out.print("1");
	} else{
		// 입력한 아이디가 중복인 경우 
		out.print("2");
	}

%>