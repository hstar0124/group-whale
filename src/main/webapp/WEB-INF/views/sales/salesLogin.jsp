<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
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
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
</head>
<style>
	.wrap-input100{border-radius: 5px;}
</style>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" action="login.sa" method="post">
					<span class="login100-form-title p-b-51">
						Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="clientId" placeholder="아이디" style="margin-left: -5px;">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" name="clientPwd" placeholder="비밀번호" style="margin-left: -5px;">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								아이디 저장
							</label>
						</div>
						<div>
							<a href="${ contextPath }/goSignUp.sa" class="txt1">
								회원가입
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button type="submit" class="login100-form-btn" style="background: -webkit-linear-gradient(left, #185BE3, #699BFF); border-radius: 5px;">
							Login
						</button>
					</div>

				</form>
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

</body>
</html>