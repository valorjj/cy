
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

boolean result = UserDao.getUserDao().logInCheck(id, password); // 로그인 성공 여부를 반환합니다. 
if (result) {


	// 로그인 성공 시 세션을 부여합니다. 
	// 세션은 LogInSession 이라는 클래스 형태로 저장합니다.
	int user_no = UserDao.getUserDao().getLogInIdNo(id);
	// 세션에는 user_no, user_id 를 저장합니다. 
	LogInSession logInSession = new LogInSession(user_no, id);
	// 세션의 이름은 logIn 입니다.
	// 세션 값을 가져올때는 getAttribute("logIn") 으로 가져옵니다. 
	session.setAttribute("logIn", logInSession);

	// 로그인 성공했을 경우 메인 화면으로 이동 
	response.sendRedirect("../../view/main/newMain.jsp");

} else {
	// 로그인 실패 했을 경우, 아이디나 비밀번호가 틀렸을 경우 혹은 아예 계정이 존재하지 않을 때 
	out.print("<script> alert('아이디 혹은 비밀번호가 틀렸습니다. '); </script>");
	out.println("<script> location.href='../../view/user/logIn.jsp'; </script>");

}
%>
