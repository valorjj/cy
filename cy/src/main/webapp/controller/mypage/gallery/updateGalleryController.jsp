
<%@page import="dao.mypage.GalleryDao"%>
<%@page import="dto.Gallery"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String folderpath = request.getSession().getServletContext().getRealPath("/upload");
	MultipartRequest multi = new MultipartRequest( request ,  folderpath , 
		1024*1024*10 ,"UTF-8" , new DefaultFileRenamePolicy() );

	request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	
	content = content.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	
	title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");
	
	String photo = multi.getFilesystemName("photo"); // type : file
	
	if(photo==null ){ // 새로운 첨부파일이 없을 경우 기존 첨부파일을 다시 DB에 저장
		
		photo = multi.getParameter("oldphoto"); // type : hidden
	}
	
	int gpost_no = Integer.parseInt(multi.getParameter("gpost_no"));
	System.out.println(gpost_no);
	// 객체화
	Gallery gallery = new Gallery( title, content, photo, gpost_no);
	// DB처리
	boolean result = GalleryDao.getGalleryDao().galleryupdate(gallery);
	if( result ){
		out.print("<script>alert('수정 되었습니다.');</script>");
		out.println("<script>location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no="+gpost_no+"';</script>");
	}else{	
	}
%>
