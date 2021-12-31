<%@page import="dto.LogInSession"%>
<%@page import="dao.user.UserDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
// 유저 프로필 사진 교체
String folderpath = request.getSession().getServletContext().getRealPath("/upload");
MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 10, "UTF-8",
		new DefaultFileRenamePolicy());

String pic = multi.getFilesystemName("newPic");
/* LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no(); */

int userNo = Integer.parseInt(request.getParameter("userNo"));
System.out.println(pic);
System.out.println(userNo);
if (pic == null) {
	pic = multi.getParameter("oldPic");
}
boolean result = UserDao.getUserDao().updateUserPic(pic, userNo);
if (result) {
	response.sendRedirect("/cy/view/mypage/gallery/listGallery.jsp?userSearch="+userNo);
} else {

}
%>