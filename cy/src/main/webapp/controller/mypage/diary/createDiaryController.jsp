<%@page import="dto.LogInSession"%>
<%@page import="dto.DPost"%>
<%@page import="dao.mypage.DPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// dsub_no 만 가져오면 끝입니다.

int dsub_no = Integer.parseInt(request.getParameter("dsubNo"));
String content = request.getParameter("dcontent");

System.out.println("dsub_no 는 : " + dsub_no + "입니다. ");
System.out.println("dcontent 는 : " + content + "입니다. ");

LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no();

DPost dPost = new DPost(dsub_no, user_no, content);

boolean result = DPostDao.getdPostDao().createDiary(dPost);

if(result){
	// 다이어리 등록 성공
	out.print(1);
} else {
	// 다이어리 등록 실패
	out.print(2);
}
%>

