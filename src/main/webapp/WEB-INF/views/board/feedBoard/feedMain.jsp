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

<style>	
	.contentTitle {
	}
	
	.contentDiv {
		min-height:680px;	
	}
	
	#feedInsertWrap{
		width: 100%;
		padding: 10px;
		border: 0.5px solid #c9c9c9;
		border-radius:3px;
  		box-shadow:1px 1px 2px 2px #999;
	}
	
	.feedTA{
		 width:650px;
		 min-height:100px;
		 overflow-y:hidden;
		 border-radius: 5px;
		 background: #eeeeee;
		 resize: none; /* 사용자 임의 변경 불가 */
	}
	
	.edit_article_ta{
		margin-top:10px;
		 width:550px;
		 min-height:30px;
		 overflow-y:hidden;
		 border-radius: 5px;
		 background: white;
		 border: 0;
		 resize: none; /* 사용자 임의 변경 불가 */
	}
	
	.reply_edit_ta{
		width: 280px;
		height: 20px;
		margin-top: 12px;
		overflow-y:hidden;
		border-radius: 5px;
		background: white;
		border: 0;
		resize: none; /* 사용자 임의 변경 불가 */
		float:left;
	}
	
	#attImgDiv{
		width: 100px;
		height: 100px;
		line-height: 100px;
		float:right;
		text-align: center;		
	}
	
	#attImg{
		width: 35px;
		height: 35px;
		margin: 0 auto;
	}
	
	#writeBtn{
		width: 100px;
		height: 30px;
		background: #337ab7;
		color: white;
		border: 0;
		border-radius: 5px;		
	}
	
	.feed_contents_wrap{
		margin-top: 10px;
		width: 100%;
		height: 500px; 
		min-height: 520px;
		background: white;	
		overflow: auto;
		
	}

	.feed_contents_wrap::-webkit-scrollbar {
    	display: none; /* Chrome, Safari, Opera*/
	}
	
	.feed_contents_ul{
		list-style:none;
		padding: 0;
	}
	
	.attachment_ul{
		list-style:none;
		padding: 0;
	}
	
	.reply{
		list-style:none;
		padding: 0;
	}
	
	span{
		display: block;
	}
	
	.data_null{
		text-align: center;
		margin-top: 50px;
	}
	
	.no_contents{		
		width: 100%;
		height: 200px;
	}
	
	.txt{
		font-size: 25px;
		font-weight: 800;
	}
	
	.article{
		margin-top: 10px;
	}
	
	.article_wrap{
		border-top: 0.5px solid #d9d9d9;
		width: 100%;
		min-height: 320px;
		height: auto;
		overflow: auto;
	}
	
	.photo{
		width: 75px;
		height: 75px;
		background: blue;
	}
	
	.info{
		width: 600px;
		min-height: 100px;
		margin: 0 auto;
		margin-top: 10px;
	}
	
	.heartBtn{
		width: 35px;
		height: 35px;
		margin-top: 10px;
	}
	
	.article_table{
		width: 100%;		
	}
	
	.reply_header{
		width: 600px;
		min-height: 20px;
		margin: 0 auto;
		margin-top: 10px;
	}
	
	.attachment_header{
		width: 600px;
		min-height: 20px;
		margin: 0 auto;
		margin-top: 10px;
	}
	
	.reply_wrap{
		width: 600px;
		min-height: 80px;
		height:auto;
		overflow: auto;
		border: 0.5px solid #d9d9d9;
		margin: 0 auto;
		margin-top: 20px;
		margin-bottom: 10px;
	}
	
	li{
		margin-top: 10px;
	}
	
	.reply_header_icon{
		width: 20px;
		height: 20px;
		float: left;
	}
	
	.reply_span{
		height: 25px;
		float: left;
	}
	
	.reply_create{
		margin-top: 5px;
		padding: 10px;
		width: 100%;
		min-height: 70px;
		height: auto;
		overflow: auto;
	}
	
	.writer_photo{
		width: 70px;
		height: 70px;
		line-height: 70px;
		text-align: center;
	}
	
	.writer_profile{
		width: 50px;
		height: 50px;
		border-radius: 100%;
	}
	
	.reply{
		width: 100%;		
	}
	
	.reply_photo{
		width: 50px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		float:left;
	}
	
	.reply_profile{
		width: 40px;
		height: 40px;
		border-radius: 100%;
	}
	
	.msg_wrap{
		width: 100%;
		min-height: 50px;		
		float: right;
	}
	
	.msg_insert_wrap{
		width: 90%;
		min-height: 30px;		
		float: right;
	}
	
	.replyTa{
		width: 400px;
		min-height:30px;
		vertical-align: middle;
		overflow-y:hidden;
		border-radius: 5px;
		background: #eeeeee;
		resize: none; /* 사용자 임의 변경 불가 */
	}
	
	.reply_button{
		margin-left: 10px;
		margin-top: 10px;
		width: 80px;
		height: 30px;
		background: white;
		border: 0.5px solid #ddd;
		font-weight: 800;
	}
	
	.heartInfo{
		width: 70px;
		height: 80px;
		text-align: center;	
		border-radius: 5px;	
		border: 1px solid #ddd;		
		margin-top:50px;
	}
	
	
	.heartCount{
		width: 100%;
		height: 20px;
		margin-top: 10px;
		text-align: center;
	}
	
	.article_writer{
		height: 20px;
		font-size: 12px;
		font-weight: 800;
	}
	
	.articel_date{
		height: 15px;
		font-size: 12px;
		font-weight: 800;
		color: #a9a9a9;
	}
	
	#pictureDisplay{
		height: 100px;
		margin: 10px;
	}
	
	.reply_body_content{
		padding: 10px;
		margin: 0;
		width: 100%;
		min-height: 30px;
	}
	
	.modify_icon_wrap{
		float:right;
		width: 80px;
		margin-top: 10px;
		margin-left: 10px;
	}
	
	.modify_comRoll_wrap{
		float:right;
		width: 100px;
		margin-top: 10px;
	}
	
	.modify_icon{
		width: 20px;
		height: 20px;
		float: left;
		margin-right: 10px;
		vertical-align: top;
		cursor: pointer;
	}
	
	.reply_content{
		width: 380px;
		min-height: 50px;		
		padding-top: 15px;
		padding-bottom: 15px;
		float:left;
	}
	.reply_writer{
		width: 50px;
		min-height: 50px;		
		padding-top: 15px;
		padding-bottom: 15px;
		float:left;
	}
	
	.attachment_li_image{
		height: 150px;
	}
	
	.article_modify_icon{
		width: 100%;
		margin-top : 10px;
		margin-bottom : 10px;
	}
	
	.modify_commit{
		margin-bottom: 10px;
	}
	
	.modify_commit_icon{
		width: 35px;
		height: 35px;
		float: right;
		margin-right: 45px;
		margin-top: 10px;
		visibility: hidden;
	}
	
	
	textarea:focus {
	  outline: none;
	}
	
	.reply_date{
		width: 75px;
		float: left;	
		font-weight: 800;
		font-size: 12px;
		color: #a9a9a9;
		margin-top: 13px;
		margin-right: 5px;
	}
	
</style>

</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->

	<jsp:include page="../boardMenubar.jsp" />
	<!-- board 메뉴바 include -->
 
		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">커뮤니티</b>
			<br><br>
			<div class="contentDiv" style=" width:800px !important; border: 0; border-radius: 10px;">
				
				<div id="feedInsertWrap">
					
					<form action="insert.fd" method="post" id=feedInsertForm enctype="multipart/form-data">
					
						<textarea class="feedTA" name="feedContent" placeholder="새로운 정보, 기분 좋은 소식을 공유하세요."></textarea>
						
						<input type="hidden" name="empNo" value="${ sessionScope.loginUser.empNo }">
						
						<div id="attImgDiv">
							<img id="attImg" alt="" src="${ contextPath }/resources/images/feed/attach.png">
							<input type="file" name="picture" id="picture" style="display:none;" onchange="LoadImg(this);">
							
						</div>
						
						
						<div class="imgWrap">
							<img id="pictureDisplay" alt="" src="">
						</div>
						
						<button type="button" id="writeBtn">이야기 쓰기</button>
						
					</form>
					
				</div>
				
				
				<div class="feed_contents_wrap">
					<ul class="feed_contents_ul">						
						
						<c:if test="${ empty list }">
							<li>
								<p class="data_null">
									<span class="no_contents">
										<img alt="" src="${ contextPath }/resources/images/feed/writing.png"
												style="width: 200px; height: 200px;">
									</span>
									<br>
									<span class="txt">아직 등록된 글이 없습니다. 글을 등록해 주세요.</span>
								</p>
							</li>
						</c:if>
						
						<c:if test="${ !empty list }">
						
						<c:forEach var="m" items="${ list }">
							<li>						
								<div class='article_wrap'>
									<table class='article_table'>
										<tr>
											<td rowspan='4' valign='top' style='padding-top: 10px;'>
												<span class='writer_photo'>
													<img class='writer_profile' alt='' src='${ contextPath }/resources/uploadFiles/${ m.photo }'>
												</span>
											</td>
											<td>
												<div class='info'>
													<div class='article_writer'>${ m.empName } ${ m.positioName }</div>
													<div class='articel_date'>${ m.feedEnrollDate }</div>
													<%-- <p class='article'>
														<c:out value="${ m.feedContent }" />														
													</p> --%>
													<form class="feed_edit_form" action="feedEdit.fd" method="post">
														<input type="hidden" name="fboardNo" value="${ m.fboardNo }">
														<textarea class="edit_article_ta" name="feedContent" readonly>${ m.feedContent }</textarea>
														<%-- <img class="modify_commit_icon" alt="수정완료" src="${ contextPath }/resources/images/feed/check.png"> --%>
														
													</form>
												</div>										
											</td>
											<td rowspan="4" style="vertical-align: top;"> 
												<div class="article_modify_icon modify_feed_end">
												<c:if test="${ m.empNo eq sessionScope.loginUser.empNo }">
													<img class="modify_icon modify_feed" alt="수정" src="${ contextPath }/resources/images/feed/edit.png">
													<img class="modify_icon" onclick="feedDelete('${ m.fboardNo }');" alt="삭제" src="${ contextPath }/resources/images/feed/bin.png">
												</c:if>
												</div>
												<div class="article_modify_icon modify_feed_ing" style="display: none;">
													<img class="modify_icon modify_feed_complete" alt="수정완료" src="${ contextPath }/resources/images/feed/check.png">
													<img class="modify_icon modify_feed_finish" alt="수정취소" src="${ contextPath }/resources/images/feed/cancel.png">
												</div>
												
												<div class='heartInfo'>
													<img class='heartBtn' alt='off' feedBoardNo="${ m.fboardNo }" src='${ contextPath }/resources/images/feed/heart_off.png'>												
													<span id='heartCount${ m.fboardNo }' class='heartCount' feedBoardNo="${ m.fboardNo }">${ m.feedCount }</span>
												</div>												
											</td>
										</tr>
										<tr>
											<td>
												<div class='attachment_header'>
													<ul class="attachment_ul">
														<c:forEach var="a" items="${ m.feedAttachmentList }">
															<li class="attachment_li">
																<img class="attachment_li_image" alt="" src="${ contextPath }/resources/uploadFiles/${ a.changeName }">
															</li>
														</c:forEach>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class='reply_header'>
													<span class='reply_span'>
														<img class='reply_header_icon' alt='' src='${ contextPath }/resources/images/feed/comment.png'>
														&nbsp; 댓글 수 : <label>${ m.feedReplyList.size() }</label> 개 &nbsp; &nbsp; 
													</span>
													<span class='reply_span'>
														<img class='reply_header_icon' alt='' src='${ contextPath }/resources/images/feed/heart.png'>
														&nbsp; 좋아요 : <label id='heartCountLabel${ m.fboardNo }' feedBoardNo="${ m.fboardNo }">${ m.feedCount }</label> 명
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class='reply_wrap'>
													<ul class='reply'>
													<c:forEach var="r" items="${ m.feedReplyList }">
														<li class="reply_li">
															<div class="reply_body_content">
																<div class="msg_wrap">
																	<span class='reply_photo'>
																		<img class='reply_profile' alt='' src='${ contextPath }/resources/uploadFiles/${ r.replyEmpPhoto }'>
																	</span>
																	<span class="reply_writer">${ r.replyEmpName }</span>
																	<%-- <span class="reply_content">
																		${ r.replyContent }
																	</span> --%>
																	
																	<form action="replyEdit.fd" method="post">
																		<input type="hidden" name="feedReplyNo" value="${ r.feedReplyNo }">
																		<textarea class="reply_edit_ta" name="replyContent" readonly>${ r.replyContent }</textarea>
																		<div class="modify_icon_wrap preModify">
																			<c:if test="${ r.replyEmpNo eq sessionScope.loginUser.empNo }">
																				<img class="modify_icon modify_reply" alt="수정" src="${ contextPath }/resources/images/feed/edit.png">
																				<img class="modify_icon" onclick="replyDelete('${ r.feedReplyNo }');" alt="삭제" src="${ contextPath }/resources/images/feed/bin.png">
																			</c:if>
																		</div>																	
																		<div class="modify_icon_wrap ingModify" style="display: none;">
																			<img class="modify_icon modify_reply_commit_icon" alt="수정완료" src="${ contextPath }/resources/images/feed/check.png">
																			<img class="modify_icon modify_reply_rollback_icon" alt="수정취소" src="${ contextPath }/resources/images/feed/cancel.png">
																		</div>
																		<div class="reply_date">${ r.replyModifyDate }</div>															
																	</form>
																	
																</div>
															</div>
														</li>
														</c:forEach>
														
													</ul>
													<div class='reply_create'>
													
													<form action="insertReply.fd" id="reply_insert_form" method="post">
														<input type="hidden" name="replyFboard" value="${ m.fboardNo }">
														<input type="hidden" name="replyEmpNo" value="${ sessionScope.loginUser.empNo }">																	
														<span class='reply_photo'>
															<img class='reply_profile' alt='' src='${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }'>
															
														</span>
														
														<div class='msg_insert_wrap'>
															<textarea class='replyTa' name="replyContent"></textarea>								
															
															<button type="button" class='reply_button'>댓글 작성</button>
														</div>
														
													</form>
													
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>							
							</li>							
						</c:forEach>
											
						</c:if>
						
						
					</ul>
					
				
				</div>
				
				
								
			
			</div>
			
		</div>
		<!-- 본문 영역 끝 -->


	</div>
	
	<script>
	$(function(){
		$('#attImg').hover(function() {
			$(this).attr("src", "${ contextPath }/resources/images/feed/attach_h.png")
		}, function(){
			$(this).attr("src", "${ contextPath }/resources/images/feed/attach.png")
		});
		
		$("#attImg").click(function (){
			$("#picture").click();
		});
		
		$("#writeBtn").click(function(){
			
			var str = $(".feedTA").html();
			str = str.replace("\n", "|");
			$(".feedTA").html(str);
			
			$("#feedInsertForm").submit();
		});
		
		$(".reply_button").click(function(){
			$(this).parent().parent().submit();
		});		
		
		
		$(".modify_feed").click(function(){
			var $feedTa = $(this).parent().parent().parent().find(".edit_article_ta");
			$feedTa.css("border", "1px solid gray");
			$feedTa.removeAttr("readonly");
					
			$feedTa.focus();			
			var str = $feedTa.val();
			$feedTa.val(str+" ");
			
			$(this).parent().parent().find('.modify_feed_end').hide();
			$(this).parent().parent().find('.modify_feed_ing').show();
		});
		
		$('.modify_feed_finish').click(function() {
			$(this).parent().parent().parent().find('.edit_article_ta').css("border", "0");
			$(this).parent().parent().parent().find('.edit_article_ta').attr("readonly","true");
			$(this).parent().parent().find('.modify_feed_end').show();
			$(this).parent().parent().find('.modify_feed_ing').hide();	
		});
		
		$(".modify_reply").click(function(){
			var $replyTa = $(this).parent().parent().find(".reply_edit_ta");
			$replyTa.css("border", "1px solid gray");
			$replyTa.removeAttr("readonly");			
			$replyTa.focus();
			
			var str = $replyTa.val();
			//console.log(str);
			$replyTa.val(str+" ");
			
			$(this).parent().parent().find('.preModify').hide();
			$(this).parent().parent().find('.ingModify').show();	
		});
		
		
		
		$('.modify_reply_rollback_icon').click(function() {
			$(this).parent().parent().find('.reply_edit_ta').css("border", "0");
			$(this).parent().parent().find('.reply_edit_ta').attr("readonly","true");
			$(this).parent().parent().find('.preModify').show();
			$(this).parent().parent().find('.ingModify').hide();		
		});
		
		
		$(".modify_feed_complete").click(function(){
			$(this).parent().parent().parent().find('.feed_edit_form').submit();
		});
		
		$(".modify_reply_commit_icon").click(function(){
			$(this).parent().parent().submit();
		});
		
	});	
	
	function feedDelete(fid){
		swal({
			  title: "삭제 알림",
			  text: "삭제되면 복구가 불가능합니다. 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("삭제되었습니다.", {
			      icon: "success",
			    });
			    location.href='deleteFeed.fd?' + fid;
			  } else {
			    swal("취소 되었습니다.");
			  }
		});		
		
	}
	
	function replyDelete(rid){
		swal({
			  title: "삭제 알림",
			  text: "삭제되면 복구가 불가능합니다. 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("삭제되었습니다.", {
			      icon: "success",
			    });
			    location.href='deleteReply.fd?' + rid;
			  } else {
			    swal("취소 되었습니다.");
			  }
		});	
		
	}
	
	function LoadImg(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#pictureDisplay").attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	</script>
	
	<script>
	/* textarea 크기 자동 조절 */
	$(document).ready(function() {
		$('textarea').on( 'keyup', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight );
		});
		$('textarea').keyup();
	});
  
	    
	    $(function(){
	    	
	    	$.ajax({
 				type:"POST",
 				url :'heartCheck.fd',
 				async: false,
 				success:function(data){ 	
 					//console.log(data);
 					for(var key in data){
 						if(data[key].heartEmpNo == "${ sessionScope.loginUser.empNo }"){
 							//console.log(data[key].feedBoardNo); 							
 							//console.log($(".heartBtn").attr("feedBoardNo"));
 							$(".heartBtn").each(function(){
 								if($(this).attr("feedBoardNo") == data[key].feedBoardNo){
 									$(this).attr("alt", "on");
 	 								$(this).attr("src", "${ contextPath }/resources/images/feed/heart_on.png");
 								} 	 							
 							});
 						}
 					}
 				}
			});
			
	    	$(".heartBtn").click(function(){    		
				  if($(this).attr("alt") == 'off'){					  
					  var heartInsertCheck = 0;
					  $.ajax({
			 				type:"POST",
			 				url :'heartInsert.fd',
			 				async: false,
			 				data: {
			 					feedBoardNo : $(this).attr("feedBoardNo"),
			 					heartEmpNo : "${ sessionScope.loginUser.empNo }"
			 				},
			 				success:function(data){ 	
			 					if(data > 0){
				 					heartInsertCheck = 1;				 					
			 					}
			 				}
						});
					  if(heartInsertCheck == 1){						  
							$(this).attr("alt", "on");
							$(this).attr("src", "${ contextPath }/resources/images/feed/heart_on.png");
							
							var count = $("#heartCount" + $(this).attr("feedBoardNo")).text();
							count = count*1;
							count += 1;
							$("#heartCount" + $(this).attr("feedBoardNo")).text('');
							$("#heartCount" + $(this).attr("feedBoardNo")).text(count);
							
							$("#heartCountLabel" + $(this).attr("feedBoardNo")).text('');
							$("#heartCountLabel" + $(this).attr("feedBoardNo")).text(count);				 	 								
 						}	  					  
				  }else {	
					  var deleteCheck = 0;
					  $.ajax({
			 				type:"POST",
			 				url :'heartDelete.fd',
			 				async: false,
			 				data: {
			 					feedBoardNo : $(this).attr("feedBoardNo"),
			 					heartEmpNo : "${ sessionScope.loginUser.empNo }"
			 				},
			 				success:function(data){ 	
			 					if(data > 0){
			 						/* $(this).attr("alt", "off");
			 						$(this).attr("src", "${ contextPath }/resources/images/feed/heart_off.png"); */
			 						deleteCheck = 1;
			 					}
			 				}
					   });
					  if(deleteCheck == 1){
					  	$(this).attr("alt", "off");
					  	$(this).attr("src", "${ contextPath }/resources/images/feed/heart_off.png");  
					  	console.log($(this).attr("feedBoardNo"));
					  	var count = $("#heartCount" + $(this).attr("feedBoardNo")).text();
						count = count*1;
						count -= 1;
						$("#heartCount" + $(this).attr("feedBoardNo")).text('');
						$("#heartCount" + $(this).attr("feedBoardNo")).text(count);
						
						$("#heartCountLabel" + $(this).attr("feedBoardNo")).text('');
						$("#heartCountLabel" + $(this).attr("feedBoardNo")).text(count);			 			 	 								
							
					  }
						
				  }
	    	});
	    	
	    	//console.log($(".reply_date").text().substr(0,10));
	    	$(".reply_date").each(function(){
	    		$(this).text($(this).text().substr(0,10));
	    	})
		});
	</script>
	
	
</body>
</html>