<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menuTitle_sub2 {
		font-size:12px;
	}
	.closeImg {
		width:8px;
		height:8px;
		cursor:pointer;
	}
	.edit {
		width:36px;
		height:24px;
		cursor:pointer
	}
	
</style>
<script>
	function goAppDraft() {
		location.href="${contextPath}/goAppDraft.ap";
	}
	
	function goAppWait() {
		location.href="${contextPath}/goAppWait.ap";
	}
	
	function goAppProceed() {
		location.href="${contextPath}/goAppProceed.ap";
	}
	
	function goAppComplete() {
		location.href="${contextPath}/goAppComplete.ap";
	}
	
	function goAppReject() {
		location.href="${contextPath}/goAppReject.ap";
	}
	
	function goAppRef() {
		location.href="${contextPath}/goAppRef.ap";
	}
	
	function goAppSetting() {
		location.href="${contextPath}/goAppSetting.ap";
	}
	
	function goDeptDoc() {
		location.href="${contextPath}/goDeptDoc.ap";
	}
	
	function goPerDoc() {
		location.href="${contextPath}/goPerDoc.ap";
	}
	
	function goTempDoc() {
		location.href="${contextPath}/goTempDoc.ap";
	}
	function goAppPlan() {
		location.href="${contextPath}/goAppPlan.ap";		
	}
</script>
</head>
<body>
	<!-- 전자결재 메뉴 -->
	<div class="nav2 nav2_approval">
		<ul>
			<li>
				<p class="menuTitlePtag">
					<img class="btn nav1_click menu_icons"
						src="${ contextPath }/resources/images/menubar/open-menu.png">
					<b class="menuTitle">전자결재</b>
				</p>
			</li>
			<li><p>
					<button id="writeBtn" class="btn writeBtn">작성하기</button>
				</p></li>
			<li><a href="#" class="nav2_a"> <img
					class="btn forder1 sub1_f1"
					src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_1">자주쓰는 양식</b><img class="btn edit" id="editImg" src="${ contextPath }/resources/images/approval/edit.png">
					<ul class="sub1_ul">
						<%-- <li class="menuTitle_sub2 sub2_1">업무기안&nbsp;&nbsp;&nbsp;<span class="closeSpan"><img class="closeImg" src="${ contextPath }/resources/images/approval/close.png"></span></li>
						<li class="menuTitle_sub2 sub2_1">휴가신청&nbsp;&nbsp;&nbsp;<span class="closeSpan"><img class="closeImg" src="${ contextPath }/resources/images/approval/close.png"></span></li>
						<li class="menuTitle_sub2 sub2_1">연장근무&nbsp;&nbsp;&nbsp;<span class="closeSpan"><img class="closeImg" src="${ contextPath }/resources/images/approval/close.png"></span></li>
					 --%>
					</ul>
			</a></li>
			<li><a href="#" class="nav2_a"> <img
					class="btn forder1  sub1_f4"
					src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_4">기안</b>
					<ul>
						<!-- <li class="menuTitle_sub2 sub2_4" onclick="goDeptDoc();">부서문서함</li>
						<li class="menuTitle_sub2 sub2_4" onclick="goPerDoc();">개인문서함</li> -->
						<li class="menuTitle_sub2 sub2_4" onclick="goAppDraft();">결재요청함</li>
						<li class="menuTitle_sub2 sub2_4" onclick="goTempDoc();">임시저장함</li>
					</ul>
			</a></li>
			<li><a href="#" class="nav2_a"> <img
					class="btn forder1  sub1_f2"
					src="${ contextPath }/resources/images/menubar/forder2.png">
					<b class="menuTitle_sub1 sub1_2">결재</b>
					<ul>
						<li class="menuTitle_sub2 sub2_2" onclick="goAppWait();">결재대기함</li>
						<li class="menuTitle_sub2 sub2_2" onclick="goAppPlan();">결재예정함</li>
						<li class="menuTitle_sub2 sub2_2" onclick="goAppProceed();">결재진행함</li>
						<li class="menuTitle_sub2 sub2_2" onclick="goAppComplete();">완료문서함</li>
						<li class="menuTitle_sub2 sub2_2" onclick="goAppReject();">반려문서함</li>
						<li class="menuTitle_sub2 sub2_2" onclick="goAppRef();">참조/열람문서함</li>
					</ul>
			</a></li>
			
			<li><a href="#" class="setting_a nav2_a"> <img
					class="btn setting_icons"
					src="${ contextPath }/resources/images/menubar/gear.png"> <b
					class="menuTitle_sub1" onclick="goAppSetting();">전자결재 환경설정</b>
			</a></li>
		</ul>
	</div>
	<script>
		$(document).ready(function(){
			
			
			var index = 0;
			$("#editImg").click(function(){
				index++;
				if(index % 2 == 1) {
					$(".closeSpan").show();
				} else {
					$(".closeSpan").hide();					
				}
			});
			
			$.ajax({
				type:"POST",
				url:"selectMostUseForm.ap",
				async:false,
				success:function(data) {
					for(var key in data) {
						//console.log(data[key]);
						var $li = '<li class="menuTitle_sub2 sub2_1"><label style="font-weight:normal;margin-bottom:0px;" class="formNameLab">'+ data[key].formName + '</label>&nbsp;&nbsp;&nbsp;'
									+ '<input type="hidden" value=" '+ data[key].formNo + '">' 
									+ '<span class="closeSpan"><img class="closeImg" src="${ contextPath }/resources/images/approval/close.png"></span></li>';
						$(".sub1_ul").append($li); 
						
						$(".closeSpan").hide();
					}
				}
			});
			
			$(".formNameLab").click(function(){
				var formNo = $(this).parent().children("input").val();
				formNo *= 1;
				location.href = "${ contextPath }/goWriteForm.ap?formNo=" + formNo; 
			});
			
			$(".closeImg").click(function(){
				var formNo = $(this).parent().parent().children("input").val();
				
				/* $.ajax({
					type:"POST",
					url:"deleteMostUseForm.ap",
					data:{formNo:formNo},
					success: function(data) {
						
					}
				}); */
				
				console.log(formNo);
				location.href="${contextPath}/deleteMostUseForm.ap?formNo=" + formNo + "";
			});
			
			
		});
	</script>
</body>
</html>