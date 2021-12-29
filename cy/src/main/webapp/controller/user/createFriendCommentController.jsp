<%@page import="dao.mypage.FLogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 입력받은 일촌평을 db에 등록한다. 
request.setCharacterEncoding("utf-8");

int user_no = Integer.parseInt(request.getParameter("userNo"));
int other_no = Integer.parseInt(request.getParameter("otherUserNo"));
String content = request.getParameter("friendComment");

boolean result = FLogDao.getFLogDao().createNewFriendComment(content, user_no);

if (result) {
	response.sendRedirect("../../view/main/test.jsp?userSearch=" + other_no);

} else {

}
%>