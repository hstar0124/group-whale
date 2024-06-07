<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/css/util.css">
	<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/sales/css/main.css">
</head>
<style>
.sign_title {font-size: 18px;}
.sign_div {width: 100%; height: 60px; border-bottom:2px solid #e5e5e5; margin-bottom: 32px;}
.sign_input {width: 95%; height: 42px; margin-top: 2px; font-size: 17px; color: #6d6d6d;} 

</style>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<span class="login100-form-title p-b-51">
					Sign Up
				</span>

					<form action="insertClient.sa" method="post" enctype="multipart/form-data">
						<table style="width: 100%">
							<tr>
								<td colspan="2"><b class="sign_title">아이디</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="sign_div">
										<input type="text" class="sign_input" name="clientId" placeholder="아이디를 입력해주세요">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><b class="sign_title">비밀번호</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="sign_div">
										<input type="password" class="sign_input" name="clientPwd" placeholder="비밀번호를 입력해주세요">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><b class="sign_title">비밀번호 확인</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="sign_div">
										<input type="password" class="sign_input" name="clientPwd2" placeholder="비밀번호를 확인해주세요">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><b class="sign_title">이메일</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="sign_div">
										<input type="email" class="sign_input" name="clientEmail" placeholder="이메일을 입력해주세요">
									</div>		
								</td>
							</tr>
							<tr>
								<td colspan="2"><b class="sign_title">연락처</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="sign_div">
										<input type="tel" class="sign_input" name="clientPhone" placeholder="연락처를 입력해주세요">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="contact100-form-checkbox" style="margin-top: 10px; margin-bottom: 20px;">
										<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
										<label class="label-checkbox100" for="ckb1">개인정보 수집·이용 동의</label>
									</div>
								</td>
								<td>
									<div style="margin-left: 0px; margin-top: -12px;">
										<a href="${ contextPath }/goLogin.sa" class="txt1" style="color:-webkit-linear-gradient(left, #185BE3, #699BFF);
											margin-left: 130px;">로그인</a>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="container-login100-form-btn m-t-17">
										<button onclick="enroll();" type="button" class="login100-form-btn" style="background:-webkit-linear-gradient(left, #185BE3, #699BFF); 
											width: 100%; height: 50px; border-radius: 10px;">
											가입
										</button>
									</div>
								</td>
								
							</tr>
						</table>
					</form>
					
	<script>
		function enroll() {
			var clientId = $("input[name=clientId]").val();
			var clientPwd = $("input[name=clientPwd]").val();
			var clientEmail = $("input[name=clientEmail]").val();
			var clientPhone = $("input[name=clientPhone]").val();

			$.ajax({
				type: "post",
				url: "selectClientId.sa",
				data: {
					clientId: clientId
				},
				success: function(data) {
						if(data == '1'){
							swal("Error", "중복된 아이디가 존재합니다.", "error");
							// "warning", "error", "success" and "info"
							
							return;
							
						} else {
							swal("Success", "회원가입이 완료되었습니다.", "success")
							.then((check) => {
								location.href = "${ contextPath }/insertClient.sa?clientId=" + clientId + "&clientPwd=" + clientPwd + "&clientEmail=" + clientEmail + "&clientPhone=" + clientPhone;	
							});
							

						}
						
				},
				error: function(error) {
					console.log(error);
				}
			}); 
			
		}
	
	</script>

				</div>
			</div>
		</div>

	<div id="dropDownSelect1"></div>
	
	<script src="${ contextPath }/resources/sales/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/animsition/js/animsition.min.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/bootstrap/js/popper.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/select2/select2.min.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/daterangepicker/moment.min.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="${ contextPath }/resources/sales/vendor/countdowntime/countdowntime.js"></script>
	<script src="${ contextPath }/resources/sales/js/mainLogin.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>