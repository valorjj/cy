<%@page import="dto.LogInSession"%>
<%@page import="dao.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

/* LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no();
 */
int userNo = Integer.parseInt(request.getParameter("userNo"));
String updatedIntro = request.getParameter("newIntro");

boolean result = UserDao.getUserDao().updateUserIntro(updatedIntro, userNo);
if (result) {
	response.sendRedirect("/cy/view/mypage/gallery/listGallery.jsp?userSearch=" + userNo);
} else {

}
%>
