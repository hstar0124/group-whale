<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.calender_check{
	content: '';
	display: inline-block;
	width: 18px;
	height: 18px;
	line-height: 18px;
	text-align: center;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 3px;
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
} 
</style>

</head>
<body>

<!-- 일정관리 메뉴 -->
	<div class="nav2 nav2_calender">
		<ul>
			<li>
				<p class="menuTitlePtag">
					<img class="btn nav1_click menu_icons" src="${ contextPath }/resources/images/menubar/open-menu.png">
					<b class="menuTitle">일정관리</b>
				</p>
			</li>
			<li><p><button class="btn writeBtn" onclick="location.href='addCalender.cl'">일정등록</button></p></li>
			<li>
				<table style="width:85%; margin:0 auto;">
					<tr><td>
						<input type="checkbox" name="calender_check" class="calender_check" id="myCal" value="normal" style="width: 14px; height: 14px; margin-top:15px; margin-left: 12px;" checked>
						<label for="myCal" style="margin-left:10px; font-size:13px; verfont-weight: bold; vertical-align: middle">내 일정</label>
					</td></tr>
					<tr><td><div style="width: 100%; height: 2px; background: lightgray; margin-top: 10px; margin-bottom: 10px;"></div></td></tr>
					<tr><td>
						<input type="checkbox" name="calender_check" class="calender_check" id="allCal" value="event" style="width: 14px; height: 14px; margin-top:15px; margin-left: 12px;">
						<label for="allCal" style="margin-left:10px; font-size:13px; font-weight: bold; vertical-align: middle">전사 일정</label></td></tr>
					<tr><td>
						<input type="checkbox" name="calender_check" class="calender_check" id="exCal" value="whisper"style="width: 14px; height: 14px; margin-top:15px; margin-left: 12px;">
						<label for="exCal" style="margin-left:10px; font-size:13px; font-weight: bold; vertical-align: middle">임원 일정</label>
					</td></tr>
					<tr><td>
						<input type="checkbox" name="calender_check" class="calender_check" id="myTeamCal" style="width: 14px; height: 14px; margin-top:15px; margin-left: 12px;">
						<label for="myTeamCal" style="margin-left:10px; font-size:13px; font-weight: bold; vertical-align: middle">내 팀 일정</label>
					</td></tr>
				</table>
			</li>			
		</ul>
	</div>

<script>
	$(function(){
		$('.nav2_calender').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
</script>

</body>
</html>