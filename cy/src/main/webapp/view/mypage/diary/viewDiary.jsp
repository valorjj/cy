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
						data-target="#diary-new-tab-modal" onclick="">게시판 생성</button>
				</div>

				<!-- 만들어진 서브 게시판이 출력될 영역 시작 -->
				<ul class="diary-tabs">
					<%

					%>
					<li class="current tab-link" data-tab="diary-tab1">2021.12.23</li>
					<li class="tab-link" data-tab="diary-tab2">2021.12.24</li>
					<li class="tab-link" data-tab="diary-tab3">2021.12.25</li>

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

				<div id="diary-tab1" class="diary-tab-content current"
					style="overflow: auto;">
					<%@ include file="viewDiaryList.jsp"%>
				</div>
				<div id="diary-tab2" class="diary-tab-content"
					style="overflow: auto;"></div>
				<div id="diary-tab3" class="diary-tab-content"
					style="overflow: auto;"></div>

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
						name="createNewFolderBtn" onclick="createNewFolder();" class="btn btn-primary">생성</button>
				</div>
			</div>


		</div>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('ul.diary-tabs li').click(function() {
				var d_tab_id = $(this).attr('data-tab');
				$('ul.diary-tabs li').removeClass('current');
				$('.diary-tab-content').removeClass('current');
				$(this).addClass('current');
				$("#" + d_tab_id).addClass('current');
			})
		});
		
		;
		
		function createNewFolder() {
			var newName = document.getElementById('newName').value;
			alert(newName);
			// 입력받은 폴더 값을 db에 저장한다. 
			$.ajax({
				url: '../../controller/mypage/diary/createNewTabController.jsp',
				data:{newName: newName},
				success:function(result){
					if(result==1){
						// 폴더 생성 완료
						alert('생성 완료!');
					} else if (result==2){
						// 폴더 생성 실패 [db 연동 오류, 혹은 유효성 검사에서 탈락]
					}
				}
				
			});
			
		}
	</script>

</body>
</html>