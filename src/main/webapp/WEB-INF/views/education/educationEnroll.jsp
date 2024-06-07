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
	.content {mign-height: 850px;}
	.contentDiv {overflow:auto; }
	.contentDiv::-webkit-scrollbar { display: inline; }
	.boardMain {width: 100%; height: 300px;}
	.edu_table1 {width: 100%; border-spacing: 15px; border-collapse: separate;}
	.education_title {font-size: 20px; font-weight:bold; }
	.edu_div_title {border-bottom: 1px solid #f7f7f7; padding-bottom: 20px; margin-bottom: 5px;}
	.input_title{width: 100%; font-size: 28px; border: 0 solid black; outline: none; }
	#input_file {display: none;} 
	.edu_btn {margin-left: 5px; width: 60px; padding: 5px; border: 1px solid #cdcdcd; border-radius: 5px; text-align: center; float: right;}
	.edu_btn:hover {cursor: pointer; }
	.edu_photo_img {width: 20px; } 
	.attachment_div {width: 200px; border-radius: 5px; background: #f7f7f7; padding: 5px; }
	.attachment_div:hover {cursor: pointer; }
	.edu_photo_div{width: 160px; float: right; -top: 5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.submit_btn{background: #0871b9; color: white;}
	.submit_btn:hover{background: #4391c6;}
</style>
<script>
</script>
</head>
<script>
//------------에디터 툴-------------
	$(document).ready(function() {
	   //여기 아래 부분
	   $('#summernote').summernote({
	        height: 370,                            // 에디터 높이
	        width: 811,
	        minHeight: null,                        // 최소 높이
	        maxHeight: null,                        // 최대 높이
	        focus: false,                           // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",                          // 한글 설정
	        placeholder: '최대 2048자까지 쓸 수 있습니다.'   //placeholder 설정
	          
	   });
	});
//------------에디터 툴-------------

</script>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->

	<jsp:include page="../board/boardMenubar.jsp" />
	<!-- board 메뉴바 include -->
	
		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<div class="contentDiv" style="width: 865px; height: 755px;  border: 0px solid #CDCDCD;">
				<!-- 게시글 작성영역 시작 -->
				<form class="enroll_form" action="enrollEdu.ed" method="post" enctype="multipart/form-data">
					<table class="edu_table1">
						<tr>
							<td><p class="education_title">글쓰기</p></td>
						</tr>
						<tr>
							<td>
								<div class="edu_div_title">
									<input type="text" name="eduTitle" class="input_title" placeholder="제목을 입력하세요">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="file" id="input_file" name="photo">
								<div class="attachment_div">
									<img class="edu_photo_img" src="${ contextPath }/resources/images/education/photo3.png">&nbsp;
									<div class="edu_photo_div">대표 이미지</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<!-- 썸머노트 텍스트 에디터 -->
								<textarea id="summernote" name="eduContent" style="overflow-x:hidden; overflow-y:auto;"></textarea>
								<input type="text" class="empNo" name="empNo" value="${sessionScope.loginUser.empNo}" hidden>
							</td>
						</tr>
						<tr>
							<td>
								<div class="edu_btn save_btn" style="float: left; width: 70px; background:#FFC462; color:white; border: 0px solid white;">임시저장</div>
								<div class="edu_btn reset_btn" onclick="back();">취소</div>
								<div class="edu_btn submit_btn" style="">완료</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- 본문 영역 끝 -->


	<script>
		$(function(){
			$(".input_title").focus();
			
			// 파일첨부
			$(".attachment_div").click(function(){
				$("#input_file").click();
				
				$("#input_file").change(function(){
					var file = this.files[0]; 
					var fileName = file.name;
					var fileNameDiv = $(".edu_photo_div").html(fileName);
				});
			});
			
			// 작성완료 버튼
			$(".submit_btn").click(function(){
				$(".enroll_form").submit();
			});
			
		});
		// 취소
		function back() {
			window.history.back();
		}
		
	</script>


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>
</html>