<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>	
	#changePwdPage{
		width: 800px;
		height: 450px;
	}
	.nav2{
		height: 620px !important;
	}
	.nav1{
		height: 620px !important;
	}
	
	#inputPwd{		
		width: 400px;
		height: 400px;
		margin: 0 auto;
		margin-top: 50px;
		border: 1px solid #c9c9c9;
		border-radius: 10px;
	}
	
	#inputPwdTitle{
		width: 100%;
		height: 20%;
		font-size: 25px;
		font-weight: 800;
		text-align: center;
		line-height: 80px;
		border-bottom: 1px solid #c9c9c9;
	}
	#inputPwdBody{
		margin-top: 50px;
		width: 100%;
		height: 280px;
	}
	#changePwdTable{
		width: 100%;
		height: 250px;
		margin-top: 25px;
	}
	.checkLabel{
		height: 15px;
		font-size: 11px;
		font-weight: 800;
	}
	.inputStyle{
		width: 200px;
	}
	.changePwdBtn{
		width: 100px;
		height: 30px;
		border: 1px solid #c9c9c9;
		background: white;				
	}
	.changePwdBtn:hover {
		border: 0;
		background: #337ab7;
		color: white;
	}


</style>


</head>
<body>


	<div class="wrap" style="height: 600px;">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="infoMenu.jsp" />

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content" style="height: 600px;">
			<b class="contentTitle">비밀번호 변경</b>
			<br><br>
			<div class="contentDiv">
			
				<div id="changePwdPage">				
					
					<div id="inputPwd">
						<div id="inputPwdTitle">비밀번호 변경</div>
						<div id="inputPwdBody">
						
						<form action="changePwd.me" id="changePwdForm">
							<table id="changePwdTable">
								<colgroup>
									<col width="40%" />
									<col width="60%" />
								</colgroup>
								<tr>								
									<td style="text-align: right; font-weight: 800;">비밀번호 입력 : </td>
									<td style="text-align: center;">									
									<input class="inputStyle" type="password" id="empPwd">
									<input type="hidden" name="empNo" value="${ loginUser.empNo }"></td>
								</tr>	
								<tr style="height: 15px;">
									<td></td>									
									<td style="text-align: left; padding-left: 20px;">
									<label id="pwdCheck" class="checkLabel">비밀번호가 틀립니다.</label></td>
								</tr>				
								<tr>
									<td style="text-align: right; font-weight: 800;">새로운 비밀번호 입력 : </td>
									<td style="text-align: center;">
									<input class="inputStyle" type="password" id="changePwd" name="changePwd"></td>
								</tr>
								<tr style="height: 15px;">
									<td></td>									
									<td style="text-align: left; padding-left: 20px;">
									<label class="checkLabel" id="changePwdCheck">적절한 비밀번호입니다.</label></td>
								</tr>				
								<tr>
									<td style="text-align: right; font-weight: 800;">새로운 비밀번호 확인 : </td>
									<td style="text-align: center;">
									<input class="inputStyle" type="password" id="checkPwd"></td>
								</tr>
								<tr style="height: 15px;">								
									<td></td>
									<td style="text-align: left; padding-left: 20px;">
									<label class="checkLabel" id="checkPwdLabel">비밀번호가 일치하지 않습니다.</label></td>
								</tr>				
								<tr style="height: 100px;">
									<td colspan="2" style="text-align: center;">
										<button type="button" class="changePwdBtn" id="changeSubmit">변경</button> &nbsp;&nbsp;
										<button type="button" class="changePwdBtn" id="">취소</button>
									</td>
								</tr>
							</table>
						</form>
						
						
						</div>						
					</div>					
				</div>			
			</div>
		

		<script>
		
		$(function() {		
			
			var pwdCheckOK = 0;
			var changePwdOK = 0;
			var changePwdCheckOK = 0;
			
			//password 일치 검사
			var $pwdCheck = $("#pwdCheck");
			$pwdCheck.html("");
			
			$("#empPwd").keyup(function(){
				//var empNameRegExp = /^[가-힣]{2,4}$/; //이름 유효성 검사 2~4자 사이
				if($("#empPwd").val() != ""){	
					$.ajax({
	      	 				type:"POST",
	      	 				url :'empPwdCheck.me',
	      	 				async: false,
	      	 				data:{
	      	 					"empNo" : "${ loginUser.empNo }",
	      	 					"empPwd" : $("#empPwd").val()
	      	 				},
	      	 				success:function(data){
	      	 					//data : 1이면 일치, 0 이면 불일치
	      	 					if(data == 1){        	 						
	      	 						$pwdCheck.html("비밀번호가 일치합니다.").css("color", "green");
	      	 						pwdCheckOK = 1;
	      	 					}else {
	      	 						$pwdCheck.html("비밀번호가 일치하지 않습니다.").css("color", "red");
	      	 						pwdCheckOK = 0;
	      	 					}
	      	 				}
					});
				}else {
					$pwdCheck.html("");
					pwdCheckOK = 0;
				}					
			});
			
			//비밀번호 체크
			$("#changePwdCheck").html('');
			$("#changePwd").keyup(function(){
				
				var pw = $("#changePwd").val();
				var num = pw.search(/[0-9]/g);
				var eng = pw.search(/[a-z]/ig);
				var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				
				if($("#changePwd").val() != ''){
					if(pw.length < 6 || pw.length > 12){					
						$("#changePwdCheck").html("6~12자리 이내로 입력해주세요.").css("color", "red");	
						changePwdOK = 0;
					}else if(pw.search(/\s/) != -1){
						$("#changePwdCheck").html("비밀번호는 공백 없이 입력해주세요.").css("color", "red");
						changePwdOK = 0;
					}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
						$("#changePwdCheck").html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.").css("color", "red");
						changePwdOK = 0;
					}else {
						$("#changePwdCheck").html('적합한 비밀번호입니다.').css("color", "green");
						changePwdOK = 1;
					}
				}else {
					$("#changePwdCheck").html('');
					changePwdOK = 0;
				}
				
				
			});
			
			$("#checkPwdLabel").html('');
			$("#checkPwd").keyup(function(){
				if($("#changePwd").val() != $("#checkPwd").val()){
					$("#checkPwdLabel").html('비밀번호가 일치하지 않습니다.').css("color", "red");
					changePwdCheckOK = 0;
				}else{
					$("#checkPwdLabel").html('비밀번호가 일치합니다.').css("color", "green");
					changePwdCheckOK = 1;
				}
				
			});
			
			
			$("#changeSubmit").click(function(){				
				if(pwdCheckOK == 1 && changePwdOK == 1 && changePwdCheckOK == 1){
					
					$("#changePwdForm").submit();
				}
			});
			
		});
		
		</script>

	</div>
	
	

	

</body>
</html>
