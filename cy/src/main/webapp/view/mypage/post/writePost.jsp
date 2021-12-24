<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
			제목 : <input id="title" class="form-control" type="text" name="title"> <br>
			내용 : <textarea id="content" class="form-control" rows="10" cols="20" name="content"></textarea> <br>
			<button  onclick="writePost();">등록</button>
		
	</div>


	

</body>
</html>