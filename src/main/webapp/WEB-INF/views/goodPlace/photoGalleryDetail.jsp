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
	.contentDiv {
	height:680px;
	}
	
	
	.boardTable td {
	boarder:1px solid lightgray;
	text-align:center;
	border-bottom: 2px solid lightgray;
	padding-bottom: 5px;
	padding-top: 5px;
	text-align: center;
	height: 30px;
	}
	#titleName {
		font-size:24px;
		color:#3333333;
	}
	.profile_area {width: 35px; height: 35px; background: gray; border-radius: 100%; margin: auto; background-size: cover; 
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg");}
	.enrollDateTd {
		color:#999999;
		display:inline-block;
    	width:110px;
    	white-space:nowrap;
   	 	overflow:hidden;	
	}
	.heartBtn {
		width: 34px;
		height: 34px;
		margin-top:10px;
	}
	.heartInfo {
		width:50px;
		height:60px;
		border:1px solid #5E5E5E;
		border-radius:5px;
		text-align:center;
		margin:auto;
	}
	.contentDiv {
		height: 700px;
		overflow:auto;
	}
	.part {
		color:#ddd;
		margin: 0 8px;
	}
	#replyTab td:nth-child(1){
		width:60px;
	}
	#replyText {
		resize:none;
		width:680px;
		border:1px solid #cecece;
		border-radius:5px;
	}
	#replyBtn {
		width:45px;
		height:45px;
		line-height:40px;
		text-align:center;
		background-color:#0871B9;
		color:white;
		border-radius:5px;
		border: 1px solid #0871B9;
		margin-top:-5px;
	}
	#replyTab td:nth-child(3) {
		width:55px;
		text-align:right;
	}
	#titleSpan {
		display:inline-block;
		margin-left:3px;
		width:750px;
	}
	#replyTab2 {
		border-collapse: separate;
		border-spacing: 0 8px;
		width:100%;
	}
	.replyEditIcon {
		width: 8px; height: 8px; margin-left:10px; cursor:pointer;
	}
	.replyDeleteIcon {
		width: 8px; height: 8px; margin-left:10px; cursor:pointer;
	}
	.replyEmpTd {
		width: 120px;	
		font-weight:bold;
		color:#3a3a3a;
		font-size:13px;
	}
	#listSpan, #modifySpan, #deleteSpan {
		cursor:pointer;
	}
	.heartBtn {
		cursor:pointer;
	}
	#modifyContent{
		resize:none;
		height:30px;
		width:400px;
		border:1px solid #cecece;
		border-radius:5px;
	}
	#chkContent {
		font-size:13px;
		background-color:#0871B9;
		color:white;
		border-radius:5px;
		border: 1px solid #0871B9;
	}
	#delContent {
		font-size:13px;
		background-color:#e4e4e4;
		color:white;
		border-radius:5px;
		border: 1px solid #e4e4e4;
	}
</style>
<script>
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->

	<jsp:include page="../board/boardMenubar.jsp" />
	<!-- board 메뉴바 include -->
	
		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle" style="font-size:18px;">포토 갤러리</b>
			<br><br> 
			<div class="contentDiv" style="width:855px; border:0px;">
			<div style="padding:10px;">
				<div style="float:left;">
					<c:if test="${ loginUser.empNo == pboard.empNo }">
						<img src="${ contextPath }/resources/images/goodPlace/edit-tools.png" style="width:17px; height:17px; vertical-align:top;"><span style="padding-left:6px;" id="modifySpan">수정</span>&nbsp;
						<img src="${ contextPath }/resources/images/approval/trash.png" style="width:14px; height:17px; vertical-align:top;"><span style="padding-left:6px;" id="deleteSpan">삭제</span>
					</c:if>
				</div>
				<div style="float:right;">
					<img src="${ contextPath }/resources/images/menubar/open-menu.png" style="width:14px; height:17px; vertical-align:top;"><span style="padding-left:6px;" id="listSpan">목록</span>
				</div>
			</div>
			<hr>
			<div>
				<div>
					<div id="titleName" style="height:47px;">
						<span id="titleSpan">${ pboard.title }</span> 
						<img class='heartBtn' src='${ contextPath }/resources/images/feed/heart_off.png'>
					</div>
					
				</div>
				<div style="height:50px;">
					<table>
						<tr>
							<td rowspan="2" style="width:43px;"><div class="profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ pboard.writerPhoto }');"></div></td>
							<td> ${ pboard.empName } ${ pboard.positionName }</td>
						</tr>
						<tr>
							<td class="enrollDateTd">${ pboard.enrollDate }</td>
						</tr>
					</table>
				</div>
				<hr style="color:#cdcdcd; margin-top:8px; margin-bottom:6px;">
				<div style="min-height:400px; padding:10px;" id="contentDiv">
				</div>
				<script>
					var content = `${pboard.content}`;
					$("#contentDiv").html(content);
				</script>
				<div style="height:40px;"></div>
				</div>
				<div>
					<span>댓글 <b id="replyCount">${ pboard.pboardReplyList.size() }</b></span>
					<span class="part">|</span>
					<span>조회  <b>${ pboard.views }</b></span>
					<span class="part">|</span>
					<span>좋아요  <b id="likesCount">${ pboard.likes }</b></span>
				</div>
				<hr style="margin-top:5px;">
				<div>
					<table id="replyTab">
						<tr>
							<td><div class="profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');"></div></td>
							<td><textarea id="replyText" placeholder="내용을 입력해주세요."></textarea></td>
							<td><button type="button" id="replyBtn">작성</button></td>					
						</tr>
					</table>
					
				</div>
				
				<hr>
				<div>
					<table id="replyTab2">
						<c:forEach var="r" items="${ pboard.pboardReplyList }">
							<tr>
								<input type="hidden" value="${ r.preplyNo }">
								<td rowspan="2" style="width: 60px;"><div
										class="profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ r.replyPhoto }');"></div></td>
								<td class="replyEmpTd">${ r.empName } ${ r.positionName }</td>
								<td class="enrollDateTd">${ r.replyDate }</td>
								<td style="text-align:left;">
									<c:if test="${ loginUser.empNo == r.empNo }">
										<img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png" style="cursor: pointer;"> 
										<img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png" style="cursor: pointer;">
									</c:if>
								</td>
								<td style="width:460px;"></td>
							</tr>
							<tr id="content${ r.preplyNo }">
								<td colspan="4">${ r.content }</td>
							</tr>
						</c:forEach>
					</table>
					<form action="deletePboardReply.gp" id="deleteForm" method="post">
						<input type="hidden" name="pboardNo" value="${ pboard.pboardNo }">
						<input type="hidden" name="preplyNo" id="preplyNo">
					</form>
					<form action="updatePboardReply.gp" id="updateForm" method="post">
						<input type="hidden" name="pboardNo" value="${ pboard.pboardNo }">
						<input type="hidden" name="preplyNo" id="updatePreplyNo">
						<input type="hidden" name="content" id="updateContent">
					</form>
				</div>
			</div>
			</div>
		</div>
		<!-- 본문 영역 끝 -->


	<script>
		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

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
		
		
		$(document).ready(function() {
			$("#replyBtn").click(function() {
				var content = $("#replyText").val();
				if (content == "") {
					swal("", "내용을 입력해주세요.", "info");
				} else {
					var time = getTimeStamp();
					
					$.ajax({
						type:"post",
						url: "insertReply.gp",
						data: {
							"pboardNo" : '${ pboard.pboardNo }',
							"empNo" : '${ loginUser.empNo }',
							"content" : content,
							"replyDate" : time
						},
						success: function(data) {
							$("#replyText").val('');
							$("#replyTab2").empty();
							$("#replyCount").text(data.length);
							for(var key in data) {
								//console.log(data[key]);
								
								var timestamp = data[key].replyDate;
								var date = new Date(timestamp);
								var year = date.getFullYear();
								var month = date.getMonth() + 1;
								month = (month < 10 ? "0" + month : month);
								var day = date.getDate();
								day = (day < 10 ? "0" + day : day);
								var hours = date.getHours();
								var minutes = date.getMinutes();										
								var monthDay = year + "-" + month + "-" + day + " ";									
								var time = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes);
								var totalTime = monthDay + time;
								
								var $tr = "";
								if(data[key].empNo == '${ loginUser.empNo }') {
									$tr = '<tr><input type="hidden" value="'+ data[key].preplyNo+ '"><td rowspan="2" style="width: 60px;">'
										+ '<div class="profile_area" style="background-image: url(\''
										+ '${ contextPath }/resources/uploadFiles/'+ data[key].replyPhoto +'\');"></div></td>'
										+ '<td class="replyEmpTd">'+ data[key].empName + data[key].positionName + '</td>'
										+ '<td class="enrollDateTd">'+ totalTime + '</td>'
										+ '<td style="text-align:left;">'
										+ '<img class="replyEditIcon" src="${ contextPath }/resources/images/todo/edit.png" style="cursor: pointer;">'
										+ '<img class="replyDeleteIcon" src="${ contextPath }/resources/images/todo/close.png" style="cursor: pointer;">'
										+ '</td><td style="width:460px;"></td></tr>'
										+ '<tr><td colspan="4">' + data[key].content + '</td></tr>';
								} else {
									$tr = '<tr><input type="hidden" value="'+ data[key].preplyNo+ '"><td rowspan="2" style="width: 60px;">'
										+ '<div class="profile_area" style="background-image: url(\''
										+ '${ contextPath }/resources/uploadFiles/'+ data[key].replyPhoto +'\');"></div></td>'
										+ '<td class="replyEmpTd">'+ data[key].empName + data[key].positionName + '</td>'
										+ '<td class="enrollDateTd">'+ totalTime + '</td>'
										+ '<td style="text-align:left;">'
										+ '</td><td style="width:460px;"></td></tr>'
										+ '<tr><td colspan="4">' + data[key].content + '</td></tr>';
								}
								
								$("#replyTab2").append($tr); 
							
							}
						},
						error: function(error) {
							console.log(error);
						}
					});
				}
			});
			
			$("#listSpan").click(function(){
				location.href="${ contextPath }/goPlace.gp";
			});
			
			var flag = 0;
			var likes = ${pboard.likes};
			
			$.ajax({
				type:"POST",
 				url :'heartCheck.gp',
 				async: false,
 				data: {
 					"pboardNo" : '${ pboard.pboardNo }',
 					"empNo" : '${ loginUser.empNo }'
 				},
 				success: function(data) {
 					console.log(data);
 					flag = data;
 					
 					if(data == 1) {
 						$(".heartBtn").attr("src" , '${ contextPath }/resources/images/feed/heart_on.png');
 					}
 				}
 				
			});
			
			$(".heartBtn").click(function(){
				if(flag == 0) {
					$.ajax({
						type:"POST",
		 				url :'insertHeart.gp',
		 				async: false,
		 				data: {
		 					"pboardNo" : '${ pboard.pboardNo }',
		 					"empNo" : '${ loginUser.empNo }'
		 				},
		 				success: function(data) {
		 					$(".heartBtn").attr("src" , '${ contextPath }/resources/images/feed/heart_on.png');
							flag = 1;
							likes += 1;
							$("#likesCount").text( likes );
		 				}
					});
					
				} else {
					$.ajax({
						type:"POST",
		 				url :'deleteHeart.gp',
		 				async: false,
		 				data: {
		 					"pboardNo" : '${ pboard.pboardNo }',
		 					"empNo" : '${ loginUser.empNo }'
		 				},
		 				success: function(data) {
		 					$(".heartBtn").attr("src" , '${ contextPath }/resources/images/feed/heart_off.png');
							flag = 0;
							likes -= 1;
							$("#likesCount").text( likes );
		 				}
					});
					
				}
			});
			
			$("#modifySpan").click(function(){
				var pboardNo = '${ pboard.pboardNo }';
				location.href="${contextPath}/goModify.gp?pboardNo=" + pboardNo;
			});
			
			$("#deleteSpan").click(function(){
				swal({
					title: "",
					text: "게시물을 삭제하시겠습니까?",
					icon: "info",
					buttons:["취소", "확인"]
				}).then((value) => {
					if(value == true) {
						var pboardNo = '${ pboard.pboardNo }';
						location.href="${contextPath}/deletePboard.gp?pboardNo=" + pboardNo;
					}
				});
			});
			
			$(document).on("click", ".replyDeleteIcon", function(){
				var pReplyNo = $(this).parent().parent().children("input").val();
				swal({
					title: "",
					text: "댓글을 삭제하시겠습니까?",
					icon: "info",
					buttons:["취소", "확인"]
				}).then((value) => {
					if(value == true) {
						$("#preplyNo").val(pReplyNo);
						$("#deleteForm").submit();
					}
				});
			});
			
			$(document).on("click", ".replyEditIcon", function(){
				var pReplyNo = $(this).parent().parent().children("input").val();
				var $tr = $(this).parent().parent().siblings("#content" + pReplyNo);
				var text = $tr.text();
				//console.log($(this).parent().parent().siblings("#content" + pReplyNo).text());
				$tr.empty();
				var $td = "<td colspan='4'><textarea id='modifyContent'></textarea>&nbsp;&nbsp;<button type='button' id='chkContent'>확인</button>&nbsp;<button type='button' id='delContent'>취소</button></td>";
				$tr.append($td);
				
				
				$("#chkContent").click(function(){
					var content = $("#modifyContent").val();
					if(content == "") {
						swal("", "수정할 내용을 입력해주세요.", "info");
					} else {
						$("#updateContent").val(content);
						$("#updatePreplyNo").val(pReplyNo);
						
						$("#updateForm").submit();
					}
				});
				
				$("#delContent").click(function(){
					$tr.empty();
					$td = "<td colspan='4'>" + text + "</td>";
					$tr.append($td);
				});
			});
		});
	</script>
</body>
</html>