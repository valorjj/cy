<%@page import="dao.mypage.CommentDao"%>
<%@page import="dto.Comment"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

// 로그인된 회원의 번호
	LogInSession logInSession = (LogInSession)session.getAttribute("logIn");
	
	int user_no = logInSession.getUser_no();
	String content = request.getParameter("content");
	int bpost_no =  Integer.parseInt( request.getParameter("bpost_no"));
	// 객체화
	Comment comment = new Comment( user_no , bpost_no , content );
	// db처리
	boolean result = CommentDao.getCommentDao().postwrite(comment);
	// 결과
	if(result) {
		out.print("<script> alert('댓글이 등록되었습니다.'); </script>");
		out.print("<script> location.href='../../../view/mypage/post/viewPostList.jsp?bpost_no=" + bpost_no+"';</script>");
	} else {
		out.print("<script> alert('댓글 등록 오류[관리자에게 문의]'); </script>");
		out.print("<script> location.href='../../../view/mypage/post/viewPostList.jsp?bpost_no=" + bpost_no+"';</script>");
	}
%>