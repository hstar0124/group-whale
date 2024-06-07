<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.menuTitle_sub2 {
		font-size:12px;
	}
</style>
</head>
<body>

<!-- 시스템 관리 메뉴 -->
	<div class="nav2 nav2_settings">
		<ul>
			<li>
				<p class="menuTitlePtag">
					<img class="btn nav1_click menu_icons" src="${ contextPath }/resources/images/menubar/open-menu.png">
					<b class="menuTitle">시스템관리</b>
				</p>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1 sub1_f1" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_1" onclick="location.href='depTree.st'">조직도 관리</b>			
					<ul style="display: none;">
						<li class="menuTitle_sub2 sub2_1"></li>
					</ul>	
				</a>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f2" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_2">계정관리</b>
					<ul>
						<li class="menuTitle_sub2 sub2_2" onclick="location.href='addMember.st'">계정 등록</li>
						<li class="menuTitle_sub2 sub2_2" onclick="location.href='selectMemberListPaging.st'">계정 목록</li>
						<li class="menuTitle_sub2 sub2_2" onclick="location.href='classList.st'">클래스 관리</li>
						<li class="menuTitle_sub2 sub2_2" onclick="location.href='managerList.st'">관리자 설정</li>
					</ul>
				</a>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f3" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_3" onclick="location.href='docFormat.st'">문서서식 관리</b>
					<!-- <ul>
						<li class="menuTitle_sub2 sub2_3">문서서식 등록</li>
						<li class="menuTitle_sub2 sub2_3">문서서식 관리</li>						
					</ul> -->
				</a>
			</li>			
		</ul>
	</div>

	<script>
	$(function(){
		$('.nav2_settings').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
	</script>

</body>
</html>