
<%@page import="dao.mypage.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	int gpost_no = Integer.parseInt(request.getParameter("gpost_no"));
	//db처리
	boolean result = GalleryDao.getGalleryDao().gallerydelete(gpost_no);
	if(result){
		out.print("<script>alert('삭제 되었습니다.');</script>");
		out.println("<script>location.href='../../../view/mypage/gallery/listGallery.jsp';</script>");
	
	}else {
		response.sendRedirect("../../../view/mypage/gallery/listGallery.jsp?gpost_no="+gpost_no);
	}

%>	