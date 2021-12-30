<%@page import="dao.mypage.ReplyDao"%>
<%@page import="dto.Reply"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 로그인된 회원의 번호
LogInSession logInSession = (LogInSession) session.getAttribute("logIn");

int user_no = logInSession.getUser_no(); // 접속한 계정 정보 
String reply1 = request.getParameter("reply1"); // 작성한 댓글 

int gpost_no = Integer.parseInt(request.getParameter("gpost_no")); 
int userNo = Integer.parseInt(request.getParameter("userNo")); // 댓글 작성한 사람의 회원 번호

System.out.println(user_no);
System.out.println(reply1);
System.out.println(gpost_no);
System.out.println(userNo);



// 객체화
Reply reply = new Reply(userNo, gpost_no, reply1);
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
