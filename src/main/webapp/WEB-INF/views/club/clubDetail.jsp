<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.contentDiv { min-height:710px; }
	.clubName-wrap { height:30px; margin-top:20px; }
	#clubName { font-size:16px; margin-left:65px; }
	.write-wrap { width:100%; height:160px; padding:15px; margin-top:-40px; }
	.write-form { 
		width:90%; 
		height:130px; 
		margin:auto; 
		background:white; 
		border-radius:5px; 
		-moz-box-shadow: 4px 4px 5px #e6e5e5; 
        -webkit-box-shadow: 4px 4px 5px #e6e5e5; 
        box-shadow: 4px 4px 5px #e6e5e5; 
    }
	#writeForm { width:90%; height:80px; overflow-y: auto; border:none; resize:none; margin-left:35px; margin-top:12px; color:gray; }
	#writeForm::placeholder { line-height:40px; }
	.writeForm-footer { width:100%; height:33px; background:#ECF5FB; border-radius:3px; }
	.footer-file { width:210px; height:100%; float:left; }
	#attach { width:18px; height:18px; margin-left:38px; margin-top:8px; }
	.footer-submit { width:100px; height:100%; float:right; }
	#writeSubmitBtn { width:80px; height:100%; background:#0871B9; color:white; border-radius:2px; font-weight:bold; border:1px; font-size:12px; float:right;}
	.content-wrap { margin-top:10px; width:100%; height:500px; min-height:520px; overflow:auto; }
	.content-ul { list-style:none; }
	.content-div { 
		background:white; 
		width:730px; 
		min-height: 250px; 
		height:auto; 
		overflow:auto; 
		border-radius:5px; 
		margin-left:16px; 
		margin-bottom:20px; 
		-moz-box-shadow: 4px 4px 5px #e6e5e5; 
        -webkit-box-shadow: 4px 4px 5px #e6e5e5; 
        box-shadow: 4px 4px 5px #e6e5e5; 
    }
	.content-header { width:100%; height:45px; margin-top:10px; }
	.content-middle { width:100%; height:100px; }
	.content-liked { width:100%; height:40px; }
	.content-reply { width:100%; min-height:45px; height:auto; border-top:0.7px solid #ddd; margin-bottom:10px; }
	.content-reply-list { width:100%; min-height:0px; height:auto; background:#ECF5FB; }
	#writer { font-weight:bold; float:left; margin-left:35px; margin-top:12px;}
	#writedTime { float:right; margin-right:35px; margin-top:12px;}
	#content { margin-top:15px; margin-left:35px; font-weight:normal; }
	#likedIcon { width:17px; height:17px; margin-left:38px; margin-top:8px; }
	#likedNum { font-weight:normal; margin-top:7px; margin-left:7px; }
	#liked-wrap { float:left; }
	#likedNum-wrap { float:left; }
	#replyIcon-wrap { float:left; }
	#replyNum-wrap { float:left; }
	#replyIcon { width:17px; height:17px; margin-top:7px; margin-left:20px;}
	#replyNum { font-weight:normal; margin-top:7px; margin-left:7px; }
	#userPhoto { width:27px; height:27px; float:left; margin-top:14px; margin-left:35px;}
	#replyForm { float:left; width:530px; height:25px; overflow-y:auto; border:none; resize:none; margin-left:10px; margin-top:15px; color:gray; }
 	#reply-userPhoto { width:27px; height:27px; float:left; margin-top:14px; margin-left:35px;}
	#replyWriter { font-weight:normal; margin-top:18px; margin-left:12px;}
	#replyWriteTime { font-weight:normal; margin-left:8px; color:gray; font-size:12px; }
	#replyContent { font-weight:normal; font-size:12px; color:rgb(90,90,90); margin-left:74px; margin-top:6px; }
	#replyEditIcon { width: 10px; height: 10px; margin-left:12px; cursor:pointer; margin-bottom:1px;}
	#replyDeleteIcon { width: 9px; height: 9px; margin-left: 7px; cursor:pointer; }
	
	input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder { color:transparent; }
	/* ======= 스크롤바 ======= */
	::-webkit-scrollbar {
		width: 7px;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
	}

	::-webkit-scrollbar-track {
		background: transparent;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
	}

	::-webkit-scrollbar-thumb {
		background: transparent;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<div class="wrap">
	<jsp:include page="../board/boardMenubar.jsp" />

		<div class="content">
			<div class="clubName-wrap">
				<label id="clubName">수족관</label>
			</div>
			<br><br>
			<div class="contentDiv" style="width:860px; border:none; background:none;">
				<div class="write-wrap">
					<div class="write-form">
						<div class="writeForm-wrap">
							<textarea id="writeForm" placeholder="새로운 소식이나 정보를 공유해주세요."></textarea>
						</div>
						<div class="writeForm-footer">
							<div class="footer-file">
								<img id="attach" src="${ contextPath }/resources/images/club/interface.png">
							</div>
							<div class="footer-submit">
								<button id="writeSubmitBtn">글쓰기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="content-wrap">
					<ul class="content-ul">
						<li>
							<div class="content-div">
								<div class="content-header">
									<span id="writer">박다영 대리</span>
									<span id="writedTime">20.05.12 18:00</span>
								</div>
								<div class="content-middle">
									<label id="content">5월 12일 회식 (●´⌓`●)</label>
								</div>
								<div class="content-liked">
									<div id="liked-wrap">
										<img id="likedIcon" src="${ contextPath }/resources/images/club/fullHeart.png">
									</div>
									<div id="likedNum-wrap">
										<label id="likedNum">5</label>
									</div>
									<div id="replyIcon-wrap">
										<img id="replyIcon" src="${ contextPath }/resources/images/club/reply.png">
									</div>
									<div id="replyNum-wrap">
										<label id="replyNum">5</label>
									</div>
								</div>
								<div class="content-reply">
									<div>
										<img id="userPhoto" src="${ contextPath }/resources/images/club/account.png">	
										<textarea id="replyForm" placeholder="댓글을 작성해주세요."></textarea>	
									</div>
								</div>
								<div class="content-reply-list">
									<img id="userPhoto" src="${ contextPath }/resources/images/club/account.png">
									<label id="replyWriter">박다영 대리</label>
									<label id="replyWriteTime">20.05.10 11:05</label>
									<br>
									<label id="replyContent">댓글 작성 내용</label>
									<img id="replyEditIcon" src="${ contextPath }/resources/images/club/edit.png">
									<img id="replyDeleteIcon" src="${ contextPath }/resources/images/club/close.png">
									<br>
									<label></label>
								</div>
							</div>
						</li>
						<li>
							<div class="content-div">
								<div class="content-header">
									<span id="writer">박다영 대리</span>
									<span id="writedTime">20.05.12 18:00</span>
								</div>
								<div class="content-middle">
									<label id="content">5월 12일 회식</label>
								</div>
								<div class="content-liked">
									<div id="liked-wrap">
										<img id="likedIcon" src="${ contextPath }/resources/images/club/fullHeart.png">
									</div>
									<div id="likedNum-wrap">
										<label id="likedNum">5</label>
									</div>
									<div id="replyIcon-wrap">
										<img id="replyIcon" src="${ contextPath }/resources/images/club/reply.png">
									</div>
									<div id="replyNum-wrap">
										<label id="replyNum">5</label>
									</div>
								</div>
								<div class="content-reply">
									<div>
										<img id="reply-userPhoto" src="${ contextPath }/resources/images/club/account.png">	
										<textarea id="replyForm" placeholder="댓글을 작성해주세요."></textarea>	
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div><!-- content div end-->
	</div><!-- wrap div end -->
</body>
</html>