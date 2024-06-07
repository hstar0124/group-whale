<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>	


	#systemMainDiv{
		width: 800px;
		height: 500px;
		border: 0.2px solid #ccd3d9;
		border-radius: 10px;
		margin: 0 auto;
	}
	
	#depListDiv{
		width: 40%;
		height: 500px;
		float: left;
		border-right: 0.2px solid #ccd3d9;
	}
	
	#empListDiv{
		width: 60%;
		padding-left: 10px;
		height: 500px;
		float: left;	
	}
	
	#depListDivTitle{
		width: 100%;
		height: 50px;
		line-height: 50px;
		vertical-align: middle;		
	}
	#empListDivTitle{
		width: 100%;
		height: 50px;
		line-height: 50px;
		vertical-align: middle;		
	}
	
	#depListDivBody{
		width: 100%;
		height: 90%;		
		padding-top: 15px;
	}
	
	#empListDivBody{
		width: 100%;
		height: 90%;		
		padding-top: 15px;
	}
	
	.empListBtn{
		width: 100px;
		height: 30px;
		line-height: 25px;
		float: right;
		margin-right: 10px;
		margin-top: 10px; 
		text-align: center;
		border-radius: 5px;
	}
	
	.depListBtn{
		width: 80px;
		height: 30px;
		line-height: 25px;
		float: right;
		margin-right: 10px;
		margin-top: 10px; 
		text-align: center;
		border-radius: 5px;
	}
	
	#depAddBtn{
		background: #0871B9;
		color: white;
		border: 1px #0871B9 solid;
	}
	#depRemoveBtn{
		border: 1px #BDBDBD solid;
		background: white;
		color: #FF3A3A;
	}
	
	#empRemoveBtn{
		border: 1px #BDBDBD solid;
		background: white;
		color: #FF3A3A;
	}
	#empAddBtn{
		background: #0871B9;
		color: white;
		border: 1px #0871B9 solid;
	}
	
	#empListTable{
		text-align: center;
	}

	
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

table th{
	border-bottom: 1px solid #0871B9;
	padding: 10px;
	text-align: center;
	height: 40px;
}

table td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	height: 40px;
}

thead tr {
	background-color: #0871B9;
	color: #ffffff;
}

tbody tr:nth-child(2n) {
	background-color: white;
}

tbody tr:nth-child(2n+1) {
	background-color: white;
}

#memberListTable{
	width: 100%;
}

	
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}

/* 조직원 추가 모달 스타일 */
	.modal-body{
		width: 750px;
		height: 380px;
	}
	
	.modal-body-div{
		height: 350px;				
		margin-left: 20px;
		float:left;
	}
	
	.model-addList-label{
		height: 50px;
		line-height: 50px;
		margin: 0;
		font-size: 20px;
		color: white;
	}
	
	#model-choose-label{
		margin-left: 10px;
		float: left;
	}
	#model-choose-cancel{
		margin-right: 10px;
		float: right;
		cursor: pointer;
	}
	
	#modal-body-empList{
		width: 280px;
	}
	
	#modalAddMemberTable{
		width: 95%;
		border: 0px;
	}
	#modalAddMemberTable td {
		border-bottom: 1px solid #c9c9c9;
	}
	
	#modal-body-chooseList{
		width: 300px;
		border: 1px solid #ccd3d9;
	}
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}

	/* 트리메뉴 */
	.tree_box { width:280px; height:350px; border:1px solid #ccd3d9; margin:0 auto; border-radius: 5px;}
	
	.tree_box .title { padding:5px 0 5px 19px ;background:#f8f8f9;border-bottom:1px solid #ccd3d9;}
	.tree_box .title strong {margin-right:12px;}
	.tree_menu {line-height: 30px; margin-top: 20px; padding-left: 20px;}
	.tree_menu strong {font-weight:normal;}
	.tree_menu label input {vertical-align:-2px;}
	.tree_menu .depth_1 a {vertical-align:bottom;text-decoration:none;}
	.tree_menu .depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu .depth_2 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
	.tree_menu .depth_2 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu .depth_2 li a em.on {background-position:0 100%;}
	.tree_menu li.last {background:none;}
	.tree_menu li.last {background:none;}
	.tree_menu .depth_3 {display:none;padding-left:23px;}
	.tree_menu .depth_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu .depth_3 li a {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu .depth_3 li a {display:inline-block;}
	.tree_menu li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.form_tree_menu .depth_1 {background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 5px;}
	.form_tree_menu ul.depth_2 li {margin-left:6px;padding-left:27px;background:url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6) no-repeat 0 5px;}
	
	.con{height: 320px;}
	
	.modal-addList{
		width: 100%;		
	}
	
	#modal-addListHead-div{
		height: 50px;
		background: #1990E1;
	}
	#modal-addListbody-div{
		height: 300px;
		border: 1px solid #ccd3d9;
		padding-top: 10px;
		padding-left: 10px;
	}
	
	/* 조직원 모달 스타일 끝 */

	/* 조직원 이동 확인 모달창 스타일 */
	#addEmpBody{
		width: 100%;
		height: 400px;
	}


	/* 부서 추가 모달 스타일 */
	#addDeptBody{
		width: 350px;
		height: 110px;
	}
	.addDeptModalDiv{
		widht: 100%;
		height: 60px;
		line-height: 60px;
		text-align: center;
	}
	.addDeptLabel{
		width: 70px;
		height: 30px;
	}
	.addDeptInput{
		width: 170px;
		height: 30px;
	}
	
	#deptCheck{
		width: 100%;
		text-align:center;
		font-size: 12px;
		/* color: #53C251; */
	}
	/* 부서 추가 모달 스타일 끝 */
	
	
	/* 부서 삭제 모달 스타일 */
	#removeDeptBody{
		width: 350px;
		height: 110px;
	}
	.removeDeptModalDiv{
		widht: 100%;
		height: 60px;
		line-height: 60px;
		text-align: center;
	}
	.removeDeptLabel{
		width: 100px;
		height: 30px;
	}
	.removeDeptInput{
		width: 170px;
		height: 30px;
	}
	#removeCheck{
		width: 100%;
		text-align: center;
		font-size: 12px;
		color: red;
		margin: 0;
	}
	#removeDeptSelect{
		width: 150px;
		height: 30px;
	}
	
	/* 부서 삭제 모달 스타일 끝 */

	.lideptName{
		cursor: pointer;
	}

</style>
<script>
	$(function(){
		$('.nav2_settings').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />

	<jsp:include page="settingsMenu.jsp" />




		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">조직도 관리</b>
			<br><br>
			<div class="contentDiv" style="border: 0; border-radius: 10px;">
			
				<div id="systemMainDiv">
					<div id="depListDiv">
						<div id="depListDivTitle">
							<label style="margin: 0; margin-left: 10px; font-size: 20px;">조직도 목록</label>
							
							<button class="depListBtn" id="depRemoveBtn" data-toggle="modal" data-target="#removeDeptModal">부서 삭제</button>
							
							<button class="depListBtn" id="depAddBtn"  data-toggle="modal" data-target="#addDeptModal">부서 추가</button>
						</div>
						<div id="depListDivBody">
						
						<div>
							<!-- 트리메뉴-->
								<!-- 마지막 리스트부분에 class="last",class="end" 넣어주세요 -->
								<div class="tree_box">
								    <div class="con">
								        <ul id="tree_menu" class="tree_menu">
								        
								            <!-- <li class="depth_1">
								            	<strong style="font-size: 20px;" id="comTitle">업사이클</strong>
								                
								                <ul class="depth_2" >
								                    <li>
								                        <a href="#none"><em>폴더</em> 총무팀</a>
								                        <ul class="depth_3">
								                            <li><a href="#none">박해영 과장</a></li>
								                            <li class="end"><a href="#none">차수현 대리</a></li>
								                        </ul>
								                    </li>								                    
								                </ul>   
								                
								                <ul class="depth_2" >
								                    <li>
								                        <a href="#none"><em>폴더</em> 영업팀</a>
								                        <ul class="depth_3">
								                            <li><a href="#none">황인성 과장</a></li>
								                            <li><a href="#none">이호성 대리</a></li>								                            
								                            <li class="end"><a href="#none">장대현 사원</a></li>
								                        </ul>
								                    </li>								                    
								                </ul>   
								                
								             	<ul class="depth_2" >
								                    <li>
								                        <a href="#none"><em>폴더</em> 인사팀</a>
								                        <ul class="depth_3">
								                            <li><a href="#none">이지호 차장</a></li>
								                            <li class="end"><a href="#none">박다영 대리</a></li>
								                        </ul>
								                    </li>								                    
								                </ul>   
								                
								               <ul class="depth_2" >
								                    <li>
								                        <a href="#none"><em>폴더</em> 관리팀</a>
								                        <ul class="depth_3">
								                            <li><a href="#none">이재한 과장</a></li>
								                            <li class="end"><a href="#none">김범주 대리</a></li>
								                        </ul>
								                    </li>								                    
								                </ul>   
								                
								                <ul class="depth_2" >
								                    <li class="last">
								                        <a href="#none"><em>폴더</em> 미지정</a>
								                        <ul class="depth_3">
								                            <li class="end"><a href="#none">미지정 사원</a></li>
								                        </ul>
								                    </li>								                    
								                </ul>  								                
								            </li> -->
								            
								            
								        </ul>								        
								        
								    </div>
								</div>
								<!--//트리메뉴-->
						</div>						
						</div>
					</div>
					
					
					<div id="empListDiv">
						<div id="empListDivTitle">
							<label style="margin: 0; margin-left: 10px; font-size: 20px;">부서원 관리</label>
							<!-- <button class="empListBtn" id="empRemoveBtn" data-toggle="modal" data-target="#removeEmpModal">부서원 삭제</button> -->
							<button class="empListBtn" id="empRemoveBtn">부서원 삭제</button>
							<!-- <button class="empListBtn" id="empAddBtn" data-toggle="modal" data-target="#myModal">부서원 추가</button> -->
							<button class="empListBtn" id="empAddBtn">부서원 추가</button>
						</div>
						
						<div id="empListDivBody">
							 <table class="table table-striped" id="empListTable">
							 	<colgroup>
							 		<col width="5%"/>
							 		<col width="30%"/>
							 		<col width="25%"/>
							 		<col width="40%"/>
							 	</colgroup>
							     <thead>							    
							      <tr>
							      	<th><input type="checkbox" name="chkAll"></th>
							        <th>이름</th>
							        <th>직책</th>
							        <th>핸드폰번호</th>
							      </tr>
							    </thead>
							    <tbody>
							    
							      <!-- <tr>
							      	<td><input type="checkbox"></td>
							        <td>박해영 과장</td>
							        <td><select>
										<option selected="selected">팀장</option>						        
										<option>없음</option>
							        </select></td>
							        <td>010-1111-2456</td>
							      </tr>		
							      
							       <tr>
							      	<td><input type="checkbox"></td>
							        <td>차수현 대리</td>
							        <td><select>
										<option selected="selected">없음</option>
										<option>팀장</option>						        
							        </select></td>
							        <td>010-1111-2456</td>
							      </tr>		 -->
							      					     
							    </tbody>
							  </table>							
						</div>					
					</div>
				</div>
			
			
			</div>
			
		</div>
		<!-- 본문 영역 끝 -->
		
		
		<!-- 조직도 세팅 ajax -->
		<script>
			$(function(){
				
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
	                        	var $top = "<li class='depth_1'><strong style='font-size: 20px;' class='comTitle'>" 
	                        					+ data[key].deptName 
	                        			 + "</strong></li>";	                        	
	                        	$(".tree_menu").append($top);
	                        }	                        
	                    }
	                    
	                    //부서 생성
	                    for(var i = 0; i < data.length ; i++){	
	                    	if(data[i].depth == "2"){	   
	                    		
	                    		if(data[i].deptNo != 999){	                    			
	                    			var $firstLevel = "<ul class='depth_2'><li><a class='lideptName'><em>폴더</em>" 
	                    							+ data[i].deptName
	                    							+ "</a><ul class='depth_3'></ul></li></ul>";	                    							
	                    			$(".comTitle").append($firstLevel);
	                    			
	                    			//부서 삭제 모달창에도 부서 추가
	                    			var option = "<option value='" + data[i].deptName + "'>" + data[i].deptName + "</option>";
		                    		$("#removeDeptSelect").append(option);
	                    			
	                    		}else if(data[i].deptNo == 999){
	                    			var $firstLevelEnd = "<ul class='depth_2'><li class='last'><a class='lideptName'><em>폴더</em>" 
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
		 					var $member = "<li class='end'><a href='#none' onclick='openEmpInfo(this);'>" + data[key].empName + " " 
		 																	 + data[key].positionName 
		 																	 + "<span style='display: none;'>|" + data[key].deptName + "</span>"
    	 																	 + "<span style='display: none;'>|" + data[key].empNo + "</span>"
		 																	 + "</a></li>";
	 						//var test = $(".lideptName").index($(".lideptName:contains('총무팀')"));
	 						//var test = $(".lideptName:contains('총무팀')");
	 						//console.log(test.html());
	 						if(data[key].empName != '관리자'){
		 						$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
	 						}
	 					}
	 				}
				});
				
				
				/* 부서명 클릭시 오른쪽 부서원 리스트 세팅하는 ajax */
				$(".lideptName").click(function(){
					//눌림 팀 이름을 구하기 위해서 뒤에서부터 3자리를 자른다
					//console.log($(this).html().substr($(this).html().length-3, 3));
					
					var $hiddenSpan = "<span style='display:none;'>" + $(this).html().substr($(this).html().length-3, 3) + "</span>"
					
					if(!$("#myModal").is(':visible')){
						$("#empListDivBody").find('span').remove();
						$("#empListDivBody").append($hiddenSpan);
					}
					//조직도 이동 모달창이 닫혀 있을 때만 작동하게 세팅
					if(!$("#myModal").is(':visible')){
						$.ajax({						
							type: 'get',
							url: 'selectMemberListInDept.st',
							data: {
								"deptName" : $(this).html().substr($(this).html().length-3, 3)
							},
							async: false,
			 				success:function(data){
			 					console.log(data);	
			 					
			 					$("input[name=chkAll]").prop("checked",false);
			 					
			 					var $empListTable = $("#empListTable > tbody");
			 					$empListTable.empty();
			 					
			 					for(key in data){
				 						if(data[key].empName != '관리자'){
				 							var $tr =  "<tr><td><input type='checkbox' name='chk'> " 
				 								 + "<input type='hidden' name='empNo' value='" + data[key].empNo + "'>"
				 								 + "<input type='hidden' name='dutyNo' value='" + data[key].dutyNo + "'>" 
				 								 + "<input type='hidden' name='deptNo' value='" + data[key].deptNo + "'></td>" 
											     + "<td>" + data[key].empName + " " + data[key].positionName + "</td>"
											     + "<td>" + data[key].dutyName + "</td>"
											     + "<td>" + data[key].phone + "</td></tr>";
											      		 						
			 							$empListTable.append($tr);	
			 						}		
			 					}
			 				}						
						});
						
	 					if($(this).html().substr($(this).html().length-3, 3) == '미지정'){
	 						//console.log('미지정');
	 						$("#empAddBtn").attr('disabled', false);
	 						$("#empRemoveBtn").attr('disabled', true).css({"background":"#c9c9c9", "color":"white"}); 						
	 					}else{
	 						$("#empAddBtn").attr('disabled', false);
	 						$("#empRemoveBtn").attr('disabled', false).css({"background":"white", "color":"#FF3A3A"});
	 					}
						
					}
					
				});
				
			}); 
		</script>


		<!-- 조직도 작동 스크립트 -->
		<script>
		$(document).ready(function() {

		      $('ul.depth_2 >li > a').click(function(e) {

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
		   });
		
		function openEmpInfo(id){
			//console.log('눌림');
			if(!$("#myModal").is(':visible')){
				var empNo = $(id).find('span').eq(1).html().substr(1);
				console.log(empNo);
				var newWin;
				var setting = "width=850, height=650, top=0, left=200, scrollbars=auto";
				newWin = window.open("${ contextPath }/empInfo.me?empNo=" + empNo, "", setting);
				newWin.focus();				
			}

		}
		</script>
		
		


		<!-- 이동할 부서원 모달 영역 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width:670px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModalLabel">조직도</h4>
						</div>
						<div class="modal-body">
							<div class="modal-body-div" id="modal-body-empList">
								<!-- 트리메뉴-->
								<!-- 마지막 리스트부분에 class="last",class="end" 넣어주세요 -->
								<div class="tree_box">
								    <div class="con">
								        <ul id="tree_menu" class="tree_menu">
								            
								            
								            
								        </ul>
								    </div>
								</div>
								<!--//트리메뉴-->
							</div>
							<div class="modal-body-div" id="modal-body-chooseList">
								<div id="modal-addListHead-div" class="modal-addList">	
									<label id="model-choose-label" class="model-addList-label">선택</label>
									<label id="model-choose-cancel" class="model-addList-label">X</label>															
								</div>
								<div id="modal-addListbody-div" class="modal-addList">
									<!-- 김범준 대리 | 총무팀 -->
									<table id="modalAddMemberTable">
										<colgroup>
											<col width="60%" />
											<col width="40%" />
										</colgroup>
										<tr>
											<td>test</td>
											<td>1234</td>
										</tr>
									</table>
								</div>				
								
							</div>
						</div>
						<div class="modal-footer">
						<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addEmpModal"  data-dismiss="modal">확인</button> -->
						<button type="button" class="btn btn-primary" data-toggle="modal" id="myModalSubmit">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 이동할 부서원 모달 영역 끝-->		
		<script>
			$("#model-choose-cancel").click(function(){
				$("#modalAddMemberTable tbody").empty();
				$("#addEmpBodyTable tbody").empty();
			});
			
			
			$(function(){
				
				$("#empAddBtn").click(function(){
					//console.log($("#empListTable tbody").find('td'));
					//var test = $(".lideptName").index($(".lideptName:contains('총무팀')"));
					//if($(".lideptName").index($(".lideptName:contains('하위폴더 열림')")) < 1){
					if($("#empListDivBody").find('span').length < 1){
						//$("#myModal").modal('show');
						//console.log($("#empListDivBody").find('span').html());
						swal("부서를 먼저 활성화 시켜주세요.");
					}else {
						//console.log($("#empListTable tbody").find('td').text());
						$("#modalAddMemberTable tbody").empty();
						//console.log($("#empListDivBody").find('span').html());
						$("#addEmpBodyTable tbody").empty();
						$("#myModal").modal('show');													
					}
				});
				
				$("#myModalSubmit").click(function(){
					if($("#modalAddMemberTable tbody").find('td').text() == ''){
						swal("이동시킬 부서원을 선택해주세요.");
					}else {
						$("#myModal").modal('hide');	
						$("#addEmpModal").modal('show');
					}
				});
				
				
				$(".end").click(function(){
					//console.log($(this).find('a').text());
					var name = $(this).find('a').text().split("|")[0];
					var dept = $(this).find('a').text().split("|")[1];
					//console.log(name);
					//console.log(dept);
					
					var $tr = "<tr><td>" + name + "</td><td>" + dept + "</td></tr>"
					
					
					var $reTr = "<tr><td>" + name + "<input type='hidden' name='deptHistoryNo' value='1'><input type='hidden' name='empNo' value='" + name.substr(0,3) + "'>" + "</td><td>" 
										   + dept + "<input type='hidden' name='originDep' value='" + dept + "'>" + "</td><td>" 
										   + $("#empListDivBody").find('span').text() + "<input type='hidden' name='changeDep' value='" + $("#empListDivBody").find('span').text() + "'>" + "</td></tr>"; 
					
					if(dept == $("#empListDivBody").find('span').text() && $("#myModal").is(':visible') ){
						swal("같은 부서로 이동은 불가능합니다.");
					}else {
						
						$("#modalAddMemberTable tbody").append($tr);
						$("#addEmpBodyTable tbody").append($reTr);	
						
						//같은 사람 추가하는거 막기
						$("#modalAddMemberTable td").each(function(){
							if($(this).html() == name){
								console.log($(this).html());
							
								if($("#modalAddMemberTable tbody:last tr:contains(" + name + ")").length > 1){
									$("#modalAddMemberTable tbody:last tr:contains(" + name + "):last").remove();
									$("#addEmpBodyTable tbody:last tr:contains(" + name + "):last").remove();
								}
							}
							
						});
					}
				});
			});					
		</script>
		
		
		<!-- 부서원 추가 확인 모달창 -->
		<div class="modal fade" id="addEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width:350px; height: 500px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModalLabel">부서원 이동 알림</h4>
					</div>
					<div class="modal-body" id="addEmpBody">
					
					
						<form action="moveEmpDept.st" method="post" id="addEmpModalForm">
							<table id="addEmpBodyTable">
								<colgroup>
									<col width="40%">
									<col width="30%">
									<col width="30%">
								</colgroup>
								<thead>
									<th>이름</th>
									<th>원래부서</th>
									<th>이동부서</th>
								</thead>			
								<tbody>
									<tr>
										<td>김범준 대리<input type="hidden" name="empNo"></td>
										<td>관리팀<input type="hidden" name="originDep" value="관리팀"></td>
										<td>총무팀<input type="hidden" name="changeDep" value="총무팀"></td>							
									</tr>
								</tbody>
							</table>							
						</form>
						
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="addModalSubmitBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 부서원 추가 확인 모달창 끝 -->
		
		<script>
			$(function(){
				$("#addModalSubmitBtn").click(function(){
					$("#addEmpModalForm").submit();					
				});
			});
		</script>
		
		
		<!-- 부서원 삭제 확인 모달창 -->
		<div class="modal fade" id="removeEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width:350px; height: 500px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModalLabel">부서원 삭제 알림</h4>
					</div>
					<div class="modal-body" id="addEmpBody">
					
					
						<form action="moveEmpDept.st" method="post" id="removeEmpModalForm">
						<table id="removeEmpModalTable">
							<colgroup>
								<col width="40%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<thead>
								<th>이름</th>
								<th>직책</th>
								<th>부서명</th>
							</thead>			
							<tbody>
								<tr>
									<td>김범준 대리</td>
									<td>미지정</td>
									<td>총무팀</td>							
								</tr>
							</tbody>
						</table>
						</form>
						
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="removeEmpModalSubmit">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 부서원 삭제 확인 모달창 끝 -->
		<script>
			$(function(){				
			    //최상단 체크박스 클릭
			    $("input[name=chkAll]").click(function(){
			        //클릭되었으면
			        if($("input[name=chkAll]").prop("checked")){
			            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			            $("input[name=chk]").prop("checked",true);			            
			            //클릭이 안되있으면
			        }else{
			            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			            $("input[name=chk]").prop("checked",false);
			            $("#removeEmpModalTable tbody").empty();
			        }
			    });
			    
			    //data-toggle="modal" data-target="#removeEmpModal"
			    $("#empRemoveBtn").click(function(){
			    	$("#removeEmpModalTable tbody").empty();
			    	//부서가 활성화 되어있는지 체크
			    	if($(".lideptName").index($(".lideptName:contains('하위폴더 열림')")) < 1){
			    		swal("부서를 먼저 활성화 시켜주세요.");
			    	} else {
			    		//부서가 활성화 되어 있어도 하나라도 체크를 했는지 확인
			    		if($("input:checkbox[name=chk]:checked").length > 0){
			    			
			    			$("input:checkbox[name=chk]:checked").each(function() {
			    				//empNo
			    				//console.log($(this).parent().children().eq(1).val());
			    				//empName !
			    				//console.log($(this).parent().parent().find('td').eq(1).html().substr(0,3));
			    				//dutyNo !
			    				//console.log($(this).parent().children().eq(2).val());
			    				//deptNo
			    				//console.log($(this).parent().children().eq(3).val());
			    				//deptName !
			    				//console.log($("#empListDivBody").find('span').html());
			    				//dutyName
			    				//console.log($(this).parent().parent().find('td').eq(2).html());
			    				
			    				// 이름, 직책, 부서명
			    				var $tr = "<tr><td><input type='hidden' name='empNo' value='" + $(this).parent().children().eq(1).val() + "''>" 
			    									+ "<input type='hidden' name='deptHistoryNo' value='0'>" 			
			    									+ $(this).parent().parent().find('td').eq(1).html().substr(0,3) + "</td>"
			    						+ "<td><input type='hidden' name='changeDep' value='999'>" 
			    									+ $(this).parent().parent().find('td').eq(2).html() + "</td>"
			    					    + "<td><input type='hidden' name='originDep' value='" + $(this).parent().children().eq(3).val() + "'>" 
			    					    			+ $("#empListDivBody").find('span').html() + "</td></tr>";
			    				
			    				$("#removeEmpModalTable tbody").append($tr);
			    			});  			    			
				    		$("#removeEmpModal").modal();
				    		
			    		}else {
			    			swal("삭제할 부서원을 체크해주세요.");
			    		}
			    	}
			    });
			    
			    $("#removeEmpModalSubmit").click(function(){
			    	$("#removeEmpModalForm").submit();	
			    });
			    
			    
			});		
			
			
		</script>
		
		
		

		<!-- 부서 추가 모달창 -->
		<div class="modal fade" id="addDeptModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width:350px; height:200px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModalLabel">부서 추가 알림</h4>
					</div>
					
					
					<form action="insertDept.st" id="deptAddForm">
						<div class="modal-body" id="addDeptBody">
						<div class="addDeptModalDiv">
								<label class="addDeptLabel">부서명 : </label>
								<input type="text" class="addDeptInput" id="deptName" name="deptName">
								<input type="hidden" name="parentDept" value="001">								 
							</div>	
							<div>
								<label id="deptCheck"></label>
							</div>	
						</div>
						<div class="modal-footer">
							<button type="button" id="insertDeptSubmit" class="btn btn-primary">확인</button>
							<button type="button" id="insertDeptCancel" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</form>
					
					
				</div>
			</div>
		</div>
		<!-- 부서 추가 모달창 끝 -->
		
		<script>
			$(function (){
				$("#insertDeptSubmit").prop("disabled", true);	
				$("#deptName").keyup(function(){
					$.ajax({
    	 				type: "get",
    	 				url : 'deptNameCheck.st',
    	 				async: false,
    	 				data:{
    	 					"deptName" : $("#deptName").val()
    	 				},
    	 				success:function(data){
    	 					//console.log("나 에이작스 잘 다녀옴 " + data);
    	 					if(data == 0 && $("#deptName").val() != ''){
    	 						$("#deptCheck").html("사용가능한 부서명입니다.").css("color", "#53C251");
    	 						$("#insertDeptSubmit").prop("disabled", false);    	 						  	 						
    	 					}else {
    	 						if($("#deptName").val() == ''){
    	 							$("#deptCheck").html("부서명을 입력해주세요.").css("color", "red");
        	 						$("#insertDeptSubmit").prop("disabled", true);	
    	 						} else {
    	 							$("#deptCheck").html("부서가 존재합니다.").css("color", "red");
        	 						$("#insertDeptSubmit").prop("disabled", true);
    	 						}
    	 						
    	 					}
    	 					
    	 				}
					});
				});				
			});
			
			$("#insertDeptSubmit").click(function(){
					$("#deptAddForm").submit();	
			});  
		</script>
		
		
		<!-- 부서 삭제 모달창 -->
		<div class="modal fade" id="removeDeptModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width:350px; height:200px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModalLabel">부서 삭제 알림</h4>
					</div>
					
					<form action="removeDept.st" id="removeDeptForm">
						<div class="modal-body" id="removeDeptBody">
							<div class="addDeptModalDiv">
								<label class="removeDeptLabel">삭제할 부서 : </label>
								<select id="removeDeptSelect" name="deptName">
									
								</select>
							</div>	
							<div>
								<label id="removeCheck">부서내 사원이 있을 경우 삭제되지 않습니다.</label>
							</div>	
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="removeDeptSubmit">확인</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</form>
					
					
				</div>
			</div>
		</div>
		<!-- 부서 삭제 모달창 끝 -->
		<script>
			$(function(){
				
				$("#removeDeptSubmit").click(function(){
					swal({
						  title: "정말로 부서를 삭제합니까?",
						  text: "삭제하면 되돌릴 수 없습니다.",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
							  
							  $.ajax({
		    	 				type: "get",
		    	 				url : 'inDeptCheck.st',
		    	 				async: false,
		    	 				data:{
		    	 					"deptName" : $("#removeDeptSelect").val()
		    	 				},
		    	 				success:function(data){
		    	 					if(data > 0){
		    	 						swal('부서원이 존재합니다.');			    	 					
		    	 					}else{
		    	 						$("#removeDeptForm").submit();	
		    	 					}
		    	 				}
							});							  
							  
						  } else {
						    swal("취소 되었습니다.");
						  }
						});
															
				});
			});
		</script>


		
		

		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>
</html>