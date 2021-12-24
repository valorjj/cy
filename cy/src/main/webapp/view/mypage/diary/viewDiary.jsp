<%@page import="dto.DSub"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.mypage.DSubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#diary-body {
	height: 500px;
}

ul.diary-tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.diary-tabs li {
	background: #00a8be;
	color: #222;
	padding: 10px 15px;
	cursor: pointer;
}

ul.diary-tabs li.current {
	background: #00a8be;
	color: #ededed;
}

.diary-tab-content {
	display: none;
	background: #ededed;
	height: 500px;
}

.diary-tab-content.current {
	display: inherit;
}
</style>

</head>

<body>

	<%
	// 1. db 에 있는 데이터를 호출해서 리스트에 저장합니다.
	// 2. 리스트를 for 문을 이용해서 표시합니다.
	ArrayList<DSub> dsubs = DSubDao.getdsubDao().getDSubList();
	int dsub_no = -1;
	%>

	<div class="container">
		<div class="row" id="diary-body">

			<!-- 왼쪽 서브 폴더 메뉴 시작 -->
			<div class="col-md-2 d-tabs-menu" id="">

				<%
				/* 
				게시판 생성 버튼을 누르면, Modal 창에서 게시판 이름을 입력 받고 db 에 등록합니다. 
				*/
				%>
				<div class="row my-2">
					<button class="btn btn-secondary btn-sm" data-toggle="modal"
						data-target="#diary-new-tab-modal">게시판 생성</button>
				</div>

				<!-- 만들어진 서브 게시판이 출력될 영역 시작 -->
				<ul class="diary-tabs" id="diary-tabs" style="overflow: auto;">
					<li class="current tab-link">폴더 목록</li>
					<%
					// int idx = 1;
					%>
					<%
					for (DSub dsub : dsubs) {
					%>
					<!-- 반복문을 돌면서, 만들어진 dsub 들을 모두 가져와서 출력한다.  -->
					<li class="tab-link" data-tab="diary-tab<%=dsub.getDsub_no()%>"
						onclick="moveToDiaryList(<%=dsub.getDsub_no()%>);"><%=dsub.getName()%></li>
					<%
					// idx++;
					}
					%>
				</ul>
				<!-- 만들어진 서브 게시판이 출력될 영역 종료 -->
			</div>
			<!-- 왼쪽 서브 폴더 메뉴 종료  -->
			<div class="col-md-10" id="diary-content-area">
				<!-- 상단 달력 시작 -->
				<div class="row">
					<h6>달력 출력 될 부분</h6>
				</div>
				<!-- 상단 달력 종료 -->
				<hr />
				<!-- 탭 눌렀을 때 전환될 화면 시작 -->

				<!-- 선택된 게시판 번호에 해당하는 게시글만 가져와야한다.  -->

				<%
				// dsub_no 를 어떻게 받아오지?
				%>

				<div class="container">
					<div id="diary-tab{]" class="diary-tab-content current"
						style="overflow: auto;">
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
									<%
									// 1. for문 돌면서 db에서 데이터 가져오기
									%>
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
				</div>


				<!-- 탭 눌렀을 때 전환될 화면 종료 -->
			</div>
		</div>
	</div>

	<div class="modal fade" id="diary-new-tab-modal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="diary-new-tab-modal-label">폴더명</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" name="newName" class="form-control" id="newName" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" id="createNewFolderBtn"
						name="createNewFolderBtn" onclick="createNewFolder();"
						class="btn btn-primary" data-dismiss="modal">생성</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// tab 전환 이벤트 
		$(document).ready(function() {
			$('ul.diary-tabs li').click(function() {
				var d_tab_id = $(this).attr('data-tab');
				$('ul.diary-tabs li').removeClass('current');
				$('.diary-tab-content').removeClass('current');
				$(this).addClass('current');
				$("#" + d_tab_id).addClass('current');
			})
		});
		// 새로운 게시판을 만드는 함수
		function createNewFolder() {
			var newName = document.getElementById('newName').value;
			// 입력받은 폴더 값을 db에 저장한다. 
			$
					.ajax({
						url : '../../controller/mypage/diary/createNewTabController.jsp',
						data : {
							newName : newName
						},
						success : function(result) {
							if (result == 1) {
								// 폴더 생성 완료
								loadDiaryList();
							} else if (result == 2) {
								// 폴더 생성 실패 [db 연동 오류, 혹은 유효성 검사에서 탈락]
							}
						}
					});
		}

		// 특정 id 값을 가진 태그만 새로고침 하는 코드입니다.
		// href 다음에 + '  ' 여기 시작에 꼭 한칸을 띄워야 합니다 .
		function loadDiaryList() {
			$('#diary-tabs').load(location.href + ' #diary-tabs');
		}

		function moveToDiaryList(dsub_no) {
			// 다이어리 리스트를 출력하는 페이지를 로드하며 인수를 전달합니다. 
			// 아래 코드는 <div id="diary-content-area"> 를 새로고침 하는 코드입니다. 
			// 그러니 일단 이 코드 실행전에 ArrayList 를 받는 코드가 실행되어야합니다. 
			
			$.ajax(
					{
						
					url: '',
					data : {},
					success: function(result){
						
				}
					
						
						
					}
				
			);
			
			
			$('#diary-content-area').load(
					location.href + ' #diary-content-area');
			
		}
		
		
		
	</script>

</body>
</html>