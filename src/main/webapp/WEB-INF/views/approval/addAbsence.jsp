<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	.contentDiv {
		height: 715px;
	}
	#absenceTab {
		border-collapse:separate;
		border-spacing:10px;
	}
	#absenceTab td:nth-child(1){
		width:130px;
		font-weight:bold;
	}
	#absenceTab td:nth-child(2) {
		width:90px;
	}
	#absenceTab td:nth-child(3) {
		width:10px;
	}
	#reasonTxt {
		width:500px;
		height:40px;
		resize:none;
	}
	input[type='date'] {
		height:30px;
	}
	#selectRep {
		cursor:pointer;
		color:#0871B9;
	}
	#selectApp {
		cursor:pointer;
		color:#0871B9;
	}
	#checkBtn {
		width:100px;
		height:30px;
		background-color:#0871B9;
		color:white;
		border-radius:5px;
		border:1px solid #0871B9;	
	}
	#cancelBtn {
		width:100px;
		height:30px;
		background-color:#F7F7F7;
		border-radius:5px;
		border:1px solid #F7F7F7;
	}
	.empNameSpan {
		border-radius:5px;
		background-color:#E4E4E4;
		height:22px;
		padding: 2px 18px 2px 18px;
		line-height:18px;
		margin:5px 4px 3px 0;
		font-size:12px;
		text-align:center;
	}
	.tree_menu2 {line-height: 30px; margin-top: 20px; padding-left: 20px;}
	.tree_menu2 strong {font-weight:normal;}
	.tree_menu2 label input {vertical-align:-2px;}
	.tree_menu2 .depth_1 a {vertical-align:bottom;text-decoration:none;}
	.tree_menu2 .depth_1 strong, .form_tree_menu .form_depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu2 .depth_2_1 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
	.tree_menu2 .depth_2_1 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu2 .depth_2_1 li a em.on {background-position:0 100%;}
	.tree_menu2 li.last {background:none;}
	.tree_menu2 li.last {background:none;}
	.tree_menu2 .depth_3 {display:none;padding-left:23px;}
	.tree_menu2 .depth_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu2 .depth_3 li a, .depth_form {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu2 .depth_3 li a {display:inline-block;}
	.tree_menu2 li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.tree_menu2 .depth_1 a {
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
   	<jsp:include page="../approval/approvalMenubar.jsp"/>
   	<jsp:include page="../approval/dateinclude.jsp"/>

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle" style="font-size:18px;">결재환경설정</b>
			<br><br>
			<div class="contentDiv" style="border:0px;">
				<h5 style="font-weight:bold;">부재추가</h5>
				<hr> 
				<table id="absenceTab">
					<tr>
						<td>부재기간</td>
						<td><input type="text" id="auto-close-date-picker1" style="width:90px; padding-left:3px;"></td>
						<td>~</td>
						<td><input type="text" id="auto-close-date-picker2" style="width:90px; padding-left:3px;"></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>부재사유</td>
						<td rowspan="2" colspan="5"><textarea id="reasonTxt"></textarea></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>대결자</td>
						<td colspan="5"><span id="autSpan"></span><span id="selectRep">+ 대결자 선택</span></td>
					</tr>
					<!-- <tr>
						<td>승인자</td>
						<td colspan="5"><span id="selectApp">+ 승인자 선택</span></td>
					</tr> -->
				</table>
				<hr>
				<div style="text-align:center;">
					<button id="checkBtn">확인</button>&nbsp;
					<button id="cancelBtn">취소</button>
				</div>
			</div>
			<form action="goAuthority.ap" method="post" id="authorityForm">
			<input type="hidden" name="startDate" id="startDate">
				<input type="hidden" name="endDate" id="endDate">
				<input type="hidden" name="absenceReason" id="absenceReason">
				<input type="hidden" name="autEmpNo" id="autEmpNo">
				<input type="hidden" name="empNo" value="${ loginUser.empNo }">
				<input type="hidden" name="autEmpName" id="autEmpName">
			</form>
		</div>
		<!-- 본문 영역 끝 -->

		<jsp:include page="../approval/writeModal.jsp"/>
		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
	
	<!-- 대결자 모달 -->
	<div class="modal fade" id="mandatorModal" role="dialog">
		<div class="modal-dialog" style="width:250px; height:500px;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h5 class="modal-title">대결자 선택</h5>
				</div>
				<div class="modal-body">
					<div style="width: 220px; height:400px; border: 1px solid #c4c4c4;">
						<div class="tree_box">
							<div class="con">
								<ul id="tree_menu2" class="tree_menu2">
									
								</ul>
							</div>
						</div>
					</div>
					
				</div>
				<div class="modal-footer" style="clear: both;">
					<button type="button" id="autChk" class="btn btn-primary">적용</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
	
	
	<script>
	$(document).ready(function(){
		
		$("#writeBtn").click(function(){
	   		$("#sgnWriteModal").modal();
	   	});
		
		$(".boxListTr").click(function(){
			var docNo = $(this).children("input").val();
			location.href= "${ contextPath }/goApprovalDetail.ap?docNo=" + docNo; 
		});
		
		var autoCloseDP = $('#auto-close-date-picker1').datepicker({
		    dateFormat: 'yyyy/mm/dd',
		    language: 'en',
		    autoClose: true
		  }).data('datepicker'); 
		
		var autoCloseDP = $('#auto-close-date-picker2').datepicker({
		    dateFormat: 'yyyy/mm/dd',
		    language: 'en',
		    autoClose: true
		  }).data('datepicker'); 
		
		/* 부서 가져와서 조직도에 추가하는 AJAX */
		$.ajax({
				type:"POST",
				url :'selectDeptList.st',
				async: false,
				success:function(data){
						                    
                //회사이름 생성
                for(var key in data){
                    //console.log(deptList[key]);
                    if(data[key].depth == "1"){
                    	//console.log(deptList[key].deptName);
                    	var $top = "<li class='depth_1'><strong style='font-size: 17px;' class='comTitle'>" 
                    					+ data[key].deptName 
                    			 + "</strong></li>";	                        	
                    	$(".tree_menu2").append($top);
                    }	                        
                }
                
                //부서 생성
                for(var i = 0; i < data.length ; i++){	
                	if(data[i].depth == "2"){	   
                		
                		if(data[i].deptNo != 999){	                    			
                			var $firstLevel = "<ul class='depth_2_1'><li><a class='lideptName'><em>폴더</em>" 
                							+ data[i].deptName
                							+ "</a><ul class='depth_3'></ul></li></ul>";	                    							
                			$(".comTitle").append($firstLevel);
                			
                			//부서 삭제 모달창에도 부서 추가
                			var option = "<option value='" + data[i].deptName + "'>" + data[i].deptName + "</option>";
                    		$("#removeDeptSelect").append(option);
                			
                		}else if(data[i].deptNo == 999){
                			var $firstLevelEnd = "<ul class='depth_2_1'><li class='last'><a class='lideptName'><em>폴더</em>" 
                							+ data[i].deptName
                							+ "</a><ul class='depth_3'></ul></li></ul>";
                			$(".comTitle").append($firstLevelEnd);
                		}	                    		
                	}	                    	
                }
                
				}
		});
		
		
		/* 사원 가져와서 조직도에 추가하는 ajax */
		$.ajax({
				type:"POST",
				url :'selectMemberList.st',
				async: false,
				success:function(data){
					for(key in data){
 					//console.log(data[key]);
 					var $member = "<li class='end'><input type='hidden' value='"+ data[key].empNo +"'><a href='#none' style='width:100px;'>" + data[key].empName + " " 
 																	 + data[key].positionName 
 																	 + "</a></li>";
						//var test = $(".lideptName").index($(".lideptName:contains('총무팀')"));
						//var test = $(".lideptName:contains('총무팀')");
						//console.log(test.html());
						if(data[key].empName != '관리자' && data[key].positionName != '대표이사'){
 						$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
						}
					}
				}
		});
		
		$('ul.depth_2_1 >li > a').click(function(e) {

	          var temp_el = $(this).next('ul');
	          var depth_3 = $('.depth_3');

	          // 처음에 모두 슬라이드 업 시켜준다.
	          depth_3.slideUp(300);
	          // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
	          depth_3.parent().find('em').removeClass('on');

	          if (temp_el.is(':hidden')) {
	            temp_el.slideDown(300);
	            $(this).find('em').addClass('on').html('하위폴더 열림');
	            
	          } else {
	            temp_el.slideUp(300);
	            $(this).find('em').removeClass('on').html('하위폴더 닫힘');

	          }

	          return false;

	     });
		
		var autEmpNo;
		var autEmpName;
		
		$('ul.depth_3 > li > a').click(function(e) {
			$('ul.depth_3 > li > a').css("background-color", "white");
			$(this).css("background-color", "lightsteelblue");
			autEmpName = $(this).text();
			autEmpNo = $(this).parent().children("input").val();
		});
		
		$("#autChk").click(function(){
			$("#autSpan").empty();
			$("#autSpan").append("<span class='empNameSpan'>"+ autEmpName + "</span>");
			$("#mandatorModal").modal("hide");
			console.log(autEmpNo);
			console.log(autEmpName);
		});
		
		
		$("#selectRep").click(function() {
			$("#mandatorModal").modal();
		});
		
		
		$("#checkBtn").click(function(){
			var startDate = $("#auto-close-date-picker1").val();
			var endDate = $("#auto-close-date-picker2").val();
			var reasonTxt = $("#reasonTxt").val();

			/* console.log(startDate);
			console.log(endDate);
			console.log(reasonTxt); */
			$("#startDate").val(startDate);
			$("#endDate").val(endDate);
			$("#absenceReason").val(reasonTxt);
			$("#autEmpNo").val(autEmpNo);
			$("#autEmpName").val(autEmpName);
			
			swal({
				  title: "진행하시겠습니까?",
				  text: "'확인'을 누르시면 부재/위임 관련 결재로 자동 진행됩니다.",
				  icon: "warning",
				  buttons: ["취소", "확인"],
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    /* swal("", "등록되었습니다.", {
				      icon: "success",
				    })
				    .then((value) => {
				    	if(value == true) { */
					    	/* location.href="${contextPath}/goAppSetting.ap"; */
					    	$("#authorityForm").submit();
				    /* 	}
				    }); */
				  }
				});
			//confirm("'확인'을 누르시면 부재/위임 관련 결재로 자동 진행됩니다. \n진행하시겠습니까?");
		});
	});
		
	</script>
</body>
</html>