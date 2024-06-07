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
	.contentTitle {
	}
	
	.contentDiv {
	height:680px;
	}
	
	table {
	border-collapse: separate;
	width:90%;
	margin:auto;
	text-align:center;
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
	
	.keyword {
	vertical-align:top;
  	background-image : url('search.png'); 
 	background-position:top right; 
 	background-repeat:no-repeat;

	}

	#button2{
	width: 50px;
	height: 30px;
	border: 0px;
	background: lightgray;
	outline: none;
	float: right;
	color: white;
	}
	
	#insertBtn {
	width:80px;
	background-color: #0871B9;
	border: 1px solid #0871B9;
	color: white;
	padding: 7px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 5px;
	font-size: 12px;
	}
	
	#pagingDiv {
	height:60px;
	}
	
</style>
<script>
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->

	<jsp:include page="../boardMenubar.jsp" />
	<!-- board 메뉴바 include -->

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">전사 게시판</b>
			<br><br>
			<div class="contentDiv" style="width:800px">
			<br><br>
				<%-- <div class="contentDiv2">
					<select style="border:2px solid lightgray; width:80px; height:30px; text-align-last:center;">
						<option>제목</option>
						<option>번호</option>
					</select>
					<input type="text" class="keyword" style="border:2px solid lightgray; width:200px; height:30px;">
					<button><img src="${ contextPath }/resources/images/icons/search.png" width="20px"></button>
				</div> --%>
					<table class="boardTable">
						<colgroup>
							<col width="10%" />
							<col width="10%"/>
							<col width="40%" />
							<col width="15%" />
							<col width="15%" />
							<col width="10%" />
						</colgroup>
						<!-- <tr>
								<td colspan="5">
								<div id="search2">
									<input id="input2" type="text" placeholder="검색어 입력">
									<button id="button2">검색</button>
								</td>
								</div>
						</tr> -->
						<tr>
							<td colspan="6" style="text-align:right;">
								<select style="border:2px solid lightgray; width:80px; height:30px; text-align-last:center;">
									<option>제목</option>
									<option>번호</option>
								</select>
									<input type="text" class="keyword" style="border:2px solid lightgray; width:200px; height:30px;">
									<%-- <button><img src="${ contextPath }/resources/images/icons/search.png" width="20px"></button> --%>
									<button id="button2">검색</button>
							</td>
						</tr>
						<tr style="background:#0871B9; color:white; vertical-align:middle;">
							<td><label>번호</label></td>
							<td><label>분류</label></td>
							<td><label>제목</label></td>
							<td><label>작성자</label></td>
							<td><label>작성일</label></td>
							<td><label>조회수</label></td>
						</tr>
						
						<c:forEach items="${list2}" var="list2" varStatus="status">
						
						<tr>
							<td>${(pi.listCount-status.index)-((pi.currentPage-1)*10)}</td>
							<td>공통</td>
							<td><a  href="selectOneAllBoard.bo?aBoardNo=${list2.aBoardNo}">${list2.aTitle}</a></td>
							<td>${list2.empName}</td>
							<td><fmt:formatDate value="${list2.aEnrollDate }" pattern="yy/MM/dd"/>&nbsp;</td>
							<td>${list2.aCount}</td>
						</tr>
						
						</c:forEach>
						
				</table>
				
					<!-- 페이징 -->
					<div id="pagingDiv" align="center" >					
							
						<ul class="pagination">
						<!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.-->
						<!-- disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
							<c:if test="${ pi.currentPage <= 1 }">
								<li class="disabled">
									<a href="${ blistBack }">
										<span>«</span>
									</a>
								</li>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="blistBack" value="selectListAllBoard.bo">
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
									<c:url var="blistCheck" value="selectListAllBoard.bo">
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
								<c:url var="blistEnd" value="selectListAllBoard.bo">
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
					
					
<!-- 					검색 창 -->

					  <%-- <div class="search">
					    <select name="searchType">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>
					    
					  </div> --%>
	<!-- 					검색 창 -->				
							

				<div style="text-align:right;">
					<label style="margin-right:43px; text-align:right;">
						<br><br>
						<button type="submit" class="formBtn" id="insertBtn" onclick="location.href='insertAllBoardForm.bo'">작성</button>
					</label>
				</div>
				
				
				
				
				
				
				
				
				
			</div>
			<br><br><br><br>
			
			<!-- <b class="contentTitle">기안 진행 문서</b>
			<br><br>
			<div class="contentDiv">두번째 Div</div>
			<br><br><br><br>
			
			<b class="contentTitle">완료 문서</b>
			<br><br>
			<div class="contentDiv">세번째 Div</div> -->
		</div>
		<!-- 본문 영역 끝 -->










		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
	
</body>
</html>