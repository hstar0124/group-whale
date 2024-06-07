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
	height:700px;
	overflow:auto;
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
	#titleTab {
		margin-left:15px;
	}
	#titleTab td:nth-child(1) {
		width:130px;
		
	}
	.fileDiv {
		float:right;
		width:200px;
		height:115px;
		border:0.7px solid lightgray;
		border-radius:5px;
		margin:10px;
		text-align:center;
		/* color:#4A566E; */
		color: dimgrey;
		font-size:12px;
		cursor:pointer;
	}
	#repImg {
		width:70px;
		height:70px;
	}
	#titleInput {
		border:1px solid white;
		height:40px;
		font-size:23px;
		margin-left:5px;
	}
	#fontDiv {
		font-size:16px;
		font-weight:bold;
	}
	input::placeholder {
		color: #cecece;
	}
	input:focus {
		outline:none;
	}
	#timeTab {
		margin-top:15px;
	}
	#timeTab td:nth-child(1) {
		width:30px;
	}
	#timeTab td:nth-child(2) {
		width:90px;
	}
	.topDiv {
		float:left;
		width:580px;
		margin-top:30px;
		margin-left:10px;
	}
	#writeBtn {
		background-color:#0871B9;
		width:80px;
		height:30px;
		color: white;
		font-size:15px;
		border-radius:5px;
		border:1px solid #0871B9;
	}
	#cancelBtn {
		background-color:#e7e7e7;
		width:80px;
		height:30px;
		color: black;
		font-size:15px;
		border-radius:5px;
		border:1px solid #e7e7e7;
	}
	.btnDiv {
		text-align:center;
	}
	#titleImg {
		width:200px;
		height:115px;
		border-radius:5px;
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
			<b class="contentTitle" style="font-size:18px;">포토 갤러리</b> <br>
			<br>
			<div class="contentDiv" style="width: 855px; border: 0px;">
				<form action="updatePboard.gp" method="post" id="updateForm" enctype="multipart/form-data">
					<div class="topDiv">
						<input id="titleInput" name="title" type="text" style="width: 570px;"
							placeholder="제목을 입력해주세요." value="${ pboard.title }" autofocus="autofocus"> <br>
						<br>
						<div style="margin-left: 6px;">
							<table id="timeTab">
								<tr>
									<td><img
										src="${ contextPath }/resources/images/goodPlace/wall-clock.png"
										style="width: 18px; height: 18px;"></td>
									<td style="color: #aeaeae; font-size: 15px;">Created</td>
									<td id="enrollTd"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="fileDiv">
						<%-- <div id="onloadBefore">
							<div style="margin-top: 10px; margin-left: 15px;">
								<img id="repImg"
									src="${contextPath }/resources/images/goodPlace/photo.png">
							</div>
							<span>대표 이미지를 첨부해주세요</span>
						</div> --%>
						<div id="onloadAfter">
							<img id="titleImg" src="${ contextPath }/resources/uploadFiles/pictureBoard/${ pboard.changeName }" >
						</div>
					</div>
					<div style="clear: both"></div>
					<hr>
					<div class="textDiv">
						<textarea id="summernote" name="content"></textarea>
					</div>
					<hr>
					<div class="btnDiv">
						<button type="button" id="writeBtn">작성</button>
						&nbsp;
						<button type="button" id="cancelBtn">취소</button>
					</div>
					<input type="hidden" name="empNo" value="${ loginUser.empNo }">
					<input type="hidden" name="enrollDate" id="enrollDate">
					<div id="fileArea">
						<input type="file" id="thumbnailImg" name="thumbnailImg"
							onchange="loadImg(this);">
					</div>
					<input type="hidden" name="pboardNo" value="${ pboard.pboardNo }">
					</form>
					<!-- private String empNo;
	private String title;
	private Timestamp enrollDate;
	private String content; -->
			</div>
		</div>
		
		<!-- 본문 영역 끝 -->
	</div>
	<script>
		function loadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {

					$("#onloadBefore").hide();
					$("#titleImg").attr("src", e.target.result);
					$("#onloadAfter").show();

				}

				reader.readAsDataURL(value.files[0]);
			}
		}
		function getTimeStamp_view() {
			var d = new Date();
			var s = leadingZeros(d.getMonth() + 1, 2) + '월 '
					+ leadingZeros(d.getDate(), 2) + ', '
					+ leadingZeros(d.getFullYear(), 4) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2);

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
		var time = getTimeStamp_view();
		$("#enrollTd").html(time);
		
		
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
	
	   
		$(document).ready(function() {

			$("#fileArea").hide();
			//$("#onloadAfter").hide();
			
			var content = `${ pboard.content }`;
			$('#summernote').summernote('code', content);
			$('#summernote').summernote({
				code : content,
				height : 400, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : false, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '' //placeholder 설정
			});

			$('.fileDiv').click(function() {
				$("#thumbnailImg").click();
			});
			
			$("#writeBtn").click(function(){
				var enrollTime = getTimeStamp();
				$("#enrollDate").val(enrollTime);
				
				var imgValue = $("#thumbnailImg").val();
				var titleValue = $("#titleInput").val();
				
				if(titleValue == "") {
					swal("", "제목을 작성해주세요.", "info");
				} else {
					$("#updateForm").submit();
				}
			});
			
			$("#cancelBtn").click(function(){
				location.href="${contextPath}/goPlace.gp";
			});
		});
	</script>
</body>
</html>