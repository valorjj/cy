<%@page import="dao.mypage.DSubDao"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 0. 세션에 저장된 사용자 아이디와 이름 호출
LogInSession logInData = (LogInSession) session.getAttribute("logIn");
int user_no = logInData.getUser_no();

// 1. 사용자가 입력한 폴더 이름
String newName = request.getParameter("newName");
// 2. dao 통해 db 에 접근
boolean result = DSubDao.getdsubDao().createCategory(user_no, newName);
if (result) {
	out.println(1);
} else {
	out.println(2);
}
%>

