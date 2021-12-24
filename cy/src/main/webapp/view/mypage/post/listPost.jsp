<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>	

	<%
		ArrayList<Post> posts 
			= PostDao.getPostDao().postlist();
	//페이징처리 [ 1.검색이 있을경우 2. 검색이 없을경우 ]
			String pagenum = request.getParameter("pagenum");	// 4. 클릭한 페이지번호
			if( pagenum == null){ // 클릭한 페이지번호가 없으면 [ 게시판 첫화면 ]
				pagenum = "1";	//	1페이지 설정
			}
			
			int lastrow = PostDao.getPostDao().postcount(); // 1. 총 게시물수 
			
			int listsize = 5;		 //2. 페이지당 화면에 표시할 게시물수 
			
			int lastpage = 0;					// 3. 마지막페이지
			if( lastrow % listsize == 0 ){		// 만약에 총게시물/페이지당게시물 나머지가 없으면
				lastpage = lastrow / listsize;		// * 총게시물/페이당게시물 
			}else{
				lastpage = lastrow / listsize+1;	// * 총게시물/페이당게시물+1
			}
		
			int currentpage = Integer.parseInt(pagenum); // 5. 현재페이지번호
			int startrow = (currentpage-1)*listsize; 
	
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
								<td><%=post.getWriter() %></td>
								<td><%=post.getDate() %></td>
								<td><%=post.getView() %></td>
							</tr>
							<%
							}
						%>
						
					</table>
					<!--  페이징 번호 -->
					<div class="row">	<!-- 가로 배치 -->
						<div class="col-md-4 offset-4 my-3">
							<ul class="pagination">
							
									<!-- 첫페이지에서 이전버튼 눌렀을때 첫페이지 고정  -->
								<% if( currentpage == 1){ %>
									
									<li class="page-item"><a href="../mypage/post/listPost.jsp?pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>	
									
								<%}else{ %>
									<li class="page-item"><a href="../mypage/post/listPost.jsp?pagenum=<%=currentpage-1 %>" class="page-link"> 이전 </a> </li>
								<%} %>										<!-- 현재페이지번호 -1  -->
								
									<!-- 게시물의 수만큼 페이지 번호 생성 -->
								<% for( int i = 1 ; i<=lastpage; i++){ %>
							
									<li class="page-item"><a href="../mypage/post/listPost.jsp?pagenum=<%=i %>" class="page-link"> <%=i %> </a> </li>
									
								<%} %>
								
									<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
								<% if( currentpage == lastpage ){ %>
								
									<li class="page-item"><a href="../mypage/post/listPost.jsp?pagenum=<%=currentpage%>" class="page-link"> 다음 </a> </li>	
									
								<%}else{ %>
									<li class="page-item"><a href="../mypage/post/listPost.jsp?pagenum=<%=currentpage+1 %>" class="page-link"> 다음 </a> </li>
								<%} %>		
								
							</ul>
						</div>
					</div>
					
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