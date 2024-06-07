<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>
		$(function() {
			var successCode = "${ requestScope.successCode }";
			var alertMessage = "";
			var movePath = "";
			
			switch(successCode) {
			case "insertMember" :
				alertMessage = "회원가입 성공!";
				movePath = "/mb/index.jsp";
				break;
			case "updateMember" :
				alertMessage = "회원수정 성공!";
				movePath = "/mb/index.jsp";
				break;
			case "deleteMember" :
				alertMessage = "회원탈퇴 성공!";
				movePath = "/mb/index.jsp";
				break;
			case "insertBoard" :
				alertMessage = "게시물 등록 성공!";
				movePath = "/mb/index.jsp";
				break;
			}
			alert(alertMessage);
			location.href = movePath;
		});
	</script>
</body>
</html>