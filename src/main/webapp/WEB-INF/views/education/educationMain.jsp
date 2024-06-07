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
	.contentDiv {height:680px; }
	.boardMain {width: 100%; height: 300px;}
	.edu_table1 {width: 100%; border-spacing: 15px; border-collapse: separate;}
	.edu_table1_td {width: 30%; border: 0px solid black; padding-bottom: 5px;}
	.edu_table1_tr_down{background: #cdcdcd;}
	.edu_table1_title {color:#0871b9; font-size: 15px; padding-top: 5px; font-weight: bold; } 
	.edu_table1_btn {float: right; margin: 10px; margin-top: 0px; background: #0871b9; border-radius: 5px; 
		width: 70px; text-align: center; padding: 5px; color: white;}
	
	.edu_table2 {width: 100%; background: white;}
	.edu_table2_td_img{width: 100%; height: 160px;}
	.edu_table2_td_title {font-size: 15px; padding-left: 0px; padding-top: 5px; padding-bottom: 5px;}
	.edu_table2_td_date{font-size: 12px; padding-left: 0px; color: #888888; padding-bottom: 5px;}
	.edu_table1_td:hover{cursor: pointer; background: #0871b9;}
	.edu_table1_btn:hover{background: #4391c6;}
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

		<div class="content">
			<b class="contentTitle">자유게시판  | &nbsp;&nbsp;신입사원 교육</b>
			<br><br>
			<div class="contentDiv" style="width:850px; border: 0px solid #CDCDCD;">
				<table class="edu_table1">
					<tr>
						<td colspan="4">
							<span class="btn2 edu_table1_title">신입사원 팁 </span>
							<span class="btn2 edu_table1_btn" onclick="enroll();">글쓰기</span>
						</td>
					</tr>
					<tr>
					<c:forEach var="l" items="${ list }" varStatus="vs" begin="0" end="${ list.size() }" step="1">
						<!-- 한 개의 게시글 시작 -->
						<td class="edu_table1_td">
							<table class="edu_table2">
								<tr>
									<td colspan="2">
										<input type="hidden" class="eduNo" value="${ l.eduNo }">
										<img class="edu_table2_td_img" src="${ contextPath }/resources/uploadFiles/education/${ l.changeName }">
									</td>
								</tr>
								<tr>
									<td colspan="2" class="edu_table2_td_title">${ l.eduTitle }
									</td>
								</tr>
								<tr>
									<td class="edu_table2_td_date">
										<div style="width: 65px; white-space:nowrap;overflow:hidden;">${ l.eduDate }</div>
									</td>
								</tr>
							</table>
						</td>
						<!-- 한 개의 게시글 끝 -->
						
						
						<c:if test="${ (vs.index + 1) % 3 == 0 }">
							</tr><tr>
						</c:if>
					</c:forEach>
					
					<%-- 	
					</tr>
					
					<!-- 여기서는 두번째 줄 -->
					<tr>
						<!-- 한 개의 게시글 시작 -->
						<td class="edu_table1_td">
							<table class="edu_table2">
								<tr>
									<td colspan="2" class="edu_table2_img">
										<img class="edu_table2_td_img" src="${ contextPath }/resources/images/education/education.png">
									</td>
								</tr>
								<tr>
									<td colspan="2" class="edu_table2_td_title">신입사원 교육 - 전자결재편
									</td>
								</tr>
								<tr>
									<td class="edu_table2_td_date">2020.05.07</td>
								</tr>
							</table>
						</td>
						<!-- 한 개의 게시글 끝 -->
						<!-- 한 개의 게시글 시작 -->
						<td class="edu_table1_td">
							<table class="edu_table2">
								<tr>
									<td colspan="2" class="edu_table2_img">
										<img class="edu_table2_td_img" src="${ contextPath }/resources/images/education/education.png">
									</td>
								</tr>
								<tr>
									<td colspan="2" class="edu_table2_td_title">신입사원 교육 - 전자결재편
									</td>
								</tr>
								<tr>
									<td class="edu_table2_td_date">2020.05.07</td>
								</tr>
							</table>
						</td>
						<!-- 한 개의 게시글 끝 -->
						<!-- 한 개의 게시글 시작 -->
						<td class="edu_table1_td">
							<table class="edu_table2">
								<tr>
									<td colspan="2" class="edu_table2_img">
										<img class="edu_table2_td_img" src="${ contextPath }/resources/images/education/education.png">
									</td>
								</tr>
								<tr>
									<td colspan="2" class="edu_table2_td_title">신입사원 교육 - 전자결재편
									</td>
								</tr>
								<tr>
									<td class="edu_table2_td_date">2020.05.07</td>
								</tr>
							</table>
						</td>
						<!-- 한 개의 게시글 끝 -->
						
					</tr>
					<!-- 두번째줄 끝 --> --%>
				</table>
			<br><br>		


<script>
	// 게시글 상세보기
	$(".edu_table1_td").click(function(){
		var eduNo = $(this).children().children().children().children().children().first().val();
		console.log(eduNo);
		
		location.href = "${contextPath}/selectEduDetail.ed?eduNo=" + eduNo;
	});

	//게시글 작성 버튼
	function enroll() {
		location.href = "${contextPath}/showEduEnroll.ed"
	}
	
</script>



		<!-- 페이징 -->
		<div id="pagingDiv" align="center">

			<ul class="pagination">
				<c:if test="${ pi.currentPage <= 1 }">
					<li class="disabled"><a href="${ blistBack }"> <span>«</span>
					</a></li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="blistBack" value="goEducation.ed">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
					</c:url>
					<li><a href="${ blistBack }"> <span>«</span>
					</a></li>
				</c:if>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="active"><a href="#">${ p }</a></li>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="blistCheck" value="goEducation.ed">
							<c:param name="currentPage" value="${ p }" />
						</c:url>
						<li><a href="${ blistCheck }">${ p }</a></li>
					</c:if>
				</c:forEach>


				<c:if test="${ pi.currentPage >= pi.endPage }">
					<li class="disabled"><a href="${ blistBack }"> <span>»</span>
					</a></li>
				</c:if>

				<c:if test="${ pi.currentPage < pi.endPage }">
					<c:url var="blistEnd" value="goEducation.ed">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
					</c:url>
					<li><a href="${ blistEnd }"> <span>»</span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝-->	
			
			</div>
		</div>
		<!-- 본문 영역 끝 -->


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>
</html>