<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato|Roboto);

html, body { min-width: 100%; min-height: 100vh; margin: 0; padding: 0; }

/* 최상위 부모 엘리먼트 */
/* 100vh는 웹 브라우저의 전체 높이 */
.wrapper { width: 100%; min-height: 800px; background: #F7F7F7; }

/* 회색 영역 */
#contentWrap {
	box-sizing: border-box;
	padding: 0px 15px;
	font-family: 'Lato', sans-serif;
	max-width: 100%;
	height:800px;
	overflow-y: auto;
	overflow-x: hidden; /* x축 스크롤 가능하게 설정 */
	background: #F7F7F7;
}

/* 흰색 영역 */
#whiteBox {
	min-width: 60%;
	height: 800px;
	margin-left: 8px;
	margin-top: 23px;
	user-select: none;
	overflow-x: hidden;
	overflow-y: auto;
	background: white;
}

/* ======= left 메뉴 ======= */
/* 폴더명 수정 input 박스 */
#fNameEdit { height: 40px; display: none; margin-left: 17px; }

/* 폴더메뉴 수정 아이콘 */
.editIcon { width: 10px; height: 10px; margin-left: 30px; }

/* 폴더메뉴 삭제 아이콘 */
.deleteIcon { width: 9px; height: 9px; margin-left: 18px; margin-bottom: 2px;}

/* 폴더메뉴 폴더 추가 아이콘 */
#folderAddIcon { width: 14px; height: 14px; margin-left: 27px; margin-top: 8px; }

/* 폴더메뉴 편집 확인 버튼 */
#todoEdit-confirm {
	width: 70px;
	height: 32px;
	font-size: 12px;
	font-weight: normal;
	background: #0871B9;
	color: white;
	padding: 5px;
	margin: 2px;
	border-radius: 5px;
	border: 1px;
	outline: 1px;
	margin-left: 30px;
	margin-top: 15px;
}

#todoEdit-confirm:hover { cursor: pointer; }

/* 폴더메뉴 편집 취소 버튼 */
#todoEdit-close {
	width: 80px;
	height: 45px;
	text-align:center;
	border: 1.2px solid lightgray;
	color: #0871B9;
	font-size: 14px;
	border-radius: 7px;
	margin-left: 60px;
	font-weight: bold;
	background: white;
}

#todoEdit-close:hover { cursor: pointer; }

/* ======= TODO 홈 ======= */
#projectTitleWrap { height: 40px; font-weight: bold; margin-top: 20px; }

#projectTitleWrap #title { height: 100%; line-height: 50px; color: #0871B9; float: left; margin-left: 30px; font-weight: bold; }

/* ======= 폴더 영역 ======= */
#listWrap { display: inline-block; vertical-align: top; /* 위로 정렬 */ margin-top:15px; margin-bottom:-25px; }

#listWrap .list {
	background: #DCF1FF;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	width: 250px;
	padding: 5px 10px;
	display: inline-block;
	vertical-align: top;
	margin-top: 5px;
	margin-left: 26px;
	margin-right: 0px;
	margin-bottom: 35px;
}

/* 폴더명 */
#listWrap .list .listTitleWrap { height: 40px; margin-bottom: 6px; margin-left: 10px; }

#listWrap .list .listTitleWrap .title {
	height: 100%;
	line-height: 40px;
	color: #2F4E60;
	font-weight: 600;
	float: left;
	font-size:13px;
	cursor:pointer;
}

/* 참여자 */
#listWrap .list .cardAddWrap .addLabel {
	padding: 7px 5px;
	color: #838C91;
	margin-bottom: 12px;
	cursor: pointer;
	margin-left: 10px;
}

#listWrap .list .cardAddWrap .addCard { display: none; margin-left: 10px; }

#listAddWrap { display: inline-block; vertical-align: top; }

/* 참여자 프로필 사진 */
#applicant { width: 30px; height: 30px; margin-right:8px; display:inline-block; }
#mem { display:inline-block; font-weight:normal; margin-top:8px; cursor:pointer; }

/* 참여자 Modal */
#partiPhoto { width:25px; height:25px; margin-left:20px; border-radius:100% }
#partiInfo { font-size:11px; font-weight:normal; margin-left:5px; }
#partiInfo2 { font-size:11px; font-weight:normal; margin-left:5px; margin-bottom:5px; margin-top:15px; }
#deleteParti { width:7px; height:7px; margin-left:9px; cursor:pointer; }
#addParti { width:26px; height:26px; margin-left:20px; margin-top:10px; margin-bottom:15px; cursor:pointer; }

/* ======= 그 외 ======= */
input, button, textarea { font-family: 'Lato', sans-serif; }

/* 크롬에서 focus 시 파란 테두리 생기는 것 방지 */
input:focus, textarea:focus { outline: none; }

/* ======= 스크롤바 ======= */
::-webkit-scrollbar {
	width: 7px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

::-webkit-scrollbar-track {
	background: #DFE3E6;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

::-webkit-scrollbar-thumb {
	background: #DFE3E6;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

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
</head>
<body>
    <div class="wrap">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../todo/todoModal.jsp" /> 

		<!-- TODO left 메뉴 -->
		<div class="nav2 nav2_todo" style="margin-right:0px;">
			<ul class="folderList">
				<li>
					<p class="menuTitlePtag">
						<img class="btn nav1_click menu_icons" src="${ contextPath }/resources/images/menubar/open-menu.png">
						<b class="menuTitle" style="cursor:pointer;" onclick="goTodoHome();">TODO+</b>
					</p>
				</li>
				<li>
					<p>
						<button class="btn writeBtn" id="todoRegisterBtn">폴더 추가</button>
					</p>
				</li>
				<!-- <li>
					폴더명 편집
                	<form id="fNameEdit">
                    	<input id="fNameInputBox" type="text" placeholder="폴더명을 입력하세요." autocomplete="off">
                    	<input type="submit" style="display:none">
                	</form>
				</li> -->
				<%-- <li>
					<a href="#" class="nav2_a"> 
					    <img class="btn forder1 sub1_f1" src="${ contextPath }/resources/images/menubar/forder2.png">
						<img class="editIcon" src="${ contextPath }/resources/images/todo/edit.png" style="cursor:pointer; display: none;">
					    <img class="deleteIcon" src="${ contextPath }/resources/images/todo/close.png" style="cursor:pointer; display: none;">
					</a>
				</li> --%>				
				<!-- <li>
					<label id="folderAdd" style="cursor: pointer; font-size:13px; color:#0871B9; display: none; margin-top:15px; margin-left:28px; font-weight:bold;">+ 폴더 추가</label>
				</li> -->
			</ul>
			<br>
			<button id="todoEdit" onclick="folderEdit();">Edit</button>
			<!-- <button id="todoEdit-confirm" style="display: none;"
				onclick="folderEditConfirm();">확인</button> -->
			<button id="todoEdit-close" style="display: none;"
				onclick="folderEditClose();">취소</button>
		</div>

        <div id="contentWrap">
        	<div id="whiteBox">
            	<div id="projectTitleWrap">
                	<div id="title" style="font-size:14px;">TODO 홈</div>            
            	</div>
            	<!-- 폴더 wrap -->
            	<div id="listWrap">
                <%-- <div class="list">
                    <div class="listTitleWrap">
                    	<!-- 리스트 제목 -->
                        <div class="title">폴더명</div>
                    </div>                   
                    <!-- 참여자 -->
                    <div class="cardAddWrap">
                        <div class="addLabel" style="">
                        	<img id="applicant" src="${ contextPath }/resources/images/todo/admin_account.png">
                        	<img id="applicant" src="${ contextPath }/resources/images/todo/admin_account.png">
                        	<img id="applicant" src="${ contextPath }/resources/images/todo/admin_account.png">
                        </div>
                    </div>
                </div>   --%>             
            	</div>                  
       	    </div>
        </div>
    </div>
    
    <!-- Modal content -> 폴더메뉴/홈 (참여자 설정) -->
      <div id="modal-applicant-edit" class="modal-applicantEdit">
         <div class="modal-content2">
         	<div class="parti-wrap" style="width:150px; min-height:140px; height:auto;">
         		<div class="partiTitleWrap">
         			<label style="margin-left:40px; margin-top:15px; font-size:12px; font-weight:bold;">참여자 목록</label>
         			<img id="closeIcon2" src="${ contextPath }/resources/images/todo/close.png" style="margin-right:13px; margin-top:16px; cursor:pointer;">
                    <hr style="border:0.5px solid lightgray; margin-bottom:15px; margin-top:7px;" width="125px;">
         		</div>
         		<div class="partiContentWrap1">
         			<%-- <img id="partiPhoto" src="${ contextPath }/resources/images/todo/admin_account.png">
                    <label id="partiInfo">박다영 대리</label> --%>
         		</div>
         		<div class="partiContentWrap2" style="min-height:5px; height:auto;">
         			<%-- <img id="partiPhoto" src="${ contextPath }/resources/images/todo/admin_account.png">
                    <label id="partiInfo2">이지호 차장</label>
                    <img id="deleteParti" src="${ contextPath }/resources/images/todo/close.png"> --%>
         		</div>
         		<div class="partiAddWrap">
         			<img id="addParti" data-toggle="modal" data-target="#mandatorModal" src="${ contextPath }/resources/images/todo/add.png">
         		</div>
         	</div>
         </div>
      </div>
      
    <!-- 조직도 Modal -->
	<div class="modal fade" id="mandatorModal" role="dialog">
		<div class="modal-dialog" style="width:280px; min-height:500px; height:auto;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h5 class="modal-title">참여자 선택</h5>
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
	</div>
    
    <!-- left 메뉴 -->
	<script>
	/* TODO+ 클릭시 홈으로 이동 */
    function goTodoHome() {
    	location.href = "${contextPath}/main.td";
    }
	
	//폴더 세팅
	$(document).ready(function() {
		
		//폴더 정보 불러오기
		$.ajax({
			type:"POST",
			url:'selectFolderList.td',
			async:false,
			success:function(data){
				for(key in data){

					var $Leftfolder = "<li><a href='#' class='nav2_a'><img class='btn forder1 sub1_f1' src='${ contextPath }/resources/images/menubar/forder2.png'><b class='menuTitle_sub1 sub1_1' style='margin-left:5px;'>"
									+ data[key].folderName 
									+ "</b><input type='hidden' id='folderNo' name='folderNo' value='" 
									+ data[key].folderNo 
									+ "'><input type='hidden' id='folderCreateEmpNo' name='folderCreateEmpNo' value='"
									+ data[key].empNo
									+ "'><img id='deleteIcon' class='deleteIcon' src='${ contextPath }/resources/images/todo/close.png' style='cursor:pointer; display: none;'></a></li>";
				    //left메뉴 폴더 목록
					$(".folderList").append($Leftfolder);
				    
				    var $folder = "<div class='list'><div class='listTitleWrap'><div class='title'>"
				    				+ data[key].folderName
				    				+ "<input type='hidden' id='folderNo2' name='folderNo2' value='" 
				    				+ data[key].folderNo 
				    				+ "'><input type='hidden' id='folderCreateEmpNo' name='folderCreateEmpNo' value='"
									+ data[key].empNo
				    				+ "'></div></div><div class='cardAddWrap'><div class='addLabel'><img id='applicant' src='${ contextPath }/resources/images/todo/audience.png'><label id='mem'>Members</label></div></div></div>";
					//TODO 홈 폴더 목록
					$("#listWrap").append($folder);
				}					
			}				
		});	
	});
	
	//폴더명 클릭 시 list 페이지로 이동
	$(document).on("click", ".menuTitle_sub1", function() {
		var fNo = $(this).parent().children().eq(2).val();

		location.href="${contextPath}/selectListInfo.td?fNo=" + fNo;	
	});
	
	//TODO 홈 폴더명 클릭 시 list 페이지로 이동
	$(document).on("click", ".title", function() {
		var fNo = $(this).children().val();

		location.href="${contextPath}/selectListInfo.td?fNo=" + fNo;
	});
		
	/* ===== 폴더 편집 ===== */
	//left 메뉴 edit 버튼 클릭
	function folderEdit() {
	   if($('.deleteIcon').css('display') == 'none'){
        $('.deleteIcon').show();
        $('.editIcon').show();
        $('#folderAdd').show();
        $('#todoEdit-confirm').show();
        $('#todoEdit-close').show();
        $('#todoEdit').hide();
	   }
	}
	//폴더명 편집 확인 버튼 클릭
	function folderEditConfirm() {
    	$('.deleteIcon').hide();
    	$('.editIcon').hide();
    	$('#folderAdd').hide();
    	$('#todoEdit-confirm').hide();
    	$('#todoEdit-close').hide();
    	$('#todoEdit').show();
	}
	//폴더명 편집 취소 버튼 클릭
	function folderEditClose() {
   	    $('.deleteIcon').hide();
    	$('.editIcon').hide();
   	    $('#folderAdd').hide();
    	$('#todoEdit-confirm').hide();
    	$('#todoEdit-close').hide();
    	$('#todoEdit').show();
	}	
	//폴더 삭제
	$(document).on("click", "#deleteIcon", function(){
		var fNo = $(this).parent().children("#folderNo").val();
		var loginUser = ${ sessionScope.loginUser.empNo };
		var createUser = $(this).parent().children().eq(3).val();
		console.log(fNo);
		console.log(loginUser);
		console.log(createUser);

		/* 폴더를 생성한 사람만 삭제 가능 */
		if(loginUser == createUser) {
			swal({
				title: "폴더를 삭제하시겠습니까?",
				text: "폴더를 삭제하면 복구할 수 없습니다.",
				icon: "warning",
				buttons: true,
				dangerMode: true
			}).then((willDelete) => {
				if(willDelete) {
	
					swal("삭제 완료되었습니다.", {
				      icon: "success",							      
					})
					.then((value) => {
						if(value == true){
							location.href="${contextPath}/deleteFolder.td?fNo=" + fNo;
						}
					});	
				}else {
					swal("삭제가 취소되었습니다.");
				}
			});
		
		} else {
			swal({
				title: "",
				text: "폴더를 생성한 사람만 삭제가 가능합니다.",
				icon: "warning",
				buttons: "확인"
			});
		}		
	});
	
	$(function(){
		$('.nav2_todo').show();
		$('.nav1').css("margin-right", "0px");
		/* $('.contentDiv').css("width", "850px"); */
	});	
	
	var folderNo;
	
	//참여자 설정 *************this 로 바꾸기 
	$(document).on("click", ".addLabel", function(e){
		
		folderNo = $(this).parent().parent().children(".listTitleWrap").children().children("#folderNo2").val();
				
		//참여자 목록 불러오기
		$.ajax({
			type:"POST",
			url:'selectParticipantList.td',
			async:false,
			data:{
				"folderNo" : folderNo
			},
			success:function(data){
				
				$(".partiContentWrap1").empty();
				$(".partiContentWrap2").empty();
				
				/* 첫번째 참여자 - 삭제 불가능 */
				var first = data[0];
				
				var $first = "<input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
					 		  + first.memberEmpNo
					 		  + "'><input type='hidden' id='folderNo3' name='folderNo3' value='"
					 		  + folderNo
					          + "'><img id='partiPhoto' src='${ contextPath }/resources/uploadFiles/"
							  + first.changeName
							  + "'><label id='partiInfo'>"
							  + first.empName + " " + first.positionName
							  + "</label>";	
				
				$(".partiContentWrap1").append($first);
					
				/* 나머지 참여자 */
				var length = data.length;
				
				if (length > 1) {
					for(var i = 1; i < length; i++) {
						var list = data[i];
						
						var $etc = "<div><input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
					 		        + list.memberEmpNo
					                + "'><img id='partiPhoto' src='${ contextPath }/resources/uploadFiles/"
									+ list.changeName
									+ "'><label id='partiInfo2'>"
									+ list.empName + " " + list.positionName
									+ "</label><img id='deleteParti' src='${ contextPath }/resources/images/todo/close.png'></div>";
						$(".partiContentWrap2").append($etc);
					}					
				}
				
				//모달이 나오는 위치 설정
				var divTop = e.clientY + 17;
				var divLeft = e.clientX - 22;
				$("#modal-applicant-edit").css({"top" : divTop, "left" : divLeft, "position" : "absolute"}).show();
				
				//$("#modal-applicant-edit").show();	
			}				
		});
	});

	//======= 조직도 =======
	/* 부서 가져와서 조직도에 추가하는 AJAX */
	$(document).ready(function() {
		
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
		
		$("#addParti").click(function(){
			  //첫번째 참여자의 사원번호
	    	  var firstEmpNo = $(this).parent().parent().children(".partiContentWrap1").children("#memberEmpNo").val();
	    	  //나머지 참여자의 사원번호 리스트
	    	  var etcEmpNolist = $(this).parent().parent().children(".partiContentWrap2").children().children("#memberEmpNo");

	    	  var etcEmpNo = new Array();
	    	  
	    	  etcEmpNolist.each(function(){
	    		 var empNo = $(this).val();  
	    		 //나머지 참여자의 사원번호를 넣어줌
	    		 etcEmpNo.push(empNo);	    		 
	    	  });
	    	  
	    	  //첫번째 참여자의 사원번호를 넣어줌
	    	  etcEmpNo.push(firstEmpNo);

	    	  //배열을 넘겨주기 위한 코드 추가
	    	  jQuery.ajaxSettings.traditional = true;
	    	  
	    	  /* 사원 가져와서 조직도에 추가하는 ajax */
		      $.ajax({
		            type:"POST",
		            url :'selectMemberList.td',
		            async: false,
		            data:{
						"etcEmpNolist" : etcEmpNo
					},
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
		});
		
		//***********this로 바꾸기
		//===== 참여자 추가 =====
		//조직도 Modal 추가 버튼 클릭 시 input 체크된 값만 가져오기
		$("#autChk").click(function(){
						
			var folderNo = $(this).parents("#mandatorModal").parent().children("#modal-applicant-edit").children().children().children().eq(1).children().eq(1).val();		
			var empList = new Array();
			
			$("input:checkbox[name=inputName]:checked").each(function() {
				var empNo = $(this).val();
				empList.push(empNo);
			});	
			
			//배열을 넘겨주기 위한 코드 추가
	    	jQuery.ajaxSettings.traditional = true;
			
	    	$.ajax({
	            type:"POST",
	            url :'insertParticipant.td',
	            async: false,
	            data:{
					"folderNo" : folderNo,
					"empList" : empList 
				},
	            success:function(data){		            			         
	            	         	
	            	$("#mandatorModal").hide();	            	
	            	$(".partiContentWrap2").empty();
	            	
	            	var length = data.length;
	       
	            	if (length > 1) {
						for(var i = 1; i < length; i++) {
							var list = data[i];
							
							var $etc = "<div><input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
						 		        + list.memberEmpNo
						                + "'><img id='partiPhoto' src='${ contextPath }/resources/uploadFiles/"
										+ list.changeName
										+ "'><label id='partiInfo2'>"
										+ list.empName + " " + list.positionName
										+ "</label><img id='deleteParti' src='${ contextPath }/resources/images/todo/close.png'></div>";
							$(".partiContentWrap2").append($etc);
						}					
					}	            	
	            }//success
	      });
			
		});
		
		//**********this로 바꾸기
		//===== 참여자 삭제 =====
		$(document).on("click", "#deleteParti", function() {
			var empNo = $(this).parent().children("#memberEmpNo").val();			
			var folderNo = $(this).parent().parent().parent().children(".partiContentWrap1").children("#folderNo3").val();

			$.ajax({
	            type:"POST",
	            url :'deleteParticipant.td',
	            async: false,
	            data:{
					"folderNo" : folderNo,
					"empNo" : empNo 
				},
	            success:function(data){		    

					$(".partiContentWrap1").empty();
					$(".partiContentWrap2").empty();
					
					/* 첫번째 참여자 - 삭제 불가능 */
					var first = data[0];
					
					var $first = "<input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
						 		  + first.memberEmpNo
						 		  + "'><input type='hidden' id='folderNo3' name='folderNo3' value='"
						 		  + first.folderNo
						          + "'><img id='partiPhoto' src='${ contextPath }/resources/uploadFiles/"
								  + first.changeName
								  + "'><label id='partiInfo'>"
								  + first.empName + " " + first.positionName
								  + "</label>";	
					
					$(".partiContentWrap1").append($first);
						
					/* 나머지 참여자 */
					var length = data.length;
					
					if (length > 1) {
						for(var i = 1; i < length; i++) {
							var list = data[i];
							
							var $etc = "<div><input type='hidden' id='memberEmpNo' name='memberEmpNo' value='"
						 		        + list.memberEmpNo
						                + "'><img id='partiPhoto' src='${ contextPath }/resources/uploadFiles/"
										+ list.changeName
										+ "'><label id='partiInfo2'>"
										+ list.empName + " " + list.positionName
										+ "</label><img id='deleteParti' src='${ contextPath }/resources/images/todo/close.png'></div>";
							$(".partiContentWrap2").append($etc);
						}					
					}				
	            }//success
	      });//ajax
		});
	
	$('ul.depth_2_1 >li > a').click(function(e) {

          var temp_el = $(this).next('ul');
          var depth_3 = $('.depth_3');

          // 처음에 모두 슬라이드 업 시켜준다.
          //depth_3.slideUp(300);
          // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
          //depth_3.parent().find('em').removeClass('on');

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
	});
	</script>
</body>
</html>