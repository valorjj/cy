<%@page import="dao.mypage.GalleryDao"%>
<%@page import="dto.Gallery"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String folderpath = request.getSession().getServletContext().getRealPath("/upload");
MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 10, "UTF-8",
		new DefaultFileRenamePolicy());
////////////////////
request.setCharacterEncoding("utf-8"); // 요청시[request] 한글 인코딩
String title = multi.getParameter("title");
String content = multi.getParameter("content");

content = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

title = title.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

String photo = multi.getFilesystemName("photo"); // getFilesystemName : 파일명 가져오기

LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
int user_no = logInSession.getUser_no();

// 객체화
Gallery gallery = new Gallery(user_no, title, content, photo);
// DB처리
GalleryDao.getGalleryDao().gallerywrite(gallery);

response.sendRedirect("../../../view/mypage/gallery/listGallery.jsp?userNumber=" + user_no);
%>