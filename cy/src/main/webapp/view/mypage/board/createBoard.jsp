<%@page import="dao.mypage.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file ="../../common/header.jsp" %>
	<%
	ArrayList<Board> boards 
			= BoardDao.getBoardDao().boardlist();
	
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div style="height:500px; border: 1px solid orange; ">폴더선택</div>
			</div>
			<div class="col-md-5">
				<div  style="height:500px; border: 1px solid orange; ">게시판
					<table class="table">
						<tr>
							<td> <button> □ </button> </td>							
							<th> 번호 </th>
							<th> 제목 </th>
							<th> 작성자 </th>
							<th> 작성일 </th>
							<th> 조회수 </th>
						</tr>
						
						
							<tr>
								<td>□</td>
								<td>1</td>
								<td>2</td>
								<td>작성자</td>
								<td>3</td>
								<td>4</td>
							</tr>
						
					</table>
				</div>
			</div>
			<div class="col-md-2">
				<div style="height:500px; border: 1px solid orange; ">사이드바</div>
			</div>
			<div class="col-md-2">
				<div class="row">
					<div style="height:300px; border: 1px solid orange; ">유튜브 재생</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>