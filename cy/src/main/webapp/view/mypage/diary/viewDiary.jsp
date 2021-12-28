<%@page import="dao.mypage.DPostDao"%>
<%@page import="dto.DPost"%>
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
	%>

	<div class="container">
		<div class="row" id="diary-body">
			<!-- 왼쪽 서브 폴더 메뉴 시작 -->
			<div class="col-md-2 d-tabs-menu" id="">
				<div class="row my-2">
					<button class="btn btn-secondary btn-sm" data-toggle="modal"
						data-target="#diary-new-tab-modal">게시판 생성</button>
				</div>
				<!-- 만들어진 서브 게시판이 출력될 영역 시작 -->
				<ul class="diary-tabs" id="diary-tabs" style="overflow: auto;">
					<li class="current tab-link" data-tab="diary-tab current">폴더
						목록</li>
					<%
					for (DSub dsub : dsubs) {
					%>
					<!-- 반복문을 돌면서, 만들어진 dsub 들을 모두 가져와서 출력한다.  -->

					<li class="tab-link" data-tab="diary-tab"
						id="tabs<%=dsub.getDsub_no()%>"
						onclick="dsubNoDeliver(<%=dsub.getDsub_no()%>);"><%=dsub.getName()%></li>

					<%
					}
					%>
				</ul>
				<!-- 만들어진 서브 게시판이 출력될 영역 종료 -->
			</div>
			<!-- 왼쪽 서브 폴더 메뉴 종료  -->

			<!-- diary-content-area 가 실행됨과 동시에 dsub_no 를 받은채로 실행되어야합니다.  -->


			<div class="col-md-10" id="diary-content-area">
				<!-- 상단 달력 시작 -->
				<div class="row">
					<h6>달력 출력 될 부분</h6>
				</div>
				<!-- 상단 달력 종료 -->
				<hr />
				<!-- 탭 눌렀을 때 전환될 화면 시작 -->
				<div class="container">

					<!-- <button type="button" class="form-control" onclick=""
						data-toggle="modal" data-target="#diary-new-post-modal"
						id="postNewDiaryBtn" name="postNewDiaryBtn">글등록</button> -->
					<!-- <button type="button" class="form-control" id="postNewDiaryBtn"
						name="postNewDiaryBtn">글등록</button> -->

					<button type="button" class="form-control">삭제</button>
					<div id="dWrite"></div>
					<div id="dList"></div>
					<%-- <%@ include file="viewDiaryList.jsp"%> --%>


				</div>

			</div>
			<!-- 탭 눌렀을 때 전환될 화면 종료 -->
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
		// 게시판 생성 버튼을 누르면, 컨트롤러를 통해 db 에 등록 후 
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
								alert('폴더 생성 완료되었습니다. ');
								refreshDiaryList();
							} else if (result == 2) {
								// 폴더 생성 실패 [db 연동 오류, 혹은 유효성 검사에서 탈락]
							}
						}
					});
		}

		// href 다음에 + '  '  시작에 꼭 한칸을 띄워야 합니다 .
		function refreshDiaryList() {
			$('#diary-tabs').load(window.location.href + ' #diary-tabs');
		}

		function dsubNoDeliver(dsubNo){

			// 동일한 서브폴더 내에서 계속 이동해야합니다.
			// 이동할 때, dsubNo 값을 가지고 이동해야합니다. 
			// 폴더 이름을 클릭하면 dsubNo 을 전달하며 게시물 목록을 가져옵니다. 
			var dsubNo = dsubNo;
			
			$(window).ready(function(){
				$.ajax({
					url: '../../controller/mypage/diary/loadDiaryListController.jsp',
					data: {dsubNo : dsubNo},
					success:function(result){
						document.getElementById('dList').innerHTML += result;
						// $('#diary-content-area').load(window.location.href + ' #diary-content-area');
						// $('#dList').load('viewDiaryList.jsp');
					}
				});
			});
			
			document.getElementById('diary-content-area').innerHTML += "<button type='button' id='testBtn' class='btn btn-secondary btn-sm'> 글등록</button>";

			$('#testBtn').click(function(){
				// 버튼 눌렀을 때 글 작성 
				// db에서 일부러 제목 작성은 빼버렸다. 다이어리의 의도는 그 순간 순간 메모장, 낙서장이기 때문에
				// 작성한 시간 자체를 제목으로 하려고 한다. 
				// document.getElementById('dList').innerHTML += "제목 : <input type='text' class='form-control'>  <br>"
				document.getElementById('dWrite').innerHTML += "내용 : <textarea id='newDiaryPost' cols='30' rows='10' class='form-control'> </textarea> "
				document.getElementById('dWrite').innerHTML += "<button class='btn btn-secondary' id='createDiary' name='createDiary' > 확인 </button>";
 				
				$("#createDiary").click(function(){
					var dcontent = document.getElementById("newDiaryPost").innerHTML;
					alert(dcontent);
					$.ajax({
						url: "../../controller/mypage/diary/createDiaryController.jsp",
						data: {dsubNo : dsubNo, dcontent : dcontent},
						success: function(result){
							if(result==1){
								$('#diary-content-area').load(window.location.href + ' #diary-content-area');
/* 								// 등록 성공
								// 기존 리스트 지우고, 새롭게 출력해야한다. 
								$(function(){
									$.ajax({
										url: '../../controller/mypage/diary/loadDiaryListController.jsp',
										data: {dsubNo : dsubNo},
										success:function(result){
											if(result==1){
												$('#diary-content-area').load(window.location.href + ' #diary-content-area');
											} else if(result==2){
												
											}
											
										}
									});

								});			// $('#diary-content-area').load(window.location.href + ' #diary-content-area'); */
							} else if (result==2){
								// 등록 실패
								alert('실패!');
							}
						}
					});
				});
			});
			
			// 번호 전달해서 리스트 가져오기 
			// 컨트롤러 통해 db 접근 후, 반복문으로 모든 데이터를 가져와서 출력해야 합니다
			/* $.ajax({
				url: '../../controller/mypage/diary/loadDiaryListController.jsp',
				data: {dsubNo : dsubNo},
				success:function(result){
					alert(result);
					document.getElementById('dList').innerHTML = "";
					document.getElementById('diary-content-area').innerHTML += result;
					// $('#diary-content-area').load(window.location.href + ' #diary-content-area');
					// $('#dList').load('viewDiaryList.jsp');
					
				}
			}); */
		}
	</script>

</body>
</html>