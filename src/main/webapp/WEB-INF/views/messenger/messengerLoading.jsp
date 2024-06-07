<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 일정 시간 뒤에 자동으로 넘김 -->
<meta http-equiv="refresh" content="2; url=${ contextPath }/chattingList.ms">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>	
	.messengerWrap { width: 380px; height: 650px; text-align: center;}
	.settings_color { background: #0871b9; }
	.settings_font { font-family: 'Yeon Sung', cursive; }
	.loadingImg { width: 240px; height: 240px; margin-top: 82px; display: inline-block; }
	.copywriter { font-size: 24px; color: white; margin-top: 15px; display: inline-block; }
	.messagenerTitle { font-size: 55px; color: white; margin-top: 0px; font-weight: bold; display: inline-block; }
	.copyright { font-size: 20px; color: white; margin-top: 130px; }
	.btn:hover { cursor: pointer; }
</style>
<script>

// 저장된 테마 색상 가져오기
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
			color = data.substring(1, 8);
			
			//$(".settings_color").css("background", "#ffa524");
			$(".settings_color").css("background", color);
			
		}, 
		error:function(data) {
			$(".settings_color").css("background", '#0871b9');
		}
	});
});

</script>
</head>
<body>
	<div class="messengerWrap settings_color">
		<img onclick="showChattingList();" class="loadingImg btn" src="${ contextPath }/resources/images/messenger/logo_circle.png"> 
		<p class="copywriter settings_font">반복되는 업무에 가치를 더하다</p>
		<p class="messagenerTitle settings_font">Whale Talk</p>
		<br>
		<p class="copyright settings_font">ⓒ UPCYCLE</p>
	
	</div>
</body>
</html>