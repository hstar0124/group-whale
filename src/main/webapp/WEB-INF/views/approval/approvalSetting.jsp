<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.waitDiv {
		border-radius:5px;
		background-color:#0871B9;
		color:white;
		text-align:center;
		width:80px;
	}
	.rejectDiv {
		border-radius:5px;
		background-color:#FFC462;
		color:white;
		text-align:center;
		width:80px;
	}
	.completeDiv {
		border-radius:5px;
		background-color:#CDCDCD;
		color:white;
		text-align:center;
		width:80px;
	}
	/* #absenceTab td:nth-child(1) {
		width:50px;
	}
	#absenceTab td:nth-child(2) {
		width:150px;
	}
	#absenceTab td:nth-child(3) {
		width:150px;
	}
	#absenceTab td:nth-child(4) {
		width:100px;
	}
	#absenceTab td:nth-child(5) {
		width:200px;
	} */
	#absenceTab {
		padding-left:7px;
		border-collapse:separate;
		border-spacing:0 8px;
	}
	.contentDiv {
		height: 715px;
	}
	#addAbsence {
		cursor:pointer;
		color:#0871B9;
		font-weight:bold;
		font-size:13px;
	}
	#delAbsence {
		cursor:pointer;
	}
	.autTr {
		cursor:pointer;
	}
	.autTr:hover {
		color:#0871B9;
	}
</style>

</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
   	<jsp:include page="../approval/approvalMenubar.jsp"/>

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle" style="font-size:18px;">결재환경설정</b>
			<br><br>
			<div class="contentDiv" style="border:0px;">
				<h5 style="font-weight:bold;">부재/위임 설정</h5>
				<hr style="margin-bottom:12px;"> &nbsp;
				<span id="addAbsence">
					<img src="${ contextPath }/resources/images/approval/plus.png" style="height:15px; width:15px;">
					부재추가
				</span> &nbsp;&nbsp;&nbsp;
				<%-- <span id="delAbsence">
					<img src="${ contextPath }/resources/images/approval/trash.png" style="height:15px; width:15px;">
					삭제
				</span> --%>
				<hr style="margin-top: 12px; margin-bottom: 3px;">
				<div style="height:470px;">
					<table id="absenceTab" style="width:100%;">
						<tr>
						<!-- 	<td><input type="checkbox" style="width:16px; height:16px;"></td> -->
							<th>부재시작일</th>
							<th>부재종료일</th>
							<th>대결자</th>
							<th>부재사유</th>
							<th>승인여부</th>
						</tr>
						<tr>
							<td colspan="5"><hr style="margin-top: 3px; margin-bottom: 3px;"></td>
						</tr>
							<c:forEach var="l" items="${ list }">
								<tr class='autTr'>
									<input type="hidden" value="${ l.docNo }">
									<td>${ l.startDate }</td>
									<td>${ l.endDate }</td>
									<td>${ l.autEmpName } ${ l.positionName }</td>
									<td>${ l.absenceReason }</td>
									<td>
										<c:if test="${ l.autStatus == 0 }">
											<div class="waitDiv">승인대기</div>
										</c:if>
										<c:if test="${ l.autStatus == 1 }">
											<div class="rejectDiv">반려</div>
										</c:if>
										<c:if test="${ l.autStatus == 2 }">
											<div class="completeDiv">승인완료</div>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="5"><hr
											style="margin-top: 0px; margin-bottom: 3px;"></td>
								</tr>
							</c:forEach>
					</table>
				</div>
				<br><br>
				<div id="pagingDiv" align="center">
					<ul class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<li class="disabled">
								<a href="${ blistBack }">
									<span>«</span>
								</a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="goAppSetting.ap">
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
								<c:url var="blistCheck" value="goAppSetting.ap">
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
							<c:url var="blistEnd" value="goAppSetting.ap">
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
		<script>
			$(document).ready(function(){
				$("#addAbsence").click(function(){
					location.href="${contextPath}/addAbsence.ap";
				});
				
				$(".autTr").click(function(){
					var docNo = $(this).children("input").val();
					location.href= "${ contextPath }/goApprovalDetail.ap?docNo=" + docNo;
				});
			});
		</script>
		<jsp:include page="../approval/writeModal.jsp"/>
		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>
</html>