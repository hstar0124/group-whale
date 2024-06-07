<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato|Roboto);

html, body {
	min-width: 100%;
	min-height: 100vh;
	margin: 0;
	padding: 0;
}

/* 최상위 부모 엘리먼트 */
/* 100vh는 웹 브라우저의 전체 높이 */
.wrapper {
	width: 100%;
	min-height: 800px;
	background: #F7F7F7;
}

/* 회색 영역 */
#contentWrap {
	box-sizing: border-box;
	padding: 0px 15px;
	font-family: 'Lato', sans-serif;
	max-width: 100%;
	/* min-height: calc(100vh - 50px); */
	height: 800px;
	overflow-y: hidden;
	overflow-x: auto; /* x축 스크롤 가능하게 설정 */
	white-space: nowrap; /* list가 늘어나도 줄바꿈이 되지 않고 증가하게 설정 */
	background: #F7F7F7;
}

/* 흰색 영역 */
#whiteBox {
	min-width: 60%;
	height: 780px;
	margin-left: 8px;
	margin-top: 23px;
	user-select: none;
	white-space: nowrap;
	overflow-x: auto;
	overflow-y: hidden;
	background: white;
}

/* ======= left 메뉴 ======= */
/* 폴더명 수정 input 박스 */
#fNameEdit {
	height: 40px;
	/* float: left; */
	/* line-height: 50px; */
	display: none;
	margin-left: 17px;
}

/* 폴더메뉴 수정 아이콘 */
.editIcon {
	width: 10px;
	height: 10px;
	margin-left: 30px;
}

/* 폴더메뉴 삭제 아이콘 */
.deleteIcon {
	width: 9px;
	height: 9px;
	margin-left: 18px;
	margin-bottom: 2px;
}

/* 폴더메뉴 폴더 추가 아이콘 */
#folderAddIcon {
	width: 14px;
	height: 14px;
	margin-left: 27px;
	margin-top: 8px;
}

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

#todoEdit-confirm:hover {
	cursor: pointer;
}

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

#todoEdit-close:hover {
	cursor: pointer;
}

/* ======= 폴더 제목 영역 ======= */
#projectTitleWrap {
	height: 50px;
	font-size: 17px;
	font-weight: bolder;
	margin-top: 20px;
}

#folderListIcon {
	width: 18px;
	height: 18px;
	margin-top: 16px;
	margin-left: 30px;
	float: left;
	cursor: pointer;
}

#projectTitleWrap .title {
	height: 100%;
	line-height: 50px;
	color: #0871B9;
	float: left;
	margin-left: 15px;
	cursor:pointer;
}

/* 폴더명 수정 네모박스 */
#projectTitleWrap #titleEdit {
	height: 100%;
	float: left;
	line-height: 50px;
	display: none;
	margin-left: 5px;
}

#projectTitleWrap #titleEdit input {
	font-size: 17px;
	width: 180px;
	background: transparent;
	color: #838C91;
	border: none;
	background: #DCDCDC;
	height: 35px;
	padding-left: 10px;
	font-weight: bolder;
	border-radius:3px;
}

#projectTitleWrap #titleEdit input::placeholder {
	font-weight: bolder;
	color: #fff;
}

/* 참여자 프로필 사진 */
#applicant {
	width: 25px;
	height: 25px;
	margin-top: 12px;
	margin-left: 15px;
}

/* ======= 리스트 영역 ======= */
#listTotalWrap {display: inline-block;}
#listWrap {
	display: inline-block;
	vertical-align: top; /* 위로 정렬 */
}

/* #listWrap .list {
	background: #DCF1FF;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	width: 250px;
	padding: 5px 10px;
	display: inline-block;
	vertical-align: top;
	margin-top: 5px;
	margin-left: 20px;
	margin-right: 15px;
	margin-bottom: 35px;
} */

/* ======= 리스트 제목 영역 ======= */
.listTitleWrap {
	height: 40px;
	font-size: 15px;
	margin-bottom: 6px;
	margin-left: 10px;
}

/* 리스트 제목 */
#listTitle {
	height: 100%;
	line-height: 40px;
	color: #2F4E60;
	font-weight: 600;
	float: left;
	cursor:pointer;
}

/* 리스트 제목 input 네모박스 */
.titleEdit {
	height: 80%;
	margin-top: 5px;
	float: left;
	line-height: 30px;
	background: #DCDCDC;
	padding-left: 10px;
	display: none;
	border-radius: 3px;
}

.titleEdit input {
	font-size: 15px;
	background: #DCDCDC;
	color: #838C91;
	font-weight: 600;
	border: none;
}

.titleEdit input::placeholder {
	color: #2F4E60;
}

/* 리스트 메뉴 아이콘 */
#listIcon {
	width: 15px;
	height: 15px;
	margin-top: 12px;
	margin-right: 10px;
	cursor:pointer;
	float: right;
}

/* ======= 카드 영역 ======= */
.cardWrap {
	min-height: 10px;
	max-height: 663px;
	overflow-y: auto;
	margin-bottom: 10px;
}

/* 카드 위치 */
.cardContent {
	padding: 7px 10px;
	background: white;
	width: calc(100% - 20px);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin-bottom: 12px;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
	margin-left: 10px;
	/* -webkit-box-shadow: 1px 1px 1px 0px #bababa; */
	-moz-box-shadow: 1px 1px 1px 0px #bababa;
	/* box-shadow: 1px 1px 1px 0px #bababa; */
	cursor:pointer;
}

/* ======= 카드 추가 영역 ======= */
/* 카드 추가 */
.addLabel {
	padding: 7px 5px;
	color: #838C91;
	margin-bottom: 12px;
	cursor: pointer;
	margin-left: 10px;
}

.addCard {
	display: none;
	margin-left: 10px;
}

/* 클릭하면 나오는 카드 content 입력 textarea */
.addCard textarea {
	border: none;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 7px 10px;
	width: calc(100% - 20px);
	font-size: 15px;
	resize: none;
	height: 80px;
	margin-bottom: 7px;
	margin-left:5px;
	/* -webkit-box-shadow: 1px 1px 1px 0px #bababa; */
	-moz-box-shadow: 1px 1px 1px 0px #bababa;
	/* box-shadow: 1px 1px 1px 0px #bababa; */
}

.addCard button {
	margin-bottom: 15px;
	float: left;
	margin-left:5px;
}

#listAddWrap {
	display: inline-block;
	vertical-align: top;
}

/* ======= 리스트 추가 영역 ======= */
/* 리스트 추가 */
#listAddWrap #addListLabel {
	width: 250px;
	background: #DFE3E6;
	color: #838C91;
	font-size: 14px;
	padding: 10px 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 15px;
	cursor: pointer;
	margin-top: 5px;
}

/* 리스트 제목 입력 form */
#listAddWrap #addList {
	background: #DFE3E6;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	width: 250px;
	padding: 8px 10px;
	float: left;
	margin-right: 15px;
	display: none;
	margin-top: 5px;
}

#listAddWrap #addList input {
	padding: 7px 10px;
	background: white;
	width: calc(100% - 20px);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	border: none;
	margin-bottom: 7px;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
	font-size: 15px;
	/* -webkit-box-shadow: 1px 1px 1px 0px #bababa; */
	-moz-box-shadow: 1px 1px 1px 0px #bababa;
	/* box-shadow: 1px 1px 1px 0px #bababa; */
	margin-left: 9px;
}

#listAddWrap #addList button {
	float: left;
	margin-bottom: 5px;
	margin-left: 10px;
}

/* ======= 그 외 ======= */
input, button, textarea {
	font-family: 'Lato', sans-serif;
}

/* 크롬에서 focus 시 파란 테두리 생기는 것 방지 */
input:focus, textarea:focus {
	outline: none;
}

.btn {
	padding: 5px 10px;
	border: none;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	cursor: pointer;
	font-size: 15px;
}

.btn-green {
	background: #0871B9;
	color: white;
}

.close {
	float: left;
	display: flex;
	height: 28px;
	width: 28px;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	margin-right:17px;
	margin-top:2px;
}

.list-placeholder {
	width: 250px;
	height: 200px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	/* background: rgb(190, 190, 190); */
	margin-right: 15px;
	display: inline-block;
}

.card-placeholder {
	width: 250px;
	height: 33px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	/* 카드 옮길때 카드 영역 색상 (그림자) */
	/* background: #D6DCE0; */
	margin-bottom: 12px;
}

/* 리스트/카드 옮길때 스타일 */
.ui-sortable-helper {
	transform: skew(-5deg, 5deg) !important;
}

/* ======= 스크롤바 ======= */
::-webkit-scrollbar {
	width: 7px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

::-webkit-scrollbar-track {
	/* background: #DCF1FF; */
	background: transparent;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

::-webkit-scrollbar-thumb {
	/* background: #DCF1FF; */
	background: transparent;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}
</style>
</head>
<body>
    <div class="wrap">
		<jsp:include page="../common/menubar.jsp" />
    	<jsp:include page="../todo/todoCardDetail.jsp" />
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
            	<img id="folderListIcon" src="${ contextPath }/resources/images/todo/open-menu.png">
            	<!-- 프로젝트 이름 -->
            	<c:forEach var="f" items="${ folderInfo }">
                	<div class="title" style="font-size:14px;"><label id="title"><c:out value="${ f.folderName }" /></label></div>
                	<input type="hidden" id="contentFolderNo" value="${ f.folderNo }">  
                </c:forEach>
                <%-- <img id="applicant" src="${ contextPath }/resources/images/todo/admin_account.png"> --%>
                <!-- 프로젝트 이름 편집 -->
                <form id="titleEdit">
                    <input id="projectTitle" type="text" autocomplete="off">
                    <input type="submit" style="display: none">
                </form>
            </div>
            <!-- 리스트 영역 -->
            <!-- 리스트가 있을 경우 -->
            <c:if test="${ listInfo.size() > 0 }">
            	<div id="listTotalWrap">
            		<c:forEach var="li" items="${ listInfo }">
						<div id="listWrap" class="ui-sortable">
							<div class="list" style="background: #DCF1FF; -webkit-border-radius: 15px; -moz-border-radius: 15px; border-radius: 15px; width: 250px; padding: 5px 10px; display: inline-block; vertical-align: top; margin-top: 5px; margin-left: 20px; margin-right: 15px; margin-bottom: 35px;">
								<div class="listTitleWrap">
									<!-- 리스트 제목 -->
									<div id="listTitle" style="font-size: 14px;"><c:out value="${ li.listTitle }" /></div>
									<img id="listIcon" src="${ contextPath }/resources/images/todo/menu.png">
									<input type="hidden" id="listNo" name="listNo" value="${ li.listNo }">
									<input type="hidden" id="listCreateEmpNo" name="listCreateEmpNo" value="${ li.listCreateEmpNo }">
									<!-- 리스트 제목 편집 -->
									<form class="titleEdit">
										<input class="listTitle" type="text" autocomplete="off">
									</form>
								</div>
								<!-- 카드가 있을 경우 -->
								<c:if test="${ cardInfo.size() > 0 }">
									<!-- 카드 목록 -->
									<div class="cardWrap">
										<c:forEach var="c" items="${ cardInfo }">									
											<c:if test="${ li.listNo == c.listNo }">												
												<div class="cardContent">
													<div id="label-area">
													<c:forEach var="lb" items="${ labelInfo }">
														<!-- 라벨이 없는 카드일 경우 -->
														<c:if test="${ lb.cardNo != c.cardNo }">															   
														</c:if>
														<!-- 라벨이 있는 카드일 경우 -->	
														<c:if test="${ lb.cardNo == c.cardNo }">																															
															<c:if test="${ lb.colorNo == '1' }">	
																<span id="pinkLabel" style="width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block;  border-radius:10px; background:#F67CAB;"></span> 													                        									
                        									</c:if>
                        									<c:if test="${ lb.colorNo == '2' }">
                        										<span id="blueLabel" style="width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block;  border-radius:10px; background:#88acea;"></span>													                        									
                        									</c:if>
                        									<c:if test="${ lb.colorNo == '3' }">
                        										<span id="yellowLabel" style="width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#fbcf3b;"></span>
                        									</c:if>
                        									<c:if test="${ lb.colorNo == '4' }">
                        										<span id="orangeLabel" style="width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#ff965f;"></span>
                        									</c:if>
                        									<c:if test="${ lb.colorNo == '5' }">
                        										<span id="greenLabel" style="width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#b2d770;"></span>
                        									</c:if>                       		                          									   
														</c:if>
													</c:forEach>
													</div>			         								
													<div style="clear:both;"><c:out value="${ c.cardTitle }" /></div>
													<input type="hidden" id="cardNo" name="cardNo" value="${ c.cardNo }">
													<input type="hidden" id="cardCreateEmpNo" value="${ c.cardCreateEmpNo }">
												</div>								
											</c:if>
										</c:forEach>	
									</div>						
								</c:if>
								<!-- 카드 추가 -->
								<div class="cardAddWrap">
									<div class="addLabel" style="">+ Add another card</div>
										<form class="addCard" style="display: none;">
											<textarea name="" class="addCardContent" cols="30" rows="10" placeholder="카드명을 입력하세요."></textarea>
											<button class="btn btn-green addCardBtn">Add Card</button>
											<span class="close" id="addCardClose">×</span>
										</form>
								</div>
							</div>
						</div>
				</c:forEach>
			</div><!-- listTotalWrap -->
			</c:if>
            <!-- 리스트 추가 영역 -->
            <div id="listAddWrap" style="margin-left:25px;">
                <div id="addListLabel">+ Add another list</div>
                <form id="addList">
                    <input id="addListTitle" type="text" placeholder="리스트명을 입력하세요." autocomplete="off">
                    <button class="btn btn-green addListBtn">Add List</button>
                    <span class="close" id="addListClose">×</span>
                </form>
            </div>
       	    </div><!-- whitebox -->
        </div>
    </div>
    <!-- list Modal -->
    <script>
    /* TODO+ 클릭시 홈으로 이동 */
    function goTodoHome() {
    	location.href = "${contextPath}/main.td";
    }
    
    /* === 리스트 메뉴 === */
	//리스트 메뉴아이콘 클릭
	var createUser;
    var liNum;
    
	$(document).on("click", "#listIcon", function (e) {	
		/* 리스트 번호 */
		liNum = $(this).parent().children().eq(2).val();

		/* 리스트 생성한 사람의 사원번호 */
		createUser = $(this).parent().children().eq(3).val();
		
		var divTop = e.clientY + 10;
		var divLeft = e.clientX - 5;
		$("#modal-list-menu").css({"top" : divTop, "left" : divLeft, "position" : "absolute"}).show();
		
	});
	/* 리스트 삭제  */
	$(document).on("click", "#deleteList", function(e) {
			
		var loginUser = ${ sessionScope.loginUser.empNo };
		//console.log(createUser);
		/* 현재 로그인한 유저의 사원번호와 리스트를 생성한 사람의 사원번호가 일치할 경우에만 삭제 가능 */
		if(loginUser == createUser) {
			swal({
				title: "리스트를 삭제하시겠습니까?",
				text: "해당 리스트의 카드도 함께 삭제되며 복구할 수 없습니다.",
				icon: "warning",
				buttons: true,
				dangerMode: true
			}).then((willDelete) => {
				if(willDelete) {
					
					$.ajax({
						type:"POST",
						url:'deleteList.td',
						async:false,
						data:{
							"listNo" : liNum
						},
						success:function(data){
							swal("삭제 완료되었습니다.", {
							      icon: "success",							      
							})
							.then((value) => {
								if(value == true){
									/* 나중에 select로 바꾸기 */
									location.reload();
								}
							});								
						}
					});
					
				}else {
					swal("삭제가 취소되었습니다.");
				}
			});
			
		} else {
			swal({
				title: "",
				text: "리스트를 생성한 사람만 삭제가 가능합니다.",
				icon: "warning",
				buttons: "확인"
			});
		}
	}); 
	
	//담당자 추가 아이콘 클릭
	/* $(function() {
		$("#participantAdd").click(function() {
			$("#modal-participant-edit").show();
		});
	}); */

	//댓글 삭제 아이콘 클릭
	$(function() {
		$(".replyDeleteIcon").click(function() {
			$("#modal-reply-delete").show();
		});
	});
    
	/* left 메뉴 */
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
	
	//폴더명 클릭 시 list 페이지로 이동
	$(document).on("click", ".menuTitle_sub1", function() {
		var fNo = $(this).parent().children().eq(2).val();
		//console.log(fNo);
		location.href="${contextPath}/selectListInfo.td?fNo=" + fNo;	
	});

	$(function(){
		$('.nav2_todo').show();
		$('.nav1').css("margin-right", "0px");
		/* $('.contentDiv').css("width", "850px"); */
	});
	
	/* jQuery UI */
	/* ===== project name ===== */
	$(document).ready(function () {
		/* 폴더명 label */
	    var pjTitle = $("#title");
		/* 폴더명 */
		var pjTitleName = pjTitle.html();
		/* 폴더명 편집 form id */
	    var pjTitleEdit = $("#titleEdit");
		/* 리스트 추가 div id */
	    var addListLabel = $("#addLabel");
	    /* 리스트 추가 form id */
	    var addListForm = $("#addList");
	    /* 프로젝트 입력 input id */
	    var titleInput = $("#projectTitle");
	    
	    var folderNo = $("#projectTitleWrap").children("#contentFolderNo").val();
	    
	    /* 프로젝트 네임 클릭 시 수정 폼이 나옴 */
	    pjTitle.click(function (e) {
	    	/* 해당 태그가 기본으로 가지고 있는 event가 실행되지 않게 해줌 */
	        e.preventDefault();
	        titleInput.val(pjTitle.html());
	        pjTitle.hide();
	        pjTitleEdit.show();
	        pjTitleEdit.children("#projectTitle").focus();
	    });
	    
	    pjTitleEdit.submit(function (e) {
	        e.preventDefault();
	        let title = $("#projectTitle").val();
	        if (title == "") {
	            title = "New Project";
	        }
	        pjTitle.html(title);
	        pjTitleEdit.hide();
	        pjTitle.show();
	        
	        $.ajax({
				type:"POST",
				url:'updateFolderName.td',
				async:false,
				data:{
					"folderNo" : folderNo,
					"folderName" : title
				},
				success:function(data){
					$(".nav2_a").find('b:contains(' + pjTitleName + ')').html(data);					
				}
			});
	    });
	    /* ===== list name ===== */
	    /* $(고정적인 엘리먼트).on("이벤트명", "셀렉터", 핸들러(함수)) 로 dynamic한 엘리먼트들에 접근 가능*/
	    var listNo;
	    $(document).on('click', "#listTitle", function (e) {
	        e.preventDefault();
	        let ltTitleEdit = $(this).parent().children(".titleEdit");
	        ltTitleEdit.children(".listTitle").val($(this).html());
	        ltTitleEdit.children(".listTitle").focus();
	        $(this).hide();
	        ltTitleEdit.show();
	        listNo = $(this).parent().children("#listNo").val();
	    });
	    $(document).on("submit", ".titleEdit", function (e) {
	        e.preventDefault();
	        let ltTitle = $(this).parent().children("#listTitle");
	        let title = $(this).children(".listTitle").val();
	        ltTitle.html(title);
	        $(this).hide();
	        ltTitle.show();
	        
	        $.ajax({
				type:"POST",
				url:'updateListName.td',
				async:false,
				data:{
					"listNo" : listNo,
					"listName" : title
				}
			});
	    });

	    /* ===== card 추가 ===== */
	    /* .addLabel 클릭시 카드 추가 폼이 나옴 */
	    $(document).on("click", ".addLabel", function (e) {
	        e.preventDefault();
	        $(this).hide();
	        $(this).parent().children("form").show();
	        $(this).parent().children("form").children("textarea").focus();
	    });

	    /* submit하면 해당 카드의 부모 리스트에 카드를 append 시킴 */
	    /* .addCard => form class */
	    $(document).on("submit", ".addCard", function (e) {
	        e.preventDefault();
	        /* + Add another card div 클래스명 */
	        let addCardLabel = $(this).parent().children(".addLabel");
	        /* textarea 클래스명 */
	        let content = $(this).children(".addCardContent");
	     	
	     	/* 기존에 카드가 있는지 찾음 */
	     	var cardWrap = $(this).parents("#listWrap").children().children(".cardWrap");
	     	var liNo = $(this).parents("#listWrap").children().children(".listTitleWrap").children("#listNo").val();
	     	console.log(liNo);
	     	//var labelArea = $(this).parents(".list").children(".cardWrap").children().children("#label-area");
	     		     	
	     	/* 카드 추가를 위한 부모 리스트 찾기 */
	     	//var parentList1 = $(this).parents(".list").children(".cardWrap").children(".cardContent:last");	
	     	//var parentList2 = $(this).parents(".list").children().eq(1);
	     	var createEmpNo = ${ sessionScope.loginUser.empNo };

	     	/* DB에 insert */
			$.ajax({
				type:"POST",
				url:'insertCard.td',
				async:false,
				data:{
					"listNo" : liNo,
					"cardTitle" : content.val()
				},
				success:function(data){
					
					cardWrap.empty();
					
					for(key in data) {
						
						var cardNo;
						if(key == 'cardList') {
							var cardList = data[key];
							var cardListLength = data[key].length;
						}
						
						if(key == 'labelList') {
							var labelList = data[key];
							var labelListLength = data[key].length;
						}

					}//for문
						
						for(var i = 0; i < cardListLength; i++) {
							var card = cardList[i];
							cardNo = card.cardNo;
							
							var $card = "<div class='cardContent ui-sortable-handle'><div id='label-area"+ i +"'></div><div style='clear:both;'>"
								+ card.cardTitle
								+ "</div><input type='hidden' id='cardNo' name='cardNo' value='"
								+ cardNo
								+ "'><input type='hidden' id='cardCreateEmpNo' value='"
								+ card.cardCreateEmpNo
								+ "'></div>";

							cardWrap.append($card);		
							
							for(var j = 0; j < labelListLength; j++) {
								var label = labelList[j];
								var color = label.colorNo;
								var cNo = label.cardNo;
								
								//pink
								if(cardNo == cNo && color == '1') {
									var $label = "<span id='pinkLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#F67CAB;'></span>";
									
									$("#label-area" + i).append($label);
								}
								//blue
								if(cardNo == cNo && color == '2') {
									var $label = "<span id='blueLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block;  border-radius:10px; background:#88acea;'></span>";

									$("#label-area" + i).append($label);
								}
								//yellow
								if(cardNo == cNo && color == '3') {
									var $label = "<span id='yellowLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#fbcf3b;'></span>";

									$("#label-area" + i).append($label);
								}
								//orange
								if(cardNo == cNo && color == '4') {
									var $label = "<span id='orangeLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#ff965f;'></span>";

									$("#label-area" + i).append($label);
								}
																
								//green
								if(cardNo == cNo && color == '5') {
									var $label = "<span id='greenLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#b2d770;'></span>";

									$("#label-area" + i).append($label);
								}
							}										
						}
				} //success
			}); //ajax

        	content.val("");
        	$(this).hide();
        	addCardLabel.show();
        
        	$(".cardWrap").sortable({
            connectWith: ".cardWrap",
            placeholder: "card-placeholder"
        	});	     	
	    });

	    $(document).on("click", ".addCardBtn", function (e) {
	        e.preventDefault();
	        $(this).parent(".addCard").submit();
	    });

	    $(document).on("click", "#addCardClose", function (e) {
	        e.preventDefault();
	        $(this).parents(".addCard").children(".addCardContent").val("");
	        $(this).parents(".addCard").hide();
	        $(this).parents(".cardAddWrap").children(".addLabel").show();
	    });

	    /* ===== list 추가 ===== */
	    /* .addListLabel 클릭시 리스트 추가 폼이 나옴 */
	    $(document).on("click", "#addListLabel", function (e) {
	    	e.preventDefault();	
	    	$(this).hide();
	    	$(this).parent().children("form").show();
	    	$(this).parent().children("form").children("#addListTitle").focus();
	    });
	    
	    $(document).on("submit", "#addList", function (e) {
	    	e.preventDefault();
	    	let addListLabel = $(this).parent().children("#addListLabel");
	    	let listTitle = $(this).children("#addListTitle");
	        var anotherCard = "+Add another card";
	        var addCard = "Add Card";
	        var x = "x";
	        
	        /* 기존에 리스트가 있는지 찾음 */
	        var listStatus = $(this).parent().parent().children("#listWrap");
	        var listTotalWrap = $(this).parent().parent().children("#listTotalWrap");
        	var fNo = $(this).parents("#whiteBox").children("#projectTitleWrap").children("#contentFolderNo").val();
        	var createEmpNo = ${ sessionScope.loginUser.empNo };
	        	        	
	        	/* DB에 insert */
	        	$.ajax({
					type:"POST",
					url:'insertList.td',
					async:false,
					data:{
						"folderNo" : fNo,
						"listTitle" : listTitle.val()
					},
					success:function(data){
						
						listTotalWrap.empty();
						
						for(key in data) {
							
							var listNo;
							var lNo;
							var lists;
							var listsLength;
							if(key == 'list') {
								lists = data[key];
								//console.log(lists);
								listsLength = data[key].length;
							}
							
							var cards;
							var cardsLength;
							if(key == 'card') {
								cards = data[key];
								//console.log(cards);
								cardsLength = data[key].length;
							}
							
							var labels;
							var labelsLength;
							if(key == 'label') {
								labels = data[key];
								//console.log(labels);
								labelsLength = data[key].length;
							}
							
							var members;
							var membersLength;
							if(key == 'member') {
								members = data[key];
								//console.log(members);
								membersLength = data[key].length;
							}
						}
						
						for(var i = 0; i < listsLength; i++) {
							var list = lists[i];
							listNo = list.listNo;
							
							//첫 리스트를 생성할 경우
							if(listsLength == 1) {
								var $list = "<div id='listTotalWrap'><div id='listWrap' class='ui-sortable'><div class='list" + i +"' style='background: #DCF1FF; -webkit-border-radius: 15px; -moz-border-radius: 15px; border-radius: 15px; width: 250px; padding: 5px 10px; display: inline-block; vertical-align: top; margin-top: 5px; margin-left: 20px; margin-right: 15px; margin-bottom: 35px;'><div class='listTitleWrap ui-sortable-handle'><div id='listTitle' style='font-size:14px;'>"
								+ list.listTitle
								+ "</div><img id='listIcon' src='${ contextPath }/resources/images/todo/menu.png'><input type='hidden' id='listNo' name='listNo' value='"
								+ listNo
								+ "'><input type='hidden' id='listCreateEmpNo' name='listCreateEmpNo' value='"
								+ list.listCreateEmpNo
								+ "'><form class='titleEdit'><input class='listTitle' type='text' autocomplete='off'></form></div></div>";
								
								$("#listAddWrap").before($list);
								
								console.log("첫 리스트 생성");
								
							//이미 리스트가 존재할 경우
							} else {
								var $list = "<div id='listWrap' class='ui-sortable'><div class='list" + i +"' style='background: #DCF1FF; -webkit-border-radius: 15px; -moz-border-radius: 15px; border-radius: 15px; width: 250px; padding: 5px 10px; display: inline-block; vertical-align: top; margin-top: 5px; margin-left: 20px; margin-right: 15px; margin-bottom: 35px;'><div class='listTitleWrap ui-sortable-handle'><div id='listTitle' style='font-size:14px;'>"
								+ list.listTitle
								+ "</div><img id='listIcon' src='${ contextPath }/resources/images/todo/menu.png'><input type='hidden' id='listNo' name='listNo' value='"
								+ listNo
								+ "'><input type='hidden' id='listCreateEmpNo' name='listCreateEmpNo' value='"
								+ list.listCreateEmpNo
								+ "'><form class='titleEdit'><input class='listTitle' type='text' autocomplete='off'></form></div>";
								
								listTotalWrap.append($list);
								
								console.log("리스트가 존재함");
							}
							
							var cardNo;
							for(var j = 0; j < cardsLength; j++) {
								var card = cards[j];
								lNo = card.listNo;
								cardNo = card.cardNo;
								
								if(listNo == lNo) {
									var $card = "<div class='cardContent ui-sortable-handle'><div id='label-area"+ j +"'></div><div style='clear:both;'>"
									+ card.cardTitle
									+ "</div><input type='hidden' id='cardNo' name='cardNo' value='"
									+ card.cardNo
									+ "'><input type='hidden' id='cardCreateEmpNo' value='"
									+ card.cardCreateEmpNo
									+ "'></div>";								
									
									$(".list" + i).append($card);
									
									var cNo;
									for(var k = 0; k < labelsLength; k++) {
										var label = labels[k];
										var color = label.colorNo;
										cNo = label.cardNo;
										
										//pink
										if(cardNo == cNo && color == '1') {
											var $label = "<span id='pinkLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#F67CAB;'></span>";
											
											$("#label-area" + j).append($label);
											console.log(cardNo);
											console.log(cNo);
										}
										//blue
										if(cardNo == cNo && color == '2') {
											var $label = "<span id='blueLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block;  border-radius:10px; background:#88acea;'></span>";

											$("#label-area" + j).append($label);
											console.log(cardNo);
											console.log(cNo);
										}
										//yellow
										if(cardNo == cNo && color == '3') {
											var $label = "<span id='yellowLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#fbcf3b;'></span>";

											$("#label-area" + j).append($label);
											console.log(cardNo);
											console.log(cNo);
										}
										//orange
										if(cardNo == cNo && color == '4') {
											var $label = "<span id='orangeLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#ff965f;'></span>";

											$("#label-area" + j).append($label);
											console.log(cardNo);
											console.log(cNo);
										}
																		
										//green
										if(cardNo == cNo && color == '5') {
											var $label = "<span id='greenLabel' style='width:33px; height:4px; margin-left:2px; margin-top:3px; margin-bottom:9px; display:inline-block; border-radius:10px; background:#b2d770;'></span>";

											$("#label-area" + j).append($label);
											console.log(cardNo);
											console.log(cNo);
										}
									}
								} 
							}
							
							var $cardadd = "<div class='cardWrap ui-sortable'></div><div class='cardAddWrap'><div class='addLabel'>+ Add another card</div><form class='addCard' style='display: none;'><textarea class='addCardContent' cols='30' rows='10' placeholder='카드명을 입력하세요.''></textarea><button class='btn btn-green addCardBt'>Add Card</button><span class='close' id='addCardClose'>×</span></form></div>";
							$(".list" + i).append($cardadd);
						}
						
						/* var listNum = data;	
						
				                 값이 있을 경우 
				        if (listTitle.val() != null) {	        		  	    	        		        	
				        	 var $list = "<div id='listWrap' class='ui-sortable'><div class='list'><div class='listTitleWrap'><div id='listTitle' style='font-size: 14px;'>" 
				 	        	+ listTitle.val() 
				 	        	+ "</div><img id='listIcon' src='${ contextPath }/resources/images/todo/menu.png'><input type='hidden' id='listNo' name='listNo' value='"
				 	        	+ listNum 
				 	        	+ "'><input type='hidden' id='listCreateEmpNo' name='listCreateEmpNo' value='"
				 	        	+ createEmpNo
				 	        	+ "'><form class='titleEdit'><input class='listTitle' type='text' autocomplete='off'></form></div><div class='cardAddWrap'><div class='addLabel'>"
				 	        	+ anotherCard 
				 	        	+ "</div><form class='addCard' style='display: none;'><textarea name='' class='addCardContent' cols='30' rows='10' placeholder='카드명을 입력하세요.'></textarea><button class='btn btn-green addCardBtn'>"
				 	        	+ addCard
				 	        	+ "</button><span class='close' id='addCardClose'>"
				 	        	+ x 
				 	        	+ "</span></form></div></div></div>";

				                 기존에 리스트가 있을 경우 
				        if(listStatus.length != 0) {
				        	$("#addList").parent().parent().children("#listWrap:last").after($list);
				        /* 기존에 리스트가 없을 경우 */	
				        /* $(this).parent().parent() => whiteBox 
				        } else {
				        	$("#addList").parent().parent().children().eq(1).before($list);
				        }
					}
				        location.reload(); */
				}//success
			});
	        
	        listTitle.val("");
	        $(this).hide();
	        addListLabel.show();    
	        
	       	$(".cardWrap").sortable({
	            connectWith: ".cardWrap",
	            placeholder: "card-placeholder"
	        });	       	        
	    });
	    
	    $(document).on("click", ".addListBtn", function (e) {
	        e.preventDefault();
	        $(this).parent("#addList").submit();
	    });
	    
	    $(document).on("click", "#addListClose", function (e) {
	    	e.preventDefault();
	    	$(this).parent("#addList").children("#addListTitle").val("");
	    	$(this).parent("#addList").hide();
	    	$(this).parents("#listAddWrap").children("#addListLabel").show();
	    });

	    /* 리스트간의 정렬 및 이동 */
	    $("#listWrap").sortable({
	    	/* 해당 엘리먼트가 놓일 자리에 마크가 생김 */
	        placeholder: "list-placeholder",
	        /* 해당 엘리먼트를 선택해야 이동이 가능 */
	        handle: ".listTitleWrap"
	    });

	    /* 리스트간의 카드 이동 */
	    $(".cardWrap").sortable({
	    	/* 서로 자식 엘리먼트(cardContent)를 공유함 */
	        connectWith: ".cardWrap",
	        placeholder: "card-placeholder"
	    });
	});
	
	$(document).ready(function() {
		//left메뉴에 폴더 목록 불러오기
		$.ajax({
			type:"POST",
			url:'selectFolderList.td',
			async:false,
			success:function(data){
				for(key in data){
					//console.log(data[key]);
					var $folder = "<li><a href='#' class='nav2_a'><img class='btn forder1 sub1_f1' src='${ contextPath }/resources/images/menubar/forder2.png'><b class='menuTitle_sub1 sub1_1' style='margin-left:5px;'>"
									+ data[key].folderName 
									+ "</b><input type='hidden' id='folderNo' name='folderNo' value='" 
									+ data[key].folderNo 
									+ "'><input type='hidden' id='folderCreateEmpNo' name='folderCreateEmpNo' value='"
									+ data[key].empNo
									+ "'><img id='deleteIcon' class='deleteIcon' src='${ contextPath }/resources/images/todo/close.png' style='cursor:pointer; display: none;'></a></li>";
					$(".folderList").append($folder);
				}					
				//console.log(data[0].folderName);
				//$("#title").html(data[0].folderName);
			}				
		});		
		
		//폴더 메뉴아이콘 클릭
		var folderNo;
		$(function() {
			$("#folderListIcon").click(function(e) {
				var divTop = e.clientY + 10;
				var divLeft = e.clientX;
				$("#modal-folder-menu").css({"top" : divTop, "left" : divLeft, "position" : "absolute"}).show();
				
				folderNo = $(this).parent().children("#contentFolderNo").val();
			});
		});
				
		//Modal 폴더명 수정 클릭
		var title;
		$(function() {
			$("#modalFolderEdit").click(function() {
				$('.modal-folderMenu').hide();
				$("#modal-folder-edit").show();
				title = $("#title").html();
				$("#editFolderName").val(title);
			});
		});
			
		//Modal 폴더명 수정
		$(function() {
			$("#editFolderConfirm").click(function() {
				var folderName = $("#editFolderName").val();
					
				$.ajax({
					type:"POST",
					url:'updateFolderName.td',
					async:false,
					data:{
						"folderNo" : folderNo,
						"folderName" : folderName
					},
					//성공시 data = controller에서 넘겨준 folderName
					success:function(data){
						
						$('.modal-folderEdit').hide();
						
						swal("수정이 완료되었습니다.", {
						      icon: "success",							      
							})
							.then((value) => {
								if(value == true){
									$("#title").html(data);
									$(".nav2_a").find('b:contains(' + title + ')').html(data);	
								}
							});
					}
				});
			});
		});		
	});
			
	/* *****수정해야함***** */
	//Modal 폴더 삭제
	$(document).on("click", "#modalFolderDelete", function(){
		var fNo = $("#deleteIcon").parent().children().eq(2).val();

		swal({
			title: "",
			text: "정말 삭제하시겠습니까?",
			icon: "warning",
			buttons: true,
			dangerMode: true
		}).then((willDelete) => {
			if(willDelete) {
				location.href="${contextPath}/deleteFolder.td?fNo=" + fNo;
			}else {
				swal("삭제가 취소되었습니다.");
			}
		});
	});	
	
	/* === 카드 상세보기 === */
	//카드 상세보기
	$(document).on("click", ".cardContent", function(){
			var cardNo = $(this).children("#cardNo").val();
			var cardCreateEmpNo = $(this).children("#cardCreateEmpNo").val();
			
			$.ajax({
					type:"POST",
					url:'selectCardDetail.td',
					async:false,
					data:{
						"cardNo" : cardNo
					},
					success:function(data){
						$("#modal-card-detail").show();
						
						for(var key in data) {
							//카드
							if(key == 'Card') {
								var list = data[key];
								var length = data[key].length;	
								$(".main-participant").empty();
								
								for(var i = 0; i < length; i++) {
									var card = list[i];
									var des = card.description;
									var inchargePhoto = card.changeName;
									var dueDate = card.dueDate;
									console.log(dueDate);
									
									/* 카드 제목 */
									$("#cardTitle").html(card.cardTitle);
									
									/* 담당자 */
									//담당자가 없을 경우
									if(inchargePhoto == null) {										
										var $parti = "<input type='hidden' id='cardNo' name='cardNo' value='"
													+ cardNo
													+ "'><input type='hidden' id='cardCreateEmpNo' name='cardCreateEmpNo' value='"
													+ cardCreateEmpNo
													+ "'><label id='participant'>담당자</label><br><div id='inchargeImage'><img id='participantAdd' data-toggle='modal' data-target='#mandatorModal' src='${ contextPath }/resources/images/todo/add.png'></div>";
									//담당자가 있을 경우	
									} else {
										var $parti = "<input type='hidden' id='cardNo' name='cardNo' value='"
													+ cardNo
													+ "'><input type='hidden' id='cardCreateEmpNo' name='cardCreateEmpNo' value='"
													+ cardCreateEmpNo													
													+ "'><label id='participant'>담당자</label><br><div id='inchargeImage'><img id='participantAdd' data-toggle='modal' data-target='#mandatorModal' src='${ contextPath }/resources/uploadFiles/"
										            + inchargePhoto
										            + "'></div>";
									}
									
									$(".main-participant").append($parti);
									
									/* 기한일 */
									if(dueDate == null) {
										$("#dueDate").css("margin-left", 26);
										$("#dueDate").html("없음");
									} else {	
										var date = new Date(dueDate);
										var year = date.getFullYear();
										var stringYear = year.toString();
										var month = date.getMonth() + 1;
										var day = date.getDate();
										
										var resultYear = stringYear.substr(2);
										var resultMonth = (month < 10 ? "0" + month : month);
										var resultDay = (day < 10 ? "0" + day : day);	
										var resultDuedate = resultYear + "/" + resultMonth + "/" + resultDay;	
										$("#dueDate").css("margin-left", 16);
										$("#dueDate").html(resultDuedate);
									}
																		
									/* 설명 */
									if(des == null) {
										$("#des").html("등록된 내용이 없습니다.");
									} else {
										$("#des").html(des);
									}																		
								}
							}
							
							//라벨
							if(key == 'Label') {
								var list = data[key];
								var length = data[key].length;
								
								//라벨이 있을 경우
								if(length > 0) {
									
									$("#labelArea").empty();
									
									for(var i = 0; i < length; i++) {
										var label = list[i];
										var color = label.colorNo;
										
										//pink
										if(color == '1') {
											$label = "<div id='pink'><input type='hidden' id='labelNo' value='"
														+ label.labelNo
														+ "'><input type='hidden' id='cNo' value='1'></div>";
										}
										
										//blue
										if(color == '2') {
											$label = "<div id='blue'><input type='hidden' id='labelNo' value='"
														+ label.labelNo
														+ "'><input type='hidden' id='cNo' value='2'></div>";
										}
										
										//yellow
										if(color == '3') {
											$label = "<div id='yellow'><input type='hidden' id='labelNo' value='"
														+ label.labelNo
														+ "'><input type='hidden' id='cNo' value='3'></div>";
										}
										
										//orange
										if(color == '4') {
											$label = "<div id='orange'><input type='hidden' id='labelNo' value='"
														+ label.labelNo
														+ "'><input type='hidden' id='cNo' value='4'></div>";
										}
										
										//green 
										if(color == '5') {
											$label = "<div id='green'><input type='hidden' id='labelNo' value='"
														+ label.labelNo
														+ "'><input type='hidden' id='cNo' value='5'></div>";
										}
										
										$("#labelArea").append($label);
									}
									
								} else {
									var $label = "<div id='noLabel'><label style='font-size:12px; margin-left:26px; margin-top:8px; font-weight:normal;'>없음</label></div>";
									$("#labelArea").empty();
									$("#labelArea").append($label);
								}
							}
							
							//체크리스트
							if(key == 'Checklist') {
								var list = data[key];
								var length = data[key].length;
								$(".main-checklist-wrap").empty();
								
								//체크리스트가 있을 경우
								if(length > 0) {
									for(var i = 0; i < length; i++) {
										var checklist = list[i];
										var checkStatus = checklist.checkYN;
																				
										if(checkStatus == 'Y') {
											//체크된 경우 라벨 속성에 checkSelected 클래스를 추가해주고 체크박스의 속성에 checked 추가
											var $checklist = "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox' checked='checked'><label id='clContent' class='checkSelected'>"
												+ checklist.checklistContent
												+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
												+ checklist.checklistNo
												+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
												+ checklist.checkYN
												+ "'></div></div>";
											
										} else {
											//체크 안된 경우	
											var $checklist = "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox'><label id='clContent'>"
												+ checklist.checklistContent
												+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
												+ checklist.checklistNo
												+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
												+ checklist.checkYN
												+ "'></div></div>";
										}								
										$(".main-checklist-wrap").append($checklist);
									}
								} 
							}							
							
							//첨부파일
							if(key == 'Attachment') {
								var list = data[key];
								var length = data[key].length;		
								
								//파일이 있을 경우
								if(length > 0) {
									
									$(".main-attach-content").empty();
									
									for(var i = 0; i < length; i++) {
										var file = list[i];
										var originName = file.originName;
										var editName = originName.lastIndexOf('.');
										var imageFormat = originName.substring(editName + 1);
					            		var result = imageFormat.toLowerCase();
					            		
					            		var fileSize = file.fileSize;
					            		var size = 1024 * 1024;	
					            		var mb = Math.round((fileSize / size) * 100)/100;
					            		var kb = Math.round((fileSize / 1024) * 100)/100;
					            		var bt = Math.round(fileSize * 100)/100;
					            		
					            		//이미지일 경우 미리보기
					            		if(result == 'png' || result == 'jpg' || result == 'jpeg' || result == 'gif') {
					            			
					            			if(fileSize >= size) {
					            				
					            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
					            					  + file.changeName 
					            					  + "'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + mb
					            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            				
					            			} else if(fileSize >= 1024) {
					            				
					            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
					            					  + file.changeName 
					            					  + "'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + kb
					            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            					  
					            			} else {
					            				
					            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
					            					  + file.changeName 
					            					  + "'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + bt
					            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            			}
					            			
					            			$(".main-attach-content").append($image);	

					            			var modalHeight = $(".modal-content5").height();			
					    					$(".modal-content5").height(modalHeight + 30);

					    				//pdf일 경우 (pdf 아이콘 추가)
										} else if(result == 'pdf') {
											
											if(fileSize >= size) {
					            				
												$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + mb	  
					            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
															            				
					            			} else if(fileSize >= 1024) {
					            				
					            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + kb	  
					            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            					  
					            			} else {
					            				
					            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + bt	  
					            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            			}
				            				
				            				$(".main-attach-content").append($file);
				            				
				            				var modalHeight = $(".modal-content5").height();			
				        					$(".modal-content5").height(modalHeight+20);
				        					
				        				//그 외 파일	
										} else {
											if(fileSize >= size) {
					            				
												$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + mb	  
					            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
															            				
					            			} else if(fileSize >= 1024) {
					            				
					            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + kb	  
					            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            					  
					            			} else {
					            				
					            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
					            					  + file.attachNo
					            					  +	"'><label id='fileName'>"
					            					  + file.originName
					            					  + "</label><label id='fileSize'>  ("
					            					  + bt	  
					            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
					            			}

				            				$(".main-attach-content").append($file);
				            				
				            				var modalHeight = $(".modal-content5").height();			
				        					$(".modal-content5").height(modalHeight+20);
										}				            		
									}
									
								} else {
									$(".main-attach-content").empty();
									$noFile = "<div id='noFile-div'><label id='noFile-label'>등록된 파일이 없습니다.</label></div>";
									$(".main-attach-content").append($noFile);
								}
							}
							
							//댓글
							if(key == 'Reply') {
								//Reply 객체를 key로 꺼내서 list에 담아줌
								var list = data[key];
								var length = data[key].length;
								$("#replyArea").empty();
								
								for(var i = 0; i < length; i++) {
									var reply = list[i];
									var empName = reply.empName;
									var position = reply.positionName;
									var writer = empName + " " + position;
									var writerEmpNo = reply.replyCreateEmpNo;
									var loginUserEmpNo = ${ sessionScope.loginUser.empNo };
									
									//작성 시간
									var timestamp = reply.enrollDate;
									var date = new Date(timestamp);
									var month = date.getMonth() + 1;
									var day = date.getDate();
									var hours = date.getHours();
									var minutes = date.getMinutes();										
									var monthDay = month + "월 " + day + "일 ";									
									var time = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes);
									var totalTime = monthDay + time;															
															
									//로그인한 유저가 작성한 댓글에만 수정/삭제 아이콘이 보이도록 설정
									if(loginUserEmpNo == writerEmpNo) {
										var $reply ='<div class="replyWrap"><div class="replyWriter"><label id="writer">'
								              + writer
								              +'</label></div>' 
								              +'<div class="replyContentWrap"><div class="replyContent">' 
								              +'<label id="reContent">'
								              + reply.replyContent
								              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
								              + totalTime
								              +'</label></div>'  
								              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
								              + reply.replyNo
								              + '"><img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png"><img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png"></div></div>';
									} else {
										var $reply ='<div class="replyWrap"><div class="replyWriter"><label id="writer">'
								              + writer
								              +'</label></div>' 
								              +'<div class="replyContentWrap"><div class="replyContent">' 
								              +'<label id="reContent">'
								              + reply.replyContent
								              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
								              + totalTime
								              + '</label></div>'  
								              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
								              + reply.replyNo
								              + '"></div></div>';
									}
									              
									$("#replyArea").append($reply);
									
									var height = $(".modal-content5").height();
									
									$(".modal-content5").height(height+50);
								}
							}							
						}//for문
					}//success
			});//ajax
		});
	</script>
</body>
</html>