<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">

<style>	

	#addCalenderDiv{
		width: 100%;
		height: 660px;
		margin: 0 auto;
		/* border: 1px solid black; */
	}
	
	#calCategory{
		width: 100px;
		height: 26px;
	}
	#categoryImg{
		width: 260px;
		height: 30px;
	}
	
	.addCalLabel{
		width: 100%;
		height: 25px;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: center;		
		font-size: 18px;
	}
	
	.dateInput{
		height:30px;
	}
	
	#addCalTable{
		width: 100%;
		border-spacing: 10px;
		border-collapse: separate;
	}
	#addCalForm{
		width: 100%;
	}
	
	.calKindsLabel{
		width: 100px;
		height: 30px;
		line-height: 30px;
		padding-left: 7px;
		border: #0871B9 1px solid;		
	}
	
	#plusAtt{
		width: 100px;
		height: 25px;
		cursor: pointer;
	}
	.attendant{
		width: 130px;
		height: 25px;
		background: lightgray;
		color:white;
		font-weight: 900;
		text-align: center;
		line-height: 25px;
		float:left;
		border-radius: 10px;
		margin-right: 10px;
		cursor: pointer;
	}
	#alertSelect{
		width: 150px;
		height: 30px;
	}
	
	.calAlertLabel{
		width: 100px;
		height: 30px;
		line-height: 30px;
		padding-left: 22px;
		font-weight: 900;
		background: lightgray;
		color:gray;
		border-radius: 10px;
	}
	
	.formBtn{
		width: 100px;
		height: 30px;
		float: right;		
		margin-right: 10px;
	}
	
	.addAttendantBtn{
		width: 120px;
		height: 25px;		
		background: white;
		border: 1px solid lightgray;
		border-radius: 10px;
		color: black;
	}
	
	
	
	/* 일정 반복 추가 모달 스타일  */
	.calender-modal-body{
		height: 300px;
	}
	
	/* #calender-repeat-table{
		width: 580px;
		height: 300px;
		margin: 0 auto;		
	} */
	
	#calender-modal-body-title{
		padding-top: 20px;
		width: 100%;
		height: 80px;
	}
	
	.calender-modal-repeatBtn{
		margin-left: 10px;
		margin-top: 10px;
		width: 100px;
		height: 40px;
		line-height: 40px;
		border: 1px solid #0871B9;
		text-align: center;
		float: left;
		border-radius: 5px;
		cursor: pointer;
	}
	
	.calender-modal-repeatBtn:hover{
		background: #0871B9;
		color:white;
		cursor: pointer;
	}
	
	.repeat-div{
		width: 100%;
		height: 210px;
		padding-top: 30px;
	}
	
	.cycle{
		width: 100px;
		height: 30px;
	}
	
	.repeatTable{
		width: 100%;
		height: 170px;		
	}
	
	/* 일정 반복 추가 모달 스타일 끝 */
	
	
	
	
	/* 참석자 추가 모달 스타일 */
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
	}
	
	#modal-addListbody-div{
		height: 300px;
		border: 1px solid #ccd3d9;
		padding-top: 10px;
		padding-left: 10px;
	}
	
	#modal-body-empList{
		width: 280px;
	}
	
	#modal-body-chooseList{
		width: 300px;
		border: 1px solid #ccd3d9;
	}
	/* 참석자 추가 모달 스타일 끝 */
	
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}

	/* 트리메뉴 */
	.tree_box { width:280px; height:350px; border:1px solid #ccd3d9;}
	
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
	}
	
	/* 모달 스타일 끝 */
	
	#submitBtn{
		border: 1px solid #0871B9;
		background: #0871B9;
		color: white;
	}
	#resetBtn{
		border: 1px solid black;
		background: white;
		color: red;
	}
	
	#modal-addListbody-div{
		height: 300px;
		border: 1px solid #ccd3d9;
		padding-top: 10px;
		padding-left: 10px;
	}
	
	#modalAddMemberTable{
		width: 95%;
		border: 0px;
	}
	#modalAddMemberTable td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	height: 40px;
	}
	.empListBtn1{
	width: 120px;
	height: 25px;		
	background: white;
	border: 1px solid lightgray;
	border-radius: 10px;
	color: black;
	}
	

	
	
</style>



</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- 서브메뉴바 include -->
	<jsp:include page="calenderMenu.jsp" />

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">일정등록</b><br>
			<br>
			<div class="contentDiv">
			
				<div id="addCalenderDiv">
					<br>
					<form id="addCalForm" action="insert.cl" method="post">
						<table id="addCalTable">
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							
							<tr>							
								<td><label class="addCalLabel">일정 제목</label></td>
								<td>
									<select id="calCategory" name="calCategory">
										  <option selected>범주 선택</option>
										  <option>업무</option>
										  <option>중요</option>
										  <option>출장</option>
										  <option>휴가</option>
										  <option>영업활동</option>
									</select>
									&nbsp;
									<input type="text" id="calTitle" name="calTitle" size="74"><br>
									<img id="categoryImg" src="${ contextPath }/resources/images/calender/category.png">
								</td>	
							</tr>
							<tr>
								<td><label class="addCalLabel">일정</label></td> 
								<!-- 종일이면 time을 숨겨야해! -->
								<td><!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
									<input class="dateInput" type="text" name="calStartDate" id="calStartDate" size=8   autocomplete="off">
									&nbsp;<input class="dateInput" type="time" name="calStartTime" id="calStartTime" size=8 step="1">&nbsp;&nbsp;~&nbsp;&nbsp;
									<input class="dateInput" type="text" name="calEndDate" id="calEndDate" size=8   autocomplete="off">
									&nbsp;<input class="dateInput" type="time" name="calEndTime" id="calEndTime" size=8 step="1" value="12:00:00">
									&nbsp;&nbsp;&nbsp;<input type="checkbox" name="allDayChk" id="allDayChk">&nbsp;<label for="allDayChk">종일</label>
									
									
									<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
									<!-- empListBtn1,empAddBtn1 처럼 만들어 봐야겠다. -->
									&nbsp;&nbsp;&nbsp;<input type="checkbox" name="calRepeat" id="calRepeat"  data-toggle="modal" data-target="#repeatModal">&nbsp;<label for="calRepeat">반복</label><br>
													  
								</td>
							</tr>
							
					<!-- 			<tr>
								<td><label class="addCalLabel">반복 요일</label></td> 
									<td>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									<input type="checkbox" name="dayofWeek"><label>월</label>
									</td>
								</tr> -->
									
							<tr>
								<td><label class="addCalLabel">일정 종류</label></td>
								<td>
									<label class="calKindsLabel" id="calKindsLabel1"><input type="checkbox" name="calKind" id="calKind1" style="visibility: hidden;" value="전사 일정">전사 일정</label>&nbsp;&nbsp;
									<label class="calKindsLabel" id="calKindsLabel2"><input type="checkbox" name="calKind" id="calKind2" style="visibility: hidden;" value="임원 일정">임원 일정</label>&nbsp;&nbsp;
									<label class="calKindsLabel" id="calKindsLabel3"><input type="checkbox" name="calKind" id="calKind3" style="visibility: hidden;" value="팀 일정">  팀 일정</label>&nbsp;&nbsp;
									<label class="calKindsLabel" id="calKindsLabel4"><input type="checkbox" name="calKind" id="calKind4" style="visibility: hidden;" value="내 일정">  내 일정</label>
								</td>
							</tr>
							<tr>
								<td><label class="addCalLabel">참석자</label></td>
								<td class="attendantTd">
									<button type="button" class="empListBtn1" id="empAddBtn1">참석자 선택</button>		
									
									<!-- 호성이형 조직도 -->
								</td>
							</tr>
							<tr>
								<td><label class="addCalLabel">장소</label></td>
								<td><input type="text" id="calPlace" name="calPlace" size="90"></td><!-- 장소는 왜있지? 장소를 일정명이라고 하신건가!>? -->
							</tr>
							<tr>
								<td><label class="addCalLabel">내용</label></td>
								<td><textarea id="calContent" name="calContent" rows="8" cols="92" style="resize: none;"></textarea> </td>
							</tr>
							<tr>
								<td><label class="addCalLabel">알림</label></td>
								<td>
									<select id="alertSelect" name="alertSelect">
									 	<option selected>사용 안함</option>
										<option>15분전</option>
										<option>30분전</option>
										<option>1시간전</option>
										<option>하루전</option>										
									</select> 
									&nbsp;&nbsp;
									<label class="calAlertLabel" id="calAlertLabel1" for="calAlert1"><input type="checkbox" name="calAlert" id="calAlert1" style="visibility: hidden;" value="메일">메일</label>&nbsp;&nbsp;
									<label class="calAlertLabel" id="calAlertLabel2" for="calAlert2"><input type="checkbox" name="calAlert" id="calAlert2" style="visibility: hidden;" value="알림">알림</label>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="formBtn" id="resetBtn">취소</button>
									<button type="button" class="formBtn" id="submitBtn">등록</button>
								</td>
							</tr>
							
						</table>
						<input type="hidden" id="calStartAll" name="calStart">
						<input type="hidden" id="calEndAll" name="calEnd">
						
								<!-- 추가할 참석자 모달 영역 -->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModal1Label">
			<div class="modal-dialog" role="document" style="width:670px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModal1Label">조직도</h4>
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
						<button type="button" class="btn btn-primary myModal1Submit2" data-toggle="modal" >확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
							
							
							<!-- 일정 반복 모달 영역ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ	 -->
	<div class="modal fade" id="repeatModal" tabindex="-1" role="dialog" aria-labelledby="myModal1Label">
			<div class="modal-dialog" role="document" style="width:600px;">
				<div class="modal-content">						
						<div class="calender-modal-body">
							<div id="calender-modal-body-title">
								<label style="margin: 0; float: left; width: 150px; height: 60px; line-height: 60px; text-align: center; font-size: 20px;">반복주기</label>
								<div class="calender-modal-repeatBtn" id="calender-modal-repeatBtn2" onclick="repeatCalender(this)" style="background:#0871B9; color:white;">매주</div>
								<div class="calender-modal-repeatBtn" id="calender-modal-repeatBtn3" onclick="repeatCalender(this)">매월</div>
								<div class="calender-modal-repeatBtn" id="calender-modal-repeatBtn4" onclick="repeatCalender(this)">매년</div>
							</div>							
							
							<div id="weekRepeat" class="repeat-div">
								<table class="repeatTable">
									<colgroup>
										<col width="35%" />
										<col width="65%" />
									</colgroup>
									<tr>
										<td style="text-align: center;"><input type="text" class="cycle" name="cycle">&nbsp;&nbsp;&nbsp;주마다 </td>
										<td>
											<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek1" value="1"> 월</label>
      										<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek2" value="2"> 화</label>
      										<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek3" value="3"> 수</label>
      										<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek4" value="4"> 목</label>
      										<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek5" value="5"> 금</label>
      										<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek6" value="6"> 토</label>
      										<label><input type="checkbox" name="cycleWeek" class="cycleWeek" id="cycleWeek0" value="0"> 일</label>      																				
										</td>
									</tr>
									<tr>
<td colspan="2"><label style="margin-left: 35px;">&nbsp;시작일  :&nbsp;&nbsp;<input style="width: 150px; height: 30px;" type="text" class="cycleMonty" name="cycleMonty" autocomplete="off"></label></td>
									</tr>
									<tr>
										<td style="padding-left: 30px;" colspan="2">
											<label><input type="radio" name="endRepeat" checked>종료일 :  <input style="width: 150px; height: 30px;" type="text" class="endOptionDay" name="endOptionDay" autocomplete="off"></label>
											<label style="margin-left: 10px;"><input type="radio" name="endRepeat" value="">&nbsp;<input style="width: 80px; height: 30px;" type="text"> 회 반복</label>											
										</td>
									</tr>
								</table>
							</div>
							<div id="monthRepeat" class="repeat-div">
							
								<table class="repeatTable">
									<colgroup>
										<col width="35%" />
										<col width="65%" />
									</colgroup>
								
									<tr>
										<td style="text-align: center;"><input type="text" class="cycle" name="cycle">&nbsp;&nbsp;&nbsp;월마다 </td>
										<td>
											<label style="margin-left: 10px;"><input type="radio" name="monthRepeat">31일</label>
										</td>										
									</tr>
									<tr>
<td colspan="2"><label style="margin-left: 35px;">&nbsp;시작일  :&nbsp;&nbsp;<input style="width: 150px; height: 30px;" type="text" class="cycleMonty" name="cycleMonty1"  autocomplete="off"></label></td>
									</tr>
									<tr>
										<td style="padding-left: 30px;" colspan="2">
											<label><input type="radio" name="endRepeat">종료일 :  <input style="width: 150px; height: 30px;" type="text" name="endOptionDay" class="endOptionDay"  ></label>
											<label style="margin-left: 10px;"><input type="radio" name="endRepeat" value="">&nbsp;<input style="width: 80px; height: 30px;" type="text"> 회 반복</label>											
										</td>
									</tr>
								</table>
							
							</div>
							<div id="yearRepeat" class="repeat-div">
								<table class="repeatTable">
									<colgroup>
										<col width="35%" />
										<col width="65%" />
									</colgroup>
								
									<tr>
										<td style="padding-left: 28px;" colspan="2"><input type="text" class="cycle" name="cycle">&nbsp;&nbsp;&nbsp;년마다 </td>										
									</tr>
									<tr>
									<td colspan="2"><label style="margin-left: 35px;">&nbsp;시작일  :&nbsp;&nbsp;<input style="width: 150px; height: 30px;" type="text" class="cycleMonty" name="cycleMonty2"  autocomplete="off"></label></td>
									</tr>
									<tr>
										<td style="padding-left: 30px;" colspan="2">
											<label><input type="radio" name="endRepeat">종료일 :  <input style="width: 150px; height: 30px;" type="text" name="endOptionDay" class="endOptionDay"  ></label>
											<label style="margin-left: 10px;"><input type="radio" name="endRepeat" value="">&nbsp;<input style="width: 80px; height: 30px;" type="text"> 회 반복</label>											
										</td>
									</tr>
								</table>
							</div>						
						</div>
						<div class="modal-footer">
																				<!-- 이쪽의 확인이 안먹습니다. -->													
						<button type="button" class="btn btn-primary myModal1Submit1" data-toggle="modal">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
				</div>
			</div>
		</div> 
		<!-- 일정 반복 모달 영역ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ	 -->
	
					<!-- HOWMANY  -->
					<input type="hidden" name="howmany" id="howmany"> 
					<!-- CYCLE_MONTY 시작일(날짜) -->
					
							
					</form>				
				
				</div>
			
			</div>
			
			</div>
		</div>
		<!-- 본문 영역 끝 -->

		<!-- datepicker -->
		  <script>
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언id="endOptionDay"
            $("#calStartDate").datepicker();                    
            $("#calEndDate").datepicker();
            $(".cycleMonty").datepicker();
            $(".endOptionDay").datepicker();
            
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
    </script>

		<!-- 일정 종류 체크시 css 변경 -->
		<script>
			$(function() {
				
				$("input[name=calKind]").change(function(){
					console.log($('input[name="calKind"]:checked').val());
					console.log("참석자 : " + $("#attendeeNo").val());
					if($("#calKind1").prop("checked")){
					$("#calKindsLabel1").css({'background':'#0871B9','color':'white'})
					}else {
						$("#calKindsLabel1").css({'background':'white','color':'black'})
					}
					if($("#calKind2").prop("checked")){
						$("#calKindsLabel2").css({'background':'#0871B9','color':'white'})
						}else {
							$("#calKindsLabel2").css({'background':'white','color':'black'})	
						}
					if($("#calKind3").prop("checked")){
						$("#calKindsLabel3").css({'background':'#0871B9','color':'white'})
						}else {
							$("#calKindsLabel3").css({'background':'white','color':'black'})	
						}
					if($("#calKind4").prop("checked")){
						$("#calKindsLabel4").css({'background':'#0871B9','color':'white'})
						}else {
							$("#calKindsLabel4").css({'background':'white','color':'black'})	
						}
				
					
				});
			});
		</script>
		
		<!-- 알림 체크시 css 변경 -->
		<!-- 		background: lightgray;
		color:gray; -->
		
		<script>
		$(function(){
			$("input[name=calAlert]").change(function(){
			if($("#calAlert1").prop("checked")){
				$("#calAlertLabel1").css({'background':'#0871B9','color':'white'})
			}else{
				$("#calAlertLabel1").css({'background':'lightgray','color':'gray'}) 
			}
			if($("#calAlert2").prop("checked")){
				$("#calAlertLabel2").css({'background':'#0871B9','color':'white'})
			}else{
				$("#calAlertLabel2").css({'background':'lightgray','color':'gray'})
			}
			
			});
		});
		
		</script>
		
		
		<script>
		//현재 날짜랑 시간을 기본값으로 넣어주자. 

									var date1 = new Date();
									//console.log("date1 : " + date1);
									//date1 : Thu Apr 23 2020 07:12:05 GMT+0900 (대한민국 표준시)
									
									var year1 = date1.getFullYear();
									
									var month1 = date1.getMonth() + 1;
									
									var day1 = date1.getDate();
									if(month1 < 10){
										month1 = "0" + month1;
									}
									if(day1 < 10){
										day1 = "0" + day1;	
									}
									
									var hours1 = date1.getHours();
									// Minutes part from the timestamp
									var minutes1 = "0" + date1.getMinutes();
									// Seconds part from the timestamp
									var seconds1 = "0" + date1.getSeconds();
									
									var hours2 = date1.getHours() + 1 ;
									
									var hours22 = hours2;
									
									
									if(hours1 < 10){
										hours1 = "0" + hours1;
									}
									if(minutes1 < 10){
										minutes1 = "0" + minutes1;
									}
									if(seconds1 < 10){
										seconds1 = "0" + seconds1;
									}
									if(hours22 < 10){
										hours22 = "0" + hours2;
									}

									// Will display time in 10:30:23 format
									var formattedDate1 = year1 + "-" + month1 + "-" + day1; 
									var formattedTime1 = hours1 + ':' + minutes1.substr(-2) + ':' + seconds1.substr(-2);
									var formattedTime2 = hours22 + ':' + minutes1.substr(-2) + ':' + seconds1.substr(-2);
								    

									//console.log("날짜 : " + formattedDate1); 2020-0423
									//console.log("시간1 : " + formattedTime1); 07:11:19
									//console.log("시간 2: " + formattedTime2); 08:11:19
									
									//현재 시간을 일정 밸류에 넣자
									$("#calStartDate").val(formattedDate1);
									$(".cycleMonty").val(formattedDate1);
									$("#calStartTime").val(formattedTime1);
									$("#calEndDate").val(formattedDate1);
									$("#calEndTime").val(formattedTime2);


		</script>


		<script>
		
		//종일이 체크드면 input type time 숨겨
		$(function(){
			$("input[name=allDayChk]").change(function(){
				if($("#allDayChk").prop("checked")){
					$("input[type=time]").hide();
					$("input[type=time]").val('00:00:00');
					console.log($("#calTitle").text());

				}else{
					$("input[type=time]").show();
					$("#calStartDate").val(formattedDate1);
					$("#calStartTime").val(formattedTime1);
					$("#calEndDate").val(formattedDate1);
					$("#calEndTime").val(formattedTime2);
					/* $("input[type=time]").val('12:00:00'); */
					
				}
			})
		})
		</script>

 	<script>//유효성 아직은 그냥 넘어가버린다!

 		$("#resetBtn").click(function(){
			 window.history.back();
		});
 	
		$("#submitBtn").click(function(){
		if($("#calKind1").prop('checked') == false && $("#calKind2").prop('checked') == false &&
				$("#calKind3").prop('checked') == false && $("#calKind4").prop('checked') == false){
			swal("잘못된 입력", "일정 종류를 선택해주세요!", "error");
		}else
		if($("#calCategory").val() == '범주 선택'){
			swal("잘못된 입력", "일정 범주를 선택해주세요!", "error");
		}else
		if($("#calTitle").val() == ''){
			swal("잘못된 입력", "제목을 입력해주세요!", "error");
		}else
		if($("#calStartDate").val() == '연도-월-일'){
			swal("잘못된 입력", "일정을 제대로 입력해주세요!", "error");
		}else
		if($("#calEndDate").val() == '연도-월-일'){
			swal("잘못된 입력", "일정을 제대로 입력해주세요!", "error");
		}else
		if($("#calStartTime").val() == '12:00'){
			swal("잘못된 입력", "일정을 제대로 입력해주세요!", "error");
		}else
		if($("#calEndTime").val() == '12:00'){
			swal("잘못된 입력", "일정을 제대로 입력해주세요!", "error");
		}else
		if($("#calPlace").val() == ''){
			swal("잘못된 입력", "장소를 입력해주세요!", "error");
		}else
		if($("#calContent").val() == ''){
			swal("잘못된 입력", "내용을 입력해주세요!", "error");
		}else {
			swal("등록이 완료되었습니다!","success");
			
			swal({
		    	  text: "일정이 등록되었습니다!",
		    	  icon: "success",
		    	  button: "확인",
		    	}).then((확인) => {
		    		$("#addCalForm").submit();
		    	});
		}
		
		});
	</script> 
<script>
	$(function(){
		$('.nav2_calender').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
</script>	
	

	
	
	
	
	
<!-- ----------------------------------------------------------------- -->	
	
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
		 					var $member = "<li class='end'><a href='#none'>" + data[key].empName + " " 
		 																	 + data[key].positionName 
		 																	 + "<span style='display: none;'>|" + data[key].deptName + "</span>"
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
				
				
				/* 부서명 클릭시 오른쪽 부서원 리스트 세팅하는 ajax */
				$(".lideptName").click(function(){
					//눌림 팀 이름을 구하기 위해서 뒤에서부터 3자리를 자른다
					//console.log($(this).html().substr($(this).html().length-3, 3));
					
					var $hiddenSpan = "<span style='display:none;'>" + $(this).html().substr($(this).html().length-3, 3) + "</span>"
					
					if(!$("#myModal1").is(':visible')){
						$("#empListDivBody").find('span').remove();
						$("#empListDivBody").append($hiddenSpan);
					}
					//조직도 이동 모달창이 닫혀 있을 때만 작동하게 세팅
					if(!$("#myModal1").is(':visible')){
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
				 						if(data[key].empName != '관리자' && data[key].positionName != '대표이사'){
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
	 						$("#empAddBtn1").attr('disabled', false);
	 						$("#empRemoveBtn").attr('disabled', true).css({"background":"#c9c9c9", "color":"white"}); 						
	 					}else{
	 						$("#empAddBtn1").attr('disabled', false);
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
		</script>
		
		
		
		<!-- 이동할 부서원 모달 영역 끝-->		
		<script>
			$("#model-choose-cancel").click(function(){
				$("#modalAddMemberTable tbody").empty();
				$("#addEmpBodyTable tbody").empty();
			});
			
				//참석자 누르면 그 참석자 삭제하기
			/* 	$(".attendant").click(function(){
					console.log("왜 안나오지 다시 확인해볼것!");
					$(this).remove();
					}); */
			//작동되는 참석자 삭제
			$(document).on("click", ".attendant", function(){
				$(this).remove();
			});   
			
			

			
			$(function(){
				
				
				//참석자 추가 선택버튼
				$("#empAddBtn1").click(function(){ 
					
						//console.log($("#empListTable tbody").find('td').text());
						$("#modalAddMemberTable tbody").empty();
						//console.log($("#empListDivBody").find('span').html());
						$("#addEmpBodyTable tbody").empty();
						$("#myModal1").modal('show');	
						
					
				});
				

				
				//myModal1 모달창, empAddBtn1 참석자 선택 버튼, empRemoveBtn, btn-primary 확인, btn-default 취소
				//.myModal1Submit 확인
				
				
				//(반복) 확인 버튼 누르면 반복 모달 숨겨라!
				$(".myModal1Submit1").click(function(){
					
						$("#repeatModal").modal('hide');
						console.log("dd");
						console.log($(".cycle").val());
						
						
						//cycle,
						
						//$("#modalAddMemberTable tbody").append($tr);
						//"<input type='hidden' name='originDep' value='" + dept + "'>"
				});
				
				//(참석자 선택) 확인 버튼 누르면 선택 모달 숨겨라!
				$(".myModal1Submit2").click(function(){
					if($("#modalAddMemberTable tbody").find('td').text() == ''){
						swal("참석자 선택 후 확인을 눌러주세요.");
					}else {
						$("#myModal1").modal('hide');
						
					}
				});
				
				
				//class end 가 없는데 어떻게 동작하지?
				//아 트리메뉴 ..!
				$(".end").click(function(){ //모달창에서 사원 클릭시
					//console.log($(this).find('a').text());
				
					console.log("사원클릭하면 뜨지?");
				
					var name = $(this).find('a').text().split("|")[0];
					var dept = $(this).find('a').text().split("|")[1];
					//console.log(name);
					//console.log(dept);
					//div class="attendant
					var $tr = "<tr><td>" + name + "</td><td>" + dept + "</td></tr>" 
					+ "<input type='hidden' id='attendeeNo' name='attendeeNo' value='" + name + "'>";
					//첫번째 선택한 사람만 추가되네.... 이거 오른쪽으로 사람 옮기는거다

					var $div = "<div class='attendant'>" + name + "</div>";
					
					var $reTr = "<tr><td>" + name + "<input type='hidden' name='deptHistoryNo' value='1'><input type='hidden' id='attendeeNo' name='attendeeNo' value='" + name.substr(0,3) + "'>" + "</td><td>" 
										   + dept + "<input type='hidden' name='originDep' value='" + dept + "'>" + "</td><td>" 
										   + $("#empListDivBody").find('span').text() + "<input type='hidden' name='changeDep' value='" + $("#empListDivBody").find('span').text() + "'>" + "</td></tr>";
					console.log("$tr : " + $tr)					   
					console.log("reTr : " + $reTr);
						$("#modalAddMemberTable tbody").append($tr);
						$("#addEmpBodyTable tbody").append($reTr);
						$(".attendantTd").append($div);
						
						//같은 사람 추가하는거 막기
						$("#modalAddMemberTable td").each(function(){
							if($(this).html() == name){
								console.log($(this).html()+"..");//사람 이름 나온다.
								if($("#modalAddMemberTable tbody:last tr:contains(" + name + ")").length > 1){
									$("#modalAddMemberTable tbody:last tr:contains(" + name + "):last").remove();
									$("#addEmpBodyTable tbody:last tr:contains(" + name + "):last").remove();
								}
							}
						});
				});
			});					
		</script>	
	
		<script>
	
			$(function() {
				$("#weekRepeat").show();
				$("#monthRepeat").hide();
				$("#yearRepeat").hide();
			});
			
			function repeatCalender(id){
				
				//console.log($(id).html());
				
				if($(id).html() == "매주"){
					$("#calender-modal-repeatBtn2").css({'background':'#0871B9','color':'white'});
					$("#calender-modal-repeatBtn3").css({'background':'white','color':'black'});
					$("#calender-modal-repeatBtn4").css({'background':'white','color':'black'});
					$("#weekRepeat").show();
					$("#monthRepeat").hide();
					$("#yearRepeat").hide();
					$("#howmany").val("매주");
				}else if($(id).html() == "매월"){
					$("#calender-modal-repeatBtn3").css({'background':'#0871B9','color':'white'});
					$("#calender-modal-repeatBtn4").css({'background':'white','color':'black'});
					$("#calender-modal-repeatBtn2").css({'background':'white','color':'black'});
					$("#weekRepeat").hide();
					$("#monthRepeat").show();
					$("#yearRepeat").hide();
					$("#howmany").val("매월");
				}else if($(id).html() == "매년"){
					$("#calender-modal-repeatBtn4").css({'background':'#0871B9','color':'white'});
					$("#calender-modal-repeatBtn2").css({'background':'white','color':'black'});
					$("#calender-modal-repeatBtn3").css({'background':'white','color':'black'});
					
					$("#weekRepeat").hide();
					$("#monthRepeat").hide();
					$("#yearRepeat").show();
					$("#howmany").val("매년");
				}
				
			}
	
		
			
		</script>
		
		
		<!-- 일정반복 -->
	<script>
	
	$(function(){
		
		$("#calRepeat").change(function(){

			if($("#calRepeat").prop("checked")){
					$("#calRepeat").val("Y");
			}else{
					$("#calRepeat").val("N");
			}
		});
	});
		
	
	</script>
	
	 <script>
		//여기서 실험해보자
		$(function(){
			
			// 배열 선언

			
 			$("input[type='text']").change(function(){

				var calStartDate = $("#calStartDate").val() + " " + $("#calStartTime").val()
				document.getElementById("calStartAll").value = calStartDate;
				
				var calEndDate = $("#calEndDate").val() + " " + $("#calEndTime").val()
				console.log("종료 날짜 + 시간 : " + calEndDate);
				document.getElementById("calEndAll").value = calEndDate;
				
			});
		});
	</script>
	
	
	
	
	
	
	
	
	

</body>
</html>