<%@page import="dao.mypage.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bpost_no = Integer.parseInt(request.getParameter("bpost_no"));
	//db처리
	boolean result = PostDao.getPostDao().postdelete(bpost_no);
	if(result){
		out.print("<script>alert('삭제 되었습니다.');</script>");
		out.println("<script>location.href='../../../view/mypage/post/listPost.jsp';</script>");
		// response.sendRedirect("../view/board/boardlist.jsp);
			// 1. out.print 2.response[ㅠㅔ이지 전환] 3. alert[X]
			// 1. out.print 2. alert, location.href[O]		
	}else {
		response.sendRedirect("../../../view/mypage/post/viewPostList.jsp?bpost_no="+bpost_no);
	}

%>	