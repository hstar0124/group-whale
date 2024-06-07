<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tempTab {
	border-collapse: separate;
	border-spacing: 0 8px;
}

.sg_status {
	border-radius: 5px;
	background-color: lightgrey;
	color: white;
	text-align: center;
	width: 80px;
}

.contentDiv {
	height: 715px;
}

.boxListTr {
	cursor: pointer;
}

.boxListTr:hover {
	color: #0871B9;
}
.enrollTd {
	display:inline-block;
    width:130px;
    white-space:nowrap;
    overflow:hidden;
}

</style>
</head>
<body>
	<div class="wrap">
		<!-- 메뉴바 include -->
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../approval/approvalMenubar.jsp" />

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle" style="font-size: 18px;">임시문서함</b> <br>
			<br>
			<div class="contentDiv" style="border: 0px;">
				<div class="searchDiv" style="text-align: right; height: 50px;">
					<select style="height: 23px;">
						<option>통합검색</option>
					</select> &nbsp;
					<div style="float: right; border: 0.5px solid #C4C4C4;">
						<input type="text" style="border: none;"> <img
							src="${ contextPath }/resources/images/approval/search.png"
							class="searchImg" style="width: 20px; height: 20px;">
					</div>
				</div>
				<div style="height:470px;">
					<table id="tempTab">
						<tr>
							<td colspan="6"><hr
									style="margin-top: 0px; margin-bottom: 3px;"></td>
						</tr>
						<tr>
							<th style="width: 80px;text-align:center;">NO</th>
							<th style="width: 200px;">결재양식</th>
							<th style="width: 400px;">제목</th>
							<th style="width: 150px;">기안자</th>
							<th style="width: 200px;">저장일</th>
							<th style="width: 150px;">결재상태</th>
						</tr>
						<tr>
							<td colspan="6"><hr
									style="margin-top: 2px; margin-bottom: 2px;"></td>
						</tr>
						<c:if test="${ empty boxList }">
							<td colspan="6" rowspan="10"><div style="text-align:center; line-height:90px; color:#a5a5a5;"> 임시 저장한 문서가 없습니다. </div></td>
						</c:if>
						<c:if test="${ ! empty boxList }">
							<c:set var="no" value="1"/>
							<c:forEach var="b" items="${ boxList }">
								<tr class="boxListTr">
									<input type="hidden" value="${ b.docNo }">
									<td style="text-align:center;">
										<c:out value="${listCount - b.num + 1}"/>
									</td>
									<td>${ b.formName }</td>
	
									<td>${ b.docTitle }</td>
									<td>${ b.empName }</td>
									<td class="enrollTd">
										<!-- <script>
										var enrollDate = '${b.enrollDate}';
										
										var sub = enrollDate.substring(0, 15);
										console.log(sub);
										$(".enrollTd").text(sub);
									</script> --> ${ b.enrollDate } <%-- <fmt:parseDate var="Date_d" value="${ b.enrollDate }" type="both" pattern="MM:dd"/> --%>
	
									</td>
									<td><div class="sg_status">임시저장</div></td>
								</tr>
								<tr>
								<td colspan="6"><hr
										style="margin-top: 0px; margin-bottom: 3px;"></td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- <tr>
							<td colspan="6"><hr
									style="margin-top: 0px; margin-bottom: 3px;"></td>
						</tr> -->
					</table>
				</div>
				
				<div id="pagingDiv" align="center">					
							
						<ul class="pagination">
							<c:if test="${ pi.currentPage <= 1 }">
								<li class="disabled">
									<a href="${ blistBack }">
										<span>«</span>
									</a>
								</li>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="blistBack" value="goTempDoc.ap">
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
									<c:url var="blistCheck" value="goTempDoc.ap">
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
								<c:url var="blistEnd" value="goTempDoc.ap">
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

		<jsp:include page="../approval/writeModal.jsp" />
		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->

	</div>
	<script>
		$(document).ready(function(){
			$(".boxListTr").click(function(){
				var docNo = $(this).children("input").val();
				location.href= "${ contextPath }/goApprovalDetail.ap?docNo=" + docNo; 
			});
		    
			$("#writeBtn").click(function(){
		   		$("#sgnWriteModal").modal();
		   	});
		});
		
	</script>
</body>
</html>