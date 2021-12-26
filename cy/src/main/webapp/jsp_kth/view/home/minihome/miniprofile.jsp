<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/common.jsp"%>
	<!-- 미니홈 시작  -->
	<div class="d-flex col-12 ">
		<!-- 탭 눌렀을 때 전환될 화면 1 -->
		<div id="tab-2" class="leftcontents col-12 border no-gutters tab-content current" style="overflow: auto;">
			<div class="col-12 leftinner d-flex">
				<!-- 좌측고정 -->
				<div class="col-3 innerleft border" style="background: white; border-radius: 0 10px 10px 0;">
					<!-- 좌측박스 -->
					<div class="leftbox">프로필이얌</div>
				</div>
				<!-- 우측고정 -->
				<div class="col-9 innerright border" style="background: white; border-radius: 10px 0 0 10px;">
					<!-- 우측박스 -->
					<div id="tab-2" class="rightbox tab-content current" style="overflow: auto;">프로필이라고</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 전환 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('div.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('div.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});
		});
	</script>
</body>
</html>