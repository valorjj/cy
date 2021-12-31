<%@page import="dao.mypage.FLogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 입력받은 일촌평을 db에 등록한다. 
request.setCharacterEncoding("utf-8");

int user_no = Integer.parseInt(request.getParameter("userNo")); // 내꺼
int other_no = Integer.parseInt(request.getParameter("otherUserNo")); // 남의꺼
String content = request.getParameter("friendComment"); // 글 내용

System.out.println("일촌평" + user_no + ":" + other_no + ":" + content);

boolean result = FLogDao.getFLogDao().createNewFriendComment(content, other_no, user_no);

if (result) {
	out.println("<script> alert('일촌평이 등록되었습니다.'); </script>");
	response.sendRedirect("../../view/main/test.jsp?userSearch=" + other_no); // 테스트

} else {

	out.println("<script> alert('오류가 발생했어요 ㅜ.ㅜ '); </script>");
	response.sendRedirect("../../view/main/test.jsp?userSearch=" + other_no);

}
%>