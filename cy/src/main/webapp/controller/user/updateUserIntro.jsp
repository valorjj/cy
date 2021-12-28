<%@page import="dto.LogInSession"%>
<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no();
String updatedIntro = request.getParameter("newIntro");

boolean result = UserDao.getUserDao().updateUserIntro(updatedIntro, user_no);
if (result) {
	response.sendRedirect("../../view/main/test.jsp");
} else {

}
%>
