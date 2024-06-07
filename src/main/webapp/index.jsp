<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	.wrap {
		width: 1200px;
		height: 720px;
		margin: auto;
	}
	.leftArea {
		width: 60%;
		height: 720px;
		float: left;
	}
	.loginArea {
		width: 40%;
		height: 720px;
		float: right;
	}
	.background {
		width: 100%;
		height: 720px;
	}
	.logo {
		width: 300px;
		height: 300px;
	}
	
	.loginTable {
		margin-top: 100px;
	}
	.loginDiv {
		width: 295px;
		height: 45px;
		border: 1px solid #727272;
		border-radius: 10px;
		outline: none;
		padding: 5px;
	}
	
	.inputForm {
		width: 80%;
		height: 30px;
		padding: 5px;
		font-size: 15px;
		border:none;
		border-right:0px; 
		border-top:0px; 
		border-left:0px; 
		border-bottom:0px;

		
	}
	.searchPw {
		text-align: right;
		height: 20px;
	}
	.loginBtn {
		width: 100%;
		height: 40px;
		background: #0871B9;
		color: white;
		font-size: 20px;
		border-radius: 10px;
		border: 2px;
	}
	.user {
		width: 30px;
		height: 25px;
		padding-top: 6px;
		padding-right: 6px;
		padding-left: 6px;
		float:left;
	}
	.btn:hover {
		cursor: pointer;
	}	
	
	#passwordSearch{
		height: 20px;
		padding: 0;
		margin: 0;		
	}
	#pwdTable{
		width: 100%;
		height: 200px;
	}
	
	.passwordLabel{
		width: 100%;
		margin: 0;
		padding: 0;
		text-align: right;
		padding-right: 15px;
	}
	.passwordInput{
		width: 213px;
		height: 35px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	
	#phone{
		width: 136px;
	}
	
	#phoneCheck{
		width: 60px;
		height: 35px;
	}

	.modalBtn{
		width: 68px;
		height: 35px;
		background: #0871B9;
		border: 0;
		color: white;
		border-radius: 5px;
	}
	
	#resendBtn{
		background: #a1a1a1;
	}
	
	#numberCheckBtn{
		background: #a1a1a1;
	}

</style>
</head>
<body>
	<!-- c:set으로 contextPath 변수 선언 -->
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

	<div class="wrap">
		<!-- 좌측 영역 시작 -->
		<div class="leftArea">
			<img class="img background" src="${ contextPath }/resources/images/menubar/background.jpg">
		</div>
		<!-- 좌측 영역 끝 -->
		
		
		<!-- 로그인 영역 시작 -->
		<div class="loginArea">
			<form action="login.me" method="post">
			<!-- <form action="noPwdLogin.me" method="post"> -->
				<table align="center" class="loginTable">
					<tr>
						<td>
							<img class="logo" src="${ contextPath }/resources/images/menubar/logo.png">
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr style="height: 50px;">
						<td>
							<div class="loginDiv">
								<img class="user" src="${ contextPath }/resources/images/menubar/user.png">
								<input class="inputForm" type="text" name="empNo" id="empNo" placeholder="사원번호">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="loginDiv">
								<img class="user" src="${ contextPath }/resources/images/menubar/password.png">
								<input class="inputForm" type="password" name="empPwd" id="empPwd" placeholder="비밀번호">
							</div>							
						</td>
					</tr>
					<tr style="height: 20px; text-align: right;">
						<td>
							<a class="searchPw btn" id="passwordSearch">비밀번호 찾기</a>
							<!-- <pre class="searchPw btn" id="passwordSearch">비밀번호 찾기</pre> -->
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="btn loginBtn">로그인</button>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
				</table>
			</form>			
		</div>
		<!-- 로그인 영역 끝 -->
	</div>
	
	<!-- 부서 추가 모달창 -->
	<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:350px; height:350px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
				</div>
				
				
				<div class="modal-body" id="pwdCheckBody">
					<div class="passwordModalDiv">
					<form action="changePwd.me" id="searchPwd">
						<table id="pwdTable">
							<colgroup>
								<col width="30%"/>
								<col width="70%"/>
							</colgroup>
							<tr>
								<td><label class="passwordLabel">사번</label></td>
								<td><input type="text" class="passwordInput" id="modalEmpNo" name="empNo">
									<input type="hidden" class="passwordInput" id="changePwd" name="changePwd">
								</td>
							</tr>
							<tr>
								<td><label class="passwordLabel">이름</label></td>
								<td><input type="text" class="passwordInput" id="empName" name="empName"></td>
							</tr>
							<tr>
								<td><label class="passwordLabel">핸드폰 번호</label></td>
								<td><input type="text" class="passwordInput" id="phone" name="phone" placeholder=" - 빼고 입력해주세요">&nbsp;&nbsp;<button type="button" class="modalBtn" id="SendNumber">인증하기</button></td>
							</tr>
							<tr>
								<td><span style="display: none" id="returnNumber"></span></td>
								<td><input class="passwordInput" type="text" id="phoneCheck" readonly>&nbsp;&nbsp;<button type="button" class="modalBtn" id="numberCheckBtn" disabled="true">확인</button>&nbsp;&nbsp;<button type="button" class="modalBtn" id="resendBtn" disabled="true">재전송</button></td>
							</tr>
							<tr style="height: 30px;">
								<td colspan="2" style="color: red; text-align:center;">비밀번호는 사번으로 변경됩니다.</td>
							</tr>							
						</table>	
						</form>						
					</div>	
				</div>
				<div class="modal-footer">
					<button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
				
				
			</div>
		</div>
	</div>
	<!-- 부서 추가 모달창 끝 -->
	
	<script>
		$(function(){
			$("#passwordSearch").click(function(){
				$("#modalEmpNo").val('');
				$("#empName").val('');
				$("#phone").val('');
				$("#modalEmpNo").attr("readonly",false);
				$("#empName").attr("readonly",false);
				$("#phone").attr("readonly",false);
				$("#passwordModal").modal();
			});	
			
		});		
		
		$("#resendBtn").click(function(){
			$.ajax({
					type: "post",
	 				url : 'sendSms.st',
	 				async: false,
	 				data:{
	 					"empNo" : $("#modalEmpNo").val(),
	 					"empName" : $("#empName").val(),
	 					"phone" : $("#phone").val()
	 				},
	 				success:function(data){
	 					console.log(data);
	 					$("#returnNumber").html(data);
	 				}
			});
		});
		
		$("#SendNumber").click(function(){									
			
			$("#modalEmpNo").attr("readonly",true);
			$("#empName").attr("readonly",true);
			$("#phone").attr("readonly",true);
			
			$.ajax({
 				type: "post",
 				url : 'searchEmpInfo.st',
 				async: false,
 				data:{
 					"empNo" : $("#modalEmpNo").val(),
 					"empName" : $("#empName").val(),
 					"phone" : $("#phone").val()
 				},
 				success:function(data){
 					//console.log(data); 					
 					if(data == 1){ 						
 						//문자 전송
 						$.ajax({
 							type: "post",
 			 				url : 'sendSms.st',
 			 				async: false,
 			 				data:{
 			 					"empNo" : $("#modalEmpNo").val(),
 			 					"empName" : $("#empName").val(),
 			 					"phone" : $("#phone").val()
 			 				},
 			 				success:function(data){
 			 					console.log(data);
 			 					$("#returnNumber").html(data);
 			 				}
 						});
 						
 						//존재하는 사원일 경우 인증버튼 비활성화 후 인증번호 입력 활성화 						
 						$("#SendNumber").attr("disabled", true).css("background", "#c1c1c1"); 	 					
 	 					$("#phoneCheck").attr("readonly",false);
 	 					$("#numberCheckBtn").attr("disabled",false).css("background", "#0871B9"); 					
 	 					$("#resendBtn").attr("disabled",false).css("background", "#0871B9");
 					}else {
 						swal('입력하신 정보에 해당하는 사원이 없습니다');
 						$("#modalEmpNo").val('');
 						$("#empName").val('');
 						$("#phone").val('');
 					}
 					
 				}
			});
		});
		
		$("#numberCheckBtn").click(function(){
			if($("#returnNumber").html() == $("#phoneCheck").val()){
//				console.log('일치');
				$("#changePwd").val($("#modalEmpNo").val());				
				$("#searchPwd").submit();				
			}else{
				//console.log('불일치');
				swal("번호를 다시 확인해주세요.");
			}
				
		});
		
	</script>
	
</body>

</html>