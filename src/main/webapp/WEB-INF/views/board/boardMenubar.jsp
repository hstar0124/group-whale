<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<!-- 게시판 메뉴 -->
	<div class="nav2 nav2_board">
		<ul>
			<li>
				<p class="menuTitlePtag">
					<img class="btn nav1_click menu_icons" src="${ contextPath }/resources/images/menubar/open-menu.png">
					<b class="menuTitle">게시판</b>
				</p>
			</li>
			<!-- <li><p><button class="btn writeBtn" onclick="write();">작성하기</button></p></li> -->
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1 sub1_f1" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_1" onclick="location.href='main.bo;'">공지사항</b>
					<!-- <ul>
						<li class="menuTitle_sub2 sub2_1">공지사항</li>
						<li class="menuTitle_sub2 sub2_1">휴가신청</li>
						<li class="menuTitle_sub2 sub2_1">연장근무</li>
					</ul> -->
				</a>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f2" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_2" onclick="location.href='selectListAllBoard.bo;'">전사 게시판</b>
					<!-- <ul>
						<li class="menuTitle_sub2 sub2_2">전사 게시판</li>
						<li class="menuTitle_sub2 sub2_2">결재대기함</li>
						<li class="menuTitle_sub2 sub2_2">결재진행함</li>
						<li class="menuTitle_sub2 sub2_2">완료문서함</li>
						<li class="menuTitle_sub2 sub2_2">반려문서함</li>
						<li class="menuTitle_sub2 sub2_2">참조/열람문서함</li>
					</ul> -->
				</a>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f3" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_3" onclick="location.href='survey.bo;'">설문</b>
					<!-- <ul>
						<li class="menuTitle_sub2 sub2_3">설문</li>
						<li class="menuTitle_sub2 sub2_2">결재대기함</li>
						<li class="menuTitle_sub2 sub2_2">결재진행함</li>
						<li class="menuTitle_sub2 sub2_2">완료문서함</li>
						<li class="menuTitle_sub2 sub2_2">반려문서함</li>
						<li class="menuTitle_sub2 sub2_2">참조/열람문서함</li>
					</ul> -->
				</a>
			</li>
			<%-- <li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f3" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_3">발신/수신</b>
					<ul>
						<li class="menuTitle_sub2 sub2_3">부서수신함</li>
						<li class="menuTitle_sub2 sub2_3">공문수신함</li>
						<li class="menuTitle_sub2 sub2_3">공문발신함</li>
					</ul>
				</a>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f4" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_4">개인보관함</b>
					<ul>
						<li class="menuTitle_sub2 sub2_4">부서문서함</li>
						<li class="menuTitle_sub2 sub2_4">개인문서함</li>
					</ul>
				</a>
			</li>
			<li>
				<a href="#" class="setting_a nav2_a">
					<img class="btn setting_icons" src="${ contextPath }/resources/images/menubar/gear.png">
					<b class="menuTitle_sub1">전자결재 환경설정</b>
				</a>
			</li> --%>
			
			<li>
				<a href='feedMain.fd' class="nav2_a">
					<img class="btn forder1 sub1_f4" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_4">커뮤니티</b>					
				</a>
			</li>
			<li>
				<a class="nav2_a" style="margin-bottom: -5px;">
					<img class="btn forder1 sub1_f5" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_5 btn2">자유 게시판</b>					
				</a>
				<ul>
					<li class="menuTitle_sub2 sub2_5 btn2" onclick="goClub();" style="display: list-item; font-size: 12px;">동호회 게시판</li>
					<li class="menuTitle_sub2 sub2_5 btn2" onclick="goPlace();" style="display: list-item; font-size: 12px;">포토 갤러리</li>
					<li class="menuTitle_sub2 sub2_5 btn2" onclick="goEducation();" style="display: list-item; font-size: 12px;">신입사원 교육</li>
				</ul>
			</li>
			
		</ul>
	</div>
	
<script>
	$(function(){
		$(".sub2_5").hide();
		
	});

	function goClub() {
		location.href = "${ contextPath }/goClub.cu"; 
	}
	
	function goPlace() {
		location.href = "${ contextPath }/goPlace.gp"; 
	}
	
	function goEducation() {
		location.href = "${ contextPath }/goEducation.ed"; 
	}

</script>
	
</body>
</html>