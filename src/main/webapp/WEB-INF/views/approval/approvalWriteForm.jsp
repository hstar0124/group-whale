<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	.addLineDiv {
		width:120px;
		border: 1px solid #0871B9;
		border-radius:7px;
		color: #0871B9;
		height:25px;
		line-height:25px;
		cursor:pointer;
	}
	.plusImg {
		width:12px; 
		height:12px; 
		margin-left:5px;
	}
	.detailDiv {
		clear:both;
		margin-top:200px;
	}
	.titleTd {
		width:200px;
		height:25px;
		background-color: #F7F7F7;
		text-align:right;
	}
	.personTd {
		width:280px;
	}
	.detailTab {
		margin:auto;
	}
	.imgDiv {
		border: 1px solid #0871B9;
		width:22px;
		height:22px;
		float:right;
		margin-right:5px;
		cursor:pointer;
	}
	.textDiv {
		width:804px;
		margin:auto;
	}
	.contentDiv {
		height: 715px;
		overflow:auto;
	}
	.refFileDiv {
		width: 804px;
		margin:auto;
	}
	.refFileTab td:first-child {
		width:680px;
	}
	.greyDiv {
		background-color : #F7F7F7;
		width:804px;
		height:150px;
		overflow:auto;
		
	}
	.refFileTab {
		width:780px;
		margin-left:5px;
		margin-right:5px;
		margin-top:10px;
		height:80px;
	}
	.refFileTab td {
		vertical-align:top;
	}
	.refDocTab {
		height:80px;
	}
	.refDocTab td {
		vertical-align:top;
	}
	.refDocTab td:nth-child(1) {
		width:200px;
	}
	.refDocTab td:nth-child(2) {
		width:200px;
	}
	.refDocTab td:nth-child(3) {
		width:250px;
	}
	.refDocTab td:nth-child(4) {
		width:150px;
	}
	.refDocTab td:nth-child(5) {
		width:100px;
	}
	.addFileDiv {
		width:120px;
		text-align:center;
		height:20px;
		background-color: #0871B9;
		color:white;
		border: 1px solid #0871B9;
		border-radius:5px;
		margin-top:5px;
		margin-left:5px;
		cursor:pointer;
	}
	/* .addFileDiv, .addDocDiv {
		width:120px;
		text-align:center;
		height:20px;
		background-color: #ffffff;
		border: 1px solid #C4C4C4;
		border-radius:5px;
		margin-left:5px;
		cursor:pointer;
	} */
	
	
	#sgnBtn {
		width:80px;
		height:35px;
		background-color:#0871B9;
		border: 1px solid #0871B9;
		color:white;
		border-radius:5px;
		font-size:13px;
	}
	
	#temporaryBtn {
		width:80px;
		height:35px;
		background-color:#FFC462;
		border: 1px solid #FFC462;
		color:white;
		border-radius:5px;
		font-size:13px;
	}
	
	#cancelBtn {
		width:80px;
		height:35px;
		background-color:#E9E9E9;
		border: 1px solid #E9E9E9;
		border-radius:5px;
		font-size:13px;
	}
	.orgChart {
		float:left;
		width:230px;
		height:400px;
		border: 1px solid #C4C4C4;
	}
	.showLineDiv {
		float:right;
		width:500px;
		height:400px;
		overflow:auto;
		/*border:1px solid #c4c4c4;*/
	}
	.lideptName, .lideptName2, .lideptName3 {
		cursor:pointer;
	}
	/* ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;} */

	/* 트리메뉴 */
	/* .tree_box { width:90%; margin:auto;} */
	/*.tree_box .title { padding:5px 0 5px 19px ;background:#f8f8f9;border-bottom:1px solid #ccd3d9;}
	.tree_box .title strong {margin-right:12px;}
	.tree_menu {line-height: 30px; margin-top: 20px; padding-left: 20px;}
	.tree_menu strong {font-weight:normal;}
	.tree_menu label input {vertical-align:-2px;}*/
	.myLine_tree_menu .myLine_depth_1 strong  {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu .depth_1_1 a, .tree_menu .depth_1_2 a, .tree_menu .depth_1_3 a {vertical-align:bottom;text-decoration:none;}
	.tree_menu .depth_1_1 strong, .tree_menu .depth_1_2 strong, .tree_menu .depth_1_3 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu .depth_2_1 li, .tree_menu .depth_2_2 li, .tree_menu .depth_2_3 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
	.tree_menu .depth_2_1 li a em, .tree_menu .depth_2_2 li a em, .tree_menu .depth_2_3 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu .depth_2_1 li a em.on, .tree_menu .depth_2_2 li a em.on, .tree_menu .depth_2_3 li a em.on {background-position:0 100%;}
	
	
	
	/*.tree_menu li.last {background:none;}
	.tree_menu li.last {background:none;}*/
	.tree_menu .depth_3_1, .tree_menu .depth_3_2, .tree_menu .depth_3_3 {display:none;padding-left:23px;}
	.tree_menu .depth_3_1 li, .tree_menu .depth_3_2 li, .tree_menu .depth_3_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu .depth_3_1 li a, .tree_menu .depth_3_2 li a, .tree_menu .depth_3_3 li a {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu .depth_3_1 li a, .msie6 .tree_menu .depth_3_2 li a, .msie6 .tree_menu .depth_3_3 li a {display:inline-block;}
	.tree_menu li.end .myLine_tree_menu li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.form_tree_menu .depth_1_1, .form_tree_menu .depth_1_2,.form_tree_menu .depth_1_3 {background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 5px;}
	.form_tree_menu ul.depth_2_1 li, .form_tree_menu ul.depth_2_2 li, .form_tree_menu ul.depth_2_3 li {margin-left:6px;padding-left:27px;background:url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6) no-repeat 0 5px;}
	.con{height: 320px;} 
	.depth_myLine {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.myLine_tree_menu .myLine_depth_1 strong {font-weight:normal;}
	.myLine_tree_menu li .myLine_ul li {margin:0;padding:3px 0 0 14px; line-height: 25px;background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.myLine_tree_menu li .myLine_ul li.end {margin:0;padding:3px 0 0 14px; line-height: 25px;background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.myLine_tree_menu .depth_1 {background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 5px;}
	.myLine_tree_menu ul.depth_2 li {margin-left:6px;padding-left:27px;background:url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6) no-repeat 0 5px;}	
	.myLine_box {padding-top:20px;} 
	.modal-addList{
		width: 100%;		
	}
	
	#modal-addListHead-div{
		height: 50px;
		background: #1990E1;
	}
	#modal-addListbody-div{
		height: 300px;
		border: 1px solid #ccd3d9;
	}
	#ocLab, #sgLab {
		cursor:pointer;
	}
	#allDeleteBtn, #oneDeleteBtn, #upBtn, #downBtn, #allRefDel, #oneRefDel {
		background-color:white;
		border:1px solid #c4c4c4;
		border-radius:5px;
	}
	/* #showLineTab {
		border-collapse:separate;
		border-spacing:7px;
	} */
	#showLineTab th:nth-child(1) {
		width:50px;
	}
	#showLineTab th:nth-child(2) {
		width:70px;
	}
	#showLineTab th:nth-child(3) {
		width:100px;
	}
	#showLineTab th:nth-child(4) {
		width:100px;
	}
	#showLineTab th:nth-child(5) {
		width:100px;
	}
	#showLineTab td:nth-child(6) {
		width:80px;
	}
	#saveLine {
		font-size:12px;
		height:25px;
		line-height:14px;
		
	}
	#reqSgnTab {
		width:410px;
		margin:auto;
		border-collapse:separate;
		border-spacing:5px;
	}
	select {
		height: 25px; 
		width: 55px;
	}
	.LineTr:hover {
		color:#0871B9;
	}
	#refListTab tr th, #refListTab tr td, #openListTab tr th, #openListTab tr td {
		text-align:center;
		width:100px;
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
		<form action="insertApproval.ap" id="insertForm" method="post" enctype="multipart/form-data">
			<b class="contentTitle" style="font-size: 18px;"></b> <br>
			<br>
			<div class="contentDiv" style="border: 0px;">
				<div>
					<h3 style="text-align: center;">${ form.formName }</h3>
					<input type="hidden" name="formNo" value="${ form.formNo }">
					<input type="hidden" name="enrollDate" id="enrollDate">
					<hr>
				</div>
				<div class="lineDiv">
					<input type="hidden" name="empNo" value="${ loginUser.empNo }">
					<table class="sgnLine">
						<tr id="sgnLineTd1">
							<td rowspan="2" class="greyTd">결재</td>
							<td class="greyTd" style="height: 30px;">${ loginUser.positionName }</td>
						</tr>
						<tr id="sgnLineTd2">
							<td style="height: 45px;">${loginUser.empName }</td>
						</tr>
					</table>
					<br>
					<div class="addLineDiv">
						<img class="plusImg"
							src="${ contextPath }/resources/images/approval/plus.png">
						결재라인 추가
					</div>
				</div>
				<div class="detailDiv">
					<table  class="detailTab" style="width:100%;">
						<tr>
							<td style="width:150px;" class="greyTd">문서번호</td>
							<td style="width:250px;">자동채번</td>
							<td class="greyTd">기안일자</td>
							<td id="dateTd"></td>
						</tr>
						<tr>
							<td class="greyTd">기안자</td>
							<td>${loginUser.empName }</td>
							<td class="greyTd">기안부서</td>
							<td>${ loginUser.deptName }<input type="hidden" name="draftDeptNo" value="${ loginUser.deptNo }"></td>
						</tr>
						<tr>
							<td class="greyTd">참조자</td>
							<td id="refTd"><div id="refEmpDiv" style="float:left; width:220px;"></div><div class="imgDiv" id="refDiv">
									<img src="${ contextPath }/resources/images/approval/add.png"
										style="width: 15px; height: 15px">
								</div></td>
							<td class="greyTd">열람자</td>
							<td id="openTd" style="width:250px;"><div id="openEmpDiv" style="float:left; width:220px;"></div><div class="imgDiv" id="openDiv">
									<img src="${ contextPath }/resources/images/approval/add.png"
										style="width: 15px; height: 15px">
								</div></td>
						</tr>
						<tr>
							<td class="greyTd">문서제목</td>
							<td colspan="3"><input type="text" name="docTitle"
								style="width: 658px; border: none"></td>						
						</tr>
					</table>
				</div>
				<div class="textDiv">
					<textarea id="summernote" name="docContent"></textarea>
				</div>
				<div class="refFileDiv">
					<img
						src="${ contextPath }/resources/images/approval/attachment.png"
						style="width: 15px; height: 15px;"> <label>첨부파일</label> <br>
					<hr style="margin-top: 0px; margin-bottom: 3px;">
					<div class="greyDiv">
						<label style="width: 680px; margin-left: 5px;">파일명</label> 크기
						<hr style="margin-top: 0px; margin-bottom: 3px;">
						<table class="refFileTab">
							<tr>
								<td><input type="file" id="file_0" name="file"></td>
								<td style="width:70px;"></td>
								<td><a href="#this" id="delete" name="delete"><img
									src="${ contextPath }/resources/images/approval/trash.png"
									style="width: 15px; height: 15px;"></a></td>
							</tr>
						</table> 
					</div>
					<div class="addFileDiv" id="addFile">파일추가</div>
					<script>
							
						var gfv_count = 1;
							
						$("#addFile").on("click", function(e){
							e.preventDefault();
							fn_addFile();
						});
						function fn_addFile(){
							var str = "<tr><td><input type='file' id='file_"+ (gfv_count++)+"' name='file'></td>"
									+"<td style='width:70px;'></td><td><a href='#this' name='delete'>"
									+"<img src='${ contextPath }/resources/images/approval/trash.png' style='width: 15px; height: 15px;'></a></td></tr>";
								
							$(".refFileTab").append(str);
							$("a[name='delete']").on("click", function(e){
								e.preventDefault();
								fn_deleteFile($(this));
							});
						}
						function fn_deleteFile(obj) {
							obj.parent().parent().remove();
						}
							
						$(document).on("change", "input[type='file']", function(){
							if($(this).val() != "") {
								var fileSize = this.files[0].size;
								var maxSize = 5 * 1024 * 1024;
								if(fileSize > maxSize) {
									alert("파일 용량이 5MB를 초과했습니다.");
									$(this).val("");
								} 
								
								var str1;
								
								if(fileSize >= 1024 * 1024) {
									str1 = (Math.round(((fileSize / (1024 * 1024)))*100)/100) +"MB";
								}
								else if(fileSize >= 1024) {
									str1 = (Math.round(((fileSize / 1024)) * 100)/100) + "KB";
								}
								else {
									str1 = (Math.round(fileSize)/100) + "byte";
								}
								
								 
								//console.log(str1);
								
								console.log($(this).parent().parent().children("td").eq(1).text(str1));
								$(this).parent().parent().children("td").eq(1).text(str1);
							}	
						});	
					</script>
					<br>
				</div>
				<br>
				<br>
				<div class="btnDiv">
					<div style="float:left;">
						<button type="button" id="temporaryBtn">임시저장</button>
					</div>
					<div style="float:right;">
						<button type="button" id="sgnBtn">결재요청</button>
						<button type="button" id="cancelBtn">취소하기</button>
					</div>
				</div>
			</div>
			<input type="hidden" id="draftOpinion" name="draftOpinion">
			<input type="hidden" id="docUrgent" name="docUrgent">
			<input type="hidden" id="docDelegate" name="docDelegate" value="${ form.formDelegate }">
			<input type="hidden" id="docStatus" name="docStatus">
			<input type="hidden" id="arrEmpNoInput" name="arrEmpNoInput">
			<input type="hidden" id="arrRefEmpNoInput" name="arrRefEmpNoInput">
			<input type="hidden" id="arrOpenEmpNoInput" name="arrOpenEmpNoInput">
		</form>
		
		</div>
		<!-- 본문 영역 끝 -->

		<jsp:include page="../approval/writeModal.jsp"/>
		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>

	<!-- 결재라인 추가 모달 -->
	<div class="modal fade" id="addLineModal" role="dialog">
		<div class="modal-dialog" style="width: 800px;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h5 class="modal-title">결재라인추가</h5>
				</div>
				<div class="modal-body">
					<div class="orgChart">
						<div style="margin-top: 10px;">
							<label id="ocLab"
								style="font-size: 14px; color: #0871B9; margin-left: 40px;">조직도</label>
							<label id="sgLab" style="font-size: 14px; margin-left: 60px;">결재선</label>
							<hr
								style="margin-top: 3px; margin-bottom: 5px; border: 0.7px solid #c4c4c4;">
						</div>
						<div>
							<div class="tree_box">
								<div class="con">
									<ul id="tree_menu2" class="tree_menu">
									</ul>
								</div>
							</div>
							<div class="myLine_box">
								<ul id="myLine_tree_menu" class="myLine_tree_menu">
									<li class="myLine_depth_1">
										<strong id="myLineTitle">
											나의 결재선
										</strong>
										<ul class="myLine_ul">
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="showLineDiv">
					<div style="height:300px; overflow:auto;">
						<div style="float: left;">
							<button id="allDeleteBtn">모두삭제</button>
							<button id="oneDeleteBtn">삭제</button>
						</div>
						<div style="float: right;">
							<button id="upBtn">위로</button>
							<button id="downBtn">아래로</button>
						</div>
						<div style="height: 300px;">
							<table id="showLineTab" style="clear: both;">
								<tr style="height:40px;">
									<th>순번</th>
									<th>구분</th>
									<th>부서명</th>
									<th>이름</th>
									<th>ID</th>
									<th>직급</th>
								</tr>
								<tr>
									<td colspan="6"><hr
											style="margin-top: 0px; margin-bottom: 0px;"></td>
								</tr>
								<tr style="height:40px;">
									<td>1</td>
									<td>기안</td>
									<td>${ loginUser.deptName }</td>
									<td>${ loginUser.empName }</td>
									<td>${ loginUser.empNo }</td>
									<td>${ loginUser.positionName }</td>
								</tr>
								<tr>
									<td colspan="6"><hr
											style="margin-top: 0px; margin-bottom: 0px;"></td>
								</tr>
							</table>
						</div>
					</div>
						<div>
							<br> <br> <input id="saveTxt"
								type="text" style="width: 200px; height: 25px; font-size: 12px;"
								placeholder="저장할 결재선 이름을 적어주세요.">&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="saveLine">저장</button>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="clear: both;">
					<button type="button" class="btn btn-primary" id="completeSgnLine">적용</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>


	<!-- 참조자 모달 -->
	<div class="modal fade" id="refModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h5 class="modal-title">참조자 선택</h5>
				</div>
				<div class="modal-body">
					<div style="float: left; width: 220px; border: 1px solid #c4c4c4;">
						<div class="tree_box" style="height:325px;">
							<div class="con">
								<ul id="tree_menu3" class="tree_menu">

								</ul>
							</div>
						</div>
					</div>
					<div style="float: right; height: 342px;">
						<button type="button" id="allRefDel">모두삭제</button>
						<button type="button" id="oneRefDel">삭제</button>
						<div 
							style="height: 310px; width: 300px; margin-top: 10px; border: 1px solid #c4c4c4;">
							<table id="refListTab" style="width:100%; margin-top:10px; margin-left:-2px;">
								<tr>
									<th>이름</th>
									<th>직위</th>
									<th>부서</th>
								</tr>
								<tr>
									<td colspan="3"><hr
											style="margin-top: 3px; margin-bottom: 3px;"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="clear: both;">
					<button type="button" id="refChkBtn" class="btn btn-primary">적용</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 열람자 모달 -->
	<div class="modal fade" id="openModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h5 class="modal-title">열람자 선택</h5>
				</div>
				<div class="modal-body">
					<div style="float: left; width: 220px; border: 1px solid #c4c4c4;">
						<div class="tree_box" style="height:325px;">
							<div class="con">
								<ul id="tree_menu4" class="tree_menu">
								</ul>
							</div>
						</div>
					</div>
					<div style="float: right; height: 342px;">
						<button id="allOpenDel">모두삭제</button>
						<button id="oneOpenDel">삭제</button>
						<div
							style="height: 310px; width: 300px; margin-top: 10px; border: 1px solid #c4c4c4;">
							
							<table id="openListTab" style="width:100%; margin-top:10px; margin-left:-2px;">
								<tr>
									<th>이름</th>
									<th>직위</th>
									<th>부서</th>
								</tr>
								<tr>
									<td colspan="3"><hr
											style="margin-top: 3px; margin-bottom: 3px;"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="clear: both;">
					<button type="button" id="openChkBtn" class="btn btn-primary">적용</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 결재요청 모달 -->
	<div class="modal fade" id="reqSgnModal" role="dialog">
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
		<div id="fileArea">
			<input type="file" id="thumbnailImg1" name="thumbnailImg1"
				onchange="loadImg(this, 1);" >
		</div>
	</div>
	<script>
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
	      
	      
	      function getDate() {
	    	  var today = new Date();
	    	  
	    	  var year = today.getFullYear(); 	// 년도
	    	  var month = today.getMonth() + 1;		// 월
	    	  month = month >= 10 ? month : '0' + month;
	    	  var date = today.getDate();	//날짜
			  date = date >= 10 ? date : '0' + date;
	    	  
	    	  
	    	  var str = year + "/" + month + "/" + date;
	    	  
	    	  return str;
	      }
	      
		$(document).ready(function() {
			var formContent = `${form.formContent}`;

			$('#summernote').summernote('code', formContent);
			$('#summernote').summernote({
				height : 500, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '' //placeholder 설정
			});
			
			$("#fileArea").hide();

			/* $('.addFileDiv').click(function() {
				$("#thumbnailImg1").click();
			}); */

			$('.addLineDiv').click(function() {
				$("#addLineModal").modal();
			});

			$('#refDiv').click(function() {
				$(".tree_box").show();
				$(".myLine_box").hide();
				$("#refModal").modal();
			});

			$('#openDiv').click(function() {
				$(".tree_box").show();
				$(".myLine_box").hide();
				$("#openModal").modal();
			});

			$('#sgnBtn').click(function() {
				$("#reqSgnModal").modal();
			});
			
			$("#dateTd").text(getDate());
			
			$("#temporaryBtn").click(function() {
				
				swal({
					  title: "",
					  text: "임시저장하시겠습니까?",
					  icon: "info",
					  buttons: ["취소", "확인"],
					})
					.then((willDelete) => {
					  if (willDelete) {
						var sendDate = getTimeStamp();
						$("#enrollDate").val(sendDate);
						$("#enrollDate").val(sendDate);
						$("#draftOpinion").val("");
						$("#docStatus").val(0);
						$("#docUrgent").val(0);
						$("#insertForm").submit();
					  
					  } 
				});
				//var markupStr = $('#summernote').summernote('code');
				//console.log(markupStr);
				
			});
			
			$("#writeBtn").click(function(){
		   		$("#sgnWriteModal").modal();
		   	});
			
			$.ajax({
				type:"POST",
				url:'selectDeptList.st',
				async: false,
				success:function(data) {
					//console.log(data);
					
					//회사이름 생성
                    for(var key in data){
                        //console.log(deptList[key]);
                        if(data[key].depth == "1"){
                        	//console.log(deptList[key].deptName);
                        	var $top = "<li class='depth_1_1'><strong class='comTitle1'>" 
                        					+ data[key].deptName  
                        			 	+ "</strong></li>";
                        	var $top2 = "<li class='depth_1_2'><strong class='comTitle2'>"
                        					+ data[key].deptName
                        				 + "</strong></li>";
                        	var $top3 = "<li class='depth_1_3'><strong class='comTitle3'>"
                        					+ data[key].deptName
                        				 + "</strong></li>" 
                        			
                        	$("#tree_menu2").append($top);
                        	$("#tree_menu3").append($top2);
                        	$("#tree_menu4").append($top3);
                        	
                        }	                        
                    }
					
                  //부서 생성
                    for(var i = 0; i < data.length ; i++){	
                    	if(data[i].depth == "2"){	   
                    		
                    		if(data[i].deptNo != 999){	                    			
                    			var $firstLevel = "<ul class='depth_2_1'><li><a class='lideptName'><em>폴더</em>" 
                    							+ data[i].deptName
                    							+ "</a><ul class='depth_3_1'></ul></li></ul>";	       
                    			
                    			var $firstLevel2 = "<ul class='depth_2_2'><li><a class='lideptName2'><em>폴더</em>" 
                        						+ data[i].deptName
                        						+ "</a><ul class='depth_3_2'></ul></li></ul>";	
                    			
                        		var $firstLevel3 = "<ul class='depth_2_3'><li><a class='lideptName3'><em>폴더</em>" 
            									+ data[i].deptName
            									+ "</a><ul class='depth_3_3'></ul></li></ul>";
                        		
            				    $(".comTitle1").append($firstLevel);
            				    $(".comTitle2").append($firstLevel2);
            				    $(".comTitle3").append($firstLevel3);
                        		
            					
            				
                    			
                    			
                    		}else if(data[i].deptNo == 999){
                    			var $firstLevelEnd = "<ul class='depth_2_1'><li class='last'><a class='lideptName'><em>폴더</em>" 
                    							+ data[i].deptName
                    							+ "</a><ul class='depth_3_1'></ul></li></ul>";
                    			
                    			var $firstLevelEnd2 = "<ul class='depth_2_2'><li class='last'><a class='lideptName2'><em>폴더</em>" 
        							+ data[i].deptName
        							+ "</a><ul class='depth_3_2'></ul></li></ul>";
        						
        						var $firstLevelEnd3 = "<ul class='depth_2_3'><li class='last'><a class='lideptName3'><em>폴더</em>" 
        							+ data[i].deptName
        							+ "</a><ul class='depth_3_3'></ul></li></ul>";
        							
        							
                    			$(".comTitle1").append($firstLevelEnd);
        						$(".comTitle2").append($firstLevelEnd2);
        						$(".comTitle3").append($firstLevelEnd3);
                    		}	                    		
                    	}	                    	
                    }
                  
                    $.ajax({
         				type:"POST",
         				url :'selectMemberList.st',
         				async: false,
         				success:function(data){
         					for(key in data){
        	 					var $member = "<li class='end'><a href='#none'class='depth_3_1_a' style='font-size:12px;'>" + data[key].empName + " " 
        	 																	 + data[key].positionName
        	 																	 +"<input type='hidden' value='"+ data[key].empNo + "'>"
        	 																	 + "</a></li>";
        	 																	 
        	 					var $member2 = "<li class='end'><a href='#none'class='depth_3_2_a' style='font-size:12px;'>" + data[key].empName + " " 
																				 + data[key].positionName
																				 +"<input type='hidden' value='"+ data[key].empNo + "'>"
																				 + "</a></li>";
																				 
								var $member3 = "<li class='end'><a href='#none'class='depth_3_3_a' style='font-size:12px;'>" + data[key].empName + " " 
																				 + data[key].positionName
																				 +"<input type='hidden' value='"+ data[key].empNo + "'>"
																				 + "</a></li>";
																				 
         						if(data[key].empName != '관리자'){
        	 						$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
									$(".lideptName2:contains('" + data[key].deptName + "')").parent().find("ul").append($member2);
									$(".lideptName3:contains('" + data[key].deptName + "')").parent().find("ul").append($member3);
         						}
         					}
         				}
        			});
					
				}
			});
			
			
			//조직도 작동 스크립트
			$('ul.depth_2_1 >li > a').click(function(e) {

				var temp_el = $(this).next('ul');
				var depth_3 = $('.depth_3_1');

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
			
			//조직도 작동 스크립트
			$('ul.depth_2_2 >li > a').click(function(e) {

				var temp_el = $(this).next('ul');
				var depth_3 = $('.depth_3_2');

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
			
			//조직도 작동 스크립트
			$('ul.depth_2_3 >li > a').click(function(e) {

				var temp_el = $(this).next('ul');
				var depth_3 = $('.depth_3_3');

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
			
			var arrEmpNo = new Array();
			var arrEmpName = new Array();
			var arrPositionName = new Array();
			
			
			arrEmpNo.push("${loginUser.empNo}");
			var index = 2;
			
			var currentClick = "";
			var currentIndex = "";
			
			//결재선 추가에서 사원 클릭시
			$(".depth_3_1_a").click(function(){
				var empNo = $(this).find("input").val();
				//console.log(empNo);
				
				$.ajax({
					type:"POST",
					url:"selectOneMember.ap",
					data:{empNo:empNo},
					success:function(data){
						//console.log(data);
						var flag = true;
						
						for(var i in arrEmpNo) {
							if(empNo == arrEmpNo[i]) {
								flag = false;
							}	
						}
						if(flag) {
							var $tr1 = "<tr class='LineTr' style='height:40px;'><td>"+ index + "</td><td>결재</td>"
									+ "<td>" + data.deptName + "</td>"
									+ "<td>" + data.empName + "</td>"
									+ "<td>" + data.empNo + "</td>"
									+ "<td>" + data.positionName + "</td>"
									+"</tr>";
							var $tr2 = "<tr><td colspan='6'><hr style='margin-top:0px; margin-bottom:0px;'></td></tr>";
							$("#showLineTab").append($tr1);
							$("#showLineTab").append($tr2);
							
							arrEmpNo.push(empNo);
							arrEmpName.push(data.empName);
							arrPositionName.push(data.positionName);
							//console.log(arrEmpNo);
							index++;
						} else {
							swal("", "이미 존재하는 사원입니다.", "error");
						}
						
						/* $(".LineTr").click(function(){
							$(".LineTr").css('background-color', 'white');
							$(this).css('background-color', 'AliceBlue');
							currentClick = $(this);
							currentIndex = $(this).children("td:first-child").text();
						}); */
					}
				});
				
			});
			
			//결재선 추가에서 모두 삭제 버튼 클릭시
			$("#allDeleteBtn").click(function(){
				arrEmpNo = new Array();
				arrEmpNo.push("${loginUser.empNo}");
				arrEmpName = new Array();
				arrPositionName = new Array();
				index = 2;
				
				$("#showLineTab").empty();
				var $infoTab = '<tr style="height:40px;">'
					+'<th>순번</th><th>구분</th><th>부서명</th><th>이름</th><th>ID</th><th>직급</th></tr>'
					+'<tr><td colspan="6"><hr style="margin-top:0px; margin-bottom:0px;"></td></tr>'
					+'<tr style="height:40px;"><td>1</td><td>기안</td><td>${ loginUser.deptName }</td>'
					+'<td>${ loginUser.empName }</td><td>${ loginUser.empNo }</td><td>${ loginUser.positionName }</td></tr>'
					+'<tr><td colspan="6"><hr style="margin-top:0px; margin-bottom:0px;"></td></tr>';
					
					
					
				$("#showLineTab").append($infoTab);	
				
			});
			
			$("#oneDeleteBtn").click(function(){
				if(currentClick == "") {
					swal("", "삭제할 사원을 클릭해주세요.", "info");
				} else {
					var $tr = $(currentClick);
					var $nextTr = $tr.next();
					
					if(currentIndex == arrEmpNo.length) {
						currentIndex--;
					} else {
						currentIndex--;
						$tr.nextAll().each(function(index, items){
							var result = $(items).children("td:first-child").text();
							console.log(result);
							if(result != "") {
								$(items).children("td:first-child").text(Number(result) - 1);
							}
						});
					}
					
					$tr.remove();
					$nextTr.remove();
					currentClick = "";
					arrEmpNo.splice(currentIndex, 1);
					arrEmpName.splice(currentIndex - 1, 1);
					arrPositionName.splice(currentIndex - 1, 1);
					
					//console.log(currentIndex);
					
				}
			});
			
			$("#upBtn").click(function(){
				if(currentClick == "") {
					swal("", "이동할 사원을 클릭해주세요.", "info");
				} else {
					if(currentIndex != 2) {
										
					var $tr = $(currentClick);
					var $nextTr = $tr.next();
					$tr.prev().prev().before($tr);
					$nextTr.prev().prev().before($nextTr);
					$tr.children("td:first-child").text(--currentIndex);
					
					var nextLineTr = $tr.next().next();
					
					var result = $(nextLineTr).children("td:first-child").text();
					
					$(nextLineTr).children("td:first-child").text(Number(result) + 1);
					
					var changeNo = arrEmpNo[currentIndex];
					arrEmpNo[currentIndex] = arrEmpNo[currentIndex - 1];
					arrEmpNo[currentIndex - 1] = changeNo;
					
					var changeName = arrEmpName[currentIndex - 1];
					arrEmpName[currentIndex - 1] = arrEmpName[currentIndex - 2];
					arrEmpName[currentIndex - 2] = changeName;
					
					var changePosition = arrPositionName[currentIndex - 1];
					arrPositionName[currentIndex - 1] = arrPositionName[currentIndex - 2];
					arrPositionName[currentIndex - 2] = changePosition;
					} else {
						swal("", "현재 순번보다 위로 불가능합니다.", "info");
					}
				}
			});
			$("#downBtn").click(function(){
				if(currentClick == "") {
					swal("", "이동할 사원을 클릭해주세요.", "info");
				} else {
					if(currentIndex < arrEmpNo.length) {

						var $tr = $(currentClick);
						var $nextTr = $tr.next();

						$nextTr.next().next().after($nextTr);
						$tr.next().next().after($tr);
						$tr.children("td:first-child").text(++currentIndex);
						
						var beforeLineTr = $tr.prev().prev();
						
						var result = $(beforeLineTr).children("td:first-child").text();
						
						$(beforeLineTr).children("td:first-child").text(Number(result) - 1);
						
						var changeNo = arrEmpNo[currentIndex - 1];
						arrEmpNo[currentIndex - 1] = arrEmpNo[currentIndex - 2];
						arrEmpNo[currentIndex - 2] = changeNo;
						
						var changeName = arrEmpName[currentIndex - 2];
						arrEmpName[currentIndex - 2] = arrEmpName[currentIndex - 3];
						arrEmpName[currentIndex - 3] = changeName;
						
						var changePosition = arrPositionName[currentIndex - 2];
						arrPositionName[currentIndex - 2] = arrPositionName[currentIndex - 3];
						arrPositionName[currentIndex - 3] = changePosition;
						
					} else {
						swal("", "현재 순번보다 아래로 불가능합니다.", "info");
					}
				}
			});
			
			$("#sgLab").click(function(){
				var empNo = ${loginUser.empNo};
				$(this).css("color", "#0871B9");
				$("#ocLab").css("color", "black");
				$.ajax({
					type:"POST",
					url:"selectSaveLine.ap",
					data:{empNo:empNo},
					success:function(data) {
						$(".tree_box").hide();
						$(".myLine_ul").empty();

						var idx = 1;
						for(var key in data) {
							
							var $li = "";
							
							if(idx == data.length) {
								$li = "<li class='end'><a class='depth_myLine' href='#none'>" 
    								+ data[key].lineName + "<input type='hidden' value='"+ data[key].lineNo + "'>" 
    			 					+ "</a></li>";	
							} else {
								$li = "<li><a class='depth_myLine' href='#none'>" 
    								+ data[key].lineName + "<input type='hidden' value='"+ data[key].lineNo + "'>" 
    			 					+ "</a></li>";
							}
							
							idx++;
							$(".myLine_ul").append($li);
							
						}
						
						$(".myLine_box").show();
					}
				});
			});
			
			$(document).on("click", ".depth_myLine", function(){
				lineNo = $(this).find("input").val();
				console.log(lineNo);
				
				$.ajax({
					type:"POST",
					url: 'selectOneMyLine.ap',
					data: {lineNo : lineNo},
					success: function(data) {
						
						arrEmpNo = new Array();
						arrEmpNo.push("${loginUser.empNo}");
						arrEmpName = new Array();
						arrPositionName = new Array();
						index = 2;
						
						$("#showLineTab").empty();
						var $infoTab = '<tr style="height:40px;">'
							+'<th>순번</th><th>구분</th><th>부서명</th><th>이름</th><th>ID</th><th>직급</th></tr>'
							+'<tr><td colspan="6"><hr style="margin-top:0px; margin-bottom:0px;"></td></tr>'
							+'<tr style="height:40px;"><td>1</td><td>기안</td><td>${ loginUser.deptName }</td>'
							+'<td>${ loginUser.empName }</td><td>${ loginUser.empNo }</td><td>${ loginUser.positionName }</td></tr>'
							+'<tr><td colspan="6"><hr style="margin-top:0px; margin-bottom:0px;"></td></tr>';
							
						$("#showLineTab").append($infoTab);
						
						for(var key in data) {
							var $tr1 = "<tr class='LineTr' style='height:40px;'><td>"+ index + "</td><td>결재</td>"
										+ "<td>" + data[key].deptName + "</td>"
										+ "<td>" + data[key].empName + "</td>"
										+ "<td>" + data[key].empNo + "</td>"
										+ "<td>" + data[key].positionName + "</td>"
										+"</tr>";
							var $tr2 = "<tr><td colspan='6'><hr style='margin-top:0px; margin-bottom:0px;'></td></tr>";
							$("#showLineTab").append($tr1);
							$("#showLineTab").append($tr2);
					
							arrEmpNo.push(data[key].empNo);
							arrEmpName.push(data[key].empName);
							arrPositionName.push(data[key].positionName);
							//console.log(arrEmpNo);
							index++;
						}
					}
				});
			});
			
			$(document).on("click", ".LineTr", function(){
				$(".LineTr").css('background-color', 'white');
				$(this).css('background-color', 'AliceBlue');
				currentClick = $(this);
				currentIndex = $(this).children("td:first-child").text();
			});
			
			$("#ocLab").click(function(){
				$(this).css("color", "#0871B9");
				$("#sgLab").css("color", "black");
				$(".tree_box").show();
				$(".myLine_box").hide();
			});
			
			$("#saveLine").click(function(){
				var txt = $("#saveTxt").val();
				
				if(txt == "") {
					swal("", "저장할 결재선 이름을 적어주세요.", "info");
				}
				
				if(arrEmpNo.length == 1) {
					swal("","저장할 결재라인을 추가해주세요.", "info");
				} else {
					console.log(arrEmpNo);
					swal({
						title : "",
						text : "결재선을 저장하시겠습니까?",
						icon : "info",
						buttons: ["취소", "확인"],
					})
					.then((willDelete) => {
						if(willDelete) {
							
							var objParams = {
									"saveName" : txt,
									"arrEmpNo" : arrEmpNo
							};
							
							$.ajax({
								type: "POST",
								url: "insertSaveMyLine.ap",
								data: objParams,
								success:function(data){
									$("#saveTxt").val("");
								}
							})
						}
					});
				}
					
				
			});
			
			$("#completeSgnLine").click(function(){
				//console.log($("#selectSgn option:selected").val());
			    /* console.log("----------------");
				console.log(arrEmpNo);
				console.log(arrEmpName);
				console.log(arrPositionName); */
				for(var i in arrEmpName) {
					console.log(arrEmpName[i]);
				}  
				$(".sgnLine").empty();
				$(".sgnLine").append('<table class="sgnLine"><tr id="sgnLineTd1"><td rowspan="2" class="greyTd">결재</td>'
							+'<td class="greyTd" style="height: 30px;">${ loginUser.positionName }</td></tr>'
							+'<tr id="sgnLineTd2"><td style="height: 45px;">${loginUser.empName }</td></tr></table>');
				$("#addLineModal").modal("hide");
				
				for(var i in arrEmpName){
					var $td1 = "<td class='greyTd' style='height: 30px;'>"+ arrPositionName[i] + "</td>";
					var $td2 = "<td style='height:45px;'>" + arrEmpName[i] + "</td>";
					
					$("#sgnLineTd1").append($td1);
					$("#sgnLineTd2").append($td2);
					$("#arrEmpNoInput").val(arrEmpNo);
				}
				
				
				
			});
			
			var arrRefEmpNo = new Array();
			var arrRefEmpName = new Array();
			var arrRefPosition = new Array();
			arrRefEmpNo.push("${loginUser.empNo}");
			
			//참조자 추가에서 사원 클릭시
			$(".depth_3_2_a").click(function(){
				var empNo = $(this).find("input").val();
				//console.log(empNo);
				
				$.ajax({
					type:"POST",
					url:"selectOneMember.ap",
					data:{empNo:empNo},
					success:function(data){
						
						
						var flag = true;
						
						for(var i in arrRefEmpNo) {
							if(empNo == arrRefEmpNo[i]) {
								flag = false;
							}
						}
						
						if(flag) {
							var $div1 = "<tr><td>" + data.empName + "</td><td>" + data.positionName + "</td><td> " + data.deptName + "</td></tr>"
											+"<tr><td colspan='3'><hr style='margin-top: 3px; margin-bottom: 3px; border:1px solid white;'></td></tr>";
							$("#refListTab").append($div1);
							arrRefEmpNo.push(empNo);
							arrRefEmpName.push(data.empName);
							arrRefPosition.push(data.positionName);
						} else {
							swal("", "이미 존재하는 사원입니다.", "error");
						}
						
					}
				}); 
				
			});
			
			//참조자 선택 모달에서 모두삭제 버튼 클릭시
			$("#allRefDel").click(function(){
				arrRefEmpNo = new Array();
				arrRefEmpNo.push("${loginUser.empNo}");
				arrRefEmpName = new Array();
				arrRefPosition = new Array();
				
				$("#refListTab").empty();
				var $infoTab = '<tr>'
					+'<th>이름</th><th>직급</th><th>부서</th></tr>'
					+'<tr><td colspan="3"><hr style="margin-top: 3px; margin-bottom: 3px;"></td></tr>';

				$("#refListTab").append($infoTab);	
			});
			
			//참조자 모달에서 "적용"버튼 클릭시
			$("#refChkBtn").click(function(){
				$("#refEmpDiv").empty();
				for(var i in arrRefEmpName) {
					$("#refEmpDiv").append("<span class='empNameSpan'><span>" + arrRefEmpName[i] + " " + arrRefPosition[i] + "</span></span> &nbsp;");
				}
				
				$("#refModal").modal("hide");
				$("#arrRefEmpNoInput").val(arrRefEmpNo);
			});
			
			
			
			var arrOpenEmpNo = new Array();
			var arrOpenEmpName = new Array();
			var arrOpenPosition = new Array();
			arrOpenEmpNo.push("${loginUser.empNo}");
			
			//열람자 선택에서 사원 클릭 시
			$(".depth_3_3_a").click(function(){
				var empNo = $(this).find("input").val();
				//console.log(empNo);
				
				$.ajax({
					type:"POST",
					url:"selectOneMember.ap",
					data:{empNo:empNo},
					success:function(data){
						
						
						var flag = true;
						
						for(var i in arrOpenEmpNo) {
							if(empNo == arrOpenEmpNo[i]) {
								flag = false;
							}
						}
						
						if(flag) {
							var $div1 = "<tr><td>" + data.empName + "</td><td>" + data.positionName + "</td><td> " + data.deptName + "</td></tr>"
											+"<tr><td colspan='3'><hr style='margin-top: 3px; margin-bottom: 3px; border:1px solid white;'></td></tr>";
							$("#openListTab").append($div1);
							arrOpenEmpNo.push(empNo);
							arrOpenEmpName.push(data.empName);
							arrOpenPosition.push(data.positionName);
						} else {
							swal("", "이미 존재하는 사원입니다.", "error");
						}
						
					}
				}); 
				
			});
			
			//열람자 선택 모달에서 모두삭제 버튼 클릭시
			$("#allOpenDel").click(function(){
				arrOpenEmpNo = new Array();
				arrOpenEmpNo.push("${loginUser.empNo}");
				arrOpenEmpName = new Array();
				arrOpenPosition = new Array();
				
				$("#openListTab").empty();
				var $infoTab = '<tr>'
					+'<th>이름</th><th>직급</th><th>부서</th></tr>'
					+'<tr><td colspan="3"><hr style="margin-top: 3px; margin-bottom: 3px;"></td></tr>';

				$("#openListTab").append($infoTab);	
			});
			
			//열람자 모달에서 "적용"버튼 클릭시
			$("#openChkBtn").click(function(){
				$("#openEmpDiv").empty();
				for(var i in arrOpenEmpName) {
					$("#openEmpDiv").append("<span class='empNameSpan'><span>" + arrOpenEmpName[i] + " " + arrOpenPosition[i] + "</span></span> &nbsp;");
				}
				
				$("#openModal").modal("hide");
				$("#arrOpenEmpNoInput").val(arrOpenEmpNo);
			});
			
			
			
			$("#modalSgnBtn").click(function(){
				var opinion = $("#sgnOpinion").val();
				var isEmer = $("#isEmergency").prop("checked");
				var sendDate = getTimeStamp();
				$("#enrollDate").val(sendDate);
				$("#draftOpinion").val(opinion);
				//$("#EmergencyInput").val(isEmer);
				$("#docStatus").val(1);
				//console.log(isEmer);
				if(isEmer == false) {
					$("#docUrgent").val(0);
				} else if(isEmer == true) {
					$("#docUrgent").val(1);
				}
				
				//console.log($("#docUrgent").val());
				//console.log($("#draftOpinion").val());
				//console.log($("#arrEmpNoInput").val());
				$("#insertForm").submit();
				
			});
			
			$("#writeBtn").click(function(){
		   		$("#sgnWriteModal").modal();
		   	});
			
			$("#cancelBtn").click(function(){
				
			});
		});
	</script>
</body>
</html>