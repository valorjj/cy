<%@page import="dao.mypage.ReplyDao"%>
<%@page import="dto.Reply"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 로그인된 회원의 번호
LogInSession logInSession = (LogInSession) session.getAttribute("logIn");

int user_no = logInSession.getUser_no();
String reply1 = request.getParameter("reply1");

System.out.print(reply1);
int gpost_no = Integer.parseInt(request.getParameter("gpost_no"));
System.out.print(gpost_no);
// 객체화
Reply reply = new Reply(user_no, gpost_no, reply1);
// db처리
boolean result = ReplyDao.getReplyDao().gallerywrite(reply);
// 결과
if (result) {
	out.print(1);
/* out.print("<script> alert('댓글이 등록되었습니다.'); </script>");
	out.print("<script> location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no=" + gpost_no
	+ "';</script>");  */
} else {
	/* out.print("<script> alert('댓글 등록 오류[관리자에게 문의]'); </script>");
	out.print("<script> location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no=" + gpost_no
	+ "';</script>"); */
}
%>
