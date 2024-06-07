<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
 .search { float:right; margin-right:5%;}
 /* .mailTable_td { width: 10%; }   */

 #test_btn1{ border-radius: 5px;margin-right:-4px; } 
 #test_btn2{ border-top-right-radius: 5px; border-bottom-right-radius: 5px; margin-left:-3px; } 
 #btn_group button{ border: 1px solid #0871B9; background-color: rgba(0,0,0,0); color: #0871B9; padding: 5px; } 
 #btn_group button:hover{ color:white; background-color: #0871B9; }
.threeButton{
	width: 100px; height: 30px; background: #0871B9; color: white; font-size: 10px; font-weight: bold; text-align: center;
		border-radius: 7px; border: 1px; margin-left: 5px;  margin-top:70px; 
}
.threeButtonDiv{
	text-align:center;
}
</style>
<script>
	
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	 <jsp:include page="mailMenubar.jsp" />

			<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->
		
		<div class="content" style="background:white;">
			<b class="contentTitle">메일 쓰기</b>
			<div class="search" style="border:1px solid black;">
			<select style="height:25px;">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input type="search" placeholder="검색" style="border:none;">
			<img class="nav1_icons" style="width:20px; height:20px;"
					src="/gw/resources/images/mail/search.png">
			</div>
			
			<hr style="border:1px solid #DDDDDD">

			<p style="text-align:center; font-size:20px; margin-top:50px;">메일을 성공적으로 발송하였습니다</p>
			<p style="text-align:center; font-size:15px; margin-top:10px; color:rgba(0, 0, 0, 0.5)">보낸메일함에서 확인하실 수 있습니다.</p>
			
			<hr style="border:1px solid #DDDDDD">
			<p style="margin-left:120px;">받는 사람　　<c:forEach var="to" items="${ to }">${ to }   </c:forEach></p>
			
			<div class="threeButtonDiv">
			<button class="threeButton" onclick="location.href='send.ml'">보낸 메일함 이동</button>
			<button class="threeButton">추가하기</button>
			<button class="threeButton" onclick="location.href='main.ml'">홈으로 이동</button>
			</div>
			
			</div>
		

	</div>



</body>
</html>