<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	   <jsp:include page="../common/menubar.jsp" />

<!-- 메일 메뉴 -->
	<div class="nav2 nav2_mail">
		<ul>
			<li>
				<p class="menuTitlePtag">
					<img class="btn nav1_click menu_icons" src="${ contextPath }/resources/images/menubar/open-menu.png">
					<b class="menuTitle">메일</b>
				</p>
			</li>
			<li><p><button class="btn writeBtn" onclick="location.href='sendform.ml'">메일 쓰기</button></p></li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1 sub1_f1" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_1">전체 메일</b>
					<ul>						<!-- 여기 링크 -->
						<li class="menuTitle_sub2 sub2_1" onclick="location.href='main.ml;'" style="display: list-item; font-size:12px;">받은 메일함</li>
						<li class="menuTitle_sub2 sub2_1" onclick="location.href='send.ml;'" style="display: list-item; font-size:12px;">보낸 메일함</li>
						<li class="menuTitle_sub2 sub2_1" onclick="location.href='important.ml;'" style="display: list-item; font-size:12px;">중요 메일함</li>
						<li class="menuTitle_sub2 sub2_1" onclick="location.href='temporary.ml;'" style="display: list-item; font-size:12px;">임시 보관함</li>
						<li class="menuTitle_sub2 sub2_1" onclick="location.href='spam.ml;'" style="display: list-item; font-size:12px;">스팸 메일함</li>
						<li class="menuTitle_sub2 sub2_1" onclick="location.href='trash.ml;'" style="display: list-item; font-size:12px;">휴지통</li>
					</ul>
				</a>
			</li>
			
		</ul>
	</div>
	
	<script>
	$(function(){
		$('.nav2_mail').show();
		//$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
</script>
</body>
</html>