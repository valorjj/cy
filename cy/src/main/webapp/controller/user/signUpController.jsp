<%@page import="dao.user.UserDao"%>
<%@page import="dto.User"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 회원가입 컨트롤러. 유효성 검사 후 db에 저장합니다. 
request.setCharacterEncoding("utf-8");

String folderpath = request.getSession().getServletContext().getRealPath("/upload");
/* MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 10, "UTF-8",
		new DefaultFileRenamePolicy()); */
MultipartRequest multi = new MultipartRequest( request ,  folderpath , 
		1024*1024*10 ,"UTF-8" , new DefaultFileRenamePolicy() );

String id = multi.getParameter("signId");
String password = multi.getParameter("signPassword");
String passwordconfirm = multi.getParameter("signPasswordConfirm");
String name = multi.getParameter("signName");
String phone = multi.getParameter("signPhone");
String email = multi.getParameter("signEmail") + "@" + multi.getParameter("postAddress");
String gender = multi.getParameter("genderCheck");
String pic = multi.getFilesystemName("signPic");
int age = Integer.parseInt(multi.getParameter("signAge"));
String nickname = multi.getParameter("signNickname");
String info = multi.getParameter("signInfo");

User user = new User(

		id, password, name, phone, email, gender, pic, age, nickname, info

);

boolean result = UserDao.getUserDao().createAccount(user);

if (result) {
	// 회원가입 성공 시 
	response.sendRedirect("../../view/main/test.jsp");
} else {
	out.println("<script> alert('오류가 발생했습니다. ');</script>");
}
%>