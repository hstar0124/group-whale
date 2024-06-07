<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>	
	.contentDiv { min-height:710px; }	
	.boardTable td {
		boarder:1px solid lightgray;
		text-align:center;
		border-bottom: 2px solid lightgray;
		padding-bottom: 5px;
		padding-top: 5px;
		text-align: center;
		height: 30px;
	}	
	.ul-tab-wrap { list-style: none; }	
	.ul-tab-wrap li { float: left; cursor: pointer; }	
	.club-joined-contents { width:700px; height:450px; margin:auto; margin-top:50px; }
	.table-wrap { height:50px; }
	.header-number { width:60px; float:left; margin:20px 0 10px 15px; }
	#joinedClub { width:100%; border:1px solid #ddd; text-align:center; }
	thead th { border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px; border-right:none; }
	#joinedClub td { padding: 10px;}
	.clubName { cursor:pointer; }
	#createClubBtn { float:right; width:100px; height:30px; background:#0871B9; color:white; border-radius:5px; border:1px; margin-right:8px; margin-top:15px;}

	/* Modal background */
   .modal-createClub {
		display: none; 
		position: fixed; 
		z-index: 10; 
		left: 0;
		top: 0;
		width: 100%; 
		height: 100%; 
		overflow: auto;
		background-color: rgb(0,0,0); 
		background-color: rgba(0,0,0,0.4); 
   }
   
   /* Modal_ content */
   .club-modal-content {
      background-color: #fefefe;
      margin: 15% auto; 
      border: 1px solid lightgray;
      width: 350px; 
      height: 250px;
   }
   
   /* 동호회 등록 확인 버튼 */
	#insertClubBtn {
		width:70px; 
		height:32px; 
		font-size:12px; 
		font-weight:normal;
		background: #0871B9; 
		color: white; 
		padding: 5px; 
		margin: 2px; 
		border-radius:5px; 
		border: 1px; 
		outline: 1px;
	} 
	
	#insertClubBtn:hover {cursor:pointer;}
	
	/* 동호회 등록 취소 버튼 */
	#modalCloseBtn {
		width:70px; 
		height:32px; 
		border:0.8px solid #DDDDDD;
		font-weight:normal;
		font-size:12px; 
		background: white; 
		color: #0871B9; 
		border-radius:5px; 
		outline: 1px;
	}
	
	/* Modal background */
	.modal-memberList {
      	display: none; /* Hidden by default */
     	position: fixed; /* Stay in place */
      	z-index: 10; /* Sit on top */
      	left: 0;
      	top: 0;
      	width: 100%; /* Full width */
      	height: 100%; /* Full height */
      	overflow: auto; /* Enable scroll if needed */	
	}
	
	/* Modal content */
	 .club-modal-content2 {
      background-color: #fefefe;
      border: 1px solid lightgray;
      width: 150px; 
      min-height: 120px; 
      max-height: 100%;
   }
   
   #closeIcon { width:10px; height:10px; float:right; margin-right:15px; margin-top:2px; }
   #totalMember { cursor:pointer; }
   #totalClubList { color:#333333; display: inline-block; font-weight: bold; }
   #joinedClubList { display: inline-block; font-weight: bold; color: rgb(130,130,130); }
   /* 멤버 목록 */
   #memberPhoto { width:25px; height:25px; margin-left:20px; border-radius:100% }
   #memberInfo { font-size:11px; font-weight:normal; margin-left:5px; }
   #memberInfo2 { font-size:11px; font-weight:normal; margin-left:5px; margin-bottom:5px; margin-top:15px; }
   #deleteMember { width:7px; height:7px; margin-left:9px; cursor:pointer; }
   #addMember { width:26px; height:26px; margin-left:20px; margin-top:10px; margin-bottom:15px; cursor:pointer; }

	/* ======= 조직도 Modal ======= */
	li { list-style:none; font-size:14px; }
	.tree_menu2 {line-height: 30px; margin-top: 20px; padding-left: 20px;}
	.tree_menu2 strong {font-weight:normal;}
	.tree_menu2 label input {vertical-align:-2px;}
	.tree_menu2 .depth_1 a {vertical-align:bottom;text-decoration:none;}
	.tree_menu2 .depth_1 strong, .form_tree_menu .form_depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu2 .depth_2_1 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px; cursor:pointer;}
	.tree_menu2 .depth_2_1 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu2 .depth_2_1 li a em.on {background-position:0 100%;}
	.tree_menu2 li.last {background:none;}
	.tree_menu2 li.last {background:none;}
	.tree_menu2 .depth_3 {display:none;padding-left:23px;}
	.tree_menu2 .depth_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu2 .depth_3 li a, .depth_form {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu2 .depth_3 li a {display:inline-block; cursor:pointer;}
	.tree_menu2 li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0; }
</style>
<script>
</script>
</head>
<body>
	<div class="wrap">
	<jsp:include page="../board/boardMenubar.jsp" />

		<div class="content">
			<b class="contentTitle" style="font-size:16px; color:#333333;">동호회 게시판</b>
			<br><br>
			<div class="contentDiv" style="width:860px; border:none;">
				<div class="home-tab-wrap" style="height:35px;">
					<ul class="ul-tab-wrap">
						<li id="all-club">
							<span id="totalClubList">전체 동호회</span>
						</li>
						<li id="club-joined" style="margin-left:40px;">
							<span id="joinedClubList">가입한 동호회</span>
						</li>
					</ul>
				</div>
				<hr style="margin-top:-2px;">
				<div class="club-joined-contents">
					<div class="table-wrap">
						<div class="header-number">
							<span id="num">
							총	<strong><span id="club-total-num" style="color:#0871B9;">${ list.size() }</span></strong> 개
							</span>
						</div>						
						<table id="joinedClub">
							<thead>
								<tr>
									<th rowspan="1" colspan="1" style="width:80px; text-align:center;">동호회명</th>
									<th rowspan="1" colspan="1" style="width:50px; text-align:center;">회원수</th>
									<th rowspan="1" colspan="1" style="width:50px; text-align:center;">전체글</th>
									<th rowspan="1" colspan="1" style="width:60px; text-align:center;">마스터</th>
									<th rowspan="1" colspan="1" style="width:60px; text-align:center;">개설일</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${ list.size() > 0}">
							<c:forEach var="li" items="${ list }">
								<tr>
									<td>
										<input type="hidden" id="clubNo" name="clubNo" value="${ li.clubNo }">
										<input type="hidden" id="masterEmpNo" name="masterEmpNo" value="${ li.masterEmpNo }">
										<span class="clubName">${ li.clubName }</span>
									</td>
									<td>
										<span id="totalMember">${ li.totalMember }</span>
									</td>
									<td>
										<span id="totalPost">${ li.totalPost }</span>
									</td>
									<td>
										<span id="masterName">${ li.empName }</span>
									</td>
									<td>
										<span id="createDate">${ li.enrollDate }</span>
									</td>
								</tr>								
							</c:forEach>
							</c:if>	
							</tbody>
							</table>
							<button id="createClubBtn">동호회 등록</button>
						</div><!-- table-wrap -->
					</div>
				<div id="pagingDiv" align="center" style="width:700px; height:80px; margin:auto;"></div>
			</div>
		</div><!-- content div end-->
		
		<!-- Modal content (동호회 추가) -->
		<div id="modal-create-club" class="modal-createClub">
			<div class="club-modal-content">
				<form action="insertClub.cu" id="createClubForm">
				<table style="width:350px; height:250px;">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label style="font-size:14px; margin-left:20px;"><b>동호회 등록</b></label>
								<hr style="border: 1px solid #0871B9; width:305px; margin-top:10px; margin-bottom:10px;">
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label style="font-size:12px; font-weight:normal; margin-left:50px;">동호회명</label>
								&nbsp;&nbsp;
								<input type="text" id="clubName" name="clubName" style="font-size:12px; width:200px; height:25px;" maxlength="50" placeholder="동호회 이름을 입력해주세요.">
							</td>
						</tr>
						<tr>
							<td>
								<label id="clubCheck" style="width:100%; font-size:12px; margin-left:100px; margin-top:5px; font-weight:normal; color:orange;"></label>
							</td>
						</tr>
						<tr style="height:50px;">
							<td style="text-align:center;">
								<button id="insertClubBtn" type="button">확인</button>
								<button id="modalCloseBtn" type="button">취소</button>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
				</table>
				</form>
			</div>
		</div><!-- 동호회 추가 Modal end -->
		
		<!-- Modal content (멤버 목록) -->
      	<div id="modal-member-list" class="modal-memberList">
         	<div class="club-modal-content2">
         		<div class="parti-wrap" style="width:150px; min-height:110px; height:auto;">
         			<div class="partiTitleWrap">
         				<label style="margin-left:45px; margin-top:15px; font-size:12px; font-weight:bold;">멤버 목록</label>
         				<img id="closeIcon" src="${ contextPath }/resources/images/club/close.png" style="margin-right:13px; margin-top:16px; cursor:pointer;">
                    	<hr style="border:0.5px solid lightgray; margin-bottom:15px; margin-top:7px;" width="125px;">
         			</div>
         			<div class="partiContentWrap1"></div>
         			<div class="partiContentWrap2" style="min-height:5px; height:auto;"></div>
         			<%-- <div class="partiAddWrap">
         				<img id="addMember" data-toggle="modal" data-target="#mandatorModal" src="${ contextPath }/resources/images/club/add.png">
         			</div> --%>
         		</div>
         	</div>
      	</div><!-- 멤버 목록 Modal end -->
      	
      	<!-- 조직도 Modal -->
		<div class="modal fade" id="mandatorModal" role="dialog">
			<div class="modal-dialog" style="width:280px; min-height:500px; height:auto;">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h5 class="modal-title">멤버 추가</h5>
					</div>
					<div class="modal-body">
						<div style="width: 250px; min-height:400px; height:auto; border: 1px solid #c4c4c4;">
							<div class="tree_box">
								<div class="con">
									<ul id="tree_menu2" class="tree_menu2">								
									</ul>
								</div>
							</div>
						</div>				
					</div>
					<div class="modal-footer" style="clear: both;">
						<button type="button" id="autChk" class="btn btn-primary">추가</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div><!-- 조직도 Modal end -->
	
	</div><!-- wrap div end -->
	<script>
		$(document).ready(function() {
			//전체 동호회 목록
			$(function() {
				$("#totalClubList").click(function() {
					
			        $.ajax({
						type:"POST",
						url:'totalClubList.cu',
						async:false,
						success:function(data){
								
							$('#totalClubList').css('color', 'black');
							$('#joinedClubList').css('color', 'gray');
							
							$("tbody").empty();
							
							for(key in data) {
								var $clubList = "<tr><td><input type='hidden' id='clubNo' name='clubNo' value='"
									+ data[key].clubNo
									+ "'><input type='hidden' id='masterEmpNo' name='masterEmpNo' value='"
									+ data[key].masterEmpNo
									+ "'><span class='clubName'>"
									+ data[key].clubName
									+ "</span></td><td><span id='totalMember'>"
									+ data[key].totalMember
									+ "</span></td><td><span id='totalPost'>"
									+ data[key].totalPost
									+ "</span></td><td><span id='masterName'>"
									+ data[key].empName
									+ "</span></td><td><span id='createDate'>"
									+ data[key].enrollDate
									+ "</span></td></tr>";
					
								$("tbody").append($clubList);
								
								//가입한 동호회 수
								$(".header-number").empty();

								var $total = "<span id='num'>총 <strong><span id='club-total-num' style='color:#0871B9;'>"
											+ data.length
											+ "</span></strong> 개 </span>";
								$(".header-number").append($total);		
							}
						}
					});//ajax
				});
			});
			
			//가입한 동호회 목록
			$(function() {
				$("#joinedClubList").click(function() {
					
			        $.ajax({
						type:"POST",
						url:'joinedClubList.cu',
						async:false,
						success:function(data){
								
							$('#totalClubList').css('color', 'gray');
							$('#joinedClubList').css('color', 'black');
							
							$("tbody").empty();
							
							for(key in data) {
								var $clubList = "<tr><td><input type='hidden' id='clubNo' name='clubNo' value='"
									+ data[key].clubNo
									+ "'><input type='hidden' id='masterEmpNo' name='masterEmpNo' value='"
									+ data[key].masterEmpNo
									+ "'><span class='clubName'>"
									+ data[key].clubName
									+ "</span></td><td><span id='totalMember'>"
									+ data[key].totalMember
									+ "</span></td><td><span id='totalPost'>"
									+ data[key].totalPost
									+ "</span></td><td><span id='masterName'>"
									+ data[key].empName
									+ "</span></td><td><span id='createDate'>"
									+ data[key].enrollDate
									+ "</span></td></tr>";
					
								$("tbody").append($clubList);
								
								//가입한 동호회 수
								$(".header-number").empty();

								var $total = "<span id='num'>총 <strong><span id='club-total-num' style='color:#0871B9;'>"
											+ data.length
											+ "</span></strong> 개 </span>";
								$(".header-number").append($total);		
							}
						}
					});
				});
			});
			
			//동호회명 클릭시 동호회 게시글로 이동
			$(document).on("click", ".clubName", function(){
				
				location.href="${contextPath}/clubDetail.cu";
			});
			
			/* ===== 동호회 등록 Modal ===== */
			//동호회 만들기 버튼 클릭
			$(function() {
				$("#createClubBtn").click(function() {
					$("#modal-create-club").show();
				});
			});
			
			//Modal 닫기 버튼 클릭   
			$(function() {
				$("#modalCloseBtn").click(function() {
					$('.modal-createClub').hide();
				});
			});
			
			//동호회 추가
			$("#insertClubBtn").click(function() {

				swal("동호회가 등록되었습니다.", {
				      icon: "success",							      
				})
				.then((value) => {
					if(value == true){
						$("#createClubForm").submit();	
						$('.modal-createClub').hide();
					}
				});	
			});
			
			var clubNo;
			var cNo;
			var clubNoList;
			/* ===== 멤버 목록 Modal ===== */
			$(document).on("click", "#totalMember", function(e){
				clubNo = $(this).parents("tr").children().children("#clubNo").val();
				cNo = $("tbody").children().children().children("#clubNo");
				
				clubNoList = new Array();
				
				cNo.each(function() {
					var c = $(this).val();
					clubNoList.push(c);
				});	
				
				//멤버 목록 불러오기
				$.ajax({
					type:"POST",
					url:'selectMemberList.cu',
					async:false,
					data:{
						"clubNo" : clubNo
					},
					success:function(data){
						
						$(".partiContentWrap1").empty();
						$(".partiContentWrap2").empty();
						
						/* 마스터 - 삭제 불가능 */
						var first = data[0];
						var masterEmpNo = first.empNo;
						var userEmpNo = "${ sessionScope.loginUser.empNo }";
						
						//마스터일 경우
						if(masterEmpNo == userEmpNo) {
						
							var length = data.length;
							$(".partiAddWrap").remove();
							
							if(length == 1) {
								var $first = "<input type='hidden' id='masterEmpNo' name='masterEmpNo' value='"
							 		  + masterEmpNo
							 		  + "'><input type='hidden' id='mem_clubNo' name='mem_clubNo' value='"
							 		  + first.clubNo
							          + "'><img id='memberPhoto' src='${ contextPath }/resources/uploadFiles/"
									  + first.changeName
									  + "'><label id='memberInfo'>"
									  + first.empName + " " + first.positionName
									  + "</label>";	
								
								$(".partiContentWrap1").append($first);
								
							} else {
								var $first = "<input type='hidden' id='masterEmpNo' name='masterEmpNo' value='"
							 		  + masterEmpNo
							 		  + "'><input type='hidden' id='mem_clubNo' name='mem_clubNo' value='"
							 		  + first.clubNo
							          + "'><img id='memberPhoto' src='${ contextPath }/resources/uploadFiles/"
									  + first.changeName
									  + "'><label id='memberInfo'>"
									  + first.empName + " " + first.positionName
									  + "</label>";	
						
								$(".partiContentWrap1").append($first);

									for(var i = 1; i < length; i++) {
										var list = data[i];
								
										var $etc = "<div><input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
							 		        + list.empNo
							                + "'><input type='hidden' id='mem_clubNo' name='mem_clubNo' value='"
									 	    + list.clubNo
									        + "'><img id='memberPhoto' src='${ contextPath }/resources/uploadFiles/"
											+ list.changeName
											+ "'><label id='memberInfo2'>"
											+ list.empName + " " + list.positionName
											+ "</label><img id='deleteMember' src='${ contextPath }/resources/images/club/close.png'></div>";
										$(".partiContentWrap2").append($etc);
									}	
							}
							
							var $addMember = "<div class='partiAddWrap'><img id='addMember' data-toggle='modal' data-target='#mandatorModal' src='${ contextPath }/resources/images/club/add.png'></div>";
							$(".partiContentWrap2").after($addMember);
						//마스터가 아닐 경우
						} else {
							
							$(".partiAddWrap").remove();
							
							var $first = "<input type='hidden' id='masterEmpNo' name='masterEmpNo' value='"
						 		  + masterEmpNo
						 		  + "'><input type='hidden' id='mem_clubNo' name='mem_clubNo' value='"
						 		  + first.clubNo
						          + "'><img id='memberPhoto' src='${ contextPath }/resources/uploadFiles/"
								  + first.changeName
								  + "'><label id='memberInfo'>"
								  + first.empName + " " + first.positionName
								  + "</label>";	
					
							$(".partiContentWrap1").append($first);
						
							/* 나머지 멤버 */
							var length = data.length;
					
							if (length > 1) {
								for(var i = 1; i < length; i++) {
									var list = data[i];
							
									var $etc = "<div><input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
						 		        + list.empNo
						                + "'><input type='hidden' id='mem_clubNo' name='mem_clubNo' value='"
								 	    + list.clubNo
								        + "'><img id='memberPhoto' src='${ contextPath }/resources/uploadFiles/"
										+ list.changeName
										+ "'><label id='memberInfo2'>"
										+ list.empName + " " + list.positionName
										+ "</label></div>";
									$(".partiContentWrap2").append($etc);
								}					
							}
						}
						
						var divTop = e.clientY+10;
						var divLeft = e.clientX-5;
						//모달이 나오는 위치 설정					
						$("#modal-member-list").css({"top" : divTop, "left" : divLeft, "position" : "absolute"}).show();
					}				
				});
			});
				
			//Modal 닫기 버튼 클릭   
			$(function() {
				$("#closeIcon").click(function() {
					$('.modal-memberList').hide();
				});
			});
			
			/* ===== 조직도 Modal ===== */
			//조직도
			$.ajax({
				type:"POST",
				url :'selectDeptList.st',
				async: false,
				success:function(data){
						                    
	            	//회사이름 생성
	            	for(var key in data){
	                	if(data[key].depth == "1"){
	                		var $top = "<li class='depth_1'><strong style='font-size: 15px;' class='comTitle'>" 
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
		              
					$(".depth_3").empty();
		               
		            for(key in data){
		            	  		           
		                var $member = "<li class='end'><a href='#' class='check_Name'><label for='" + data[key].empName + " " + data[key].positionName + "님' style='font-size: 13px; font-weight: normal; margin-bottom: -5px; cursor:pointer;'>" + data[key].empName + " " + data[key].positionName 
										+ "<span style='display: none;'>|" + data[key].deptName + "</span>"
		                                + "</label></a></li><input type='checkbox' id='" + data[key].empName + " " + data[key].positionName + "님' name='inputName' value='" + data[key].empNo + "' style='position: fixed; margin-top: -19px; margin-left: 130px;'>";
		                                                     
		                if(data[key].empName != '관리자'){
		                	$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
		                }

		                var checkId = $("input:checkbox[id='" + data[key].empName +"']");
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
			
			//멤버 추가
			$("#autChk").click(function(){
				var memberList = new Array();
				
				$("input:checkbox[name=inputName]:checked").each(function() {
					var empNo = $(this).val();
					memberList.push(empNo);
				});	
				
				//배열을 넘겨주기 위한 코드 추가
		    	jQuery.ajaxSettings.traditional = true;
				
		    	$.ajax({
		            type:"POST",
		            url :'addClubMember.cu',
		            async: false,
		            data:{
						"clubNo" : clubNo,
						"memberList" : memberList 
					},
		            success:function(data){	
		            	
		            	console.log(data);
		            	         	
		            	$("#mandatorModal").hide();	            	
		            	$(".partiContentWrap2").empty();
		            	
		            	var length = data.length;
		       
		            	if (length > 1) {
							for(var i = 1; i < length; i++) {
								var list = data[i];
								
								var $etc = "<div><input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
					 		        + list.empNo
					                + "'><input type='hidden' id='mem_clubNo' name='mem_clubNo' value='"
							 	    + list.clubNo
							        + "'><img id='memberPhoto' src='${ contextPath }/resources/uploadFiles/"
									+ list.changeName
									+ "'><label id='memberInfo2'>"
									+ list.empName + " " + list.positionName
									+ "</label><img id='deleteMember' src='${ contextPath }/resources/images/club/close.png'></div>";
								
								$(".partiContentWrap2").append($etc);
								
								var $totalMember = "<span id='totalMember'>"
													+ length
													+ "</span>";
								
								//clubNoList
								//("#totalMember").replaceWith($totalMember);
							}					
						}	            	
		            }//success
		      });				
			});
			
		});
	</script>
</body>
</html>