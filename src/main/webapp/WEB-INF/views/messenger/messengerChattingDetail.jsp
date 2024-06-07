<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${ contextPath }/resources/js/notification.js"></script>
<script src="${ contextPath }/resources/js/websocket.js"></script>
<title>Insert title here</title>
<style>	
	.messengerWrap { width: 380px; height: 650px; border: 1px solid #CDCDCD; text-align: center; font-family: 'Yeon Sung', cursive; }
	.settings_color { background: #0871b9; }
	.settings_font { font-family: 'Yeon Sung', cursive; }
	
	/* 상단영역 */
	.topArea { height: 60px; text-align: left; padding: 10px; }
	.chattingTitle { width: 265px; font-size: 25px; color: white; float: left; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.plus_img { width: 50px; height: 40px; margin-left: -10px;}
	.back_img { width: 45px; height: 35px; float: left; margin-left: -15px;}
	
	.btn:hover { cursor: pointer; }	


	/* 내용영역 */ 
	.content_ms::-webkit-scrollbar { display: none; }
	.content_ms { height: 523px; text-align: left; overflow:auto; margin-bottom:7px;}
	.chattingList { height: 75px; }
	.chattingList:hover{ background: #f6f6f6; }
	.chattingList_div { width: 55px; height: 55px; background: gray; float: right; border-radius: 100%; background-size: cover; 
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg");}
	
	/* 채팅 리스트 */	
	.profile_td { padding-left: 10px; padding-right: 15px; padding-top: 10px; padding-bottom: 7px; }	
	.roomName_td { height: 20px;	padding-top: 12px;}	
	.roomName_div { font-size: 17px; font-weight: bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}	
	.context_div { width: 220px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.time_div { width: 80px; text-align: center;}
	.time_td { vertical-align: bottom; width: 51px; }
	
	/* 채팅입력 영역 */
	.sendInputText { width:380px; height: 60px; background: #efeff1; padding: 10px; vertical-align: middle; line-height: 20px; }
	.sendInput { width: 230px; height: 42px; font-size: 20px; }
	.sendTd { width: 100px; }
	.sendBtn { font-size: 20px; color: white }
	
	.outgoing_msg { width:100%; margin-top: 15px; overflow: hidden; padding-left: 90px;}
	.incoming_msg{ width:100%; margin-top: 0px; overflow: hidden; padding-right: 30px; }
	.send_msg { margin-right: 0px; border-radius: 5px; float: right;  margin-right: 10px; padding: 7px; color: white; word-break:break-all}
	.received_msg { margin-left: 0px; border-radius: 5px;  float: left;  margin-right: 5px; padding: 7px; color: white; background: yellowgreen; word-break:break-all }
	.send_time_date { color: #747474; font-size: 12px; margin: 0px;}
	.received_time_date { color: #747474; font-size: 12px; margin-bottom: 5px;}
	
	/* 첨부파일 메뉴 */
	.attachment_div { background: #efeff1; display:none;}
	.attachment_table { width: 380px; height: 110px; }
	.attachment_td { width: 200px; }
	.attachment_td:hover {background: #808080 ; cursor: pointer;}
	.attachment_img { width: 75px; height: 65px;}
	.attachment_p { margin-bottom: 0px; }
	
	
	/* 채팅방 설정 */
	.dropdown { margin-top: 0px; float: right; }
	.dd-button { display: inline-block; border: 0px solid gray; border-radius: 4px; cursor: pointer; white-space: nowrap; color: #013252; }
	.dd-button:after { display:none; content: ''; position: relative; width: 0; height: 0; 
		border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 5px solid black; }
	.dd-button:hover { color: white; }
	.dd-input { display: none; }
	.dd-menu { width: 300px; height: 630px; padding: 10px; position: absolute; top: 0; right: 0; border: 1px solid #ccc; border-radius: 4px; padding: 0; margin: 2px 0 0 0;
		box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.1); background-color: #ffffff; list-style-type: none; !important; }
	.dd-menu_text { font-size: 15px; }
	.dd-input+.dd-menu { display: none; }
	.dd-input:checked+.dd-menu { display: block; }
	.dd-menu li { padding: 10px 20px; cursor: pointer; white-space: nowrap; }
	.dd-menu li:hover { background-color: #f6f6f6; }
	.dd-menu li a { display: block; margin: -10px -20px; padding: 10px 20px; }
	.dd-menu li.divider { padding: 0; border-bottom: 1px solid #cccccc; }
	
	
	/* 채팅방 설정 */
	.roomSetting_wrap { display: none; }
	.background_black { position: absolute; top:0; right: 0;  width: 380px; height: 650px; background: black; opacity: 0.5; }
	.roomSetting_div { position: absolute; top:0; right: 0;  width: 300px; height: 650px; background: white; }
	.roomSetting_top { position: absolute; top:0; right: 0; width: 300px; height: 170px; backgorund: blue; }
	.roomSetting_attachment {position: absolute; top:50px; right: 0; width: 300px; height: 110px;}
	.roomSetting_alarm{ font-size: 20px; padding-top: 7px; float: left;}
	.alarm_img { width: 50px; height: 40px; text-align:left; float: left;}
	.plus_img2 { float: right; }
	.attachment_td {width: 150px;}
	.attachment_text {font-size: 20px;}
	.attachment_td2:hover{ background: #808080; color: white}
	.addMember { overflow:auto; position: absolute; top: 170px; right: 0; width: 300px; height: 430px; background: white;} 
	.addMember::-webkit-scrollbar { display: none; }
	
	.exitArea { position: absolute; bottom:0; right: 0; width: 300px; height: 52px; color: white; }
	.btn2:hover{ cursor: pointer;}
	.attachImg:hover{ cursor: pointer;}
</style>
</head>
<body>
	<div class="messengerWrap">
		<!-- 최상단 로고 영역 -->
		<div class="topArea settings_color settings_font">
		<img class="btn back_img" src="${ contextPath }/resources/images/messenger/left-arrow.png">
		<p class="chattingTitle">채팅방 제목</p>
		
		<label class="dropdown">
			<div class="dd-button">
				<img onclick="settingRoom();" class="btn plus_img" src="${ contextPath }/resources/images/messenger/settings_ms.png">
			</div> 
			<input type="checkbox" class="dd-input" id="test">
		</label>
		</div>
		
		<!-- 내용 영역 시작-->
		<div id="messages" class="content_ms">
		
			<!-- 웹소켓 버튼 -->
			<!-- 			
			<div>
				<button type="button" onclick="openSocket();">Open</button>
				<button type="button" onclick="closeSocket();">Close</button>
			</div>
 			-->		
			
			<%-- <!-- 보낸 메시지 -->
			<div class="outgoing_msg">
				<table align="right">
					<tr>
						<td class="time_td">
							<p class="send_time_date">오후 1:00</p>	
						</td>
						<td>
							<div class="send_msg settings_color">
								메시지입니다.
							</div>
						</td>
					</tr>
				</table>
			</div>

			<!-- 받은 메시지 -->
			<div class="incoming_msg">
				<table class="chatting_table">
					<tr>
						<td rowspan="2" class="profile_td">
							<div class="btn chattingList_div" style="background-image: url('${ contextPath }/resources/images/messenger/user02.png')"></div>
						</td>
						<td colspan="2" class="roomName_td">
							<div class="roomName_div">차수현 대리님</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="received_msg">
								답변입니다.
							</div>
						</td>
						<td class="time_td" >
							<p class="send_time_date">오후 1:00</p>	
						</td>
					</tr>
				</table>
			</div> --%>
					
		</div>
		<!-- 내용 영역 끝 -->
			
		<!-- 첨부파일 메뉴 -->	
		<div class="attachment_div">
			<table class="attachment_table" >
				<tr>
					<td class="attachment_td attachPicture" id="attachPicture">
						<img class="btn attachment_img" src="${ contextPath }/resources/images/messenger/picture.png">
						<p class="attachment_p">사진</p>
					</td>
					<td class="attachment_td attachFile" id="attachFile">
						<img class="btn attachment_img" src="${ contextPath }/resources/images/messenger/attachment.png">
						<p class="attachment_p">파일</p>
					</td>
				</tr>
			</table>		
		</div>	

		<!-- 숨겨진 파일 첨부 -->
		<div id="fileArea">
			<form id="file_form" method="post" enctype="multipart/form-data" action="">
				<input type="file" id="input_picture" name="picture">
				<input type="file" id="input_file" name="file">
			</form>
		</div>
		
 <script>
 
 
 
	/* 사진이미지 채팅창에 반영하기 */
 	$("input[name=picture]").on("change", function() {
		var date = new Date();
		var ampm = (date.getHours() > 12 ? "오후 " + (date.getHours() - 12) :"오전 " + date.getHours());
		var time = ":" + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
		var $msgHistory = $(".content_ms");
		
		
		
		var form = $("#file_form")[0];
		var formData = new FormData(form);
		formData.append("fileObj", $("#input_picture")[0].files[0]);
		
		//console.log(form);
		//console.log(formData);
		
		/* 보낸 메시지 DB에 저장하기 */
        var roomNo = "${ param.roomNo }";
        var sender = '${ sessionScope.loginUser.empNo }';
        var message = '(사진)';
		var messageType = 1;            
		var sendDate = getTimeStamp();
		
		$.ajax({
				url: "saveMessage.ms",
				type: "post",
				data: {
					roomNo: roomNo,
					empNo: sender,
					message: message,
					messageType: messageType,
					sendDate: sendDate
				},
				success: function(data) {
					console.log(data);
					
					// 파일 저장하기
					$.ajax({
						type: "post",
						url: "insertFile.ms",
						processData: false,
			            contentType: false,
			            data: formData,	
						success: function(data) {
							console.log(data);
							
							// 저장한 파일의 이름 가져오기 
							$.ajax({
								type: "post",
								url: "selectFile.ms",
								success: function(img) {
									
						    		var sender_img = "${contextPath}/resources/uploadFiles/${sessionScope.loginUser.photoName}";
						    		var fileUrl = "${contextPath}/resources/uploadFiles/messenger/" + img + ";"
									
	    							var $sendMsg = "<div class='outgoing_msg'><table align='right'><tr><td class='time_td' style='padding-right:2px;'><p class='send_time_date'>" 
				    					   + ampm + time + "</p></td><td><div class='send_msg settings_color'><img class='attachImg' src='" 
				    					   + fileUrl + "' style='max-width: 250px; max-height: 250px;'></div></td></tr></table></div>";
				    				$msgHistory.append($sendMsg);
				    				
				    				// 소켓에 전송
						    		var text = document.getElementById("messageinput").value + "&%" + document.getElementById("sender").value + "&%" + sender_img + "&%" + fileUrl;
						    		ws.send(text);
						            text="";
						            
						            // 첨부파일 영역 끄기
						            plusAttachment();
								},
								error: function(error) {
									console.log(error);
								}
							});
							
						},
						error: function(error) {
							console.log(error);
						}
					});
					
				},
				error: function(error) {
					console.log(error);
				}
				
        });
		
	}); 
		
 </script>

		<!-- 채팅방 메시지 보내는 영역 -->			
		<div class="sendInputText">
			<table class="sendTable">
				<tr>
					<td class="sendTd">
						<img class="btn plus_img" src="${ contextPath }/resources/images/messenger/plus.png" onclick="plusAttachment();">
					</td>
					<td class="sendTd">
						<input type="text" id="sender" value="${ sessionScope.loginUser.empName } ${ sessionScope.loginUser.positionName }님" style="display: none;">
						<input type="text" id="messageinput" class="sendInput" onkeyup="enterkey();">
					</td>
					<td class="sendTd">
						<div class="btn sendBtn settings_color" onclick="send();">Send</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 채팅방 설정 영역 -->
	<div class="roomSetting_wrap">
		<div class="background_black"></div>
		<div class="roomSetting_div">
			<div class="roomSetting_top" style="background: #eceff1">
				<img class="btn alarm_img" src="${ contextPath }/resources/images/messenger/notifications.png">
				<p class="roomSetting_alarm settings_font">ON</p>
				<img onclick="settingRoom();" class="btn plus_img plus_img2" src="${ contextPath }/resources/images/messenger/settings_gray.png">
			</div>
			
			<!-- 채팅 설정 첨부파일 메뉴 -->
			<div class="roomSetting_attachment" style="background: white; ">
				<table style="width: 300px; height: 110px; text-align:center;">
					<tr>
						<td class="attachment_td2 attachPicture" id="attachPicture">
							<p class="attachment_text settings_font">
								<img class="btn attachment_img" src="${ contextPath }/resources/images/messenger/picture.png" style="width: 60px; height: 50px;">사진
							</p>
						</td>
						<td class="attachment_td2 attachFile" id="attachFile">
							<p class="attachment_text settings_font">
								<img class="btn attachment_img" src="${ contextPath }/resources/images/messenger/attachment.png" style="width: 60px; height: 50px;">파일
							</p>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 대화상대 추가 -->
			<div class="addMember">
				<div class="chattingList chattingList1" style="height: 60px;">
					<table class="chatting_table">
						<tr>
							<td rowspan="2" class="profile_td">
								<img onclick="addMember();"  class="btn exit_img" src="${ contextPath }/resources/images/messenger/plusBtn_gray.png" style="width: 50px; height: 40px; margin-top: 2px;">
							</td>
							<td class="roomName_td">
								<div onclick="addMember();" class="btn2 settings_font" style="color: #727272; font-size: 15px; font-weight: normal; margin-top: -10px;">대화상대 추가</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<script>
			/* 현재 방에 있는 인원 리스트 조회 */
			 $(function(){
					var roomNo = "${ param.roomNo }";
					var empNo = "${ sessionScope.loginUser.empNo }"

					$.ajax({
						type: "post",
						url: "selectRoomMember.ms",
						data: {
							roomNo: roomNo,
							empNo: empNo
						},
						success: function(data) {
							console.log(data);
							for(var key in data) {
								//console.log(data[key]);
								
								var $addMember =  $(".addMember");
								var photoName = "${contextPath}/resources/uploadFiles/" + data[key].photoName;
								
								var $member = '<div class="chattingList chattingList1"><table class="chatting_table"><tr><td rowspan="2" class="profile_td"><div class="btn chattingList_div"' 
									+ 'style="background-image: url(' + photoName + ');"></div></td><td class="roomName_td"><div class="roomName_div settings_font">' 
		    						+ data[key].empName + ' ' + data[key].positionName + '</div></td></tr></table></div>';
			    					   
			    				$addMember.append($member);
								
							}
							
						},
						error: function(error) {
							console.log(error);
							
						}
					});
			    	
			    });
			
			</script>


			<!-- 나가기 영역 -->
			<div class="exitArea settings_color">
				<table style="vertical-align: middle;">
					<tr>
						<td>
							<img onclick="exit();" class="btn exit_img" src="${ contextPath }/resources/images/messenger/exit.png" style="width: 55px; height: 45px; margin-top: 2px;">
						</td>
						<td>
							<p onclick="exit();" class="btn2 settings_font" style="font-size: 20px; margin-top: 7px;">채팅방 나가기</p>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
<script>
	//저장된 테마 색상 가져오기
	var color = "";
	$(function(){
		var empNo = "${sessionScope.loginUser.empNo}";
		$.ajax({
			type:"POST",
			url :'selectThema.ms',
			data: {
				empNo: empNo
			},
			success:function(data){
				console.log(data);
				console.log("===================");
				
				color = data.substring(1, 8);
				
				$(".settings_color").css("background", color);
				
			}, 
			error:function(data) {
				$(".settings_color").css("background", '#0871b9');
			}
		});
	});

	/* 파일첨부 div 온오프 */
	function plusAttachment() {
		if($(".attachment_div").is(":visible")) {
			$(".attachment_div").hide();
			$('.content_ms').css("height", "523px");
		} else {
			$(".attachment_div").show();
			$('.content_ms').css("height", "413px");
		}
	}
	
	/* 채팅방 설정 온오프 */
	function settingRoom() {
		if($(".roomSetting_wrap").is(":visible")) {
			$(".roomSetting_wrap").hide();
		} else {
			$(".roomSetting_wrap").show();
		}
	}
	
	/* 채팅방 옵션선택 */
	$(function() {
		$(".back_img").click(function(){
			window.history.back();
		});
		
		/* 파일첨부 */
		$("#fileArea").hide(); 
		
		$(".attachPicture").click(function(){
			$("#input_picture").click();
		});
		$(".attachFile").click(function() {
			$("#input_file").click();
		});
	});
	
	/* 채팅방 나가기 */
	function exit() {
		var roomNo = "${ param.roomNo }";
		var empNo = "${sessionScope.loginUser.empNo}";
		location.href = "${ contextPath }/exitRoom.ms?roomNo=" + roomNo + "&empNo=" + empNo;
	}
	
	/* 맴버 초대하기 */
	function addMember() {
		var roomNo = "${ param.roomNo }";
		location.href = "${ contextPath }/addMember.ms?roomNo=" + roomNo;
	}

	/* 첨부파일 채팅창에 반영하기 */
	/* $("input[name=file]").on("change", function() {
		var date = new Date();
		var ampm = (date.getHours() > 12 ? "오후 " + (date.getHours() - 12) :"오전 " + date.getHours());
		var time = ":" + date.getMinutes();
		var receiver = "받는 사람";
		var receiver_imgsrc = "${contextPath}/resources/images/messenger/user02.png";
		var $msgHistory = $(".content_ms");

		
		var file = this.files[0] 
		var fileName = file.name
		var fileSize = file.size;
		//alert("Uploading: " + fileName + " @ " + fileSize + "bytes");

		// 내가 보낸 메시지 
		var $sendMsg = "<div class='outgoing_msg'><table align='right'><tr><td class='time_td'><p class='send_time_date'>" 
					   + ampm + time + "</p></td><td><div class='send_msg settings_color'>" 
					   + fileName + "</div></td></tr></table></div>";
					   
	    // 상대가 보낸 메시지 
		var $receivedMsg = "<div class='incoming_msg'><table class='chatting_table'><tr><td rowspan='2' class='profile_td'>" + 
						   "<div class='btn chattingList_div' style='background-image: url(" + receiver_imgsrc + ")'></div></td><td colspan='2' class='roomName_td'><div class='roomName_div'>"
						   + receiver + "</div></td></tr><tr><td><div class='received_msg'>"
						   + fileName + "</div></td><td class='time_td'><p class='send_time_date'>"
						   + ampm + time + "</p></td></tr></table></div>";
					  
		$msgHistory.append($receivedMsg);
		$msgHistory.append($sendMsg);
		
		// 스크롤을 하단으로 이동하기 
		$(".content_ms").scrollTop($(".content_ms")[0].scrollHeight);
	}); */

	// 엔터로 메시지 보내기	
    function enterkey() {
    	if (window.event.keyCode == 13) {
        	
           send();
       	}
    }
	
    // 보내는 사람 이미지
    var sender_img = "";
	var date;
	var today;
	
    // 메시지 히스토리 조회
    $(function(){
    	$(".content_ms").ready(function(){
			var roomNo = "${ param.roomNo }";
			var sendTime = "";
			
			$.ajax({
				type: "post",
				url: "messageHistory.ms",
				data: {
					roomNo: roomNo
				},
				success: function(data) {
					//alert(data);

					var $msgHistory = $(".content_ms");
					var $chattingTitle = $(".chattingTitle");
					
					for(var key in data) {
						var profilePhoto = "${contextPath}/resources/uploadFiles/" + data[key].profilePhoto;
						
						var timestamp = data[key].sendDate;
						date = new Date(timestamp);
						today = new Date();							
						//alert(date.getFullYear() + "년 " + date.getMonth() + "월 " + date.getDate() + "일");
						//alert(today.getFullYear() + "년 " + today.getMonth() + "월 " + today.getDate() + "일");

						sendTime = (date.getHours() > 12 ? "오후 " + (date.getHours() - 12) :"오전 " + date.getHours()) 
							+ ":" + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
						
	    				$chattingTitle.html(data[key].roomName);
	    				
	    				// 로그인 유저 여부 확인
	    				if("${ sessionScope.loginUser.empNo }" == data[key].empNo) {
	    					
	    					// 입장 메시지 확인
	    					if(data[key].messageContent == '입$장') {
								var $sendMsg = '<div style="text-align: center; margin-top: 10px;">'
									+ data[key].roomName + '이 입장하셨습니다.</div>';
	    					} else {
	    						// 이미지 여부 확인
	    						if(data[key].messageType == 1 && data[key].messageFile != null){
	    							var img = data[key].messageFile;
	    							var file = "${contextPath}/resources/uploadFiles/messenger/" + data[key].messageFile + ";"
	    							
	    							var $sendMsg = "<div class='outgoing_msg'><table align='right'><tr><td class='time_td' style='padding-right:2px;'><p class='send_time_date'>" 
				    					   + sendTime + "</p></td><td><div class='send_msg settings_color'><img class='attachImg' src='" 
				    					   + file + "' style='max-width: 250px; max-height: 250px;'></div></td></tr></table></div>";
				    			// 이미지가 아니라면		   
	    						} else {
									var $sendMsg = "<div class='outgoing_msg'><table align='right'><tr><td class='time_td' style='padding-right:2px;'><p class='send_time_date'>" 
				    					   + sendTime + "</p></td><td><div class='send_msg settings_color'>" 
				    					   + data[key].messageContent + "</div></td></tr></table></div>";
	    						}
	    					}	
		    				$msgHistory.append($sendMsg);
		    				
	    				} else {
	    					// 로그인 유저가 아니라면
	    					if(data[key].messageContent == '입$장') {
								var $receivedMsg = '<div style="text-align: center; margin-top: 10px;">'
									+ data[key].empName + ' ' + data[key].positionName + '님이 입장하셨습니다.</div>';
	    					} else if(data[key].messageContent == '퇴$장') {
								var $receivedMsg = '<div style="text-align: center; margin-top: 10px;">'
									+ data[key].empName + ' ' + data[key].positionName +'님이 나가셨습니다.</div>';
	    					} else {
	    						
	    						// 이미지 여부 확인
	    						if(data[key].messageType == 1 && data[key].messageFile != null){
	    							var img = data[key].messageFile;
	    							var file = "${contextPath}/resources/uploadFiles/messenger/" + data[key].messageFile + ";"
	    							
	    							var $receivedMsg = "<div class='incoming_msg'><table class='chatting_table'><tr><td rowspan='2' class='profile_td' style='vertical-align:top; padding-top: 32px;'>" + 
										   "<div class='btn chattingList_div' style='background-image: url(" + profilePhoto + ")'></div></td><td colspan='2' class='roomName_td'><div class='roomName_div'>"
										   + data[key].empName + " " + data[key].positionName + "님</div></td></tr><tr><td><div class='received_msg'>"
										   + "<img class='attachImg' src='" + file + "' style='max-width: 250px; max-height: 250px;'></div></td><td class='time_td'><p class='send_time_date'>"
										   + sendTime + "</p></td></tr></table></div>";
	    						} else {
	    							// 이미지가 아니라면
				    				var $receivedMsg = "<div class='incoming_msg'><table class='chatting_table'><tr><td rowspan='2' class='profile_td'>" + 
										   "<div class='btn chattingList_div' style='background-image: url(" + profilePhoto + ")'></div></td><td colspan='2' class='roomName_td'><div class='roomName_div'>"
										   + data[key].empName + " " + data[key].positionName + "님</div></td></tr><tr><td><div class='received_msg'>"
										   + data[key].messageContent + "</div></td><td class='time_td'><p class='send_time_date'>"
										   + sendTime + "</p></td></tr></table></div>";
	    						}
	    					}	
		    	    		$msgHistory.append($receivedMsg);
	    				}
	    				// 테마 색성 변경
	    				$(".settings_color").css("background", color);
	    	    		// 스크롤를 가장 아래로
	    				$(".content_ms").scrollTop($(".content_ms")[0].scrollHeight);
					}
				},
				error: function(error) {
					console.log(error);
					
				}
			}); 
			
		});
    	
    });
    
    /* 현재시간을 구하는 함수 */
    function getTimeStamp() {
    	  var d = new Date();
    	  var s =
    	    leadingZeros(d.getFullYear(), 4) + '-' +
    	    leadingZeros(d.getMonth() + 1, 2) + '-' +
    	    leadingZeros(d.getDate(), 2) + ' ' +

    	    leadingZeros(d.getHours(), 2) + ':' +
    	    leadingZeros(d.getMinutes(), 2) + ':' +
    	    leadingZeros(d.getSeconds(), 2);

    	  return s;
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


	//===========================================================================
		/* 웹소켓 관련 */
        function send(){
        	/* 날짜 포맷 */
    		var date = new Date();
    		var ampm = (date.getHours() > 12 ? "오후 " + (date.getHours() - 12) :"오전 " + date.getHours());
    		var time = ":" + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
    		var $msgHistory = $(".content_ms");
    		
    		/* 채팅창 */
    		var chat = $(".sendInput").val();
    		
    		// input 공백 막기
    		if(chat == null || chat.replace(/ /gi,"") == ""){
    			return;
    		} else {
	    		/* 내가 보낸 메시지 */
	    		var $sendMsg = "<div class='outgoing_msg'><table align='right'><tr><td class='time_td'><p class='send_time_date'>" 
	    					   + ampm + time + "</p></td><td><div class='send_msg settings_color'>" 
	    					   + chat + "</div></td></tr></table></div>";
	    		
	    		$msgHistory.append($sendMsg);
	    		
	    		/* 스크롤을 하단으로 이동하기 */
	    		$(".content_ms").scrollTop($(".content_ms")[0].scrollHeight);
	    		
	    		var sender_img = "${contextPath}/resources/uploadFiles/${sessionScope.loginUser.photoName}";
	    		//alert(sender_img);
	    		
	    		var text = document.getElementById("messageinput").value + "&%" + document.getElementById("sender").value + "&%" + sender_img;
	    		ws.send(text);
	            text="";
	            
	            /* 보낸 메시지 DB에 저장하기 */
	            var roomNo = "${ param.roomNo }";
	            var sender = '${ sessionScope.loginUser.empNo }';
	            var message = $(".sendInput").val();
				var messageType = 0;            
				var sendDate = getTimeStamp();
				
	            $.ajax({
					url: "saveMessage.ms",
					type: "post",
					data: {
						roomNo: roomNo,
						empNo: sender,
						message: message,
						messageType: messageType,
						sendDate: sendDate
					},
					success: function(data) {
						//alert("메시지 전송");
						console.log(data);
					},
					error: function(error) {
						console.log(error);
					}
	            });
	            
	        	$(".settings_color").css("background", color);
	        	
	            /* 메시지 전송 후 inputRset */
	    		var inputReset = $(".sendInput").val("");
    		}
        } 
        
        function closeSocket(){
            ws.close();
        }
        
        // 상대가 보낸 메시지
        function writeResponse(text){
        	//messages.innerHTML+="<br/>"+text;
            
            /* 날짜 포맷 */
    		var date = new Date();
    		var ampm = (date.getHours() > 12 ? "오후 " + (date.getHours() - 12) :"오전 " + date.getHours());
    		var time = ":" + date.getMinutes();
    		
    		var $msgHistory = $(".content_ms");
    		
            
    		var splitText = text.split("&%");
    		var chatContent = splitText[0];
    		var sender = splitText[1];
    		var photo = splitText[2];
    		var file = splitText[3];
    		console.log("splitText : " + splitText);
    		
    		
    		if(chatContent != "" && file != "") {
	            /* 상대가 보낸 메시지 */
	    		var $receivedMsg = "<div class='incoming_msg'><table class='chatting_table'><tr><td rowspan='2' class='profile_td'>" + 
	    						   "<div class='btn chattingList_div' style='background-image: url(" + photo + ")'></div></td><td colspan='2' class='roomName_td'><div class='roomName_div'>"
	    						   + sender + "</div></td></tr><tr><td><div class='received_msg'>"
	    						   + chatContent + "</div></td><td class='time_td'><p class='send_time_date'>"
	    						   + ampm + time + "</p></td></tr></table></div>";
    		} else {
    			// 이미지일 때
    			var $receivedMsg = "<div class='incoming_msg'><table class='chatting_table'><tr><td rowspan='2' class='profile_td' style='vertical-align:top; padding-top: 32px;'>" + 
				   "<div class='btn chattingList_div' style='background-image: url(" + photo + ")'></div></td><td colspan='2' class='roomName_td'><div class='roomName_div'>"
				   + sender + "</div></td></tr><tr><td><div class='received_msg'>"
				   + "<img class='attachImg' src='" + file + "' style='max-width: 250px; max-height: 250px;'></div></td><td class='time_td'><p class='send_time_date'>"
				   + ampm + time + "</p></td></tr></table></div>";
				
    		}
			// 첨부파일명 초기화 
			file = "";   
            
    		$msgHistory.append($receivedMsg);
    		$(".settings_color").css("background", color);
    		
    		
    		/* 스크롤을 하단으로 이동하기 */
    		$(".content_ms").scrollTop($(".content_ms")[0].scrollHeight);
        }
	       
		// 파일 다운로드
		$(document).on("click", ".attachImg", function() {
			var src = $(this).attr("src");
			//console.log(src);
			
			location.href = "${contextPath}/downloadFile.ms?src=" + src;
		});
</script>
	
	
	
</body>
</html>