<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
	.contentDiv {
		height: 700px;
		overflow:auto;
	}
	.greyTd {
		background-color : #F7F7F7;
	}
	.sgnLine, .sgnLine tr, .sgnLine td, .detailDiv tr, .detailDiv td {
		border: 1px solid #C4C4C4;
		text-align:center;
	}
	.sgnLine td {
		width:60px;
	}
	.lineDiv {
		float:right;
	}
	.detailDiv {
		clear:both;
		margin-top:200px;
	}
	.titleTd {
		width:150px;
		height:25px;
		background-color: #F7F7F7;
		text-align:right;
	}
	.personTd {
		width:250px;
	}
	.detailTab {
		width:100%;
		margin:auto;
	}
	.detailTab td {
		padding:0.5em;
	}
	.refFileDiv, .appLogDiv, .appOpinionDiv {
		border:1px solid #E2E2E2;
		min-height:100px;
	}
	.refFileDiv td, .appLogDiv td, .appOpinionDiv td {
		padding: 0.5em;
	}
	.deepGreyTd {
		background-color : #E2E2E2;
		color:#494949;
		height:25px;
	}
	.approvalBtnDiv {
		text-align:right;
	}
	#approvalBtn, #afterReadBtn {
		background-color:white;
		width:80px;
		height:30px;
		color: #0871B9;
		font-size:15px;
		border:1px solid #0871B9;
	}
	#submitTempBtn {
		background-color:#0871B9;
		width:80px;
		height:30px;
		color: white;
		font-size:15px;
		border-radius:5px;
		border:1px solid #0871B9;
	}
	#modifyTempBtn {
		background-color:#FFC462;
		width:80px;
		height:30px;
		color: white;
		font-size:15px;
		border-radius:5px;
		border:1px solid #FFC462;
	}
	#appModalTab td {
		padding:1em;
	}
	#listBtn, #printBtn {
		background-color:white;
		border:1px solid #c4c4c4;
		height:30px;
		width:80px;
	}
	.note-editable { background-color: white !important; }
	
	.downloadTd {
		cursor:pointer;
	}
	.textDiv {
		border:1px solid #c4c4c4;
	}
	.empNameSpan {
		border-radius:5px;
		background-color:#E4E4E4;
		height:22px;
		padding: 2px 18px 2px 18px;
		line-height:18px;
		margin:5px 4px 3px 0;
		font-size:12px;
		text-align:center;
	}
	#enrollDateDiv, .adocEnroll {
		display:inline-block;
		width:110px;
		white-space:nowrap;
		overflow:hidden;
		line-height:10px;
	}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../approval/approvalMenubar.jsp"/>
		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->
		<c:set var="lineTurn" value="0"/>
		<div class="content">
			<br>
			<div style="text-align:right;">
				<button type="button" id="printBtn" onclick="goPrint();" style="margin-right:3px;"><img src="${ contextPath }/resources/images/approval/technology.png" style="width:18px; height:18px; vertical-align:top;"><span style="padding-left:6px;">인쇄</span></button>
				<button type="button" id="listBtn" onclick="goBack();" style="margin-right:30px;"><img src="${ contextPath }/resources/images/menubar/open-menu.png" style="width:14px; height:17px; vertical-align:top;"><span style="padding-left:6px;">목록</span></button>
			</div>
			<br>
			<div class="contentDiv" style="border: 0px; width:850px; margin:auto;">
			  <div id="printDiv"> 
				<div>
					<h3 style="text-align:center;">${ adoc.formName }</h3>
					<hr>
				</div>
				<div class="lineDiv">
					<table class="sgnLine">
						
						<tr>
							<td rowspan="3" class="greyTd">결재</td>
							<c:forEach var="s" items="${ stepList }">
								<td class="greyTd" style="height:25px; font-size:12px;">${s.positionName }</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="l" items="${ logList }">
								<c:if test="${ l.appResult == 5 }">
										<c:set var="delegate" value="true"/>
								</c:if>
							</c:forEach>
							<c:forEach var="s" items="${ stepList }">
								<c:if test="${ s.stepNum eq 0 }">
									<td style="height:45px;"><img src="${ contextPath }/resources/images/approval/submit.png" style="height:30px; width:30px;"></td>
								</c:if>
								<c:if test="${ s.stepNum ne 0 }">
									<td style="height:45px;">
									
									<c:set var="loop_flag" value="false"/>
									<c:forEach var="l" items="${ logList }">
										<c:if test="${l.empNo == s.empNo &&  (l.appResult == 1 || l.appResult == 5) }">
											<img src="${ contextPath }/resources/images/approval/approval.png" style="height:30px; width:30px;">
											<c:set var="loop_flag" value="true"/>
											<c:set var="appRes" value="5"/>
										</c:if>
										
										<c:if test="${l.appResult == 5}">
											<c:set var="appRes" value="4"/>
										</c:if>
									</c:forEach>
									<c:if test="${ delegate == true && loop_flag == false && appRes == 4 }">
										<div style="background-size:100% 100%; width:100%; height:100%;"><img src="${ contextPath }/resources/images/approval/slash.png" style="width:59px; height:45px;"></div>
									</c:if> 
									</td>
								</c:if>
								<c:if test="${ s.empNo == loginUser.empNo }">
									<c:set var="lineTurn" value="${ s.stepNum }"/>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="s" items="${ stepList }">
								<td style="height:15px; font-size:10px;">${ s.empName }</td>
							</c:forEach>
						</tr>
					</table>
					<br>
						<!-- 합의 테이블 -->
						<%-- <table class="sgnLine">
							<tr>
								<td rowspan="3" class="greyTd">합의</td>
								<td class="greyTd" style="height:25px; font-size:12px;">대리</td>
							</tr>
							<tr>
								<td style="height:45px;"><img src="${ contextPath }/resources/images/approval/approval.png" style="height:30px; width:30px;"></td>
							</tr>
							<tr>
								<td style="height:15px; font-size:10px;">김철수</td>
							</tr>
						</table> --%>
					<br>
				</div>
				
				<div class="detailDiv">
					<table  class="detailTab" style="width:100%;">
						<tr>
							<td style="width:150px;" class="greyTd">문서번호</td>
							<td style="width:250px;">${ adoc.docName }</td>
							<td class="greyTd">기안일자</td>
							<td><div id="enrollDateDiv">${ adoc.enrollDate }</div></td>
						</tr>
						<tr>
							<td class="greyTd">기안자</td>
							<td>${ adoc.empName }</td>
							<td class="greyTd">기안부서</td>
							<td>${ adoc.deptName }</td>
						</tr>
						<tr>
							<td class="greyTd">참조자</td>
							<td>
								<c:forEach var="p" items="${ peruseList }">
									<c:if test="${ p.perKind == 1 }">
										<span class="empNameSpan">${ p.empName } ${ p.positionName }</span>
									</c:if>
								</c:forEach>
							</td>
							<td class="greyTd">열람자</td>
							<td>
								<c:forEach var="p" items="${ peruseList }">
									<c:if test="${ p.perKind == 0 }">
										<span class="empNameSpan">${ p.empName } ${ p.positionName }</span>
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td class="greyTd">문서제목</td>
							<td colspan="3">${ adoc.docTitle }</td>						
						</tr>
					</table>
				</div>
				<div class="textDiv">
					<!-- <textarea id="summernote" name="editordata"></textarea> --> 
					<div style="margin:8px;">${adoc.docContent }</div>
				</div>
				<br>
			  </div>
				<div class="refFileDiv">
					<table class="refFileTab" style="width:100%;">
						<tr>
							<td colspan="3" class="deepGreyTd"><img src="${ contextPath }/resources/images/approval/attachment.png" style="width:15px; height:15px;">&nbsp;첨부파일</td>
						</tr>
						<c:if test="${ empty attachList }">
							<tr>
								<td rowspan="3"><div style="text-align:center; line-height:50px; color:#a5a5a5;">첨부파일이 없습니다.</div></td>
							</tr>
						</c:if>
						<c:if test="${ !empty attachList }">
						<c:forEach var="a" items="${ attachList }">
							<tr>
								<input type="hidden" value="${ a.attachmentNo }">
								<td style="width:350px;">${ a.originName }</td>
								<td style="width:100px;">
									<c:choose>
										<c:when test="${a.fileSize >= 1024*1024 }">
											<fmt:formatNumber value="${ a.fileSize / (1024*1024) }" pattern=".00"/> MB
										</c:when>
										<c:when test="${a.fileSize >= 1024}">
											<fmt:formatNumber value="${ a.fileSize / 1024 }" pattern=".00"/> KB
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${ a.fileSize }" pattern=".00"/> byte
										</c:otherwise>
									</c:choose>
									
								</td>
								<td class="downloadTd">
									<img src="${contextPath }/resources/images/approval/down-arrow.png" style="width:15px; height:15px;">
								</td>
							</tr>
						</c:forEach>
						</c:if>
							<!-- <td style="width:200px;">이번년도매출금액.xlsx</td>
							<td>92Kb</td> -->
					</table>		
				</div>
				<br><br>
				<div class="appLogDiv">
					<table class="appLogTab" style="width:100%">
						<tr>
							<td colspan="3" class="deepGreyTd">결재로그</td>
						</tr>
						<c:if test="${ adoc.docStatus != 0 }">
							<tr>
								<td style="width:180px;">[<div class="adocEnroll">${ adoc.enrollDate }</div>]</td>
								
								<td style="width:160px;">${adoc.deptName} ${ adoc.empName } ${ adoc.positionName }</td>
								<td style="color:#0871B9;">제출</td>
							</tr>
						</c:if>
						<c:if test="${ adoc.docStatus == 0 }">
							<tr>
								<td rowspan="3"><div style="text-align:center; line-height:50px; color:#a5a5a5;">결재로그가 없습니다.</div></td>
							</tr>
						</c:if>
						<c:forEach var="l" items="${ logList }" >
							<tr>
								<td style="width:180px;">[<div class="adocEnroll">${ l.appDate }</div>]</td>
								
								<c:if test="${ l.absenceStatus == 'n' }">
									<td style="width:200px;">${l.deptName} ${ l.empName } ${ l.positionName }</td>
								</c:if>
								<c:if test="${ l.absenceStatus == 'y' }">
									<td style="width:200px;"><div>${l.deptName} ${ l.empName } ${ l.positionName }</div><div style="font-size:12px;">(대결 : ${ l.autDeptName } ${ l.autEmpName } ${ l.autPositionName })</div></td>
								</c:if>
								<c:if test="${l.appResult == 1}">
									<td style="color:#0871B9;">승인</td>
								</c:if>
								<c:if test="${l.appResult == 2}">
									<td style="color:#FFC462;">반려</td>
								</c:if>
								<c:if test="${l.appResult == 3}">
									<td style="color:#FFC462;">보류</td>
								</c:if>
								<c:if test="${l.appResult == 4}">
									<td style="color:#5E5E5E;">후열</td>
								</c:if>
								<c:if test="${l.appResult == 5}">
									<td style="color:#0871B9;">전결</td>
								</c:if>
							</tr>
						</c:forEach>
						<!-- <tr>
							<td>[2020-03-18 10:35:57]</td>
							<td>총무팀 박해영 과장</td>
							<td style="color:#0871B9;">제출</td>
						</tr> -->
					</table>
				</div>
				<br><br>
				<div class="appOpinionDiv">
					<table class="appOpinionTab" style="width:100%">
						<tr>
							<td colspan="2" class="deepGreyTd">결재의견</td>
						</tr>
						<c:if test="${ adoc.docStatus == 0 }">
							<tr>
								<td rowspan="2"><div style="text-align:center; line-height:50px; color:#a5a5a5;">결재의견이 없습니다.</div></td>
							</tr>
						</c:if>
						<c:if test="${ adoc.draftOpinion != null }">
							<tr>
								<td style="width:200px;">${adoc.deptName} ${ adoc.empName } ${ adoc.positionName } :</td>
								<td>${adoc.draftOpinion }</td>
							</tr>
						</c:if>
						<c:forEach var="l" items="${ logList }">
							<c:if test="${ l.appOpinion != null }">
								<tr>
									<td style="width:200px;">${l.deptName} ${ l.empName } ${ l.positionName } :</td>
									<td>${ l.appOpinion }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				
			<br><br>
			<form action="insertApprovalVo.ap" id="approvalForm" method="post">
				<input type="hidden" name="formNo" id="formNo" value="${adoc.formNo }">
				<input type="hidden" name="docNo" id="docNo" value="${ adoc.docNo }">
				<input type="hidden" name="appResult" id="appResult">
				<input type="hidden" name="appOpinion" id="appOpinion">
				<input type="hidden" name="appDate" id="appDate">
				<input type="hidden" name="empNo" id="empNo">
				<input type="hidden" name="lineNo" id="lineNo" value="${ adoc.lineNo }">
				<input type="hidden" name="absenceStatus" id="absenceStatus">
				<input type="hidden" name="autEmpNo" id="autEmpNo">
			</form>
			<form action="insertAfterRead.ap" id="afterReadForm" method="post">
				<input type="hidden" name="perNo" id="perNo">
				<input type="hidden" name="docNo" value="${ adoc.docNo }">
				<input type="hidden" name="appType" value="1">
				<input type="hidden" name="appResult" value="4">
				<input type="hidden" name="appDate" id="appDate_AR">
				<input type="hidden" name="empNo" value="${ loginUser.empNo }">
				<input type="hidden" name="absenceStatus" value="n">
			</form>
			<form action="updateApprovalDocument.ap" id="submitTempForm" method="post">
				<input type="hidden" name="docNo" value="${ adoc.docNo }">
				<input type="hidden" name="enrollDate" id="enrollDate">
				<input type="hidden" name="draftOpinion" id="draftOpinion"> 
				<input type="hidden" name="docUrgent" id="docUrgent">
				<input type="hidden" name="docStatus" value="1">
			</form>
			<div class="approvalBtnDiv">
				<c:if test="${currentEmp == loginUser.empNo  or autEmp == loginUser.empNo or (adoc.docDelegate == 1 and line.lineTurn < lineTurn) }">
					<button type="button" id="approvalBtn">결재</button>
				</c:if>
				<c:forEach var="p" items="${ peruseList }">
					<c:if test= "${ p.perKind == 2 and p.empNo == loginUser.empNo and p.readStatus == null }">
						<c:set var="perNo" value="${ p.perNo }"/>
						<button type="button" id="afterReadBtn">후열</button>
					</c:if>
				</c:forEach>
				<c:if test="${ adoc.docStatus == 0 }">
					<button type="button" id="modifyTempBtn">수정</button>&nbsp;
					<button type="button" id="submitTempBtn">제출</button>
				</c:if>
			</div>
		</div>
		<!-- 본문 영역 끝 -->
		<jsp:include page="../approval/writeModal.jsp"/>
		<!-- footer 영역 시작 -->
		<!-- <footer class="footer"></footer> -->
		<!-- footer 영역 끝-->
	</div>
	
	 <div class="modal fade" id="approvalModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width:400px; margin-left:100px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h5 class="modal-title" style="color:#0871B9; font-weight:bold;">결재</h5>
        </div>
        <div class="modal-body">
          <div>
          	<table id="appModalTab" style="width:100%; margin-left:20px;">
          		<tr>
          			<td><input type="radio" name="approval" id="approval1" value="1">&nbsp;<label for="approval1">승인</label></td>
          			<td><input type="radio" name="approval" id="approval2" value="2">&nbsp;<label for="approval2">반려</label></td>
          			<td><input type="radio" name="approval" id="approval3" value="3">&nbsp;<label for="approval3">보류</label></td>
          		</tr>
          		<tr>
          			<c:if test="${ adoc.docDelegate == 1 }">
          				<td><input type="radio" name="approval" id="approval5" value="5">&nbsp;<label for="approval5">전결</label></td>
          			</c:if>
          		</tr>
          	</table>
          	<br>
          	<div style="text-align:center;">
          		<textarea id="opinionText" style="resize:none; width:350px; height:100px; background-color:#EDEDED; border:0px;" placeholder="의견을 작성해주세요."></textarea>
          	</div>
          </div>
        </div>
        <div class="modal-footer" style="text-align:center;">
          <button type="button" id="chkApproval" class="btn btn-primary">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="modal fade" id="submitTempModal" role="dialog">
		<div class="modal-dialog" style="width: 450px;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h5 class="modal-title">결재요청</h5>
				</div>
				<div class="modal-body">
					<table id="reqSgnTab">
						<tr>
							<td style="width: 100px;">기안의견</td>
							<td colspan="2"><textarea
									style="resize: none; width: 300px; height: 150px;"
									placeholder="의견을 작성해주세요." name="sgnOpinion" id="sgnOpinion"></textarea></td>
						</tr>
						<tr>
							<td>긴급문서</td>
							<td style="width: 25px;"><input type="checkbox"
								style="width: 20px; height: 20px;" id="isEmergency" name="isEmergency"></td>
							<td style="color: orange; font-weight: bold;"><label for="isEmergency">긴급</label></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="modalSgnBtn">결재요청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
				</div>
			</div>

		</div>
	</div>
	<script>
		
		function goBack() {
			window.history.back();	
		}
		
		function goPrint() {
			var printThis = document.getElementById('printDiv').innerHTML;
			win = window.open('','offprint','width=755 height=526');
			self.focus();
			win.document.open();
			win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
			win.document.write('.printDiv{border: 1px solid black;} .greyTd { background-color : #F7F7F7; }'
								+ 'table {border-collapse:collapse;}'
								+ '.sgnLine {border:1px solid #C4C4C4; text-align:center; } .detailTab, .detailTab td {border:1px solid #C4C4C4;} '
								+ '.sgnLine td { width:60px;  border:1px solid #C4C4C4; } .lineDiv { float:right; } .detailDiv { clear:both; margin-top:200px; width:750px; }'
								+ '.titleTd { width:150px; height:25px; background-color: #F7F7F7; text-align:right; }'
								+ '.personTd { width:250px; } .detailTab { width:100%; margin:auto; overflow:hidden; } .detailTab td { padding:0.5em; }'
								+ '.textDiv { border:1px solid #c4c4c4; width:748px; }'
								+ '#enrollDateDiv { display:inline-block; width:125px; white-space:nowrap; overflow:hidden;}');
			win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
			win.document.write(printThis);
			win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
			win.document.close();
			win.print();
			win.close();	
		}
		
		/* 현재시간을 구하는 함수 */
	    function getTimeStamp() {
	         var d = new Date();
	         var s =
	           leadingZeros(d.getFullYear(), 4) + '-' +
	           leadingZeros(d.getMonth() + 1, 2) + '-' +
	           leadingZeros(d.getDate(), 2) + ' ' +
	
	           leadingZeros(d.getHours(), 2) + ':' +
	           leadingZeros(d.getMinutes(), 2) + ':' +
	           leadingZeros(d.getSeconds(), 2);
	
	         return s;
	       }
	
	      function leadingZeros(n, digits) {
	        var zero = '';
	        n = n.toString();
	
	        if (n.length < digits) {
	          for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	        }
	        return zero + n;
	      }
	      
	      
		$(document).ready(function(){
		    $("#approvalBtn").click(function(){
		        $("#approvalModal").modal();
		    });
		    //multiLine String으로 인한 에러 해결을 위해 Template Literal을 사용
		   	var content = `${adoc.docContent}`;
		   	
		    $('#summernote').summernote('code', content);
		    $('#summernote').summernote('disable');
		    $('#summernote').summernote({
				height : 500, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '' //placeholder 설정
			});
		    
		    
		    $(".downloadTd").click(function(){
		    	var fileNo = $(this).parent().children("input").val();
		    	
		    	location.href = "${contextPath}/downloadAttachment.ap?fileNo=" + fileNo;
		    });
		    
		    var empNo = '${loginUser.empNo}';
		    var currentEmp = '${currentEmp}';
			var line = '${lineTurn}';
			console.log(line);
		    if(empNo != currentEmp && line == 0) {
	    		$("#absenceStatus").val('y');
	    		$("#empNo").val(currentEmp);
	    		$("#autEmpNo").val(empNo);
	    	} else {
	    		$("#empNo").val(empNo);
	    		$("#absenceStatus").val('n');
	    	}
		    
		    $("#chkApproval").click(function(){
		    	var date = getTimeStamp();
		    	//console.log(date);
		    	$("#appDate").val(date);
		    	var result = $("input[name='approval']:checked").val();
		    	//console.log(result);
		    	$("#appResult").val(result);
		    	var text = $("#opinionText").val();
		    	$("#appOpinion").val(text);
		    	
		    	
		    	if(result == null) {
		    		swal({
		    			  title: "",
		    			  text: "결재 방식을 선택해주세요.",
		    			  icon: "warning",
		    			  button: "확인",
		    			});
		    	} else {
		    		$("#approvalForm").submit();
		    	}
		    	
		    });
		    
		    $("#writeBtn").click(function(){
		   		$("#sgnWriteModal").modal();
		   	}); 
		    
		    //후열 클릭 시
		    $("#afterReadBtn").click(function(){
		    	
		    	swal({
					  title: "",
					  text: "후열처리하시겠습니까?",
					  icon: "info",
					  buttons: ["취소", "확인"],
					})
					.then((willDelete) => {
					  if (willDelete) {
						var date = getTimeStamp();
						$("#perNo").val('${perNo}');
						$("#appDate_AR").val(date);
						$("#afterReadForm").submit(); 
					  } 
				});
		    	
		    });
		    
		    //임시저장 문서에서 제출 클릭 시 
		    $("#submitTempBtn").click(function(){
		    	$("#submitTempModal").modal();
		    });
		    
		    $("#modalSgnBtn").click(function(){
		    	var opinion = $("#sgnOpinion").val();
				var isEmer = $("#isEmergency").prop("checked");
				var sendDate = getTimeStamp();
				$("#enrollDate").val(sendDate);
				$("#draftOpinion").val(opinion);

				if(isEmer == false) {
					$("#docUrgent").val(0);
				} else if(isEmer == true) {
					$("#docUrgent").val(1);
				}
				
		    	$("#submitTempForm").submit();
		    });
		    
		    $("#modifyTempBtn").click(function(){
		    	var docNo = ${adoc.docNo};
		    	
		    	location.href = "${contextPath}/modifyTemporary.ap?docNo=" + docNo;
		    	//console.log(${adoc.docNo});
		    });
		});
	</script>	
</div>
</body>
</html>