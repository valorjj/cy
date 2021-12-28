<%@page import="dto.LogInSession"%>
<%@page import="dao.user.UserDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 유저 프로필 사진 교체
String folderpath = request.getSession().getServletContext().getRealPath("/upload");
MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 10, "UTF-8",
		new DefaultFileRenamePolicy());
request.setCharacterEncoding("utf-8");
String pic = multi.getFilesystemName("newPic");
LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no();
System.out.println(pic);
System.out.println(user_no);
if (pic == null) {
	pic = multi.getParameter("oldPic");
}
boolean result = UserDao.getUserDao().updateUserPic(pic, user_no);
if (result) {
	out.print("<script>alert('수정 되었습니다.');</script>");
	out.println("<script> location.href='../../view/main/test.jsp';</script>");
} else {

}
%>