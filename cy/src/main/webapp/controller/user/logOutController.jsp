<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("logInCheck", null); // 로그인 세션 초기화
response.sendRedirect("../../view/user/login(kth).jsp");
%>
