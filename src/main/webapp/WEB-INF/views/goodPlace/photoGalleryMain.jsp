<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>	
	.contentDiv {
	height:680px;
	}
	
	
	.boardTable td {
	boarder:1px solid lightgray;
	text-align:center;
	border-bottom: 2px solid lightgray;
	padding-bottom: 5px;
	padding-top: 5px;
	text-align: center;
	height: 30px;
	}
	
	.boardDiv {
		display:inline-block;
		padding:14px;
		cursor:pointer;
	}
	.cardDiv {
		border:1px solid #e6e5e5;
		width:177px;
		background:white;
	}
	.classWithShadow{
      -moz-box-shadow: 4px 4px 5px #e6e5e5; 
      -webkit-box-shadow: 4px 4px 5px #e6e5e5; 
      box-shadow: 4px 4px 5px #e6e5e5; 
	}
	
	#writeBtn {
		width:80px;
		height:35px;
		background-color:#0871B9;
		border: 1px solid #0871B9;
		color:white;
		border-radius:5px;
		font-size:13px;
	}
	.searchDiv {
		display:inline-block;
		border: 0.5px solid #C4C4C4; 
		background-color:white; 
		width:253px;
		height: 25px;
	}
	select:focus {outline:none;}
	input:focus {outline:none;}
	
	#titleDiv {
		font-size: 15px;
		height:45px;
		margin-top:5px;
		font-weight:bold;
	}
</style>
<script>
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->

	<jsp:include page="../board/boardMenubar.jsp" />
	<!-- board 메뉴바 include -->
	
		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content" style="background-color:#f6f5f5;">
			<b class="contentTitle" style="font-size:18px;">포토 갤러리</b>
			<br><br>
			<div class="contentDiv" style="width:855px; border:0px; background-color:#f6f5f5;">
				<div style="display:inline-block; width:560px;"></div>
				<div class="searchDiv">
					<select id="searchCondition" style="height: 23px; width:75px; border:0px; color:grey">
						<option value="title">제목</option>
						<option value="form">작성자</option>
					</select>
					<div style="display:inline-block; width:175px; margin-left:-4px;">
						<input name="searchValue" id="searchValue" type="text" style="border: none;width:150px;" onkeyup="enterkey();"> <img id="searchIcon"
							src="${ contextPath }/resources/images/approval/search.png"
							class="searchImg" style="width: 20px; height: 20px;" onclick="search();">
					</div>
				</div>
				<!-- <div style="display:inline-block;"><button type="button">글쓰기</button></div> -->
				
				<div style="clear:both; height:20px;"></div>
					<!-- <button>글쓰기</button> -->
				<c:forEach var="l" items="${ list }">
					<div class="boardDiv">
						<input type="hidden" value="${ l.pboardNo }">
				    	<div class="cardDiv">
					    	<div>
					        	 <img src="${contextPath }/resources/uploadFiles/pictureBoard/${ l.changeName }"
					              	style="width:100%; height:120px;">
					    	</div>
					    	<div style="padding: 1rem; height: 80px;">
					         	<div>
					              	<div id="titleDiv">${ l.title }</div>
					              	<div style="font-size:12px;">${ l.empName } ${ l.positionName } [${ l.deptName }]</div>
					         	</div>
					    	</div>
					    	<div style="text-align:right; padding:10px;">
					         	<span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>${ l.likes }</span>
					         	</span>
					    	</div>
				    	</div>
					</div>
				</c:forEach>
				<%-- <div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div>
				<div class="boardDiv">
				    <div class="cardDiv">
					    <div>
					         <img src="https://tumblbug-pci.imgix.net/6e55fd0b261d97a413184662ebc64defcfea5279/e7ff069260ad584e26486ff97cbbfa37e074f1be/22e9a5fb9bcdba99c67612ed145cb4069b3e7c72/4936860d-856c-4830-873e-b85b3ed128a3.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=867aba99bc94f81a2bff82653da56fc1"
					              style="width:100%; height:120px;">
					    </div>
					    <div style="padding: 1rem; height: 80px;">
					         <div>
					              <div>제목</div>
					              <div>이름</div>
					         </div>
					    </div>
					    <div style="text-align:right; padding:10px;">
					         <span>
					                  <span><img src="${ contextPath }/resources/images/goodPlace/fullheart.png" style="width:20px; height:20px;"></span>
					                  <span>12</span>
					         </span>
					    </div>
				    </div>
				</div> --%>
				<div style="clear:both;height:10px;"></div>
				<div style="height:25px; text-align:right; padding-right:17px;">
					<button type="button" id="writeBtn">글쓰기</button>
				</div>
				<div id="pagingDiv" align="center">
					<ul class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<li class="disabled">
								<a href="${ blistBack }">
									<span>«</span>
								</a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="goPlace.gp">
								<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
							</c:url>
							<li>
								<a href="${ blistBack }">
									<span>«</span>
								</a>
							</li>
						</c:if>
							 
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<li class="active"><a href="#">${ p }</a></li>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="goPlace.gp">
									<c:param name="currentPage" value="${ p }" />
								</c:url>
								<li><a href="${ blistCheck }">${ p }</a></li>
							</c:if>				
						</c:forEach>
							
							
						<c:if test="${ pi.currentPage >= pi.endPage }">
							<li class="disabled">
								<a href="${ blistBack }">
									<span>»</span>
								</a>
							</li>
						</c:if>
							
						<c:if test="${ pi.currentPage < pi.endPage }">
							<c:url var="blistEnd" value="goPlace.gp">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
							</c:url>
							<li>
								<a href="${ blistEnd }">
									<span>»</span>
								</a>
							</li>								 
						</c:if>	
					</ul>
				</div>
			</div>
		</div>
		<!-- 본문 영역 끝 -->



		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
	<script>
		$(".cardDiv").hover(function() { 
			$(this).toggleClass('classWithShadow');
		});
		$("#writeBtn").click(function(){
			location.href="${ contextPath }/goWrite.gp";
		});
		$(document).ready(function(){
			$(".boardDiv").click(function(){
				var pboardNo = $(this).children("input").val();
				location.href="${ contextPath }/goDetail.gp?pboardNo=" + pboardNo;
			});
		});
	</script>
</body>
</html>