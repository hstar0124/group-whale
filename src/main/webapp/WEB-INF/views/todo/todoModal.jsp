<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<style>
   /* ========== Modal background ========== */
   /* 폴더 메뉴, 참여자설정, 리스트 메뉴, 담당자 설정   */
   .modal-folderMenu, .modal-applicantEdit, .modal-listMenu, .modal-participantEdit {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 10; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
   }
   
   /* 폴더 추가  Modal background */
   .modal-todoRegister, .modal-folderAdd, .modal-folderEdit{
		display: none; 
		position: fixed; 
		z-index: 10; 
		left: 0;
		top: 0;
		width: 100%; 
		height: 100%; 
		overflow: auto;
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
   }
    
   /* ========== Modal content ========== */
   /* 폴더 메뉴 - Modal_1 content */
   .modal-content1 {
      background-color: #fefefe;
      /* margin: 180px 545px; */ /* 15% from the top and centered */
      border: 1px solid lightgray;
      width: 150px; /* Could be more or less, depending on screen size */
      height: 160px;
   }
   
   /* 참여자설정 - Modal_2 content */
   .modal-content2 {
      background-color: #fefefe;
      /* margin: 180px 545px;  */
      border: 1px solid lightgray;
      width: 150px; 
      min-height: 120px; /* 테이블 크기도 같이 조정해야함! */
      max-height: 100%;
   }

   /* 리스트 메뉴 - Modal_3 content */
   .modal-content3 {
      background-color: #fefefe;
      /* margin: 240px 580px; */ 
      border: 1px solid lightgray;
      width: 150px; 
      min-height: 120px;
      max-height: 100%;
   }
   
   /* todo 등록 - Modal_4 content */
   .modal-content4 {
      background-color: #fefefe;
      margin: 15% auto; 
      border: 1px solid lightgray;
      width: 350px; 
      height: 250px;
   }
   
   /* 카드 상세보기_담당자 설정 (Modal_6 content) */
   .modal-content6 {
      background-color: #fefefe;
      margin: 255px 257px; 
      border: 1px solid lightgray;
      width: 150px; 
      min-height: 120px; 
      max-height: 100%;
   }
   
   /* 카드 상세보기_댓글 삭제 확인 (Modal_7 content) */
   .modal-content7 {
      background-color: #fefefe;
      margin: 255px 257px;
      border: 1px solid lightgray;
      width: 150px; 
      min-height: 120px; 
      max-height: 100%;
   }
   
   /* 폴더 추가 (Modal_8 content) */
   .modal-content8 {
      background-color: #fefefe;
      margin: 255px 257px;
      border: 1px solid lightgray;
      width: 350px; 
      height: 250px;
   }
   
   /* 폴더명 수정 (Modal_9 content) */
   .modal-content9 {
      background-color: #fefefe;
      margin: 15% auto; 
      border: 1px solid lightgray;
      width: 350px; 
      height: 250px; 
   }
   
   /* 담당자 설정 확인 버튼 */
   #pcConfirm {
   		width:50px; 
		height:30px; 
		font-size:11px; 
		font-weight:normal;
		background: #0871B9; 
		color: white; 
		padding: 5px; 
		margin: 2px; 
		border-radius:5px; 
		border: 1px; 
		outline: 1px;
		margin-left:20px;
		margin-top:15px;
   }
   
   #pcConfirm:hover {cursor:pointer;}
   
   /* 담당자 설정 취소 버튼 */
   #pcClose {
   		width:50px; 
		height:30px; 
		border:0.8px solid #DDDDDD;
		font-weight:normal;
		font-size:11px; 
		background: white; 
		color: #0871B9; 
		border-radius:5px; 
		outline: 1px;
   }
   
   #pcClose:hover {cursor:pointer;}
	
   /* 댓글 삭제 버튼 */
   #replyDeleteBtn {
   		width:50px; 
		height:30px; 
		font-size:11px; 
		font-weight:normal;
		background: #0871B9; 
		color: white; 
		padding: 5px; 
		margin: 2px; 
		border-radius:5px; 
		border: 1px; 
		outline: 1px;
		margin-left:20px;
		margin-top:15px;
   }
   
   #replyDeleteBtn:hover {cursor:pointer;}
   
   /* 댓글 삭제 취소 버튼 */
   #replyDeleteClose {
   		width:50px; 
		height:30px; 
		border:0.8px solid #DDDDDD;
		font-weight:normal;
		font-size:11px; 
		background: white; 
		color: #0871B9; 
		border-radius:5px; 
		outline: 1px;
   }
   
   #replyDeleteClose:hover {cursor:pointer;}
   
   	/* todo등록 확인 버튼 */
	#insertFolderBtn, #addFolderConfirm, #editFolderConfirm {
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
	
	#insertFolderBtn:hover {cursor:pointer;}
	#addFolderConfirm:hover {cursor:pointer;}
	#editFolderConfirm:hover {cursor:pointer;}
	
	/* todo등록 취소 버튼 */
	#closeBtn, #addCloseBtn, #editCloseBtn {
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
	
	#closeBtn:hover {cursor:pointer;}
	#addCloseBt:hover {cursor:pointer;}
	#editCloseBtn:hover {cursor:pointer;}
   
   /* Modal 닫기 아이콘 */
   #closeIcon, #closeIcon2, #closeIcon3, #closeIcon6, #closeIcon7 {
      width:10px;
      height:10px;
      float:right;
      margin-right:15px;
      margin-top:2px;
   }
   
   #closeIcon4 { width:14px; height:14px; float:right; margin-right:8px; margin-top:15px; }
</style>
<script>
    /* ===== Modal 닫기 ===== */
    //Modal_1 닫기 아이콘 클릭   
	$(function() {
		$("#closeIcon").click(function() {
			$('.modal-folderMenu').hide();
		});
	});

	//Modal_2 닫기 아이콘 클릭   
	$(function() {
		$("#closeIcon2").click(function() {
			$('.modal-applicantEdit').hide();
		});
	});

	//Modal_3 닫기 아이콘 클릭   
	$(function() {
		$("#closeIcon3").click(function() {
			$('.modal-listMenu').hide();
		});
	});

	//Modal_4 닫기 아이콘 클릭   
	$(function() {
		$("#closeBtn").click(function() {
			$('.modal-todoRegister').hide();
		});
	});
		
	//Modal_6 닫기 아이콘 클릭   
	$(function() {
		$("#closeIcon6").click(function() {
			$('.modal-participantEdit').hide();
		});
	});

	//Modal_7 닫기 아이콘 클릭   
	$(function() {
		$("#closeIcon7").click(function() {
			$('.modal-replyDelete').hide();
		});
	});
	
	//Modal_8 닫기 클릭   
	$(function() {
		$("#addCloseBtn").click(function() {
			$('.modal-folderAdd').hide();
		});
	});
	
	//Modal_9 닫기 클릭   
	$(function() {
		$("#editCloseBtn").click(function() {
			$('.modal-folderEdit').hide();
		});
	});

	/* ===== Modal 열기 ===== */
	//todo등록 버튼 클릭
	$(function() {
		$("#todoRegisterBtn").click(function() {
			$("#modal-todo-register").show();
		});
	});
	
	//폴더 추가 클릭
	$(function() {
		$("#folderAdd").click(function() {
			$("#modal-folder-add").show();
		});
	});

	/* === 폴더 메뉴 === */
	//참여자 설정 클릭
	/* $(function() {
		$("#applicantEdit").click(function() {
			$('.modal-folderMenu').hide();
			$("#modal-applicant-edit").show();
		});
	}); */

</script>
</head>
<body>
	<!-- Modal content -> 폴더 추가 -->
		<div id="modal-todo-register" class="modal-todoRegister">
			<div class="modal-content4">
				<form action="insertFolder.td" id="folderAddForm">
				<table style="width:350px; height:250px;">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label style="font-size:14px; margin-left:20px;"><b>폴더 추가</b></label>
								<hr style="border: 1px solid #0871B9; width:305px; margin-top:10px; margin-bottom:10px;">
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label style="font-size:12px; font-weight:normal; margin-left:50px;">폴더명</label>
								&nbsp;&nbsp;
								<input type="text" id="folderName" name="folderName" style="font-size:12px; width:200px; height:25px;" maxlength="50" placeholder="프로젝트명을 입력해주세요.">
							</td>
						</tr>
						<tr>
							<td>
								<label id="folderCheck" style="width:100%; font-size:12px; margin-left:100px; margin-top:5px; font-weight:normal; color:orange;"></label>
							</td>
						</tr>
						<tr style="height:50px;">
							<td style="text-align:center;">
								<button id="insertFolderBtn" type="button">확인</button>
								<button id="closeBtn" type="button">취소</button>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
				</table>
				</form>
			</div>
		</div>
		
		<script>
			/* $(function() { 
				$("#insertFolderBtn").prop("disabled", true);
				$("#folderName").keyup(function() {
					$.ajax({
						type: "get",
						url: 'folderNameCheck.td',
						async: false,
						data: {
							"folderName" : $("#folderName").val()
						},
						success:function(data) {
							console.log("ajax 결과 : " + data);
							if(data == 0 && $("#folderName").val() != '') {
								$("#folderCheck").html("사용 가능한 폴더명입니다.").css("color", "#53C251");
								$("#insertFolderBtn").prop("disabled", false);   
							} else {
								if($("#folderName").val() == '') {
									$("#folderCheck").html("폴더명을 입력해주세요.").css("color", "#EF2A59");
									$("#insertFolderBtn").prop("disabled", true); 
								} else {
									$("#folderCheck").html("폴더명이 이미 존재합니다.").css("color", "orange");
									$("#insertFolderBtn").prop("disabled", true); 
								}
							}							
						}											
					});
				});				
			}); */
			
			//폴더 추가
			$("#insertFolderBtn").click(function() {

				swal("폴더가 생성되었습니다.", {
				      icon: "success",							      
				})
				.then((value) => {
					if(value == true){
						$("#folderAddForm").submit();						
					}
				});	
			});
	  </script>
		
	  <!-- Modal content -> 폴더 메뉴 -->
      <div id="modal-folder-menu" class="modal-folderMenu">
         <div class="modal-content1">
            <table style="width:150px; height:160px;">
                  <tr>
                     <td>&nbsp;</td>
                  </tr>
                  <tr>
                     <td style="text-align:center; font-size:12px;">
                        <b style="padding-left:22px;">메뉴</b>
                        <img id="closeIcon" src="${ contextPath }/resources/images/todo/close.png" style="cursor:pointer;">
                        <hr style="border: 0.5px solid lightgray; margin-bottom: 10px; margin-top:15px;" width="125px;">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label id="modalFolderEdit" style="font-size:11px; font-weight:normal; margin-left:20px; cursor:pointer;">폴더명 수정</label>
                        <hr style="border: 0.5px solid lightgray; margin-bottom: 10px; margin-top:10px;" width="125px;">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label id="modalFolderDelete" style="font-size:11px; font-weight:normal; margin-left:20px; cursor:pointer;">삭제</label>                        
                     </td>
                  </tr>
                  <tr>
                     <td>&nbsp;</td>
                  </tr>
            </table>
         </div>
      </div> 
      
      <!-- Modal content -> 폴더메뉴 (폴더명 수정)-->
		<div id="modal-folder-edit" class="modal-folderEdit">
			<div class="modal-content9">
				<table style="width:350px; height:250px;">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label style="font-size:14px; margin-left:20px;"><b>폴더명 수정</b></label>
								<hr style="border: 1px solid #0871B9; width:305px; margin-top:10px; margin-bottom:10px;">
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label style="font-size:12px; font-weight:normal; margin-left:50px;">폴더명</label>
								&nbsp;&nbsp;
								<input type="text" id="editFolderName" name="editFolderName" style="font-size:12px; width:200px; height:25px;" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>
								<label id="folderCheck" style="width:100%; font-size:12px; margin-left:100px; margin-top:5px; font-weight:normal; color:orange;"></label>
							</td>
						</tr>
						<tr style="height:50px;">
							<td style="text-align:center;">
								<button id="editFolderConfirm" type="button">확인</button>
								<button id="editCloseBtn" type="button">취소</button>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
				</table>
			</div>
		</div>
      
      <!-- Modal content -> 리스트 메뉴 -->
      <div id="modal-list-menu" class="modal-listMenu">
         <div class="modal-content3">
            <table style="width:150px; height:200px;">
                  <tr>
                     <td>&nbsp;</td>
                  </tr>
                  <tr>
                     <td style="text-align:center; font-size:12px;">
                        <b style="padding-left:22px;">메뉴</b>
                        <img id="closeIcon3" src="${ contextPath }/resources/images/todo/close.png" style="cursor:pointer;">
                        <hr style="border: 0.5px solid lightgray; margin-bottom: 10px; margin-top:15px;" width="125px;">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label id="applicantEdit" style="font-size:11px; font-weight:normal; margin-left:20px; cursor:pointer;">카드 추가</label>
                        <hr style="border: 0.5px solid lightgray;margin-bottom: 10px; margin-top:10px;" width="125px;">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label id="" style="font-size:11px; font-weight:normal; margin-left:20px;">제목 수정</label>
                        <hr style="border: 0.5px solid lightgray; margin-bottom: 10px; margin-top:10px;" width="125px;">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label id="deleteList" style="font-size:11px; font-weight:normal; margin-left:20px; cursor:pointer;">삭제</label>                        
                     </td>
                  </tr>
                  <tr>
                     <td>&nbsp;</td>
                  </tr>
            </table>
         </div>
      </div>
      
      <!-- Modal content (카드상세보기_담당자 설정) -->
      <div id="modal-participant-edit" class="modal-participantEdit">
         <div class="modal-content6">
            <table style="width:150px; height:120px;">
                  <tr>
                     <td>&nbsp;</td>
                  </tr>
                  <tr>
                     <td style="text-align:center; font-size:12px;">
                        <b style="padding-left:18px;">담당자</b>
                        <img id="closeIcon6" src="${ contextPath }/resources/images/todo/close.png" style="margin-right:13px; cursor:pointer;">
                        <hr style="border: 0.5px solid lightgray; margin-bottom: 10px; margin-top:15px;" width="125px;">
                     </td>
                  </tr>
                  <tr>
                     <td> 
                        <img src="${ contextPath }/resources/images/todo/admin_account.png" style="width:25px; height:25px; margin-left:15px;">
                        <label style="font-size:11px; font-weight:normal; margin-left:5px;">박다영 대리</label>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <img src="${ contextPath }/resources/images/todo/admin_account.png" style="vertical-align:middle; width:25px; height:25px; margin-left:15px;">
                        <label style="font-size:11px; font-weight:normal; margin-left:5px; margin-bottom:5px; margin-top:15px;">이지호 차장</label>
                     </td>
                  </tr> 
                  <tr>
                     <td>
                        <button id="pcConfirm">확인</button>   
                        <button id="pcClose">취소</button>    
                     </td>
                  </tr>
                  <tr>
                     <td>&nbsp;</td>
                  </tr>
            </table>
         </div>
      </div>
</body>
</html>