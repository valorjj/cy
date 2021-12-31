<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 세션 값 해제 
	
	session.setAttribute("logIn", null);
	response.sendRedirect("../../view/user/logIn.jsp");


%>