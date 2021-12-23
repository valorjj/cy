<%@page import="com.mysql.cj.Session"%>
<%@page import="dto.LogInSession"%>
<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 로그인 컨트롤러 
// 아이디, 비밀번호 입력 후 db 조회해서 로그인 성공 여부 반환
// 로그인 성공 시 session 값에 user_no, user_id 저장 후 메인 페이지로 전환

String id = request.getParameter("logInId"); // 로그인 화면에서 입력한 아이디
String password = request.getParameter("loginPassword"); // 로그인 화면에서 입력한 비밀번호

// UserDao 에 접근해서 아이디, 비밀번호가 db 에 존재하는지 확인합니다. 

boolean result = UserDao.getUserDao().logInCheck(id, password);
if (result) {
	
	// user_no가 필요해서 만듬 : 조지훈 12.23
	int user_no = UserDao.getUserDao().getuser_no(id);
		LogInSession logInSession = new LogInSession(user_no, id);
		
		session.setAttribute("logInSession", logInSession);
	// 조지훈 끝 12.23
	
	// 로그인 성공했을 경우 메인 화면으로 이동 
	response.sendRedirect("../../view/main/test.jsp");
} else {
	// 로그인 실패 했을 경우, 아이디나 비밀번호가 틀렸을 경우 혹은 아예 계정이 존재하지 않을 때 
	out.print("<script> alert('아이디 혹은 비밀번호가 틀렸습니다. '); </script>");
	out.println("<script> location.href='../../view/user/logIn.jsp'; </script>");

}
%>
