<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 리스트</title>
</head>
<body>

	<%
	// 1. viewDiary.jsp 에서 인수를 받아옵니다.
	int dsub_no = Integer.parseInt(request.getParameter("idx"));
	out.println("<script> alert('dsub_no'); </script>");
	%>

	<div class="container">
		
		<button class="btn btn-success"> 다이어리 작성 </button>
		<hr />
		<div>
			<h4>2021.12.23 다이어리</h4>
		</div>

		<div class="table-responsive" style="max-width: 100%;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>작성일</th>
						<th colspan="2"></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>1</td>
						<td>내용</td>
						<td>2021.12.23 15:50:00</td>
						<td><button class="form-control">수정</button></td>
						<td><button class="form-control">삭제</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>