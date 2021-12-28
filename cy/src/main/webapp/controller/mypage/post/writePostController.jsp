<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 사진, 글 내용을 입력받아서 db 에 저장하는 컨트롤러입니다. 
// 사진은 여러장 등록할 수 있기 때문에 db 테이블을 media 로 따로 뺐습니다. 
// 만일 번거롭다면 post 테이블 안에 photo1, photo3, photo3  이렇게 3개 정도로 제한해서 하는 것도 괜찮을 것 같습니다. default : null 
// 3장 제한인데 1장만 업로드했다면 db에는 photo1, null, null 이렇게 저장 될 것이고
// 출력할 때는 null 값은 제외시키고 출력하면 고민할 여지가 줄어들 것 입니다. 
// 
// 게시판 안에 새로운 게시판을 만드는 컨트롤러
// 하위 게시판을 생성합니다.

	request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
	String title = request.getParameter("title");
	String content = request.getParameter("content");
		// 1. html < > -> 문자 변환 [ 정규표현식x ]
		// 2. \n -> <br> 줄바꿈 변환
	//content = content.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		// 3. html < > -> 문자 변환 [ 정규표현식 ]
	//title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");
	//title = title.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

	LogInSession logInSession  =  (LogInSession)session.getAttribute("logIn");
	int user_no = logInSession.getUser_no();
	// 객체화
	Post post = new Post( title , content , user_no);
	// DB처리
	boolean result = PostDao.getPostDao().postwrite(post);	
	response.sendRedirect("../../../view/mypage/post/listPost.jsp");
	
	
	
	
	// response.sendRedirect("../../../view/mypage/post/listPost.jsp");
	
%>