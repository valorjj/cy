<%@page import="dao.user.UserDao"%>
<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dto.Visitor"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 다른 계정의 홈페이지에 방명록을 작성하는 컨트롤러
String content = request.getParameter("content");
int otherNo = Integer.parseInt(request.getParameter("otherUserNo"));

if(content.length() < 5 ) {
	out.println("<script type='text/javascript'> alert('방명록은 5글자 이상 작성하셔야 합니다.'); </script>");
	
	out.println("<script>location.href='/cy/view/mypage/visitor/viewLogList.jsp?userNumber="+otherNo+"';</script>");
	// response.sendRedirect("/cy/view/mypage/visitor/viewLogList.jsp?userNumber=" +otherNo);
}
else {
content = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no();

System.out.println("컨텐트 : " + content + "otherNo : " + otherNo + "user_no : " + user_no);

String user_id = UserDao.getUserDao().getid(user_no);

// 내꺼 불러올 때
// 남의 꺼 불러올 떄 

Visitor visitor = new Visitor(otherNo, content, user_id);

boolean result = VisitorDao.getvisitorDao().visitorwrite(visitor);
if (result) {
	/* response.sendRedirect("/cy/view/mypage/visitor/viewLogList.jsp?userNumber=" + otherNo); */
} else {

}
}
%>