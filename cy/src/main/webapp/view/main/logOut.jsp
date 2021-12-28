<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	session.setAttribute("logIn", null); // 로그인 세션 초기화
	response.sendRedirect("../user/logIn.jsp"); // 로그인 화면으로 이동

%>