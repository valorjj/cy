<%@page import="dto.LogInSession"%>
<%@page import="dto.DPost"%>
<%@page import="dao.mypage.DPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

// 새로운 다이어리 포스트를 생성하는 
String content = request.getParameter("newDiaryPost");
LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
out.println("<script> alert('다이어리 포스트 생성 컨트롤러 접근?'); </script>");
int user_no = logInSession.getUser_no();

int dsub_no = Integer.parseInt(request.getParameter("dno"));

out.println("<script> alert(dsub_no); </script>");

/* DPost dPost = new DPost(1, user_no, content);

boolean result = DPostDao.getdPostDao().createDiary(dPost);
if (result) {
	out.print(1);
} else {
	out.print(2);
} */
%>