<%@page import="dao.mypage.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	int comment_no = Integer.parseInt(request.getParameter("comment_no"));
	int bpost_no= Integer.parseInt(request.getParameter("bpost_no")); // 전페이지로 돌아가려면 b_num 이 필요
	boolean result = CommentDao.getCommentDao().postCommentdelete(comment_no);
	// 결과
	if(result) {
		out.print("<script> alert('댓글이 삭제되었습니다.'); </script>");
		out.print("<script> location.href='../../../view/mypage/post/viewPostList.jsp?bpost_no=" + bpost_no+"';</script>");
	} else {
		out.print("<script> alert('댓글 삭제 오류[관리자에게 문의]'); </script>");
		out.print("<script> location.href='../../../view/mypage/post/viewPostList.jsp?bpost_no=" + bpost_no+"';</script>");
	}

%>