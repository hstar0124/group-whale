<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.contentDiv {
		height:550px;
		overflow:auto;
	}
	.textDiv {
		margin-top:10px;
	}
	#btnsDiv {
		text-align:center;
	}
	#formTab {
		border-collapse:separate;
		border-spacing:8px;
	}
	#formTab td:nth-child(1) {
		width:120px;
		font-size:14px;
		font-weight:bold;
	}
	#formTab td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(5) {
		width:80px;
	}
	input[type='radio'] {
		width:14px;
		height:14px;
	}
	#chkBtn {
		border-radius:5px;
		background-color:#0871B9;
		color:white;
		border: 1px solid #0871B9;
		width:80px;
	}
	
	#cancelBtn {
		border-radius:5px;
		background-color:#ECEFF1;
		border:1px solid #ECEFF1;
		width:80px;
	}
	label {
		font-size:13px;
	}
</style>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />

	<jsp:include page="settingsMenu.jsp" />




		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle" style="font-size:17px;">문서양식 추가</b>
			<br><br>
			<div class="contentDiv" style="border:0px";>
			<form action="insertDocumentForm.st" id="insertDocForm" method="post">
				<table id="formTab">
					<tr>
						<td>보존연한</td>
						<td><input type="radio" name="formTerm" id="1year" value="1">&nbsp;<label for="1year" style="font-weight:normal;">1년</label></td>
						<td><input type="radio" name="formTerm" id="3year" value="3">&nbsp;<label for="3year"style="font-weight:normal;">3년</label></td>
						<td><input type="radio" name="formTerm" id="5year" value="5">&nbsp;<label for="5year"style="font-weight:normal;">5년</label></td>
						<td><input type="radio" name="formTerm" id="10year" value="10">&nbsp;<label for="10year"style="font-weight:normal;">10년</label></td>
					</tr>
					<tr>
						<td>전결</td>
						<td><input type="radio" name="formDelegate" id="accept" value="1">&nbsp;<label for="accept" style="font-weight:normal;">허용</label></td>
						<td><input type="radio" name="formDelegate" id="notAccept" value="0">&nbsp;<label for="notAccept" style="font-weight:normal;">비허용</label></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>사용여부</td>
						<td><input type="radio" name="formUse" id="use" value="1">&nbsp;<label for="use" style="font-weight:normal;">사용</label></td>
						<td><input type="radio" name="formUse" id="notUse" value="0">&nbsp;<label for="notUse" style="font-weight:normal;">미사용</label></td>
						<td colspan="2"></td>
					</tr>
				</table>
				<input type="hidden" name="cboxNo" value="${ cboxNo }">
				<hr>
				<div style="margin-left:10px;">
					<label>제목 :</label>&nbsp;&nbsp;&nbsp;<input type="text" name="formName" id="formName" style="width:700px;">
					<div class="textDiv">
						<textarea id="summernote" name="formContent"></textarea>
					</div>
				</div>
			</form>
				<div id="btnsDiv">
					<button type="button" id="chkBtn">확인</button> &nbsp;
					<button type="button" id="cancelBtn">취소</button>
				</div>
			</div>
			
		</div>
		<!-- 본문 영역 끝 -->

		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
	<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			width : 750,
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '' //placeholder 설정
		});
		
		$("#chkBtn").click(function(){
			swal({
				title: "",
				text: "양식을 등록하시겠습니까?",
				icon: "info",
				buttons:["취소", "확인"]
			}).then((value) => {
				if(value == true) {
					$("#insertDocForm").submit();
				}
			});
			
		});
		
		$("#cancelBtn").click(function(){
			swal({
				  title: "정말로 취소하시겠습니까?",
				  text: "취소한 양식은 되돌릴 수 없습니다.",
				  icon: "warning",
				  buttons: ["취소", "확인"],
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("취소되었습니다.", {
				      icon: "success",
				      buttons: "확인",
				    })
				    .then((value) => {
				    	if(value == true) {
				    		location.href="${contextPath}/docFormat.st";
				    	}
				    });
				    
				  } 
			});
		});	
		
	});
	</script>
</body>
</html>