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

	<%
	ArrayList<Post> posts 
			= PostDao.getPostDao().postlist();
	
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div style="height:500px; border: 1px solid orange; ">폴더선택</div>
			</div>
			<div class="col-md-9">
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
						<%
				
							if( posts.size() == 0) {%>
								<tr>
									<td colspan="5" class="text-center">검색 결과가 없습니다.</td>
								</tr>	
								
						<% 	}%>
						<%
							for( Post post : posts ){
						%>
									
							<tr>
								<td>□</td>
								<td><%=post.getBpost_no() %></td>
								<td><%=post.getTitle() %></td>
								<td>작성자</td>
								<td><%=post.getDate() %></td>
								<td><%=post.getView() %></td>
							</tr>
							<%
							}
						%>
						
					</table>
					<div>
						<button type="button" class="form-control" onclick=" btnadd();">글 등록</button>
					</div>
				</div>
			</div>
		
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

	function btnadd() {
		$("#tab-4").load("../mypage/post/writePost.jsp");
	}
	
	function writePost(){
		var title = document.getElementById("title").value; 
		var content = document.getElementById("content").value; 
		
		$.ajax({ 
			url : "../../controller/mypage/post/writePostController.jsp",
			data : { title : title , content : content},
			success : function(result) { 
				$("#tab-4").load("../mypage/post/listPost.jsp");
			} 
				
		});
		
	}
	</script>
  
</body>
</html>