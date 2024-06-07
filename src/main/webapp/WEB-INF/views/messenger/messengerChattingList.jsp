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
<title>Insert title here</title>
<style>	
	/* 채팅 리스트 */	
	.profile_td {padding-left: 10px; padding-right: 15px; padding-top: 10px; padding-bottom: 7px; }	
	.roomName_td {height: 20px;	padding-top: 12px;}	
	.roomName_div { width: 220px; font-size: 17px; font-weight: bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}	
	.context_div { width: 220px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.time_div {width: 80px; text-align: center;}
</style>
</head>
<body>
	<div class="messengerWrap">
	<jsp:include page="messengerMenubar.jsp" />	
		
		<!-- 내용 영역 -->
		<div class="content_ms">
			<!-- <div class="chattingList chattingList1">
				<table class="chatting_table">
					<tr>
						<td rowspan="2" class="profile_td">
							<div class="btn chattingList_div"></div>
						</td>
						<td class="roomName_td">
							<div class="roomName_div">테스트</div>
						</td>
						<td rowspan="2">
							<div class="time_div" >3월 28일</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="context_div">안녕하세요</div>
						</td>
					</tr>
				</table> -->
			</div>
				
				
	<script>
	    // 채팅 리스트 조회
		$(function(){
			$(".content_ms").ready(function(){
				var	empNo = '${ sessionScope.loginUser.empNo}';
				var $msgHistory = $(".content_ms");
				var sendTime = "";
				
				$.ajax({
					type: "post",
					url: "selectRoomList2.ms",
					data: {
						empNo: empNo
					},
					success: function(data) {
						for(var key in data) {
							var timestamp = data[key].sendDate;
							var date = new Date(timestamp);
							var today = new Date();							
							//alert(date.getFullYear() + "년 " + date.getMonth() + "월 " + date.getDate() + "일");
							//alert(today.getFullYear() + "년 " + today.getMonth() + "월 " + today.getDate() + "일");
							
							// 메시지를 보낸 시간 하루를 넘겼을 때에 따라 포맷을 다르게 한다.
							if(today.getFullYear() >= date.getFullYear() && today.getMonth() >= date.getMonth() && today.getDate() == date.getDate()) {
								// format : 오전 오후
								sendTime = (date.getHours() > 12 ? "오후 " + (date.getHours() - 12) :"오전 " + date.getHours()) 
									+ ":" + date.getMinutes();
							} else {
								// format : 0월 0일
								sendTime = (date.getMonth() + 1) + "월 " + date.getDate() + "일"
							}
							
							
							//var profilePhoto = "${contextPath}/resources/uploadFiles/" + data[key].profilePhoto;
							var profilePhoto = "${contextPath}/resources/uploadFiles/" + data[key].roomImg;
		    				var roomNo = "date[key].roomNo";
		    				
		    				if(data[key].messageContent == '입$장') {
			    				var $roomList = '<div class="chattingList chattingList1" onclick="showChattingDetail('+ data[key].roomNo +');"><table class="chatting_table"><tr><td rowspan="2" class="profile_td"><div class="btn chattingList_div" style="background-image: url(' 
			    						+ profilePhoto + ')"></div></td><td class="roomName_td"><div class="roomName_div">'
			    						+ data[key].roomName + '</div></td><td rowspan="2"><div class="time_div" >'
			    						+ sendTime + '</div></td></tr><tr><td><div class="context_div">'
			    						+ data[key].roomName + '이 입장하셨습니다.</td></tr></table></div>';
		    					
		    				} else if(data[key].messageContent == '퇴$장') {
			    				var $roomList = '<div class="chattingList chattingList1" onclick="showChattingDetail('+ data[key].roomNo +');"><table class="chatting_table"><tr><td rowspan="2" class="profile_td"><div class="btn chattingList_div" style="background-image: url(' 
	    						+ profilePhoto + ')"></div></td><td class="roomName_td"><div class="roomName_div">'
	    						+ data[key].roomName + '</div></td><td rowspan="2"><div class="time_div" >'
	    						+ sendTime + '</div></td></tr><tr><td><div class="context_div">'
	    						+ '인원 1명이  나가셨습니다.</td></tr></table></div>';
    					
    						} else {
			    				var $roomList = '<div class="chattingList chattingList1" onclick="showChattingDetail('+ data[key].roomNo +');"><table class="chatting_table"><tr><td rowspan="2" class="profile_td"><div class="btn chattingList_div" style="background-image: url(' 
			    						+ profilePhoto + ')"></div></td><td class="roomName_td"><div class="roomName_div">'
			    						+ data[key].roomName + '</div></td><td rowspan="2"><div class="time_div" >'
			    						+ sendTime + '</div></td></tr><tr><td><div class="context_div">'
			    						+ data[key].messageContent + '</td></tr></table></div>';
		    				}
		    				
		    					   
		    				$msgHistory.append($roomList);
						}
						
					},
					error: function(error) {
						console.log(error);
						
					}
				}); 
			});
	    	
	    });	    
	    
	    
		// 채팅방 이동
		function showChattingDetail(roomNo) {
			//alert(roomNo);
		    location.href = "${ contextPath }/chattingDetail.ms?roomNo=" + roomNo + ""; 
		}
		
	</script>			
			
			
		</div>
	</div>
</body>
</html>