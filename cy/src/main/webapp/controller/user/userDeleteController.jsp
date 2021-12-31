<%@page import="dto.LogInSession"%>
<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 로그인된 아이디[세션]

LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
String id = logInSession.getUser_id();
String password = request.getParameter("password");

boolean result = UserDao.getUserDao().userDelete(id, password);
if (result) {
	out.print("1");
} 
%>