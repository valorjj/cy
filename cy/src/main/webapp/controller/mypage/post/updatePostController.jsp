<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
String title = request.getParameter("title");
String content = request.getParameter("content");

//content = content.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

//title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");


int bpost_no = Integer.parseInt(request.getParameter("bpost_no"));

// 객체화
Post post = new Post(bpost_no , title, content );
// DB처리
boolean result = PostDao.getPostDao().postupdate(post);
if( result ){
	out.print("<script>alert('수정 되었습니다.');</script>");
	out.println("<script>location.href='../../../view/mypage/post/viewPostList.jsp?bpost_no="+ bpost_no+"';</script>");
}
%>
