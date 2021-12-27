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
	int dsub_no = -1;
	// 3. dsub 에 있는 정보 중, dsub_no 만을 저장할 리스트를 만듭니다. 
	ArrayList<Integer> dsubsNoList = new ArrayList<>();
	// 4. dpost 정보를 불러옵니다. 
	ArrayList<DPost> dPosts = DPostDao.getdPostDao().getDPostList();
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
					<li class="current tab-link" data-tab="diary-tab-0">폴더 목록</li>
					<%
					for (DSub dsub : dsubs) {
						// dsub_no 를 넘기는 것에 문제가 있어서 일단 배열에 저장해둡니다. 
						dsubsNoList.add(dsub.getDsub_no());
					%>
					<!-- 반복문을 돌면서, 만들어진 dsub 들을 모두 가져와서 출력한다.  -->
					<<<<<<< HEAD
					<li class="tab-link" data-tab="diary-tab"
						onclick="moveToDiaryList(<%=dsub.getDsub_no()%>);"
						id="tabs<%=dsub.getDsub_no()%>"><%=dsub.getName()%></li> =======
					<!-- diary-tab-{dsub_no} 를 넣습니다.  -->
					<li class="tab-link" data-tab="diary-tab"
						onclick="moveToDiaryList(<%=dsub.getDsub_no()%>);"><%=dsub.getName()%></li>
					>>>>>>> branch 'dev' of https://github.com/valorjj/cy.git
					<%
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
				<div class="container">
					<button type="button" class="form-control" onclick=""
						data-toggle="modal" data-target="#diary-new-post-modal">글등록</button>
					<button type="button" class="form-control">삭제</button>

					<%@ include file="viewDiaryList.jsp"%>

					<<<<<<< HEAD


				</div>
				======= >>>>>>> branch 'dev' of https://github.com/valorjj/cy.git
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

	<div class="modal fade" id="diary-new-post-modal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="diary-new-tab-modal-label">다이어리 내용</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<textarea name="newDiaryPost" id="newDiaryPost" cols="30" rows="10"
						class="form-control"></textarea>
					<!-- <input type="text" name="newDiaryPost" class="form-control"
						id="newDiaryPost" /> -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" id="createNewPostBtn" name="createNewPostBtn"
						onclick="createNewDiaryPost();" class="btn btn-primary"
						data-dismiss="modal">생성</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">

		// tab 전환 이벤트 
		$(window).ready(function() {
			$('ul.diary-tabs li').click(function() {
				var d_tab_id = $(this).attr('data-tab');
				$('ul.diary-tabs li').removeClass('current');
				$('.diary-tab-content').removeClass('current');
				$(this).addClass('current');
				$("#" + d_tab_id).addClass('current');
			})
		});
		
		// 폴더 별 전환 이벤트 
		
		
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
								loadDiaryList();
							} else if (result == 2) {
								// 폴더 생성 실패 [db 연동 오류, 혹은 유효성 검사에서 탈락]
							}
						}
					});
		}


		// href 다음에 + '  '  시작에 꼭 한칸을 띄워야 합니다 .
		function loadDiaryList() {
			$('#diary-tabs').load(location.href + ' #diary-tabs');
		}
		
		function loadDiarys(dsub_no){
			// 인수로 dsub_no 를 받아서 
			// ajax 로 컨트롤러에서 dsub_no 에 해당하는 게시글을 table 형식으로 작성한 후 
			// diary-tab-{dsub_no} 에 해당하는 div에 table 을 출력한다. 
		}	
	

		function moveToDiaryList(no) {

			var number = no;
			alert(number);
			var dsubNo = document.getElementById('tabs' + number).innerHTML;
			alert(dsubNo);
			alert('ajax 통신 시도');
			$.ajax({
				url: '../../controller/mypage/diary/createDiaryController.jsp',
				data: {dno: number},
				success:function(result){
					alert(result);
					if(result==1){
						
						
						
						$('#diary-content-area').load(location.href + ' #diary-content-area');
					} else if(result==2){
						
					}
					
				}
				
			}); 
			//$('#diary-content-area').load(location.href + ' #diary-content-area');

		}

		$(window).ready(function() {
			function loadDiaryList() {
				$('#diary-tabs').load(location.href + ' #diary-tabs');
			}

		});

 		function createNewDiaryPost() {
			var newDiaryPost = document.getElementById('newDiaryPost').value;
			$.ajax({
				url : '../../controller/mypage/diary/createNewPostController.jsp',
				data : {
					newDiaryPost : newDiaryPost
				},
				success : function(result) {
					if (result == 1) {
						alert('글 등록이 완료되었습니다. ');
						$('#diary-content-area').load(
								location.href + ' #diary-content-area');
					} else if (result == 2) {

					}
				}

			});
		}
		
/* 		$(document).on("click", ".open-AddBookDialog", function () {
		     var myBookId = $(this).data('id');
		     $(".modal-body #bookId").val( myBookId );
		     // As pointed out in comments, 
		     // it is unnecessary to have to manually call the modal.
		     // $('#addBookDialog').modal('show');
		}); */
	</script>

</body>
</html>