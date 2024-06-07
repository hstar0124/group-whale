<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>	
	/* 본문 영역 */
	#nav1 {margin-right: 20px;}
	.content { width: 100%; height: 100%; background: #f7f7f7; padding-top: 20px; }
	/* 대시보드 영역 */
	.dashboard { width: 250px; border: 1px; background: white; float: left; border: 1px solid #CDCDCD; border-radius: 5px; margin-bottom: 20px; padding: 20px; }
	
	/* 프로필 영역 */
	.profile { width: 250px; height: 480px; }
	.profileTd { width: 270px; padding: 0; magin: 0; }
	.profile_area {width: 100px; height: 100px; background: gray; border-radius: 100%; margin: auto; margin-top: 22px; margin-bottom: 28px; background-size: cover; 
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg");}
	.userName {text-align: center; font-size: 15px; font-weight: bold;}	
	.companyName {text-align: center; font-size: 12px; margin-top: -10px;}	
	.profile_btn_table{width: 200px; margin-top: 50px;}
	.profile_btn_title { font-weight: normal; margin-top: 3px;}
	.profile_btn_td { padding: 12px 5px 12px 5px; }
	.profile_btn_img {width: 25px; height: 25px; background-size: cover; float: left; margin-right: 5px; 
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg");}
	.profile_messenger_btn { margin-top: 22px; height: 55px; background: #0871B9; text-align:center; border-radius: 5px; }
	.profile_messenger_title { font-weight:normal;  text-align:center; font-size: 17px; padding-top: 15px; color: white;}
	.profile_messenger_btn_img { width: 30px; height: 30px; background-size: cover; float: left; margin-top: 11px; margin-left: 30px; margin-right: -27px;
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg"); }
	
	/* 퀵메뉴 영역 */
	.quickMenu { width: 250px; height: 160px; }
	.quickMenu_table { width: 200px; }	
	.quickMenu_td { height: 29px; }
	.quickMenu_td_title { height: 29px; font-weight: bold; }
	.quickMenu_td_count { text-align: center; font-weight: bold; color: #0871B9  }
	
	/* 리스트 영역 */
	.board { width: 392px; height: 320px; border: 1px; background: white; float: left; border: 1px solid #CDCDCD; border-radius: 5px; margin-bottom: 20px; padding: 0px;}
	.boardTd { width: 412px; }
	.attachment_img {width: 15px; height: 15px; background-size: cover; float: left; margin-top: 2px; margin-left: 3px; margin-right: -5px; 
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg");}
	.dashboard_title { width: 392px; height: 50px; margin-top: -2px; margin-left: -2px; padding: 10px; padding-top: 12px; background: #0871B9; font-weight: bold; border-radius: 5px 5px 0px 0px; font-size: 17px; color: white; }	
	.dashboard_title_div { padding-left: 5px; padding-right: 5px; width: 140px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.dashboard_title_border_div { padding-left: 10px; padding-right: 0px; width: 220px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.dashboard_title_mail_div { padding-left: 5px; padding-right: 5px; width: 220px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.dashboard_title_icon { width: 20px; height: 20px; float: right; margin-top: 2px; margin-right: 5px;}
	.dashboard_table { width: 100%; }
	.dashboard_content { padding: 10px; }
	.dashboard_td_title { font-weight: bold; font-size: 15px; text-align: center; padding-top: 10px; padding-bottom: 12px; }
	.dashboard_td_content { font-size: 15px; text-align: center; padding-top: 5px; padding-bottom: 10px; }
	.dashboard_statusX{ background: #4bc286; color: white; border-radius: 5px; text-align:center;}
	.dashboard_statusY{ background: #ffca28; color: white; border-radius: 5px; text-align:center;}
	.dashboard_form_div{width:100px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;} 
	.dashboard_mailFrom_div{width:140px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.dashboard_mailSubject_div{width:120px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.dashboard_mailDate_div{white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	
	.btn2:hover{ cursor: pointer;}
	.profile_btn_td:hover{ cursor: pointer; background: #f1f1f1; }
	.profile_messenger_btn:hover { background: #4391C6; }
	.tr:hover { cursor: pointer; background: #f1f1f1; }
	.dashboard_title_div:hover { cursor: pointer; background: #f1f1f1; }
	.dashboard_title_border_div:hover { cursor: pointer; background: #f1f1f1; }
	.dashboard_title_mail_div:hover { cursor: pointer; background: #f1f1f1; }

</style>
<script>
	
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	
		<!-- 본문 영역 시작 -->
		<div class="content">
			<table class="contentTable">
				<tr>
					<!-- 프로필 영역 시작 -->
					<td class="profileTd" rowspan="2">
						<div class="dashboard profile">
							<div class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');"></div>
							<p class="userName">${ sessionScope.loginUser.empName } ${ sessionScope.loginUser.positionName }</p>
							<%-- <div class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/images/menubar/user.jpg');"></div>
							<p class="userName">${ sessionScope.loginUser.empName } ${ sessionScope.loginUser.positionNo }</p> --%>
							<p class="companyName">㈜ OrangeRed Company</p>
							
							<table class="profile_btn_table" align="center" >
								<tr>
									<td class="profile_btn_td">
										<div class="btn2 profile_btn_img" style="background-image: url('${ contextPath }/resources/images/dashboard/mail.png');"></div>
										<label class="btn2 profile_btn_title" id="mail_write_td">메일쓰기</label>
									</td>
									<td class="profile_btn_td" id="approval_write_td">
										<div class="btn2 profile_btn_img" style="background-image: url('${ contextPath }/resources/images/dashboard/briefcase.png');"></div>
										<label class="btn2 profile_btn_title">결재작성</label>
									</td>
								</tr>
								<tr>
									<td class="profile_btn_td">
										<div class="btn2 profile_btn_img" style="background-image: url('${ contextPath }/resources/images/dashboard/calendar.png');"></div>
										<label class="btn2 profile_btn_title" id="calendar_write_td">일정등록</label>
									</td>
									<td class="profile_btn_td" id="servey_write_td">
										<div class="btn2 profile_btn_img" style="background-image: url('${ contextPath }/resources/images/dashboard/list.png');"></div>
										<label class="btn2 profile_btn_title">설문작성</label>
									</td>
								</tr>
								<tr>
									<td class="" colspan="2">
										<div class="btn2 profile_messenger_btn" onclick="showMessenger();">
											<div class="profile_messenger_btn_img" style="background-image: url('${ contextPath }/resources/images/messenger/logo_circle.png');"></div>
											<label class="btn2 profile_messenger_title">Whale Talk</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- 프로필 영역 끝 -->

						<!-- 퀵메뉴 시작 -->
						<div class="dashboard quickMenu">
							<table class="quickMenu_table" align="center">
								<tr class="tr">
									<td class="btn2 quickMenu_td quickMenu_td_title">안읽은 메일</td>
									<td class="btn2 quickMenu_td quickMenu_td_count" id="mail_count"></td>
								</tr>
								<tr class="tr">
									<td class="btn2 quickMenu_td quickMenu_td_title">결재할 문서</td>
									<td class="btn2 quickMenu_td quickMenu_td_count" id="approval_count"></td>
								</tr>
								<tr class="tr">
									<td class="btn2 quickMenu_td quickMenu_td_title">오늘의 일정</td>
									<td class="btn2 quickMenu_td quickMenu_td_count">1</td>
								</tr>
								<tr class="tr">
									<td class="btn2 quickMenu_td quickMenu_td_title">최근 게시글</td>
									<td class="btn2 quickMenu_td quickMenu_td_count" id="allBoard_count"></td>
								</tr>
							</table>						
						
						</div>
					</td>
					
					<!-- 대시보드 리스트1 시작 -->
					<td class="boardTd">
						<div class="dashboard board">
							<div class="dashboard_title">결재대기함
								<img class="btn2 dashboard_title_icon" id="approval_wait_img" src="${ contextPath }/resources/images/dashboard/plus.png">
							</div>
							<div class="dashboard_content">
								<table class="dashboard_table" id="approval_table">
									<tr>
										<!-- 20/30/40/10 -->
										<td class="dashboard_td_title" style="width: 80px;">기안일</td>
										<td class="dashboard_td_title" style="width: 100px;">결재양식</td>
										<td class="dashboard_td_title" style="width: 147px;">제목</td>
										<td class="dashboard_td_title" style="width: 38px;">첨부</td>
									</tr>
									<%-- <tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content">휴일근무신청</td>
										<td class="dashboard_td_content"><div class="dashboard_title_div">4월 휴일근무신청서입니다.</div></td>
										<td class="dashboard_td_content">
											<div class="btn2 attachment_img" style="background-image: url('${ contextPath }/resources/images/dashboard/paperclip.png');"></div>
											1												
										</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content">휴일근무신청</td>
										<td class="dashboard_td_content"><div class="dashboard_title_div">4월 휴일근무신청서입니다.</div></td>
										<td class="dashboard_td_content">
											<div class="btn2 attachment_img" style="background-image: url('${ contextPath }/resources/images/dashboard/paperclip.png');"></div>
											1												
										</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content">휴일근무신청</td>
										<td class="dashboard_td_content"><div class="dashboard_title_div">4월 휴일근무신청서입니다.</div></td>
										<td class="dashboard_td_content">
											<div class="btn2 attachment_img" style="background-image: url('${ contextPath }/resources/images/dashboard/paperclip.png');"></div>
											1												
										</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content">휴일근무신청</td>
										<td class="dashboard_td_content"><div class="dashboard_title_div">4월 휴일근무신청서입니다.</div></td>
										<td class="dashboard_td_content">
											<div class="btn2 attachment_img" style="background-image: url('${ contextPath }/resources/images/dashboard/paperclip.png');"></div>
											1												
										</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content">휴일근무신청</td>
										<td class="dashboard_td_content"><div class="dashboard_title_div">4월 휴일근무신청서입니다.</div></td>
										<td class="dashboard_td_content">
											<div class="btn2 attachment_img" style="background-image: url('${ contextPath }/resources/images/dashboard/paperclip.png');"></div>
											1												
										</td>
									</tr> --%>
								</table>
							</div>
						</div>
					</td>
					<!-- 대시보드 리스트1 끝 -->

					<!-- 대시보드 리스트2 시작 -->					
					<td class="boardTd">
					<div class="dashboard board">
							<div class="dashboard_title">공지사항
								<img class="btn2 dashboard_title_icon" id="notice_list_img" src="${ contextPath }/resources/images/dashboard/plus.png">
							</div>
							<div class="dashboard_content">
								<table class="dashboard_table"  id="notice_table">
									<tr>
										<td class="dashboard_td_title" style="width: 20%">작성자</td>
										<td class="dashboard_td_title" style="width: 65%">제목</td>
										<td class="dashboard_td_title" style="width: 15%">등록일</td>
									</tr>
									<!-- <tr class="tr">
										<td class="dashboard_td_content">이재한 과장</td>
										<td class="dashboard_td_content"><div class="dashboard_title_mail_div">공지사항 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content">20/04/02</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">이재한 과장</td>
										<td class="dashboard_td_content"><div class="dashboard_title_mail_div">공지사항 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content">20/04/02</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">이재한 과장</td>
										<td class="dashboard_td_content"><div class="dashboard_title_mail_div">공지사항 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content">20/04/02</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">이재한 과장</td>
										<td class="dashboard_td_content"><div class="dashboard_title_mail_div">공지사항 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content">20/04/02</td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">이재한 과장</td>
										<td class="dashboard_td_content"><div class="dashboard_title_mail_div">공지사항 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content">20/04/02</td>
									</tr> -->
								</table>
							</div>
						</div>
						
					</td>
					<!-- 대시보드 리스트2 끝 -->
				</tr>

				<tr>
					<!-- 대시보드 리스트3 시작 -->
					<td>
						<div class="dashboard board">
							<div class="dashboard_title">안읽은 메일
								<img class="btn2 dashboard_title_icon" id="receive_mail_img" src="${ contextPath }/resources/images/dashboard/plus.png">
							</div>
							<div class="dashboard_content">
								<table class="dashboard_table" id="mail_table" style="width:380px;">
									<tr>
										<td class="dashboard_td_title">보낸사람</td>
										<td class="dashboard_td_title">제목</td>
										<td class="dashboard_td_title">발송일</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
					<!-- 대시보드 리스트3 끝 -->
					
					<!-- 대시보드 리스트4 시작 -->
					<td>
						<div class="dashboard board">
							<div class="dashboard_title">설문게시판
								<img class="btn2 dashboard_title_icon" id="survey_list_img" src="${ contextPath }/resources/images/dashboard/plus.png">
							</div>
							<div class="dashboard_content">
								<table class="dashboard_table"  id="survey_table">
									<tr>
										<td class="dashboard_td_title" style="width: 15%">상태</td>
										<td class="dashboard_td_title" style="width: 65%">제목</td>
										<td class="dashboard_td_title" style="width: 20%">마감일</td>
									</tr>
									<!-- <tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content"><div class="dashboard_title_border_div">설문게시판 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content"><div class="dashboard_statusY">진행중</div></td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content"><div class="dashboard_title_border_div">설문게시판 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content"><div class="dashboard_statusY">진행중</div></td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content"><div class="dashboard_title_border_div">설문게시판 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content"><div class="dashboard_statusX">완료</div></td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content"><div class="dashboard_title_border_div">설문게시판 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content"><div class="dashboard_statusX">완료</div></td>
									</tr>
									<tr class="tr">
										<td class="dashboard_td_content">20/04/02</td>
										<td class="dashboard_td_content"><div class="dashboard_title_border_div">설문게시판 제목 길이 테스트입니다.</div></td>
										<td class="dashboard_td_content"><div class="dashboard_statusX">완료</div></td>
									</tr> -->
								</table>
							</div>
						</div>
					</td>
					<!-- 대시보드 리스트4 끝 -->
				</tr>
			</table>
		
		
		
		</div>
		<!-- 본문 영역 끝 -->


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->
		

	</div>
	
	<script>
	$(function(){
		
		
		//DB에서 가져온 TimeStamp값 yy/MM/dd 형태로 변환하는 함수
		function getFormatDate(date) {
			var year = date.getFullYear().toString().substr(2,4);
			var month = ( 1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '/' + month + '/' + day;
		}
		
		console.log("${ loginUser }");	
		
		//설문작성 아이콘 연동
		$("#servey_write_td").click(function(){
			location.href="${contextPath}/surveyInsertForm.bo";
		});
		
		//설문 게시판 아이콘 연동 
		$("#survey_list_img").click(function(){
			location.href="${contextPath}/survey.bo";
		});
		
		//공지사항 아이콘 연동 
		$("#notice_list_img").click(function(){
			location.href="${contextPath}/main.bo";
		});
		
		var empNo = '${loginUser.empNo}';
		
		//공지사항 5개 ajax로 불러오기
		$.ajax({
			type:"POST",
			url:'selectListNoticeMain.bo',
			async: false,
			data: {empNo : empNo },
			success:function(data) {
				for(var key in data) {
					console.log(data[key]);
					var date = new Date(data[key].nEnrollDate);
					var $tr = '<tr class="tr notice_tr" height:20px;>'
						 + '<input type="hidden" value="' + data[key].nBoardNo +'">'
						 + '<td class="dashboard_td_content">'+ data[key].empName + '</td>'
						 + '<td class="dashboard_td_content"><div class="dashboard_title_mail_div">' + data[key].nTitle +'</div></td>'
						 + '<td class="dashboard_td_content">'+ getFormatDate(date) +'</td>'
					     + '</tr>';
					$("#notice_table").append($tr);
				}
				if(data == "") {
					var $tr = '<tr><td colspan="4" rowspan="5"><div style="text-align:center; line-height:150px; color:#a5a5a5;">게시물이 없습니다.</div></td></tr>';
					
					$("#notice_table").append($tr);
				}
			}
		});
		
		//메인보드 설문 5개까지 출력
		$.ajax({
			type:"POST",
			url:'selectListSurveyMain.bo',
			async: false,
			data: {empNo : empNo },
			success:function(data) {
				for(var key in data) {
					console.log(data[key]);
					console.log("데이터 : " + data[key].endStatus);
					var date = new Date(data[key].endDate);
					var endStatus = data[key].endStatus;
					
					var $tr;
					     
					if(data[key].endStatus == 'Y'){
						$tr = '<tr class="tr survey_tr">'
						 		 + '<input type="hidden" value="' + data[key].surveyNo +'">'
								 + '<td>'
								 + '<div class="dashboard_statusY">진행중</div>'
								 + '</td>'
								 + '<td class="dashboard_td_content"><div class="dashboard_title_border_div">' + data[key].sTitle +'</div></td>'
								 + '<td class="dashboard_td_content">'+ getFormatDate(date) + '</td>'
					     		 + '</tr>';
					} else {
						$tr = '<tr class="tr survey_tr">'
						 	+ '<input type="hidden" value="' + data[key].surveyNo +'">'
								 + '<td>'
								 + '<div class="dashboard_statusX">마감</div>'
								 + '</td>'
								 + '<td class="dashboard_td_content"><div class="dashboard_title_border_div">' + data[key].sTitle +'</div></td>'
								 + '<td class="dashboard_td_content">'+ getFormatDate(date) + '</td>'
					     + '</tr>';
					}  
					     
					$("#survey_table").append($tr);
				}
			}
		});
		
		//최신 게시글 표시
		$.ajax({
			type:"POST",
			url:"getAllBoardListCount.bo",
			async: false,
			success:function(data) {
				$("#allBoard_count").text(data);
				console.log(data);
			}
		});
	}); 
		//공지사항 클릭시 해당 게시물로 이동
		$(document).on("click", ".notice_tr", function(){

			var nBoardNo = $(this).children("input").val();
			location.href= "${ contextPath }/noticeDetail.bo?nBoardNo=" + nBoardNo;
			console.log(nBoardNo);
		});
		
		//설문조사 클릭시 해당 게시물로 이동
		$(document).on("click", ".survey_tr", function(){

			var surveyNo = $(this).children("input").val();
			location.href= "${ contextPath }/surveyDetail1.bo?surveyNo=" + surveyNo;
			console.log(surveyNo);
		});
	</script>
	
	
	<script>
	$(function(){
		//DB에서 가져온 TimeStamp값 yy/MM/dd 형태로 변환하는 함수
		function getFormatDate(date) {
			var year = date.getFullYear().toString().substr(2,4);
			var month = ( 1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '/' + month + '/' + day;
		}
		
		console.log("${ loginUser }");	
		
		//결재작성 아이콘 연동
		$("#approval_write_td").click(function(){
			location.href="${contextPath}/main.ap";
		});
		
		//결재대기함 아이콘 연동 
		$("#approval_wait_img").click(function(){
			location.href="${contextPath}/goAppWait.ap";
		});
		
		var empNo = '${loginUser.empNo}';
		
		//결재대기문서 5개 ajax로 불러오기
		$.ajax({
			type:"POST",
			url:'selectTopFiveDraftList.ap',
			async: false,
			data: {empNo : empNo },
			success:function(data) {
				for(var key in data) {
					//console.log(data[key]);
					var date = new Date(data[key].enrollDate);
					var $tr = '<tr class="tr approval_tr">'
						 + '<input type="hidden" value="' + data[key].docNo +'">'
						 + '<td class="dashboard_td_content">'+ getFormatDate(date) + '</td>'
						 + '<td class="dashboard_td_content"><div class="dashboard_form_div">' + data[key].formName +'</div></td>'
						 + '<td class="dashboard_td_content"><div class="dashboard_title_div">'+ data[key].docTitle +'</div></td>'
						 + '<td class="dashboard_td_content">'
						 + '<div class="btn2 attachment_img" style="background-image: url( '+'${ contextPath }/resources/images/dashboard/paperclip.png'+ ');"></div>'
						 +	data[key].fileCount												
						 + '</td>'
					     + '</tr>';
					$("#approval_table").append($tr);
				}
				if(data == "") {
					var $tr = '<tr><td colspan="4" rowspan="5"><div style="text-align:center; line-height:150px; color:#a5a5a5;">결재할 문서가 없습니다.</div></td></tr>';
					
					$("#approval_table").append($tr);
				}
			}
		});
		
		$.ajax({
			type:"POST",
			url:"getAppWaitListCount.ap",
			async: false,
			data: {empNo : empNo },
			success:function(data) {
				$("#approval_count").text(data);
			}
		});
		
		//결재대기문서 클릭시 해당 결재문으로 이동
		$(document).on("click", ".approval_tr", function(){

			var docNo = $(this).children("input").val();
			location.href= "${ contextPath }/goApprovalDetail.ap?docNo=" + docNo; 
		});
		
		
	});
	</script>
	
		<script>
	$(function(){
		//DB에서 가져온 TimeStamp값 yy/MM/dd 형태로 변환하는 함수
		function getFormatDate(date) {
			var year = date.getFullYear().toString().substr(2,4);
			var month = ( 1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '/' + month + '/' + day;
		}
		
		//메일쓰기 아이콘 연동
		$("#mail_write_td").click(function(){
			location.href="${contextPath}/sendform.ml";
		});
		//일정등록 아이콘 연동
		$("#calendar_write_td").click(function(){
			location.href="${contextPath}/addCalender.cl";
		});
		
		//안읽은메일 아이콘 연동 
		$("#receive_mail_img").click(function(){
			location.href="${contextPath}/main.ml";
		});
		
		
		
		var empNo = '${loginUser.empNo}';
		
		//안 읽은 메일 5개 ajax로 불러오기
		$.ajax({
			type:"POST",
			url:'selectNotReadList.ml',
			async: false,
			data: {empNo : empNo },
			success:function(data) {
				for(var key in data) {
					//console.log(data[key]);
					console.log(data);
					var date = new Date(data[key].mailEnrollDate);
					var $tr = '<tr class="tr mail_tr">'
						 + '<input type="hidden" value="' + data[key].mailNo +'">'
						 + '<td class="dashboard_td_content" style="width:130px;"><div class="dashboard_mailFrom_div">' + data[key].from +'</div></td>'
						 + '<td class="dashboard_td_content" style="width:140px;"><div class="dashboard_mailSubject_div" style="width:150px;">' + data[key].mailSubject +'</div></td>'
						 + '<td class="dashboard_td_content" style="width:130px;"><div class="dashboard_mailDate_div">'+ getFormatDate(date)  +'</div></td>'
					     + '</tr>';
					     //td width 설정해보자
					$("#mail_table").append($tr);
				}
				if(data == "") {
					var $tr = '<tr><td colspan="4" rowspan="5"><div style="text-align:center; line-height:150px; color:#a5a5a5;">읽지 않은 메일이 없습니다.</div></td></tr>';
					
					$("#mail_table").append($tr);
				}
			}
		});
		
		 $.ajax({
			type:"POST",
			url:"getNotReadMailListCount.ml",
			async: false,
			data: {empNo : empNo },
			success:function(data) {
				$("#mail_count").text(data);
			}
		}); 
		
		$(document).on("click", ".mail_tr", function(){

			var mailNo = $(this).children("input").val();
			location.href= "${ contextPath }/receiveMailDetail.ml?mailNo=" + mailNo; 
		});
		
		
	});
	</script>
	
</body>
</html>