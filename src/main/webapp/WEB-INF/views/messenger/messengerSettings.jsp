<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>	
	/* 내용영역 */ 
	.content_ms { height: 530px;}
	.settings_title { height: 50px; text-align: left; padding: 10px; font-size: 20px; display: inline-block; }
	.settings_table { width: 100% }
	.settings_table_td1 { width: 50%; text-align: left; }
	.settings_table_td2 { width: 50%; text-align: right; padding-right: 0px;}
	.settings_div { height: 120px; margin-bottom: 5px;}
	.settings_div:hover{ cursor: pointer; }
	.settings_color1 { background: #0a9dff; }
	.settings_color2 { background: #2b5e80; }
	.settings_color3 { background: #ffa524; }
	.settgins_btn_div { text-align: center; }
	.settings_choice { display: inline-block;}
	.choice_color {width: 30px; vertical-align: middle; }
	.settings_btn { width: 80px; height: 30px; font-size: 17px; margin-top: 10px; color: white; background: #0871b9; border-radius: 7px; border: 0; }
</style>
</head>
<body>
	<div class="messengerWrap">
		<jsp:include page="messengerMenubar.jsp" />
		
		<!-- 내용 영역 -->
		<div class="content_ms">
			<table class="settings_table">
				<tr>
					<td class="settings_table_td1">
						<div class="settings_title">테마 변경</div>
					</td>
					<td class="settings_table_td2">
						<div class="btn settings_choice">
							<label class="btn" for="choice_color" style="font-weight: normal; padding-right: 0">사용자 지정</label>&nbsp;
							<input id="choice_color" class="choice_color" type="color">
						</div>
					</td>
				</tr>
			</table>
			<div class="settings_div settings_color1" value="#0a9dff" ></div>
			<div class="settings_div settings_color2" value="#2b5e80"></div>
			<div class="settings_div settings_color3" value="#ffa524"></div>
			<div class="settgins_btn_div">
				<button class="settings_btn" onclick="setting();">적용</button>
			</div>
		</div>
	</div>
	
<script>
	var color = "";
	$(document).ready(function(){ 
	    $('body').click(function(e){
	        color = e.target.getAttribute('value');
	        if ( ( value != '') && (value != null))  
	        alert(color);
	    });
	});

	document.getElementById('choice_color').onchange = function(){
	  color = this.value;
	}
	
	function setting() {
		//alert(color);
		var empNo = "${sessionScope.loginUser.empNo}";
		
		$.ajax({
			type:"POST",
			url :'settingThema.ms',
			data: {
				color: color,
				empNo: empNo
			},
			success:function(data){
				swal("Success", '선택된 테마 색상은 ' + data + '입니다.', "success");
				// "warning", "error", "success" and "info"
				
				//alert('선택된 테마 색상은 ' + data + '입니다.');
				return;
			}
		});
	}
</script>
	
	
	
</body>
</html>