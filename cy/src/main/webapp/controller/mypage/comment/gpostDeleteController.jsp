<%@page import="dao.mypage.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	int reply_no = Integer.parseInt(request.getParameter("reply_no"));
	int gpost_no = Integer.parseInt(request.getParameter("gpost_no")); // 전페이지로 돌아가려면 b_num 이 필요
	boolean result = ReplyDao.getReplyDao().galleryCommentdelete(reply_no);
	
	if(result) {
		out.print("<script> alert('댓글이 삭제되었습니다.'); </script>");
		out.print("<script> location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no="+gpost_no+"';</script>");
	} else {
		out.print("<script> alert('댓글 삭제 오류[관리자에게 문의]'); </script>");
		out.print("<script> location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no="+gpost_no+"';</script>");	
	}

%>
</body>
</html>