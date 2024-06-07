<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<script>
	
		//swal("${ msg }");
		swal({
            title: "비밀번호 변경 성공",
            text: "${ msg }",
            icon: "success",
            button: "확인"
          }).then((확인) => {
             if(확인) {
            	 location.href='showLogin.vi';
             }
         });
	</script>
</body>
</html>