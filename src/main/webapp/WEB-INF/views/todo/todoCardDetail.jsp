<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<style>   
	.card-detail-wrap { width:800px; position: relative; }
	
   /* ========== 카드 제목 영역 ========== */
   /* header 전체 div */
   .card-detail-header { width:800px; height:60px; }  
   /* 제목 아이콘 div */
   .titleIcon { width:40px; height:60px; float:left; margin-left:20px; display:inline-block; }  
   /* 제목 아이콘 img */
   #cardTitleIcon { width:20px; height:18px; margin-top:32px; margin-left:12px; }  
   /* 카드 제목 div */
   .card-detail-title { width:600px; height:25px; margin-left:10px; display:inline-block; }
   /* 닫기 아이콘 div */
   .card-detail-close { width:40px; height:45px; display:inline-block; margin-left:80px; }
   /* input text */
   #titleText { width:180px; height: 30px; border-radius: 3px; /* position: relative; */ border: 1.4px solid lightgray; resize: none; }
   #titleText:hover { border: 1.4px solid #88acea; }
   /* 제목 수정 버튼 */
   #titleModifyBtn { width:50px; height:30px; font-size:12px; font-weight:normal;background: #0871B9; color: white; padding: 5px; margin: 2px; 
	  				  border-radius:5px; border: 1px; outline: 1px; margin-left:10px; margin-right:5px; margin-bottom:3px; }
   /* 제목 수정 취소 버튼 */
   #titleCloseBtn { width:50px; height:30px; border:0.8px solid #DDDDDD; font-weight:normal; font-size:12px; background: white; color: #0871B9; 
	                border-radius:5px; outline: 1px; margin-top:5px; }
     
   /* ========== 담당자/설명/체크리스트/댓글 영역 ========== */
   .card-detail-main { float:left; width:650px; min-height:760px; height:auto; position:relative; margin-top:2px; }
   /* 담당자/라벨/기한일 div */
   .main-wrap { width:650px; height:80px; }
   
   /* ========== 담당자 ========== */
   /* 담당자 div */
   .main-participant { width:155px; height:80px; display:inline-block; float:left; }
   /* 담당자 label */
   #participant { font-size:12px; font-weight:normal; margin-left:70px; margin-top:15px; }  
   /* 담당자 추가 아이콘 */
   #participantAdd { width:30px; height:30px; margin-left:70px; margin-top:5px; cursor:pointer; border-radius: 100%; }
   
   /* ========== 라벨 ========== */
   /* 라벨 전체 div */
   .main-label { min-width:100px; height:80px; display:inline-block; float:left; } 
   #noLabel { width:80px; height:30px; margin-top:5px; background:#ECEFF1; border-radius:10px; }  
   /* 라벨 label */
   #label { font-size:12px; font-weight:normal; margin-top:15px; }   
   /* 라벨 색상 */  
   #pink { width:30px; height:30px; margin-top:5px; background:#F67CAB; border-radius:100%; display:inline-block; float:left; margin-left:3px; }  
   #blue { width:30px; height:30px; margin-top:5px; background:#88acea; border-radius:100%; display:inline-block; float:left; margin-left:3px; } 
   #yellow { width:30px; height:30px; margin-top:5px; background:#fbcf3b; border-radius:100%; display:inline-block; float:left; margin-left:3px; }   
   #orange { width:30px; height:30px; margin-top:5px; background:#ff965f; border-radius:100%; display:inline-block; float:left; margin-left:3px; }  
   #green { width:30px; height:30px; margin-top:5px; background:#62bf66; border-radius:100%; display:inline-block; float:left; margin-left:3px; }
   
   /* ========== 기한일 ========== */
   /* 기한일 전체 div */
   .main-duedate { min-width:100px; height:80px; display:inline-block; float:left; margin-left:40px; }  
   /* 기한일 label */
   #dueDateTitle { font-size:12px; font-weight:normal; margin-top:15px; }  
   /* 기한일 div */
   #dueDateArea { width:80px; height:30px; margin-top:5px; background:#ECEFF1; border-radius:10px; }   
   /* 기한일 들어가는 라벨 */
   #dueDate { font-size:12px; font-weight:normal; margin-left:16px; margin-top:8px; cursor:pointer; }
	   
   /* ========== 설명 ========== */
   /* 전체 div */
   .main-description { width:650px; min-height:150px; margin-top:25px; }
   /* 아이콘 div */
   .main-description-icon { width:40px; height:45px; margin-left:15px; display:inline-block; }
   /* 타이틀 div */
   .main-description-title { width:550px; height:30px; margin-left:10px; display:inline-block; } 
   /* 내용 div */
   .main-description-content { width:550px; min-height:80px; margin-left:70px; display:inline-block; }
   /* 내용 라벨 div */
   .descript { background: #ECEFF1; border-radius: 10px; width: 550px; min-height: 80px; position: relative; }  
   /* 내용 label */
   #des { font-weight:normal; color:#595959; font-size:12px; margin-top:15px; margin-left:15px; margin-bottom:15px; cursor:pointer; }
   /* input text */
   #desText { width:550px; min-height: 80px; border-radius: 3px; position: relative; border: 1.4px solid lightgray; resize: none; }
   #desText:hover { border: 1.4px solid #88acea; }
   /* 설명 저장 버튼 */
   #desConfirmBtn { width:50px; height:30px; font-size:12px; font-weight:normal;background: #0871B9; color: white; padding: 5px; margin: 2px; 
	  				  border-radius:5px; border: 1px; outline: 1px; margin-left:2px; margin-right:5px; margin-top:5px; }
   /* 설명 취소 버튼 */
   #desCloseBtn { width:50px; height:30px; border:0.8px solid #DDDDDD; font-weight:normal; font-size:12px; background: white; color: #0871B9; 
	                border-radius:5px; outline: 1px; margin-top:5px; }
   
   /* ========== 체크리스트 ========== */
   /* 전체 div */
   .main-checklist { width:650px; min-height:110px; height:auto; margin-top:25px; }
   /* 아이콘 div */
   .main-checklist-icon { width:40px; height:45px; margin-left:15px; display:inline-block; }
   /* 아이콘 이미지 */
   #checkBox { width:17px; height:16px; margin-left:18px; }
   /* 타이틀 div */
   .main-checklist-title { width:550px; height:30px; margin-left:10px; background:white; display:inline-block; }
   /* 체크리스트 내용 전체 div */
   .main-checklist-wrap { width:550px; /* min-height:80px; height:auto; */ margin-left:70px; }
   /* 체크리스트 내용 하나 div */   
   .main-checklist-list { width:550px; height:30px; }
   /* 체크박스 div */
   .main-checklist-content { width:550px; height:25px; display:inline-block; margin-bottom: 10px;}
   /* input text */
   #clText { margin-left:5px; width:525px; }
   #clText:hover { border: 1.4px solid #88acea; }
   /* 체크리스트 추가 이미지 */
   #addChecklist { width:30px; height:30px; margin-left:70px; margin-top:10px; cursor:pointer; }
   /* 체크리스트 저장 버튼 */
   #checkConfirmBtn { width:50px; height:30px; font-size:12px; font-weight:normal;background: #0871B9; color: white; padding: 5px; margin: 2px; 
	  				  border-radius:5px; border: 1px; outline: 1px; margin-left:13px; margin-right:5px; margin-top:5px; }
   /* 체크리스트 취소 버튼 */
   #checkCloseBtn { width:50px; height:30px; border:0.8px solid #DDDDDD; font-weight:normal; font-size:12px; background: white; color: #0871B9; 
	                border-radius:5px; outline: 1px; margin-top:5px; }
   /* 체크리스트 내용 */
   #clContent { margin-left:10px; font-size:12px; font-weight:normal; cursor:pointer; }    
   /* 체크박스 체크 시 label 스타일 변경 */
   .checkSelected { text-decoration:line-through; }
   /* 체크리스트 수정 저장 버튼 */
   #checkEditBtn { width:50px; height:30px; font-size:12px; font-weight:normal;background: #0871B9; color: white; padding: 5px; margin: 2px; 
	  				  border-radius:5px; border: 1px; outline: 1px; margin-left:13px; margin-right:5px; margin-top:5px; }
   /* 체크리스트 수정 취소 버튼 */
   #checkCancelBtn { width:50px; height:30px; border:0.8px solid #DDDDDD; font-weight:normal; font-size:12px; background: white; color: #0871B9; 
	                border-radius:5px; outline: 1px; margin-top:5px; }
   /* 체크리스트 삭제 아이콘 */
   #deleteCk { cursor:pointer; }
	                
   /* ========== 파일 ========== */
   /* 전체 div */
   .main-attach { width:650px; min-height:150px; height:auto; margin-top:25px; }
   /* 아이콘 div */
   .main-attach-icon { width:40px; height:45px; margin-left:15px; display:inline-block; }
   /* title div */
   .main-attach-title { width:550px; height:30px; margin-left:10px; display:inline-block; }
   /* content div */
   .main-attach-content { width:550px; min-height:20px; height:auto; margin-left:70px; display:inline-block; }
   /* 파일 하나 div */
   .main-attach-detail { width:550px; height:80px; margin-top:10px;}
   /* 이미지 (크기) */
   #attachImage { width:75px; height:75px; }
   /* 파일 이름 label */
   #fileName { font-weight:normal; font-size:12px; margin-left:10px; cursor:pointer; }
   /* 파일 크기 label */
   #fileSize { font-weight:normal; font-size:12px; margin-left:2px; color:gray; }
   /* 삭제 아이콘 */
   #deleteAttach { width:9px; height:9px; margin-left:13px; cursor:pointer; }
   /* PDF아이콘 */
   #pdfIcon { width:17px; height:17px; }
   /* 등록된 파일이 없을 때 */
   #noFile-div { background: #ECEFF1; border-radius: 10px; width: 550px; min-height: 80px; position: relative; }
   #noFile-label { font-weight:normal; color:#595959; font-size:12px; margin-top:15px; margin-left:15px; margin-bottom:15px; }
   
   /* ========== 댓글 ========== */
   /* 댓글 전체 div */
   .main-reply { width:650px; min-height:150px; height:auto; margin-top:25px; }
   /* 댓글 아이콘 div */
   .main-reply-icon { width:40px; height:45px; margin-left:15px; display:inline-block; }  
   /* 댓글 아이콘 */
   #replyIcon { width: 18px; height: 18px; margin-left:10px; margin-top:8px; }
   /* 댓글 (0) div */
   .main-reply-title { width:550px; height:30px; margin-left:10px; display:inline-block; }
   /* 댓글 (0) 아래 전체 wrap */
   .main-reply-wrap { width:550px; min-height:80px; height:auto; margin-left:70px; }
   /* 댓글 div */
   .main-reply-list { width:550px; height:50px; }
   /* 댓글 작성 div */
   .main-reply-content { min-width:100px; height:35px; margin-left:5px; display:inline-block; }
   /* 카드 상세보기 댓글 박스 div */
   .replyBox { background: white; border-radius: 3px; cursor: pointer; border: 1px solid rgb(210,210,210); width: 545px; height: 30px; } 
   /* 댓글 작성 label */
   #writeReply { font-weight:normal; color:#595959; font-size:12px; margin-left:5px; margin-top:5px; cursor:pointer; }
   /* 댓글 불러와서 append하는 div */
   #replyArea { width:550px; min-height:20px; height:auto; margin-left:5px; display:inline-block; }
   /* 댓글 작성자 이름 div */
   .replyWriter { width:150px; height:30px; }
   /* 댓글 작성자 이름 label */
   #writer { font-size:12px; margin-top:5px; margin-left:0px; font-weight:bold; }
   /* 댓글 내용 전체 div */
   .replyContentWrap { width:550px; height:30px; }
   /* 댓글 내용 div */
   .replyContent { min-width:100px; height:25px; display:inline-block; float:left; }
   /* 댓글 내용 label */
   #reContent { font-size:12px; font-weight:normal; }
   /* 댓글 작성 시간 div */
   .replyTimeArea { width:90px; height:25px; display:inline-block; float:left; margin-left:10px; color:gray; }   
   /* 댓글 작성 시간 label */
   #writeTime { font-size:12px; font-weight:normal; } 
   /* 댓글 수정/삭제 아이콘 div */
   .replyEditArea { width:40px; height:25px; display:inline-block; float:left; } 
   /* 댓글 수정 아이콘 */
   .replyEditIcon { width: 10px; height: 10px; margin-left:10px; cursor:pointer; }
   /* 댓글 삭제 아이콘 */
   .replyDeleteIcon { width: 9px; height: 9px; margin-left: 7px; cursor:pointer; }
   /* input text */
   #replyText { width:545px; min-height: 50px; border-radius: 3px; position: relative; border: 1.4px solid lightgray; resize: none; }
   #replyText:hover { border: 1.4px solid #88acea; }
   /* 댓글 저장 버튼 */
   #replyConfirmBtn { width:50px; height:30px; font-size:12px; font-weight:normal;background: #0871B9; color: white; padding: 5px; margin: 2px; 
	  				  border-radius:5px; border: 1px; outline: 1px; margin-left:2px; margin-right:5px; margin-top:5px; cursor:pointer; }
   /* 댓글 작성 취소 버튼 */
   #replyCloseBtn { width:50px; height:30px; border:0.8px solid #DDDDDD; font-weight:normal; font-size:12px; background: white; color: #0871B9; 
	                border-radius:5px; outline: 1px; margin-top:5px; cursor:pointer; }
   #replyModifyBtn { width:50px; height:30px; font-size:12px; font-weight:normal;background: #0871B9; color: white; padding: 5px; margin: 2px; 
	  				 border-radius:5px; border: 1px; outline: 1px; margin-left:2px; margin-right:5px; margin-top:5px; cursor:pointer; }
  
   /* ===== 삭제 ===== */
   /* 삭제 전체 div */
   .card-detail-delete { width:100px; height:40px; background:#DCF1FF; border-radius:10px; margin-left:15px; margin-top:15px; } 
   /* 삭제 아이콘 div */
   .card-detail-deleteIcon { width:25px; height:30px; margin-left:15px; display:inline-block; }  
   /* 삭제 label */
   #deleteCard { font-size:13px; margin-top:12px; font-weight:bold; cursor:pointer; }
   
   /* 상세보기 Modal background */
   .modal-cardDetail {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 10; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
   }
   
   /* 상세보기 Modal content */
   .modal-content5 {
      background-color: #fefefe;
      margin: 10% auto; /* 15% from the top and centered */
      /* padding: 20px; */
      border: 1px solid lightgray;
      width: 800px; /* Could be more or less, depending on screen size */
      min-height: 840px;
      height:auto;
      /* padding-bottom: 30px; */
   }
   
   /* ======= 조직도 Modal ======= */
   li { list-style:none; font-size:14px; }
   .tree_menu2 {line-height: 30px; margin-top: 20px; padding-left: 20px;}
   .tree_menu2 strong {font-weight:normal;}
   .tree_menu2 label input {vertical-align:-2px;}
   .tree_menu2 .depth_1 a {vertical-align:bottom;text-decoration:none;cursor:pointer;}
   .tree_menu2 .depth_1 strong, .form_tree_menu .form_depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
   .tree_menu2 .depth_2_1 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
   .tree_menu2 .depth_2_1 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
   .tree_menu2 .depth_2_1 li a em.on {background-position:0 100%;}
   .tree_menu2 li.last {background:none;}
   .tree_menu2 li.last {background:none;}
   .tree_menu2 .depth_3 {display:none;padding-left:23px;}
   .tree_menu2 .depth_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
   .tree_menu2 .depth_3 li a, .depth_form {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
   .msie6 .tree_menu2 .depth_3 li a {display:inline-block; }
   .tree_menu2 li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}

   /* ======= 조직도 Modal ======= */
   #mandatorModal { top:180px; right:250px; }
   
   /* ======= 라벨 Modal ======= */
   .label-wrap { width:220px; height:25px; margin-bottom:3px; }
   #mandatorModal2 { top:260px; left:500px; }
   .modal-backdrop { background-color: transparent !important; }   
</style>
<script>
	//카드 상세보기 Modal 닫기 아이콘 클릭   
	$(function() {
		$("#closeIcon4").click(function() {
			$('.modal-cardDetail').hide();
			$(".modal-content5").height(840);
		});
	});	
</script>
</head>
<body>
	<!-- Modal content -> 카드 상세보기 -->
		<div id="modal-card-detail" class="modal-cardDetail">
			<div class="modal-content5">
				<div class="card-detail-wrap">
					<!--카드 제목 영역 -->
					<div class="card-detail-header">
						<div class="titleIcon">							
							<img id="cardTitleIcon" src="${ contextPath }/resources/images/todo/cardTitle.png">
						</div>
						<div class="card-detail-title">
							<!-- 카드 제목 -->
							<label id="cardTitle" style="font-size:13px; font-weight:bold; cursor:pointer;"></label>
						</div>
						<div class="card-detail-close"> 
							<img id="closeIcon4" src="${ contextPath }/resources/images/todo/close.png" style="cursor:pointer;">
						</div>
					</div>
					<!-- 담당자/설명/체크리스트/댓글 영역 -->
					<div class="card-detail-main">
						<!-- 담당자/라벨/기한일 -->
						<div class="main-wrap">
							<!-- 담당자 -->
							<div class="main-participant"></div>
							<!-- 라벨 -->
							<div class="main-label">
								<label id="label">라벨</label>
								<br>
								<div id="labelArea"></div>							
							</div>
							<!-- 기한일 -->
							<div class="main-duedate">
								<label id="dueDateTitle">기한일</label>
								<br>
								<div id="dueDateArea">
									<label id="dueDate" onclick="deleteDuedate();"></label>
								</div>  
							</div>
						</div>
						<!-- 설명 -->
						<div class="main-description">
							<div class="main-description-icon">
								<img id="description" src="${ contextPath }/resources/images/todo/description.png" style="width:18px; height:17px; margin-left:18px;">
							</div>
							<div class="main-description-title">
								<label style="font-size:13px; margin-top:7px;"><b>설명</b></label>
							</div>
							<div class="main-description-content">
								<div class="descript">
									<label id="des"></label>
								</div>
							</div>
						</div>
						<!-- 체크리스트 -->
						<div class="main-checklist">
							<div class="main-checklist-icon">
								<img id="checkBox" src="${ contextPath }/resources/images/todo/check-box.png">
							</div>
							<div class="main-checklist-title">
								<label style="font-size:13px; margin-top:7px;"><b>체크리스트</b></label>
							</div>
							<div class="main-checklist-wrap">
								<!-- <div class="main-checklist-list">
									<div class="main-checklist-content">
										<input id="clCheck" type="checkbox">
										<input id="clText" type="text">
										<img src="${ contextPath }/resources/images/todo/close.png" style="width:9px; height:9px; margin-left:10px; margin-bottom:2px;">
									</div>
									</div> -->
							</div>
							<div class="main-checklistAdd-wrap">
								<img id="addChecklist" src="${ contextPath }/resources/images/todo/add.png">
							</div>
						</div>
						<!-- 파일 -->
						<div class="main-attach">
							<div class="main-attach-icon">
								<img id="attach" src="${ contextPath }/resources/images/todo/attach.png" style="width:20px; height:20px; margin-left:18px;">
							</div>
							<div class="main-attach-title">
								<label style="font-size:13px; margin-top:7px;"><b>파일</b></label>
							</div>
							<div class="main-attach-content">
								<%-- <div class="main-attach-detail">
									<img id="attachImage" src="${ contextPath }/resources/images/todo/mybatis.PNG">
									<label id="fileName">mybatis.PNG</label>
									<label id="fileSize">(387.0KB)</label>
									<img id="deleteAttach" src="${ contextPath }/resources/images/todo/close.png">
								</div> --%>
							</div>
						</div>
						
						<!-- 댓글 -->
						<div class="main-reply">
							<div class="main-reply-icon">
								<img id="replyIcon" src="${ contextPath }/resources/images/todo/cardReply.png" style="width:20px; height:20px; margin-left:18px;">
							</div>
							<div class="main-reply-title">
								<label style="font-size:13px; margin-top:7px;"><b>댓글</b></label>
								<label style="font-size:13px; margin-top:7px;"><b>(0)</b></label>
							</div>
							<div class="main-reply-wrap">
									<div class="main-reply-list">
											<div class="main-reply-content">
												<div class="replyBox">
													<label id="writeReply">댓글을 작성해주세요.</label>
												</div>
											</div>
										</div>
									<div id="replyArea">
										<%-- <div class="replyWriter">
											<label id="writer"></label>
										</div>
										<div class="replyContentWrap">
											<div class="replyContent">
												<label id="reContent">장터 싫어요ㅠㅠ</label>						
										    </div>
										    <div class="replyTimeArea">
										    	<label id="writeTime">3월 23일 20:30</label>
										    </div>
											<div class="replyEditArea">
												<img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png" style="cursor:pointer;">
												<img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png" style="cursor:pointer;">
											</div>
										</div>
										<img id="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png" style="cursor:pointer; display: none;"> --%>																			
									</div>																															
							</div>
						</div>
					</div>
					<!-- 사이드바 영역 (라벨/기한일/파일/삭제)-->
					<div class="card-detail-sidebar-wrap" style="float:right; width:145px; height:770px; height:auto; position:relative; margin-top:2px;">
						<div class="card-detail-sidebar" style="width:145px; height:250px;">
							<!-- 라벨 -->
							<div class="card-detail-label" style="width:100px; height:40px; background:#DCF1FF; border-radius:10px; margin-left:15px; margin-top:30px;">
								<div class="card-detail-labelIcon" style="width:25px; height:30px; margin-left:15px; display:inline-block;">
									<img src="${ contextPath }/resources/images/todo/label.png" style="width:18px; height:18px; margin-top:2px;">
								</div>
								<label id="addLabel" style="font-size:13px; margin-top:12px; cursor:pointer; font-weight:bold;" data-toggle='modal' data-target='#mandatorModal2'>라벨</label>
							</div>
							<!-- 기한일 -->
							<div class="card-detail-duedate" style="width:100px; height:40px; background:#DCF1FF; border-radius:10px; margin-left:15px; margin-top:15px;">
								<div class="card-detail-dudateIcon" style="width:25px; height:30px; margin-left:15px; display:inline-block;">
									<img src="${ contextPath }/resources/images/todo/clock.png" style="width:18px; height:18px; margin-top:2px;">
								</div>
								<label id="addDuedate" style="font-size:13px; margin-top:12px; font-weight:bold; cursor:pointer;">기한일</label>
							</div>
							<!-- 파일 -->
							<div class="card-detail-file" style="width:100px; height:40px; background:#DCF1FF; border-radius:10px; margin-left:15px; margin-top:15px;">
								<div class="card-detail-fileIcon" style="width:25px; height:30px; margin-left:15px; display:inline-block;">
									<img src="${ contextPath }/resources/images/todo/clip.png" style="width:18px; height:18px; margin-top:2px;">
								</div>
								<label id="addFileLabel" style="font-size:13px; margin-top:12px; cursor:pointer; font-weight:bold;">파일</label>
								<!-- 파일 첨부 -->
								<form id="insertFileForm" method="post" enctype="multipart/form-data">
									<input id="addFile" type="file" name="picture" style="display:none;">
								</form>
							</div>							
							<!-- 삭제 -->
							<div class="card-detail-delete">
								<div class="card-detail-deleteIcon">
									<img src="${ contextPath }/resources/images/todo/bin.png" style="width:18px; height:18px; margin-top:2px;">
								</div>
								<label id="deleteCard">삭제</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<!-- 조직도 Modal -->
	<div class="modal fade" id="mandatorModal" role="dialog">
		<div class="modal-dialog" style="width:250px; height:500px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" style="margin-right:-10px;">×</button>
					<h5 class="modal-title">담당자 설정</h5>
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
					<button type="button" id="deleteIncharge" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 라벨 Modal -->
	<div class="modal fade" id="mandatorModal2" role="dialog">
		<div class="modal-dialog" style="width:250px; height:300px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" style="margin-right:-10px;">×</button>
					<h5 class="modal-title">라벨</h5>
				</div>
				<div class="modal-body">
					<div style="width: 220px; height:135px;">
						<!-- pink -->
						<div class="label-wrap">
							<div style="vertical-align:top; display:inline-block;"><input type="checkbox" id="labelColor1" class="labelCheck" name="labelCheck" value="1"></div>
							<div style="width:200px; height:23px; background:#f67cab; border-radius:3px; display:inline-block;"></div>							
						</div>
						<!-- blue -->
						<div class="label-wrap">
							<div style="vertical-align:top; display:inline-block;"><input type="checkbox" id="labelColor2" class="labelCheck" name="labelCheck" value="2"></div>
							<div style="width:200px; height:23px; background:#88acea; border-radius:3px; display:inline-block;"></div>							
						</div>
						<!-- yellow -->
						<div class="label-wrap">
							<div style="vertical-align:top; display:inline-block;"><input type="checkbox" id="labelColor3" class="labelCheck" name="labelCheck" value="3"></div>
							<div style="width:200px; height:23px; background:#fbcf3b; border-radius:3px; display:inline-block;"></div>							
						</div>
						<!-- orange -->
						<div class="label-wrap">
							<div style="vertical-align:top; display:inline-block;"><input type="checkbox" id="labelColor4" class="labelCheck" name="labelCheck" value="4"></div>
							<div style="width:200px; height:23px; background:#ff965f; border-radius:3px; display:inline-block;"></div>							
						</div>
						<!-- green -->
						<div class="label-wrap">
							<div style="vertical-align:top; display:inline-block;"><input type="checkbox" id="labelColor5" class="labelCheck" name="labelCheck" value="5"></div>
							<div style="width:200px; height:23px; background:#62bf66; border-radius:3px; display:inline-block;"></div>							
						</div>
					</div>					
				</div>
				<!-- <div class="modal-footer" style="clear: both;">
					<button type="button" id="addLabelBtn" class="btn btn-primary">적용</button>
					<button type="button" id="deleteLabelBtn" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div> -->
			</div>
		</div>
	</div>
	
	<!-- 기한일 Modal -->
	<div class="modal fade" id="mandatorModal3" role="dialog">
		<div class="modal-dialog" style="width:250px; height:300px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" style="margin-right:-10px;">×</button>
					<h5 class="modal-title">기한일</h5>
				</div>
				<div class="modal-body">
					<div style="width: 220px; height:100px;">
						<input type="text" id="datepicker" style="width:90px; padding-left:3px;">
					</div>					
				</div>
				<div class="modal-footer" style="clear: both;">
					<button type="button" id="addLabelBtn" class="btn btn-primary">적용</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
		
	<script>
		/* 현재시간을 구하는 함수 */
		function getTimeStamp() {
			var date = new Date();
			var result = leadingZeros(date.getFullYear(), 4) + '-' +
						 leadingZeros(date.getMonth() + 1, 2) + '-' +
	           			 leadingZeros(date.getDate(), 2) + ' ' +
	
	           			 leadingZeros(date.getHours(), 2) + ':' +
	           			 leadingZeros(date.getMinutes(), 2) + ':' +
	           			 leadingZeros(date.getSeconds(), 2);
	
	         return result;
		}
		
		function leadingZeros(n, digits) {
			var zero = '';
	        n = n.toString();
	
	        if (n.length < digits) {
	          for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	        }
	        return zero + n;
		}
		
		$(document).ready(function() {	
			
			//카드명 수정
			var cardNo;
			$(document).on("click", "#cardTitle", function(){
				cardNo = $(this).parents(".card-detail-wrap").children(".card-detail-main").children().eq(0).children(".main-participant").children("#cardNo").val();
				var title = $(this).html();
				
				var $editTitle = "<input type='text' id='titleText' value='"
			 		  + title
			 		  + "'><button id='titleModifyBtn' type='button'>수정</button><button id='titleCloseBtn' type='button'>취소</button>";
				
				$(this).replaceWith($editTitle);			
			});
			
			$(document).on("click", "#titleModifyBtn", function(){
				var cardName = $(this).parent().children("#titleText").val();
				var titleDiv = $(this).parent();
				
				$.ajax({
					type:"POST",
					url:'updateCardName.td',
					async:false,
					data:{
						"cardNo" : cardNo,
						"cardName" : cardName
					}, 
					success:function(data) {
						var $title = "<label id='cardTitle' style='font-size:13px; font-weight:bold; cursor:pointer;'>"
									+ cardName
									+ "</label>";
						titleDiv.empty();
						titleDiv.append($title);
					}
				});	
			});
			
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
			});//ajax
						
			/* 사원 가져와서 조직도에 추가하는 ajax */
			$.ajax({
					type:"POST",
					url :'selectMemberList.st',
					async: false,
					success:function(data){
						for(key in data){
	 					//console.log(data[key]);
	 					var $member = "<li class='end'><input type='hidden' value='"+ data[key].empNo +"'><a href='#none' style='width:100px; cursor:pointer;'>" + data[key].empName + " " 
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
			});//ajax
			
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
				 $(this).css("background-color", "#DCF1FF");
				 $(this).css("border-radius", "5px");
				 autEmpName = $(this).text();
				 autEmpNo = $(this).parent().children("input").val();
			 });
			 
			 var cardNo;
			 
			 //담당자 추가 아이콘 클릭
			 $(document).on("click", "#participantAdd", function(){	
				 cardNo = $(this).parent().parent().children("#cardNo").val();	
			 });
			
			 //===== 담당자 추가 =====
			 $("#autChk").click(function(){
				 $("#autSpan").empty();
				 $("#autSpan").append("<span class='empNameSpan'>"+ autEmpName + "</span>");

				 $.ajax({
			            type:"POST",
			            url :'insertIncharge.td',
			            async: false,
			            data:{
							"cardNo" : cardNo,
							"empNo" : autEmpNo 
						},
			            success:function(data){		            			         
			            	         	
			            	$("#mandatorModal").hide();	 
			            	$(".main-participant").empty();
			           
								for(key in data) {
									console.log(data[key]);
									var $incharge = "<input type='hidden' id='cardNo' name='cardNo' value='"
										+ data[key].cardNo
										+ "'><input type='hidden' id='cardCreateEmpNo' name='cardCreateEmpNo' value='"
										+ data[key].cardCreateEmpNo													
										+ "'><label id='participant'>담당자</label><br><div id='inchargeImage'><img id='participantAdd' data-toggle='modal' data-target='#mandatorModal' src='${ contextPath }/resources/uploadFiles/"
							            + data[key].changeName
							            + "'><input type='hidden' id='inchargeEmpNo' name='inchargeEmpNo' value='"
										+ data[key].inchargeEmpNo
										+ "'></div>";
									$(".main-participant").append($incharge); 
								}					        	
			            }//success
			      });//ajax 			 
			 });	
			 
			 //===== 담당자 삭제 =====
			 $("#deleteIncharge").click(function() {

				 $.ajax({
			            type:"POST",
			            url :'deleteIncharge.td',
			            async: false,
			            data:{
							"cardNo" : cardNo,
							"empNo" : autEmpNo 
						},
			            success:function(data){		
			            	         	
			            	$("#mandatorModal").hide();	 
			            	$(".main-participant").empty();
			           
								for(key in data) {
									console.log(data[key]);
									
									var $incharge = "<input type='hidden' id='cardNo' name='cardNo' value='"
													+ data[key].cardNo
													+ "'><input type='hidden' id='cardCreateEmpNo' name='cardCreateEmpNo' value='"
													+ data[key].cardCreateEmpNo
													+ "'><label id='participant'>담당자</label><br><div id='inchargeImage'><img id='participantAdd' data-toggle='modal' data-target='#mandatorModal' src='${ contextPath }/resources/images/todo/add.png'></div>";
																		
									$(".main-participant").append($incharge); 
								}				        	
			            }//success
			      }); 				
			 });
			 
				//===== 카드 삭제 =====
				$("#deleteCard").click(function() {
					var cardNo = $(this).parent().parents(".card-detail-wrap").children(".card-detail-main").children().eq(0).children(".main-participant").children("#cardNo").val();
					var createUser = $(this).parent().parents(".card-detail-wrap").children(".card-detail-main").children().eq(0).children(".main-participant").children("#cardCreateEmpNo").val();
					//console.log("cardNo : " + cardNo);
					//console.log(cardCreateEmpNo);
								
					var loginUser = ${ sessionScope.loginUser.empNo };
					
					/* 카드를 생성한 사람만 삭제 가능 */
					if(loginUser == createUser) {
					swal({
						title: "카드를 삭제하시겠습니까?",
						text: "카드를 삭제하면 복구할 수 없습니다.",
						icon: "warning",
						buttons: true,
						dangerMode: true
					}).then((willDelete) => {
						if(willDelete) {
							
							$.ajax({
								type:"POST",
								url:'deleteCard.td',
								async:false,
								data:{
									"cardNo" : cardNo
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
						text: "카드를 생성한 사람만 삭제가 가능합니다.",
						icon: "warning",
						buttons: "확인"
					});
				}
					
				});
		});//document.ready
		
		//체크리스트 추가 - text 상자 나오게 하기
		$(document).on("click", "#addChecklist", function(){	
			 var $checklist = "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox'><input id='clText' type='text'><button id='checkConfirmBtn' type='button'>저장</button><button id='checkCloseBtn' type='button'>취소</button></div></div>";				 
			 var no = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			 var listTotalWrap = $(this).parents(".main-checklist");
			 var listWrap = $(this).parents(".main-checklistAdd-wrap").parent().children(".main-checklist-wrap");
			 var modal = $(this).parents(".modal-content5");

			 //체크리스트 내용 맨 뒷부분에 text 상자를 추가해줌
			 listWrap.append($checklist);
			 
			 //높이가 자동으로 늘어나지 않아서 체크리스트 div의 높이를 늘려줌 
			 var totalWrapHeight = listTotalWrap.height();
			 listTotalWrap.css("height", totalWrapHeight + 10);
		     
			 var wrapHeight = listWrap.height();
			 listWrap.css("height", wrapHeight + 30);
			 			 
		     //Modal 높이 조정
		     var modalHeight = modal.height();			
			 modal.css("height", modalHeight + 10);
			 
			 //*****modal의 높이가 초기값일 경우 높이를 늘리지 않아야함 => 수정하기 *****
			 
			 $(this).parent().empty();
			 //$(".main-checklist-list").append($checklist);
			 //$(".main-checklist-add").empty();
		 });		
		
		//체크리스트 추가 
		$(document).on("click", "#checkConfirmBtn", function(){	
			var content = $(this).parent().children("#clText").val();
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			var listTotalWrap = $(this).parents(".main-checklist");
			var listWrap = $(this).parents(".main-checklist-wrap");
			var addWrap = $(this).parents(".main-checklist").children(".main-checklistAdd-wrap");
			var totalWrapHeight = listTotalWrap.height();
			var listWrapHeight = listWrap.height();
			
			$.ajax({
	            type:"POST",
	            url :'insertChecklist.td',
	            async: false,
	            data:{
					"cardNo" : cardNo,
					"content" : content
				},
	            success:function(data){		
	            	         	
	            	listWrap.empty();
			           
					for(key in data) {
						var checkStatus = data[key].checkYN;
						
						if(checkStatus == 'Y') {
							var $checklist =  "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox' checked='checked'><label id='clContent' class='checkSelected'>"
								+ data[key].checklistContent
								+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
								+ data[key].checklistNo
								+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
								+ data[key].checkYN
								+ "'></div></div>";
						} else {
							var $checklist =  "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox'><label id='clContent'>"
								+ data[key].checklistContent
								+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
								+ data[key].checklistNo
								+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
								+ data[key].checkYN
								+ "'></div></div>";
						}	
						//체크리스트 내용 append
						listWrap.append($checklist);
					}
					
					listTotalWrap.css("height", totalWrapHeight + 20);
					listWrap.css("height", listWrapHeight - 10);
					
					//체크리스트 추가 아이콘 append (추가 시 empty 해줬기 때문에 추가)
					var $checkAdd = "<img id='addChecklist' src='${ contextPath }/resources/images/todo/add.png'>";						
					addWrap.append($checkAdd);
					
	            }//success
	      	});
		});
		
		//체크리스트 체크
		$(document).on("click", "#clCheck", function(){
			
			var checklistNo = $(this).parent().children("#checklistNo").val();
			var checkStatus;
			
			if($(this).prop("checked")) {
				$(this).parent().children("#clContent").addClass("checkSelected");
				checkStatus = 'Y';
			} else {
				$(this).parent().children("#clContent").removeClass("checkSelected");
				checkStatus = 'N';
			} 

			$.ajax({
	            type:"POST",
	            url :'updateCheckStatus.td',
	            async: false,
	            data:{
					"checkStatus" : checkStatus,
					"checklistNo" : checklistNo
				}
	      	});
		});
		
		var checklistNo;
		var listWrap;
		var listTotalWrap;
		var addWrap;
		var listWrapHeight;
		var totalWrapHeight;
		var addWrapHeight;
		//체크리스트 수정 (체크리스트 내용 클릭)
		$(document).on("click", "#clContent", function(){
			checklistNo = $(this).parent().children("#checklistNo").val();
			var content = $(this).html();
			
			var modal = $(this).parents(".modal-content5");
			listTotalWrap = $(this).parents(".main-checklist");
			listWrap = $(this).parents(".main-checklist-wrap");
			var list = $(this).parents(".main-checklist-list");
			addWrap = $(this).parents(".main-checklist").children(".main-checklistAdd-wrap");
			
			var modalHeight = modal.height();
			totalWrapHeight = listTotalWrap.height();
			listWrapHeight = listWrap.height();	
			var listHeight = list.height();
			addWrapHeight = addWrap.height();
			
			var $checklist = "<div class='main-checklist-list' style='height:75px;'><div class='main-checklist-content'><input id='clCheck' type='checkbox'><input id='clText' type='text' value='"
							  + content
							  + "'><button id='checkEditBtn' type='button'>수정</button><button id='checkCancelBtn' type='button'>취소</button></div></div>";
			
			//기존 main-checklist-list를 수정 폼으로 바꿔줌
			list.replaceWith($checklist);
			
			//높이 조정
			modal.css("height", modalHeight + 50);
			listTotalWrap.css("height", totalWrapHeight + 50);
			listWrap.css("height", listWrapHeight + 40);
		});
		
		//체크리스트 수정 저장 버튼 클릭
		$(document).on("click", "#checkEditBtn", function(){
			var ckNo = checklistNo;
			var content = $(this).parent().children("#clText").val();
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			var modal = $(this).parents(".modal-content5");
			console.log(modal);
			
			$.ajax({
            	type:"POST",
            	url :'updateChecklist.td',
            	async: false,
            	data:{
            		"cardNo" : cardNo,
					"checklistNo" : ckNo,
					"content" : content
				},
            	success:function(data){		
            	         	
            		listWrap.empty();
		           
					for(key in data) {
						var checkStatus = data[key].checkYN;
					
						if(checkStatus == 'Y') {
							var $checklist =  "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox' checked='checked'><label id='clContent' class='checkSelected'>"
							+ data[key].checklistContent
							+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
							+ data[key].checklistNo
							+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
							+ data[key].checkYN
							+ "'></div></div>";
						} else {
							var $checklist =  "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox'><label id='clContent'>"
							+ data[key].checklistContent
							+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
							+ data[key].checklistNo
							+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
							+ data[key].checkYN
							+ "'></div></div>";
						}	
						//체크리스트 내용 append
						listWrap.append($checklist);
					}
				
					listTotalWrap.css("height", totalWrapHeight + 10);
					listWrap.css("height", listWrapHeight + 10);
					//addWrap.css("height", addWrapHeight + 20);			
            	}//success 
      		});
		});
		
		//체크리스트 삭제
		$(document).on("click", "#deleteCk", function(){
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			var checklistNo = $(this).parent().children("#checklistNo").val();
			var listTotalWrap = $(this).parents(".main-checklist");
			var listWrap = $(this).parents(".main-checklist-wrap");
			
			$.ajax({
				type: "POST",
				url: "deleteChecklist.td",
				async: false,
				data: {
					"cardNo" : cardNo,
					"checklistNo" : checklistNo
				},      
				success:function(data) {

					listWrap.empty();
			           
					for(key in data) {
						var checkStatus = data[key].checkYN;
					
						if(checkStatus == 'Y') {
							var $checklist =  "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox' checked='checked'><label id='clContent' class='checkSelected'>"
							+ data[key].checklistContent
							+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
							+ data[key].checklistNo
							+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
							+ data[key].checkYN
							+ "'></div></div>";
						} else {
							var $checklist =  "<div class='main-checklist-list'><div class='main-checklist-content'><input id='clCheck' type='checkbox'><label id='clContent'>"
							+ data[key].checklistContent
							+ "</label><img id='deleteCk' src='${ contextPath }/resources/images/todo/close.png' style='width:9px; height:9px; margin-left:10px; margin-bottom:2px;'><input type='hidden' id='checklistNo' name='checklistNo' value='"
							+ data[key].checklistNo
							+ "'><input type='hidden' id='checkYN' name='checkYN' value='"
							+ data[key].checkYN
							+ "'></div></div>";
						}	
						//체크리스트 내용 append
						listWrap.append($checklist);
					}
				
					listTotalWrap.css("height", totalWrapHeight - 10);
					listWrap.css("height", listWrapHeight - 10);
				}
			});

		});
		
		//파일 label 클릭시 파일 추가 창 띄우기
		$("#addFileLabel").click(function() {		
			$("#addFile").click();
		});

		$("input[name=picture]").on("change", function() {
			
			var cardNo = $(this).parents(".card-detail-sidebar-wrap").parent().children(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			var form = $("#insertFileForm")[0];
			var formData = new FormData(form);
			formData.append("fileObj", $("#addFile")[0].files[0]);
			console.log(formData);
			
			$.ajax({
				type: "post",
				url: "insertFileInfo.td",
				data: {
					"cardNo" : cardNo
				},
				success: function(data) {
					
					$.ajax({
			            type: "post",
			            url: "uploadFile.td",
			            processData: false,
			            contentType: false,
			            data: formData,
			            success: function(data) {
			            	
			            	$(".main-attach-content").empty();			            	
			    			            	
			            	for(key in data) {
			            		var originName = data[key].originName;
			            		var editName = originName.lastIndexOf('.');
			            		var imageFormat = originName.substring(editName + 1);
			            		var result = imageFormat.toLowerCase();
			            		
			            		var fileSize = data[key].fileSize;
			            		var size = 1024 * 1024;	
			            		var mb = Math.round((fileSize / size) * 100)/100;
			            		var kb = Math.round((fileSize / 1024) * 100)/100;
			            		var bt = Math.round(fileSize * 100)/100;
			            		
			            		//이미지일 경우 미리보기
			            		if(result == 'png' || result == 'jpg' || result == 'jpeg' || result == 'gif') {
			            			
			            			if(fileSize >= size) {
			            				
			            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
			            					  + data[key].changeName 
			            					  + "'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + mb
			            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            				
			            			} else if(fileSize >= 1024) {
			            				
			            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
			            					  + data[key].changeName 
			            					  + "'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + kb
			            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            					  
			            			} else {
			            				
			            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
			            					  + data[key].changeName 
			            					  + "'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + bt
			            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            			}
			            			
			            			$(".main-attach-content").append($image);	
			            			
			            			var modalHeight = $(".modal-content5").height();			
			    					$(".modal-content5").height(modalHeight+30);

			    				//pdf일 경우 (pdf 아이콘 추가)
								} else if(result == 'pdf') {
									
									if(fileSize >= size) {
			            				
										$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + mb	  
			            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
													            				
			            			} else if(fileSize >= 1024) {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + kb	  
			            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            					  
			            			} else {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
			            					  + data[key].originName
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
			            					  + data[key].attachNo
			            					  +	"'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + mb	  
			            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
													            				
			            			} else if(fileSize >= 1024) {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + kb	  
			            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            					  
			            			} else {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + bt	  
			            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            			}
		            				
		            				$(".main-attach-content").append($file);
		            				
		            				var modalHeight = $(".modal-content5").height();			
		        					$(".modal-content5").height(modalHeight+20);
								}			            		
			            	}//for문			            				          			            	
			            }//success
			      	});
				}//success
			});		
		});
		
		//파일 다운로드
		$(document).on("click", "#fileName", function() {
			var attachNo = $(this).parent().children("#attachNo").val();
			
			location.href = "${contextPath}/downloadFile.td?attachNo=" + attachNo;			
		});
		
		//파일 삭제
		$(document).on("click", "#deleteAttach", function() {
			var attachNo = $(this).parent().children("#attachNo").val();
			var cardNo = $(this).parent().parents(".card-detail-wrap").children(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();		
			var modal = $(this).parent().parents(".card-detail-wrap").parent();
			
			swal({
				title: "첨부파일을 삭제하시겠습니까?",
				text: "첨부파일을 삭제하면 복구할 수 없습니다.",
				icon: "warning",
				buttons: true,
				dangerMode: true
			}).then((willDelete) => {
				if(willDelete) {
					
					$.ajax({
			            type:"POST",
			            url :'deleteFile.td',
			            async: false,
			            data:{
							"attachNo" : attachNo,
							"cardNo" : cardNo
						},
			            success:function(data){		
		    	         		            		          	          
			            	$(".main-attach-content").empty();			            	
			            	
			            	for(key in data) {
			            		var originName = data[key].originName;
			            		var editName = originName.lastIndexOf('.');
			            		var imageFormat = originName.substring(editName + 1);
			            		var result = imageFormat.toLowerCase();
			            		//console.log(result);
			            		
			            		var fileSize = data[key].fileSize;
			            		var size = 1024 * 1024;	
			            		var mb = Math.round((fileSize / size) * 100)/100;
			            		var kb = Math.round((fileSize / 1024) * 100)/100;
			            		var bt = Math.round(fileSize * 100)/100;
			            		
			            		//이미지일 경우 미리보기
			            		if(result == 'png' || result == 'jpg' || result == 'jpeg' || result == 'gif') {
			            			
			            			if(fileSize >= size) {
			            				
			            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
			            					  + data[key].changeName 
			            					  + "'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + mb
			            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            				
			            			} else if(fileSize >= 1024) {
			            				
			            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
			            					  + data[key].changeName 
			            					  + "'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + kb
			            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            					  
			            			} else {
			            				
			            				$image = "<div class='main-attach-detail'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='attachImage' src='${ contextPath }/resources/uploadFiles/todo/"
			            					  + data[key].changeName 
			            					  + "'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + bt
			            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            			}
			            			
			            			$(".main-attach-content").append($image);	
			            			
			    					var modalHeight = modal.height();
			    					modal.height(modalHeight - 40);

			    				//pdf일 경우 (pdf 아이콘 추가)
								} else if(result == 'pdf') {
									
									if(fileSize >= size) {
			            				
										$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + mb	  
			            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
													            				
			            			} else if(fileSize >= 1024) {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + kb	  
			            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            					  
			            			} else {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><img id='pdfIcon' src='${ contextPath }/resources/images/todo/pdf.PNG'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + bt	  
			            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            			}
		            				
		            				$(".main-attach-content").append($file);
		            				
		            				var modalHeight = modal.height();
			    					modal.height(modalHeight - 40);
		        					
		        				//그 외 파일	
								} else {
									if(fileSize >= size) {
			            				
										$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + mb	  
			            					  + "MB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
													            				
			            			} else if(fileSize >= 1024) {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + kb	  
			            					  + "KB)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            					  
			            			} else {
			            				
			            				$file = "<div class='main-attach-detail' style='height:40px;'><input type='hidden' id='attachNo' name='attachNo' value='"
			            					  + data[key].attachNo
			            					  +	"'><label id='fileName'>"
			            					  + data[key].originName
			            					  + "</label><label id='fileSize'>  ("
			            					  + bt	  
			            					  + "byte)</label><img id='deleteAttach' src='${ contextPath }/resources/images/todo/close.png'></div>";
			            			}
		            				
		            				$(".main-attach-content").append($file);
		            					            				
		            				var modalHeight = modal.height();
			    					modal.height(modalHeight - 40);
								}			            		
			            	}//for문		        	
			            }
			      	});	
					
				}else {
					swal("삭제가 취소되었습니다.");
				}
			});				
		});

		//라벨 등록
		var cardNo;
		var labelArea;
		var cNoList = new Array();
		$(document).on("click", "#addLabel", function(){
			cardNo = $(this).parents("#modal-card-detail").children().children().children(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			labelArea = $(this).parents(".card-detail-sidebar").parents(".modal-content5").children().children(".card-detail-main").children(".main-wrap").children(".main-label").children("#labelArea");
			var color1 = $("#labelColor1").val();
			var color2 = $("#labelColor2").val();
			var color3 = $("#labelColor3").val();
			var color4 = $("#labelColor4").val();
			var color5 = $("#labelColor5").val();
			
			//등록되어 있는 라벨의 색상번호를 가져옴
			cNoList = labelArea.children().children("#cNo");

			//등록되어 있는 라벨의 경우 checked 상태로 바꿔줌
			cNoList.each(function() {
				var cNo = $(this).val();
				
				if(cNo == color1){
					$("#labelColor1").attr("checked", true);
				}
				if(cNo == color2){
					$("#labelColor2").attr("checked", true);
				}
				if(cNo == color3){
					$("#labelColor3").attr("checked", true);
				}
				if(cNo == color4){
					$("#labelColor4").attr("checked", true);
				}
				if(cNo == color5){
					$("#labelColor5").attr("checked", true);
				}
			});		
		});
		
		$(document).on("click", ".labelCheck", function(){
			var colorNo = $(this).val();

			//라벨 등록 => 체크 시 DB insert
			if($(this).prop("checked")) {
				
				$.ajax({
		            type:"POST",
		            url :'insertLabel.td',
		            async: false,
		            data:{
						"cardNo" : cardNo,
						"colorNo" : colorNo
					},
		            success:function(data){		
		            	
		            	//$("#mandatorModal2").hide();            	
		            	labelArea.empty();
		            	
		            	for(key in data) {
		            		var color = data[key].colorNo;
		            		
		            		//pink
							if(color == '1') {
								$label = "<div id='pink'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='1'></div>";
							}
							
							//blue
							if(color == '2') {
								$label = "<div id='blue'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='2'></div>";
							}
							
							//yellow
							if(color == '3') {
								$label = "<div id='yellow'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='3'></div>";
							}
							
							//orange
							if(color == '4') {
								$label = "<div id='orange'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='4'></div>";
							}
							
							//green 
							if(color == '5') {
								$label = "<div id='green'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='5'></div>";
							}

							labelArea.append($label);
		            	}	         	
		            }//success 
		      	});
				
			//라벨 삭제	
			} else {
				
				$.ajax({
		            type:"POST",
		            url :'deleteLabel.td',
		            async: false,
		            data:{
						"cardNo" : cardNo,
						"colorNo" : colorNo
					},
		            success:function(data){		
		            	
		            	//$("#mandatorModal2").hide();            	
		            	labelArea.empty();
		            	
		            	for(key in data) {
		            		var color = data[key].colorNo;
		            		
		            		//pink
							if(color == '1') {
								$label = "<div id='pink'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='1'></div>";
							}
							
							//blue
							if(color == '2') {
								$label = "<div id='blue'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='2'></div>";
							}
							
							//yellow
							if(color == '3') {
								$label = "<div id='yellow'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='3'></div>";
							}
							
							//orange
							if(color == '4') {
								$label = "<div id='orange'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='4'></div>";
							}
							
							//green 
							if(color == '5') {
								$label = "<div id='green'><input type='hidden' id='labelNo' value='"
											+ data[key].labelNo
											+ "'><input type='hidden' id='cNo' value='5'></div>";
							}
					
							labelArea.append($label);
		            	}	         	
		            }//success 
		      	});
			}		
		});
		
		/* $("input:checkbox[name=labelCheck]:checked").each(function() {
			var labels = $(this).val();
			labelList.push(labels);
		}) */
		
		//라벨 등록		
		/* $("#addLabelBtn").click(function() {
			var cardNo = $(this).parents("#mandatorModal2").parent().children("#modal-card-detail").children().children().children(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			var labelList = new Array();			
			
			$("input:checkbox[name=labelCheck]:checked").each(function() {
				var labels = $(this).val();
				labelList.push(labels);
			})
			
			//배열을 넘겨주기 위한 코드 추가
	    	jQuery.ajaxSettings.traditional = true;
			
	    	$.ajax({
	            type:"POST",
	            url :'insertLabel.td',
	            async: false,
	            data:{
					"cardNo" : cardNo,
					"labelList" : labelList
				},
	            success:function(data){		
	            	
	            	$("#mandatorModal2").hide();            	
	            	$("#labelArea").empty();
	            	
	            	for(key in data) {
	            		var color = data[key].colorNo;
	            		
	            		//pink
						if(color == '1') {
							$label = "<div id='pink'></div>";
						}
						
						//blue
						if(color == '2') {
							$label = "<div id='blue'></div>";
						}
						
						//yellow
						if(color == '3') {
							$label = "<div id='yellow'></div>";
						}
						
						//orange
						if(color == '4') {
							$label = "<div id='orange'></div>";
						}
						
						//green 
						if(color == '5') {
							$label = "<div id='green'></div>";
						}
						
						//console.log("$label : " + $label);
						$("#labelArea").append($label);
	            	}	         	
	            }//success 
	      	});	
		}); */
		
		//기한일 등록
		$(document).on("click", "#addDuedate", function(e) {
			//위치 가져오기
			var divTop = e.clientY - 20;
			var divLeft = e.clientX - 380;
			$("#mandatorModal3").css({"top" : divTop, "left" : divLeft, "position" : "absolute"}).show();
			$("#datepicker").focus();
		}); 
		
		$(document).on("click", "#mandatorModal3", function() {
			var chooseDate = $("#datepicker").val();
			console.log("chooseDate : " + chooseDate);
			$("#mandatorModal3").hide();
			
			var cardNo = $(this).parent().children("#modal-card-detail").children().children().children(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			
			$.ajax({
	            type:"POST",
	            url :'insertDuedate.td',
	            async: false,
	            data:{
					"cardNo" : cardNo,
					"chooseDate" : chooseDate
				},
	            success:function(data){		
	            	
	            	var $dueDate = data;
	            	$("#dueDate").css("margin-left", 16);
					$("#dueDate").html($dueDate);
	            }//success 
	      	});	
		});
		
		$(function () {
            $("#datepicker").datepicker({
    		    dateFormat: 'yy/mm/dd'
    		  }).data('datepicker');
        });
		
		//기한일 삭제
		function deleteDuedate() {
			var cardNo = $(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();
			var duedate = $("#dueDate").html();
			
			//기한일이 있을 경우
			if(duedate != "없음") {
				
				swal({
					title: "",
					text: "기한일을 삭제하시겠습니까?",
					icon: "warning",
					buttons: true,
					dangerMode: true
				}).then((willDelete) => {
					if(willDelete) {
						
						$.ajax({
							type:"POST",
							url:'deleteDuedate.td',
							async:false,
							data:{
								"cardNo" : cardNo
							},
							success:function(data){
								swal("삭제 완료되었습니다.", {
								      icon: "success",							      
								})
								.then((value) => {
									if(value == true){
										$("#dueDate").css("margin-left", 26);
										$("#dueDate").html("없음");
									}
								});								
							}
						});
						
					}else {
						swal("삭제가 취소되었습니다.");
					}
				});
			} else {
				swal("", "기한일을 등록해주세요.", "info");
			}
		}
		
		//설명 등록
		$(document).on("click", "#des", function(){		
			var content = $(this).html();
			
			$(".main-description-content").empty();
			
			//등록된 내용이 있을 경우
			if(content != "등록된 내용이 없습니다.") {
				var $des = "<textarea id='desText'>"
							+ content
							+ "</textarea><button id='desConfirmBtn' type='button'>저장</button><button id='desCloseBtn' type='button'>취소</button>";				 
			} else {
				var $des = "<textarea id='desText'></textarea><button id='desConfirmBtn' type='button'>저장</button><button id='desCloseBtn' type='button'>취소</button>";	
			}
			
			$(".main-description-content").append($des);
		});	
		
		//설명 등록 저장 버튼 클릭
		$(document).on("click", "#desConfirmBtn", function(){		
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();			
			var content = $(this).parent().children("#desText").val();
			
			$.ajax({
	            type:"POST",
	            url :'insertDescription.td',
	            async: false,
	            data:{
					"cardNo" : cardNo,
					"content" : content
				},
	            success:function(data){		
	            	
	            	$(".main-description-content").empty();
	            	
	            	//저장한 내용이 있을 경우
	            	if(content.length > 0) {
	            		var $content = "<div class='descript'><label id='des'>"
        					+ content
        					+ "</label></div>";
	            	} else {
	            		var $content = "<div class='descript'><label id='des'>등록된 내용이 없습니다.</label></div>";
	            	}
		
	            	$(".main-description-content").append($content);
	            }//success 
	      	});		
		});
		
		//설명 등록 취소 버튼 클릭
		$(document).on("click", "#desCloseBtn", function(){
			var wrap = $(this).parent();
			wrap.empty();
			
			var $content = "<div class='descript'><label id='des'>등록된 내용이 없습니다.</label></div>";
			$(".main-description-content").append($content);
		});

		//댓글 등록
		$(document).on("click", "#writeReply", function(){		
			var content = $(this).html();
			
			//모달 높이 조절
			var modal = $(this).parents(".main-reply-wrap").parents(".card-detail-wrap").parent();
			var modalHeight = modal.height();
			modal.height(modalHeight+40);
			
			//등록되어 있는 댓글과 textarea가 겹치지 않도록 높이를 조정해줌
			var replyWrap = $(this).parents(".main-reply-list");
			replyWrap.css("height", 115);
			
			$(".main-reply-content").empty();
			
			//등록된 내용이 있을 경우
			if(content != "댓글을 작성해주세요.") {
				var $reply = "<textarea id='replyText'>"
							  + content
							  + "</textarea><button id='replyConfirmBtn' type='button'>저장</button><button id='replyCloseBtn' type='button'>취소</button>";
			} else {
				var $reply = "<textarea id='replyText'></textarea><button id='replyConfirmBtn' type='button'>저장</button><button id='replyCloseBtn' type='button'>취소</button>";
			}
			
			$(".main-reply-content").append($reply);		
		});
		
		//댓글 등록 저장 버튼 클릭
		$(document).on("click", "#replyConfirmBtn", function(){		
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();			
			var content = $(this).parent().children("#replyText").val();
			var modal = $(this).parents(".main-reply-wrap").parents(".card-detail-wrap").parent();
			var replyWrap = $(this).parent(".main-reply-content");
			var replyWrap2 = $(this).parents(".main-reply-list"); 
			var writeTime = getTimeStamp();

			$.ajax({
	            type:"POST",
	            url :'insertReply.td',
	            async: false,
	            data:{
					"cardNo" : cardNo,
					"content" : content,
					"writeTime" : writeTime
				},
	            success:function(data){		
	            	
	            	$("#replyArea").empty();
	            	
	             	for(key in data) {
	            		var empName = data[key].empName;
						var position = data[key].positionName;
						var writer = empName + " " + position;
						var writerEmpNo = data[key].replyCreateEmpNo;
						var loginUserEmpNo = ${ sessionScope.loginUser.empNo };

						//작성 시간
						var timestamp = data[key].enrollDate;
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
					              + data[key].replyContent
					              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
					              + totalTime
					              +'</label></div>'  
					              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
					              + data[key].replyNo
					              + '"><img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png"><img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png"></div></div>';
						} else {
							var $reply ='<div class="replyWrap"><div class="replyWriter"><label id="writer">'
					              + writer
					              +'</label></div>' 
					              +'<div class="replyContentWrap"><div class="replyContent">' 
					              +'<label id="reContent">'
					              + data[key].replyContent
					              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
					              + totalTime
					              + '</label></div>'  
					              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
					              + data[key].replyNo
					              + '"></div></div>';
						}
						
						//댓글 등록 하기 전에 있던 텍스트상자가 나오게 해줌
						replyWrap.empty();
						var $replyBox = "<div class='replyBox'><label id='writeReply'>댓글을 작성해주세요.</label></div>";
						replyWrap.append($replyBox);
						
						replyWrap2.css("height", 65);
						
						$("#replyArea").append($reply); 
						
						//Modal 높이 조절
						/* var modalHeight = modal.height();
						modal.height(modalHeight+40); */
	            	}
	            }//success 
	      	});
		});
		
		/* 댓글 등록 취소 버튼 클릭 */
		$(document).on("click", "#replyCloseBtn", function(){	
			var modal = $(this).parents(".modal-content5");
			var modalHeight = modal.height();
			
			var wrap = $(this).parent().parent();
			wrap.empty();
			
			var $replyBox = "<div class='main-reply-content'><div class='replyBox'><label id='writeReply'>댓글을 작성해주세요.</label></div></div>";
			wrap.append($replyBox);
			
			wrap.height(50);
			modal.height(modalHeight-20);
		});
		
		var replyNo;
		var replyWrap;
		//댓글 수정 아이콘 클릭
		$(document).on("click", ".replyEditIcon", function(){
			replyNo = $(this).parent().children("#replyNo").val();
			var content = $(this).parent().parent().children(".replyContent").children("#reContent").html();
			replyWrap = $(this).parents(".replyWrap");
			var modal = $(this).parents(".main-reply-wrap").parents(".card-detail-wrap").parent();
			var modalHeight = modal.height();					
			
			replyWrap.empty();
			var $reply = "<textarea id='replyText'>"
				 		  + content
				 		  + "</textarea><button id='replyModifyBtn' type='button'>수정</button><button id='replyCloseBtn' type='button'>취소</button>";
			
			replyWrap.css("height", 115);
			modal.height(modalHeight+40);
			replyWrap.append($reply);
		});
		
		//댓글 수정 버튼 클릭
		$(document).on("click", "#replyModifyBtn", function(){
			var rNo = replyNo; 
			var content = $(this).parent().children("#replyText").val();
			var modal = $(this).parents(".main-reply-wrap").parents(".card-detail-wrap").parent();
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();			
			var replyWrap2 = $(this).parents(".main-reply-wrap").children(".main-reply-list"); 
			var modifyTime = getTimeStamp();
			
			$.ajax({
	            type:"POST",
	            url :'updateReply.td',
	            async: false,
	            data:{
					"replyNo" : rNo,
					"cardNo" : cardNo,
					"content" : content,
					"modifyTime" : modifyTime
				},
	            success:function(data){		
	            	
	            	$("#replyArea").empty();
	            	
	             	for(key in data) {
	            		var empName = data[key].empName;
						var position = data[key].positionName;
						var writer = empName + " " + position;
						var writerEmpNo = data[key].replyCreateEmpNo;
						var loginUserEmpNo = ${ sessionScope.loginUser.empNo };

						//수정 시간
						var timestamp = data[key].modifyDate;
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
					              + data[key].replyContent
					              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
					              + totalTime
					              +'</label></div>'  
					              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
					              + data[key].replyNo
					              + '"><img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png"><img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png"></div></div>';
						} else {
							var $reply ='<div class="replyWrap"><div class="replyWriter"><label id="writer">'
					              + writer
					              +'</label></div>' 
					              +'<div class="replyContentWrap"><div class="replyContent">' 
					              +'<label id="reContent">'
					              + data[key].replyContent
					              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
					              + totalTime
					              + '</label></div>'  
					              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
					              + data[key].replyNo
					              + '"></div></div>';
						}
						
						//댓글 등록 하기 전에 있던 텍스트상자가 나오게 해줌
						replyWrap.empty();
						var $replyBox = "<div class='replyBox'><label id='writeReply'>댓글을 작성해주세요.</label><div>";
						replyWrap.append($replyBox);
						
						replyWrap2.css("height", 65);
						
						$("#replyArea").append($reply);	
						
						//Modal 높이 조절
						/* var modalHeight = modal.height();
						modal.height(modalHeight-20); */
	            	} 
	            }//success 
	      	});
		});
		
		//댓글 삭제
		$(document).on("click", ".replyDeleteIcon", function(){
			var cardNo = $(this).parents(".card-detail-main").children(".main-wrap").children(".main-participant").children("#cardNo").val();			
			var replyNo = $(this).parent().children("#replyNo").val();
			var replyWrap = $(this).parents(".replyWrap");
			var replyWrap2 = $(this).parents(".main-reply-wrap").children(".main-reply-list"); 
			var modal = $(this).parents(".main-reply-wrap").parents(".card-detail-wrap").parent();
			var modalHeight = modal.height();
			var replyArea = $(this).parents(".main-reply-wrap").children("#replyArea");
			
			swal({
				title: "댓글을 삭제하시겠습니까?",
				text: "댓글을 삭제하면 복구할 수 없습니다.",
				icon: "warning",
				buttons: true,
				dangerMode: true
			}).then((willDelete) => {
				if(willDelete) {
					
					$.ajax({
			            type:"POST",
			            url :'deleteReply.td',
			            async: false,
			            data:{
							"replyNo" : replyNo,
							"cardNo" : cardNo
						},
			            success:function(data){	
			            	swal("삭제 완료되었습니다.", {
							      icon: "success",							      
							})
							.then((value) => {
								if(value == true){
									
									replyArea.empty();
					            	
					             	for(key in data) {
					            		var empName = data[key].empName;
										var position = data[key].positionName;
										var writer = empName + " " + position;
										var writerEmpNo = data[key].replyCreateEmpNo;
										var loginUserEmpNo = ${ sessionScope.loginUser.empNo };

										//작성 시간
										var timestamp = data[key].enrollDate;
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
									              + data[key].replyContent
									              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
									              + totalTime
									              +'</label></div>'  
									              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
									              + data[key].replyNo
									              + '"><img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png"><img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png"></div></div>';
										} else {
											var $reply ='<div class="replyWrap"><div class="replyWriter"><label id="writer">'
									              + writer
									              +'</label></div>' 
									              +'<div class="replyContentWrap"><div class="replyContent">' 
									              +'<label id="reContent">'
									              + data[key].replyContent
									              +'</label></div><div class="replyTimeArea"><label id="writeTime">'
									              + totalTime
									              + '</label></div>'  
									              +'<div class="replyEditArea"><input type="hidden" id="replyNo" name="replyNo" value="'
									              + data[key].replyNo
									              + '"></div></div>';
										}
										
										//댓글 등록 하기 전에 있던 텍스트상자가 나오게 해줌
										replyWrap.empty();
										var $replyBox = "<div class='replyBox'><label id='writeReply'>댓글을 작성해주세요.</label><div>";
										replyWrap.append($replyBox);
										
										replyWrap2.css("height", 65);
										
										$("#replyArea").append($reply);	 

										modal.height(modalHeight-40);
									}//for문
								}
							});		
			         	}//success
					});//ajax
					
				}else {
					swal("삭제가 취소되었습니다.");
				}
			});	
		});
		
	</script>  
</body>
</html>