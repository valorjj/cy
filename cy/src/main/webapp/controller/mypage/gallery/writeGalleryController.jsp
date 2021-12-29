<%@page import="dao.mypage.GalleryDao"%>
<%@page import="dto.Gallery"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서버로 파일 업로드 
	//* 현재 작업폴더 업로드
	//String folderpath ="C:/Users/ezr210310/git/cy/cy/src/main/webapp/upload";
	//* 서버 실제 경로
	String folderpath = request.getSession().getServletContext().getRealPath("/upload");
	MultipartRequest multi = new MultipartRequest( request ,  folderpath , 
			1024*1024*10 ,"UTF-8" , new DefaultFileRenamePolicy() );
	////////////////////
	request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
		// 1. html < > -> 문자 변환 [ 정규표현식x ]
		// 2. \n -> <br> 줄바꿈 변환
	//content = content.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		// 3. html < > -> 문자 변환 [ 정규표현식 ]
	//title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");
	//title = title.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	
	String photo = multi.getFilesystemName("photo");	// getFilesystemName : 파일명 가져오기
	/////////////////////////
					/* 	// 요청 [ 일반 form ]
						String title = request.getParameter("title");
						String contents = request.getParameter("contents");
						String file = request.getParameter("file"); */
	// 작성자의 회원번호
	LogInSession logInSession =  (LogInSession)session.getAttribute("logIn");
	int user_no = logInSession.getUser_no();
	// 객체화
	Gallery gallery = new Gallery( user_no, title , content , photo);
	// DB처리
	GalleryDao.getGalleryDao().gallerywrite(gallery);
	
	response.sendRedirect("../../../view/mypage/gallery/listGallery.jsp");
	
%>