<%@page import="dto.LogInSession"%>
<%@page import="dao.mypage.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 게시판 안에 새로운 게시판을 만드는 컨트롤러
// 하위 게시판을 생성합니다.

	request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
		// 1. html < > -> 문자 변환 [ 정규표현식x ]
		// 2. \n -> <br> 줄바꿈 변환
	contents = contents.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		// 3. html < > -> 문자 변환 [ 정규표현식 ]
	title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");
	title = title.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

	LogInSession logInSession  =  (LogInSession)session.getAttribute("login");
	int user_no = logInSession.getUser_no();
	// 객체화
	Board board = new Board( title , contents , user_no);
	// DB처리
	BoardDao.getBoardDao().boardwrite( board);
	
	response.sendRedirect("../view/mypage/board/createBoard.jsp");

%>