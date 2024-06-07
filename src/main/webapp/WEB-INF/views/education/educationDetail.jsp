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
	.content {mign-height: 850px;}
	.contentDiv {overflow:auto; }
	.contentDiv::-webkit-scrollbar { display: inline; }
	.boardMain {width: 100%; height: 300px;}
	.edu_table1 {width: 100%; border-spacing: 15px; border-collapse: separate;}
	.education_title {font-size: 28px; font-weight:bold;  color: #0871b9;}
	.edu_heart_img {width: 17px;}
	.education_context{min-height: 400px; padding-bottom: 15px;}
	.detail_btn {width: 50px; text-align: center; padding: 5px; border: 1px solid #cdcdcd; border-radius: 5px; margin-left: 5px;}
	.heart_btn {width: 50px; text-align: center; padding: 5px; border: 1px solid #cdcdcd; border-radius: 5px; margin-left: 5px;}
	.detail_btn:hover {background:#0871b9; color: white; }
	.edu_table_reply{width: 97%; margin: 10px;}
	.user_img { width: 40px; height: 40px; background: gray; float: right; border-radius: 100%; background-size: cover; margin-top: 0px; margin-right: 10px;}
	.edu_table_reply_td {color: #999;}
	.edu_table_reply_td_b {color: black; margin-bottom: 2px;}
	.edu_table_reply_tr_content {padding-bottom: 15px;}
	.submit_reply {width: 70px; height: 32px; padding: 5px; text-align: center; border-radius: 5px; 
	background: #0871b9; color: white; float: right;}
	.submit_reply:hover{background: #4391c6;}
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
			<!-- 게시글영역 시작 -->
			<div class="contentDiv" style="width: 865px; height: 755px;  border: 0px solid #CDCDCD;">
				<table class="edu_table1">
					<tr>
						<td>
							<p class="education_title">${ eduDetail.eduTitle }</p>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">
							<b style="color: #0871b9">신입사원 팁</b>.&nbsp;&nbsp;
							by ${ eduDetail.empName } ${ eduDetail.positionName }.&nbsp;&nbsp;
							<div style="width:112px; display:inline-flex; white-space:nowrap; overflow:hidden;">${ eduDetail.eduDate }</div>
						</td>
					</tr>
					<tr>
						<td>
							<div style="padding-top: 0px; padding-bottom: 20px; border-bottom: 1px solid #cdcdcd; color: ">
								<img class="edu_heart_img" src="${ contextPath }/resources/images/education/eye2.png" style="width: 20px; margin-right: 2px;">
								${ eduDetail.eduCount }
								<img class="edu_heart_img" src="${ contextPath }/resources/images/education/leaf.png" style="margin-left: 10px; margin-right: 2px;">
								<span class="likeCount">${ eduDetail.likeCount }</span>
							</div>						
						</td>
					</tr>
					<tr>
						<td>
							<div class="education_context">
								${ eduDetail.eduContent }
							</div>						
						</td>
					</tr>
					<tr>
						<td>
							<div onclick="showList();" class="detail_btn btn2" style="float: left; margin-left: 0px;">목록</div>
							<div class="heart_btn btn2" style="float: left; width: 75px; ">LIKE<img class="edu_heart_img2" src="${ contextPath }/resources/images/education/leaf_em.png" style="width: 15px; margin-left: 3px; margin-top: -4px;">
							</div>
							<div class="detail_btn btn2" style="float: right; background: ">삭제</div>
							<div class="detail_btn btn2" style="float: right;">수정</div>
						</td>
					</tr>
				</table>
			<br><br>		
			<!-- 게시글영역 끝 -->
		
			<!-- 댓글영역 시작 -->
			<table class="edu_table_reply">
				<tr>
					<td colspan="2"><p style="font-size: 15px; font-weight: bold;">댓글 (<span class="replyCount">${ eduDetail.educationReplyList.size() }</span>)</p></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="edu_reply_Content" class="reply_Content" placeholder="댓글을 작성해주세요." style="width: 100%;height: 74px;"></textarea>
						<div class="submit_reply btn2" style="">작성</div>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<!-- 한 개의 댓글 시작 -->
				<c:forEach var="r" items="${ eduDetail.educationReplyList }">
				<tr>
					<td rowspan="2" style="width: 20px; vertical-align: top;">
						<input type="hidden" value="${ r.replyNo }">
						<div class="user_img" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');"></div>
					</td>
					<td class="edu_table_reply_td"><b class="edu_table_reply_td_b">${ r.empName } ${ r.positionName }</b>&nbsp;
						<div style="width:110px; display:inline-flex; white-space:nowrap; overflow:hidden;">${ r.replyDate }</div>
					</td>
				</tr>
				<tr>
					<td class="edu_table_reply_tr_content">${ r.replyContent }
						<c:if test="${ loginUser.empNo == r.empNo }">
							<img class="reply_edit btn2" src="${ contextPath }/resources/images/education/edit.png" style="width: 10px; margin-right: -2px; margin-right:2px;">
							<img class="reply_delete btn2" src="${ contextPath }/resources/images/education/close.png" style="width: 10px; margin-right: -2px;">
						</c:if>
					</td>
				</tr>
				</c:forEach>
				<!-- 한 개의 댓글 끝 -->
				<%-- <!-- 한 개의 댓글 시작 -->
				<tr>
					<td rowspan="2" style="width: 20px; vertical-align: top;">
						<div class="user_img" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');"></div>
					</td>
					<td class="edu_table_reply_td"><b class="edu_table_reply_td_b">이진규 대표이사</b>&nbsp;
						2020-05-07 14:09</td>
				</tr>
				<tr>
					<td class="edu_table_reply_tr_content">피는 심장의 안고, 꾸며 무한한 힘있다. 이상의 이상은 풍부하게 것이다. 사람은 인간에 못할 맺어, 피고, 열락의 품었기 것이다. 이상은 몸이 황금시대를 소담스러운 보이는 것이다. 가슴이 피에 이상은 만천하의 아니다. 행복스럽고 피어나기 하였으며, 뿐이다. 이상의 있는 찾아 우리 이것이다.</td>
				</tr>
				<!-- 한 개의 댓글 끝 -->
				<!-- 한 개의 댓글 시작 -->
				<tr>
					<td rowspan="2" style="width: 20px; vertical-align: top;">
						<div class="user_img" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');"></div>
					</td>
					<td class="edu_table_reply_td"><b class="edu_table_reply_td_b">이진규 대표이사</b>&nbsp;
						2020-05-07 14:09</td>
				</tr>
				<tr>
					<td class="edu_table_reply_tr_content">피는 심장의 안고, 꾸며 무한한 힘있다. 이상의 이상은 풍부하게 것이다. 사람은 인간에 못할 맺어, 피고, 열락의 품었기 것이다. 이상은 몸이 황금시대를 소담스러운 보이는 것이다. 가슴이 피에 이상은 만천하의 아니다. 행복스럽고 피어나기 하였으며, 뿐이다. 이상의 있는 찾아 우리 이것이다.
				</td>
				</tr>
				<!-- 한 개의 댓글 끝--> --%>
				
			</table>
		
			<!-- 댓글영역 끝 -->
			
			</div>
		</div>
		<!-- 본문 영역 끝 -->


	<script>
		function showList(){
			window.history.back();
		}
	
		var ch = 0; // 0일때 체크X, 1일때 체크O
		var likeCount = ${ eduDetail.likeCount };
		//console.log(likeCount);
		
		$(function(){
			// 좋아요 체크여부
			$.ajax({
			type:"POST",
				url :'heartCheck.ed',
				async: false,
				data: {
					"eduNo" : "${ eduDetail.eduNo }",
					"empNo" : '${ loginUser.empNo }'
				},
				success: function(data) {
					console.log(data);
					ch = data;
					
					if(data == 1) {
						$(".edu_heart_img2").attr('src', "${ contextPath }/resources/images/education/leaf.png");
						$(".heart_btn").css("color", "#33AB49");
					}
				}
			});
		});
		
		
		// 좋아요 버튼 클릭
		$(".heart_btn").click(function(){
			if(ch == 0){
				$.ajax({
					type:"POST",
	 				url :'insertHeart.ed',
	 				async: false,
	 				data: {
	 					"eduNo" : "${ eduDetail.eduNo }",
	 					"empNo" : '${ loginUser.empNo }'
	 				},
	 				success: function(data) {
	 					$(".edu_heart_img2").attr('src', "${ contextPath }/resources/images/education/leaf.png");
	 					$(".heart_btn").css("color", "#33AB49");
	 					ch = 1;
	 					likeCount += 1;
	 					$(".likeCount").text( likeCount );
	 				}
				});

			} else {
				$.ajax({
					type:"POST",
	 				url :'deleteHeart.ed',
	 				async: false,
	 				data: {
	 					"eduNo" : "${ eduDetail.eduNo }",
	 					"empNo" : '${ loginUser.empNo }'
	 				},
	 				success: function(data) {
	 					$(".edu_heart_img2").attr('src', "${ contextPath }/resources/images/education/leaf_em.png");
	 					$(".heart_btn").css("color", "black");
	 					ch = 0;
	 					likeCount -= 1;
	 					$(".likeCount").text( likeCount );
	 				}
				});
				
			}
		});
		
		
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
		
		// 댓글 작성
		$(document).ready(function() {
			$(".submit_reply").click(function() {
				var replyContent = $(".reply_Content").val();
				if (replyContent == "") {
					swal("", "내용을 입력해주세요.", "info");
				} else {
					//onsole.log(content);
					var time = getTimeStamp();
					
					$.ajax({
						type:"post",
						url: "insertReply.ed",
						data: {
							"eduNo" : "${ eduDetail.eduNo }",
		 					"empNo" : '${ loginUser.empNo }',
							"replyContent" : replyContent,
							"replyDate" : time
						},
						success: function(data) {
							console.log(data);
							
							$(".reply_Content").val('');
							$(".edu_table_reply").empty();
							$(".replyCount").text(data.length);
							
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
								if(data[key].empNo != '${ loginUser.empNo }') {
									$tr = '<tr><td rowspan="2" style="width: 20px; vertical-align: top;"><div class="user_img" style="background-image: url('
										+ '${ contextPath }/resources/uploadFiles/' + data[key].replyPhoto + ');"></div></td><td class="edu_table_reply_td"><b class="edu_table_reply_td_b">'
										+ data[key].empName + data[key].positionName + '</b>&nbsp;'
										+ totalTime + '</td></tr><tr><td class="edu_table_reply_tr_content">'
										+ data[key].replyContent + '</td></tr>'
										+ '<img class="reply_edit btn2" src="${ contextPath }/resources/images/education/edit.png" style="width: 10px; margin-right: -2px; margin-right:2px;">'
										+ '<img class="reply_delete btn2" src="${ contextPath }/resources/images/education/close.png" style="width: 10px; margin-right: -2px;">'
								} else {
									$tr = '<tr><td rowspan="2" style="width: 20px; vertical-align: top;"><div class="user_img" style="background-image: url('
										+ '${ contextPath }/resources/uploadFiles/' + data[key].replyPhoto + ');"></div></td><td class="edu_table_reply_td"><b class="edu_table_reply_td_b">'
										+ data[key].empName + data[key].positionName + '</b>&nbsp;'
										+ totalTime + '</td></tr><tr><td class="edu_table_reply_tr_content">'
										+ data[key].replyContent + '</td></tr>';
								}
								
								$(".edu_table_reply").append($tr); 
							
							}
							
							
						},
						error: function(error) {
							console.log(error);
						}
					});
				}
			});
		});
		
	</script>






		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>
</html>