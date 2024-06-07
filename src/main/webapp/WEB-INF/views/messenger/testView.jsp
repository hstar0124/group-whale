<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>	
	/* 본문 영역 */
	#nav1 {margin-right: 20px;}
	.content { width: 100%; height: 100%; background: #f7f7f7; padding-top: 20px; }
	#contentDiv {width: 1060px; }
	
	
	
	
	.btn2:hover{ cursor: pointer;}

</style>
<script>
	
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	
		<!-- 본문 영역 시작 -->
		<div class="content">
			<b class="contentTitle">환율 정보</b>
			<br><br>
			<div id="contentDiv" class="contentDiv">
			
			</div>
			
		</div>
		<!-- 본문 영역 끝 -->
		


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->
	</div>
		

	
	<script>
	$(function(){
		console.log("${ loginUser }");	
	});
	</script>
	
</body>
</html>