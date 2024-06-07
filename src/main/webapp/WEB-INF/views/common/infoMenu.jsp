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
	<div class="nav2 nav2_info">
		<ul>
			<li>
				<p class="menuTitlePtag">
					<img class="btn nav1_click menu_icons" src="${ contextPath }/resources/images/menubar/open-menu.png">
					<b class="menuTitle">회원정보 수정</b>
				</p>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1 sub1_f1" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_1" onclick="location.href='updateMember.me'">계정 정보 수정</b>			
					<ul style="display: none;">
						<li class="menuTitle_sub2 sub2_1"></li>
					</ul>	
				</a>
			</li>
			<li>
				<a href="#" class="nav2_a">
					<img class="btn forder1  sub1_f2" src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_2" onclick="location.href='showChangePwd.me'">암호 변경</b>
					<ul style="display: none;">
						<li class="menuTitle_sub2 sub2_2"></li>
					</ul>	
				</a>
			</li>
				
		</ul>
	</div>

	<script>
	$(function(){
		$('.nav2_info').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
		
		/* //하나 열렸을 때에 다른 하나는 닫힌 이미지로 변경
		$(".nav2_a").click(function(){
			//console.log($(this).find('img').attr("src"));
			$(".nav2_a").find('img').each(function(){
				$(this).attr("src", "/gw/resources/images/menubar/forder2.png");
			});
			$(this).find('img').attr("src", "/gw/resources/images/menubar/forder.png");
		}); */
	});
	</script>

</body>
</html>