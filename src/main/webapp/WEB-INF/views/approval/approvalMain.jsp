<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>   
   .sg_status {
      border-radius:5px;
      color:white;
      text-align:center;
      width:80px;
   }
   .sgn_wait {
      border-collapse:separate;
      border-spacing:0 5px;
      margin-top:-3px;
   }
   .contentSubTitle {
      font-size:15px;
   }
   .sgn_draft {
      border-collapse:separate;
      border-spacing:0 5px;
      margin-top:-3px;
   }
   .sgn_complete {
      border-collapse:separate;
      border-spacing:0 5px;
      margin-top:-3px;
   }
   .st_complete {
      border-radius:5px;
      background-color:#CDCDCD;
      width:100px;
      color:white;
      text-align:center;
   }
   
   /* .sgn_wait tr:nth-child(3) {cursor:pointer;} */
   .enrollTd {
	   	display:inline-block;
	    width:75px;
	    white-space:nowrap;
	    overflow:hidden;
   }
   .boxListTr {
		cursor:pointer;
	}
	
	.boxListTr:hover {
		color: #0871B9;
	}
	.contentDiv {
		height:150px;
		background-color:white;
		
	}
	.completeDate {
		display:inline-block;
    	width:75px;
		vertical-align:bottom;
    	white-space:nowrap;
    	overflow:hidden;
	}
</style>
<script>
   
   $(document).ready(function() {
      $("#sgnWrite").click(function() {
         $("#sgnWriteModal").modal();
      });
   
      $('ul.depth_2 >li > a').click(function(e) {

          var temp_el = $(this).next('ul');
          var depth_3 = $('.depth_3');

          // 처음에 모두 슬라이드 업 시켜준다.
          depth_3.slideUp(300);
          // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
          depth_3.parent().find('em').removeClass('on');

          if (temp_el.is(':hidden')) {
            temp_el.slideDown(300);
            $(this).find('em').addClass('on').html('하위폴더 열림');
          } else {
            temp_el.slideUp(300);
            $(this).find('em').removeClass('on').html('하위폴더 닫힘');
          }

          return false;

        }); 
         
      
   });   
   
</script>
<script>
	$(function(){
		$('.nav2_approval').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
</script>

</head>
<body>
   <div class="wrap">
   <!-- 메뉴바 include -->
   <jsp:include page="../common/menubar.jsp" />
   <jsp:include page="../approval/approvalMenubar.jsp"/>


      <!-- 본문 영역 시작 -->
      <!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

      <div class="content">
         <b class="contentTitle">전자결재홈</b>
         <br><br>
         <b class="contentSubTitle">결재 대기 문서</b>
         <br><br>
         <div class="contentDiv" style="border:0px;">
            <table class="sgn_wait"style="width:100%; ">
               <tr>
                  <th style="width:100px;">기안일</th>
                  <th style="width:200px;">결재양식</th>
                  <th style="width:50px; text-align:center;">긴급</th>
                  <th style="width:300px;">제목</th>
                  <th style="width:80px;">첨부</th>
                  <th style="width:100px;">기안자</th>
                  <th style="width:100px;">결재상태</th>
               </tr>
               <tr>
                  <td colspan="7"><hr style="margin-top:0px;margin-bottom:2px;"></td>
               </tr>
               <c:if test="${ empty waitList }">
               		<tr>	
               			<td colspan="7" rowspan="3"><div style="text-align:center; line-height:80px; color:#a5a5a5;"> 결재할 문서가 없습니다. </div></td>
               		</tr>
               </c:if>
               <c:if test="${ ! empty waitList }">
	               <c:forEach var="w" items="${ waitList }">
	               <tr class="boxListTr">
	               		<input type="hidden" value="${ w.docNo }">
	               		<td class="enrollTd">${ w.enrollDate }</td>
	               		<td>${ w.formName }</td>
	               		<td style="text-align:center;">
	               			<c:if test="${w.docUrgent eq 1}">
								<img src="${contextPath }/resources/images/approval/alert.png" style="width:17px; height:17px">
							</c:if>
	               		</td>
	               		<td>${ w.docTitle }</td>
	               		<td><img src="${ contextPath }/resources/images/approval/attachment.png" style="width:15px; height:15px;">&nbsp;${ w.fileCount }</td>
	               		<td>${ w.empName }</td>
	               		<td>
	               			<c:if test="${w.docStatus == 1}">
								<div class="sg_status" style="background:#0871B9;">
									진행중
								</div>
							</c:if>
							<c:if test="${w.docStatus == 2 }">
								<div class="sg_status" style="background:#FFC462;">
									반려
								</div>
							</c:if>
							<c:if test="${w.docStatus == 3 }">
								<div class="sg_status" style="background:#CDCDCD;">
									완료
								</div>
							</c:if>
	               		</td>
	               	</tr>
	               	<tr>
	                  <td colspan="7"><hr style="margin-top:0px;margin-bottom:3px; border:1px solid white;"></td>
	               </tr>
	               </c:forEach>
               </c:if>
            </table>
         </div>
         <br><br><br><br><br><br>
         <br>
         <div style="height:30px"></div>
         <b class="contentSubTitle">기안 진행 문서</b>
         <br><br>
         <div class="contentDiv" style="border:0px;">
            <table class="sgn_draft">
               <tr>
                  <th style="width:100px;">기안일</th>
                  <th style="width:200px;">결재양식</th>
                  <th style="width:50px; text-align:center;">긴급</th>
                  <th style="width:300px;">제목</th>
                  <th style="width:80px;">첨부</th>
                  <th style="width:100px;">기안자</th>
                  <th style="width:100px;">결재상태</th>
               </tr>
               <tr>
                  <td colspan="7"><hr style="margin-top:0px;margin-bottom:2px;"></td>
               </tr>
               <c:if test="${ empty proceedList }">
               		<tr>	
               			<td colspan="7" rowspan="3"><div style="text-align:center; line-height:80px; color:#a5a5a5;"> 진행된 문서가 없습니다. </div></td>
               		</tr>
               </c:if>
               <c:if test="${ ! empty proceedList }">
	               <c:forEach var="p" items="${ proceedList }">
	               	<tr class="boxListTr">
	               		<input type="hidden" value="${ p.docNo }">
	               		<td class="enrollTd">${ p.enrollDate }</td>
	               		<td>${ p.formName }</td>
	               		<td style="text-align:center;">
	               			<c:if test="${p.docUrgent eq 1}">
								<img src="${contextPath }/resources/images/approval/alert.png" style="width:17px; height:17px">
							</c:if>
	               		</td>
	               		<td>${ p.docTitle }</td>
	               		<td><img src="${ contextPath }/resources/images/approval/attachment.png" style="width:15px; height:15px;">&nbsp;${ p.fileCount }</td>
	               		<td>${ p.empName }</td>
	               		<td>
	               			<c:if test="${p.docStatus == 1}">
								<div class="sg_status" style="background:#0871B9;">
									진행중
								</div>
							</c:if>
							<c:if test="${p.docStatus == 2 }">
								<div class="sg_status" style="background:#FFC462;">
									반려
								</div>
							</c:if>
							<c:if test="${p.docStatus == 3 }">
								<div class="sg_status" style="background:#CDCDCD;">
									완료
								</div>
							</c:if>
	               		</td>
	               	</tr>
	               	<tr>
	                  <td colspan="7"><hr style="margin-top:0px;margin-bottom:3px; border:1px solid white;"></td>
	               </tr>	
	               </c:forEach>
               </c:if>
            </table>
         </div>
         <br><br><br><br><br><br>
         <br>
         <div style="height:30px"></div>
         
         <b class="contentSubTitle">완료 문서</b>
         <br><br>
         <div class="contentDiv" style="border:0px;">
            <table class="sgn_complete">
               <tr>
                  <th style="width:100px;">기안일</th>
                  <th style="width:200px;">결재양식</th>
                  <th style="width:50px; text-align:center;">긴급</th>
                  <th style="width:300px;">제목</th>
                  <th style="width:80px;">기안자</th>
                  <th style="width:100px;">완료일</th>
                  <th style="width:100px;">결재상태</th>
               </tr>
               <tr>
                  <td colspan="7"><hr style="margin-top:0px;margin-bottom:2px;"></td>
               </tr>
               <c:if test="${ empty completeList }">
               		<tr>	
               			<td colspan="7" rowspan="3"><div style="text-align:center; line-height:80px; color:#a5a5a5;"> 완료된 문서가 없습니다. </div></td>
               		</tr>
               </c:if>
               <c:if test="${ ! empty completeList }">
	               <c:forEach var="c" items="${ completeList }">
	               	<tr class="boxListTr">
	               		<input type="hidden" value="${ c.docNo }">
	               		<td class="enrollTd">${ c.completeDate }</td>
	               		<td>${ c.formName }</td>
	               		<td style="text-align:center;">
	               			<c:if test="${c.docUrgent eq 1}">
								<img src="${contextPath }/resources/images/approval/alert.png" style="width:17px; height:17px">
							</c:if>
	               		</td>
	               		<td>${ c.docTitle }</td>
	               		<td>${ c.empName }</td>
	               		<td class="completeDate">${ c.completeDate }</td>
	               		<td>
	               			<c:if test="${c.docStatus == 1}">
								<div class="sg_status" style="background:#0871B9;">
									진행중
								</div>
							</c:if>
							<c:if test="${c.docStatus == 2 }">
								<div class="sg_status" style="background:#FFC462;">
									반려
								</div>
							</c:if>
							<c:if test="${c.docStatus == 3 }">
								<div class="sg_status" style="background:#CDCDCD;">
									완료
								</div>
							</c:if>
	               		</td>
	               	</tr>
	               	<tr>
	                  <td colspan="7"><hr style="margin-top:0px;margin-bottom:3px; border:1px solid white;"></td>
	               </tr>	
	               </c:forEach>
               </c:if>
            </table>
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
	   	$("#writeBtn").click(function(){
	   		$("#sgnWriteModal").modal();
	   	});
	   	
	   	$(".boxListTr").click(function(){
			var docNo = $(this).children("input").val();
			location.href= "${ contextPath }/goApprovalDetail.ap?docNo=" + docNo; 
		});
   });
   </script>
</body>
</html>