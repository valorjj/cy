<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 1. viewDiary.jsp 에서 인수를 받아옵니다.
// 이유는 모르겠지만 dsub_no 를 받아오면 자꾸 에러 뱉어내서 어처구니 없게도 여기서 멈춰있습니다. null 예외처리를 해줘도 동일하게 오류 발생
// 한줄 한줄 찍어보면서 한번 더 체크해야합니다.

%>
<div class="container">
	<button class="btn btn-success">다이어리 작성</button>
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
