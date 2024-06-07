<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#completeTab {
		border-collapse:separate;
		border-spacing:0 8px;
	}
	.sg_status {
		border-radius:5px;
		background-color:#CDCDCD;
		color:white;
		text-align:center;
		width:80px;
	}
	.boxListTr {
		cursor:pointer;
	}
	
	.boxListTr:hover {
		color: #0871B9;
	}
	#searchIcon {
		cursor:pointer;
	}
	.completeTd {
		display:inline-block;
		width:110px;
		white-space:nowrap;
		overflow:hidden;
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
			<b class="contentTitle" style="font-size: 18px;">완료문서함</b> <br>
			<br>
			<div class="contentDiv" style="border: 0px;">
				<div class="searchDiv" style="text-align: right; height: 50px;">
					<select id="searchCondition" style="height: 23px;">
						<option value="title">제목</option>
						<option value="form">결재양식</option>
						<option value="writer">기안자</option>
					</select> &nbsp;
					<div style="float: right; border: 0.5px solid #C4C4C4;">
						<input name="searchValue" id="searchValue" type="text" style="border: none;" onkeyup="enterkey();"> <img id="searchIcon"
							src="${ contextPath }/resources/images/approval/search.png"
							class="searchImg" style="width: 20px; height: 20px;" onclick="search();">
					</div>
					<script>
						function enterkey() {
					    	if(window.event.keyCode == 13) {
					    		search();
					    	}	
					    }
					    
					    function search() {
					    	var searchCondition = $("#searchCondition").val();
							var searchValue = $("#searchValue").val();
							
							if(searchValue != "") {
								location.href="searchComplete.ap?searchCondition=" + searchCondition + "&searchValue=" + searchValue;
							}else {
								swal({
									  title: "",
									  text: "검색할 내용을 입력해주세요.",
									  icon: "info",
									  button: "확인"
									});
							}
					    }
					</script>
				</div>
				<div style="height:470px;">
					<table id="completeTab">
						<tr>
							<td colspan="7"><hr
									style="margin-top: 0px; margin-bottom: 3px;"></td>
						</tr>
						<tr>
							<th style="width: 50px;text-align:center;">NO</th>
							<th style="width: 150px;">결재양식</th>
							<th style="width: 40px;">긴급</th>
							<th style="width: 250px;">제목</th>
							<th style="width: 100px;">기안자</th>
							<th style="width: 150px;">완료일</th>
							<th style="width: 80px;">결재상태</th>
						</tr>
						<tr>
							<td colspan="7"><hr
									style="margin-top: 2px; margin-bottom: 2px;"></td>
						</tr>
						<c:if test="${ empty boxList }">
							<td colspan="7" rowspan="10"><div style="text-align:center; line-height:90px; color:#a5a5a5;"> 완료된 문서가 없습니다. </div></td>
						</c:if>
						<c:if test="${ ! empty boxList }">
							<c:forEach var="b" items="${ boxList }">
								<tr class="boxListTr">
									<input type="hidden" value="${ b.docNo }">
									<td style="text-align:center;">
										<c:out value="${listCount - b.num + 1}"/>
									</td>
									<td>${ b.formName }</td>
									<td>
										<c:if test="${b.docUrgent eq 1}">
											<div style="margin-left:5px;"><img src="${contextPath }/resources/images/approval/alert.png" style="width:17px; height:17px"></div>
										</c:if>
									</td>
									<td>${ b.docTitle }</td>
									<td>${ b.empName }</td>
									<td class="completeTd">${ b.completeDate }</td>
									<td>
										<c:if test="${b.docStatus == 1}">
											<div class="sg_status" style="background:#0871B9;">
												진행중
											</div>
										</c:if>
										<c:if test="${b.docStatus == 2 }">
											<div class="sg_status" style="background:#FFC462;">
												반려
											</div>
										</c:if>
										<c:if test="${b.docStatus == 3 }">
											<div class="sg_status" style="background:#CDCDCD;">
												완료
											</div>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="7"><hr
										style="margin-top: 0px; margin-bottom: 3px;"></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
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
							<c:url var="blistBack" value="goAppComplete.ap">
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
								<c:url var="blistCheck" value="goAppComplete.ap">
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
							<c:url var="blistEnd" value="goAppComplete.ap">
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
		
		<jsp:include page="../approval/writeModal.jsp"/>

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