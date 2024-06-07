<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#classListDiv {
	width: 800px;
	height: 620px;
	margin: 0 auto;
	margin-top: 10px;
	position: relative;
}

#pagingDiv{
	width: 100%;
	height: 100px;
	line-height: 100px;
	text-align: center;
	background: white;
	position: absolute;
	bottom: 0px;
}


#classListTitle {
	width: 100%;
	height: 50px;
	background: white;
}

.classListBtn {
	float: right;
	width: 100px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	background: #0871B9;
	color: white;
	margin-right: 10px;
	margin-top: 10px;
	line-height: 30px;
	cursor: pointer;
	border-radius: 5px;
}

#mlTitle {
	float: left;
	width: 450px;
	height: 30px;
	padding-left: 10px;
}

#mlTItleLabel {
	margin-top: 5px;
	font-size: 15px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table th{
	border-bottom: 1px solid #0871B9;
	padding: 10px;
	text-align: center;
	height: 40px;
}

table td {
	border-bottom: 1px solid #D8D8D8;
	padding: 10px;
	text-align: center;
	height: 40px;
}

thead tr {
	background-color: #0871B9;
	color: #ffffff;
}



tbody tr:nth-child(2n) {
	background-color: white;
}

tbody tr:nth-child(2n+1) {
	background-color: white;
}

tbody tr:hover{
	background-color: #c9c9c9;
}

.classListTable{
	width: 100%;
}

.classTitleDiv{
	width: 150px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 15px;
	font-weight: 900;
	border-right:1px solid #D8D8D8;
	float: left;
}

.classTitleDiv:hover {
	color: #0871B9;
}

#addPostionBody{
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 380px;
	height: 150px;
}

.addPositionModalDiv{
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
}
.addPositionInput{
	width: 200px;
	height: 30px;
}
.addPositionLabel{
	width: 75px;
	height: 50px;
	margin: 0;
	margin-right: 30px;
}

#codeCheck{
	width: 100%;
	height: 15px;
	font-size: 12px;
	margin: 0;
	text-align: center;
	padding-left: 40px;	
	color: #53C251;
	/* 불가능시 글씨 색 */
	/* color: red */
}

#positionNameCheck{
	width: 100%;
	height: 15px;
	font-size: 12px;
	margin: 0;
	text-align: center;
	padding-left: 50px;	
	color: #53C251;
	/* 불가능시 글씨 색 */
	/* color: red */
}



#addDutyBody{
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 380px;
	height: 170px;
}

.addDutyModalDiv{
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
}
.addDutyInput{
	width: 200px;
	height: 30px;
}
.addDutyLabel{
	width: 75px;
	height: 50px;
	margin: 0;
	margin-right: 30px;
}

/* 직책 삭제 모달 스타일 */

	.removeDutyLabel{
		width: 100px;
		height: 30px;
	}
	.removeDutyInput{
		width: 150px;
		height: 30px;
	}
	#removeCheck{
		width: 100%;
		height: 30px;
		color:red;
		text-align: center;
	}
/* 직책 삭제 모달 스타일 끝 */

/* 직위 삭제 모달창 */

	.removePositionLabel{
		width: 100px;
		height: 30px;
	}
	.removePositionInput{
		width: 150px;
		height: 30px;
	}
	#removeCheck{
		width: 100%;
		height: 30px;
		color:red;
		text-align: center;
	}
/* 직위 삭제 모달창 끝*/

/* 직위 삭제 모달창 스타일 끝 */

.checkCodeLabel{
	margin-left: 130px;
}

</style>

</head>
<body>

	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="settingsMenu.jsp" />


		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
		
			<b class="contentTitle">클래스 설정</b>
			<br><br>
			
			<div class="contentDiv" style="padding-top: 0px; border: 0; border-radius: 10px;">
				
				<div id="classListDiv">
				
				
					<div id="classListTitle">
						<div>
							<div id="positionDiv" class="classTitleDiv" onclick="changeClass('직위');">직위 관리</div>
							<div id="dutyDiv" class="classTitleDiv" onclick="changeClass('직책');">직책 관리</div>
						</div>
						<div class="classListBtn" id="removeClass" 
							style="border: 1px solid black; background:white; color:red;">코드 삭제</div>
						<!-- <div class="classListBtn" id="addClass" data-toggle="modal" data-target="#addPositionModal">코드 추가</div> -->
						<div class="classListBtn" id="addClass">코드 추가</div>
					</div>
					
					<table id="positionTable" class="classListTable">						
						 <thead>
				        <tr>
				          <th>코드</th><th>직위이름</th><th>소속계정(명)</th>
				        </tr>
				      </thead>
				      <tbody>
				      
				        <c:forEach var="p" items="${ positionList }">
						<tr>
							<td><c:out value="${ p.positionNo }" /></td>
							<td><c:out value="${ p.positionName }" /></td>
							<td><c:out value="${ p.count }" /></td>				
						</tr>				
						</c:forEach>
						
				      </tbody>
					</table>	
					
					<table id="dutyTable" class="classListTable" style="display: none;">						
						<thead>
					        <tr>
					          <th>코드</th><th>직책이름</th><th>소속계정(명)</th>
					        </tr>
				      	</thead>
				      	<tbody>
				      	
					        <c:forEach var="d" items="${ dutyList }">
					        	<c:if test="${ d.dutyNo ne 999}">
								<tr>
									<td><c:out value="${ d.dutyNo }" /></td>
									<td><c:out value="${ d.dutyName }" /></td>
									<td><c:out value="${ d.count }" /></td>				
								</tr>				
								</c:if>
							</c:forEach>	
								       
				      	</tbody>
					</table>
					
					<!-- 페이징 -->
					<div id="pagingDiv">
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
								<c:url var="blistBack" value="classList.st">
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
									<c:url var="blistCheck" value="classList.st">
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
								<c:url var="blistEnd" value="classList.st">
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
			
		</div>
	</div>

	<script>
		
		function changeClass(name){
			//console.log(name);
			if(name == '직책'){
				$("#positionTable").hide();
				$("#dutyTable").show();
				$("#pagingDiv").hide();
			}
			else if(name == '직위'){				
				$("#positionTable").show();
				$("#dutyTable").hide();		
				$("#pagingDiv").show();
			}
		}
		
		
		$(function(){
			$("#addClass").click(function() {
				
				if($("#positionTable").is(":visible")){
					$("#addPositionModal").modal();
				} else if($("#dutyTable").is(":visible")){
					$("#addDutyModal").modal();
				}		
				
			});
			
			$("#removeClass").click(function() {
				if($("#positionTable").is(":visible")){
					$("#removePositionModal").modal();
				} else if($("#dutyTable").is(":visible")){
					$("#removeDutyModal").modal();
				}	
			});
		});
	</script>
	
	
	<!-- 직위 추가 확인 모달창 -->
	<div class="modal fade" id="addPositionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:400px; height: 300px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">직위 추가</h4>
				</div>
				
				<form action="insertPosition.st" id="addPositionForm">
				<div class="modal-body" id="addPostionBody">
					<div class="addPositionModalDiv">
						<label class="addPositionLabel">코드 : </label>
						<input type="text" class="addPositionInput" name="positionNo" id="positionNo">
					</div>
					<div>
						<label id="codeCheck">사용 가능한 코드입니다</label>
					</div>
					<div class="addPositionModalDiv">
						<label class="addPositionLabel">직위명 : </label>
						<input type="text" class="addPositionInput" name="positionName" id="positionName">
					</div>
					<div>
						<label id="positionNameCheck">사용 가능한 직위명입니다</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="addPositionBtn">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
				</form>
				
				
			</div>
		</div>
	</div>
	<!-- 직위 추가 확인 모달창 끝 -->
	
	<script>
		$(function (){
			
			$("#codeCheck").html('');
			var positionNoCheck = 0;
		
			
			$("#positionNo").keyup(function() {
				
				if($("#positionNo").val() != ""){
						//console.log("적합")
						$("#codeCheck").html("");
						$.ajax({
        	 				type:"POST",
        	 				url :'positionNoCheck.st',
        	 				async: false,
        	 				data:{
        	 					"positionNo" : $("#positionNo").val()
        	 				},
        	 				success:function(data){
        	 					//data : 1이면 중복값 존재, 0 이면 중복값 없음
        	 					//console.log("나 에이작스 잘 다녀옴 " + data); 
        	 					if(data == 1){
        	 						$("#codeCheck").html("불가능한 코드입니다.").css("color","red");
        	 						positionNoCheck = 0;
        	 					}else {
        	 						$("#codeCheck").html("사용 가능한 코드입니다.").css("color","#53C251");
        	 						positionNoCheck = 1;
        	 					}
        	 				}
						});					
				}
				
			});
			
			
			$("#positionNameCheck").html('');
			var positionNameCheck = 0;
			
			$("#positionName").keyup(function() {
				
				if($("#positionName").val() != ""){
						//console.log("적합")
						$("#positionNameCheck").html("");
						$.ajax({
        	 				type:"POST",
        	 				url :'positionNameCheck.st',
        	 				async: false,
        	 				data:{
        	 					"positionName" : $("#positionName").val()
        	 				},
        	 				success:function(data){
        	 					//data : 1이면 중복값 존재, 0 이면 중복값 없음
        	 					//console.log("나 에이작스 잘 다녀옴 " + data); 
        	 					if(data == 1){
        	 						$("#positionNameCheck").html("불가능한 직위명입니다.").css("color","red");
        	 						positionNameCheck = 0;
        	 					}else {
        	 						$("#positionNameCheck").html("사용 가능한 직위명입니다.").css("color","#53C251");
        	 						positionNameCheck = 1;
        	 					}
        	 				}
						});					
				}
				
			});
			
			
			$("#addPositionBtn").click(function(){				
				if(positionNoCheck == 1 && positionNameCheck == 1){
					$("#addPositionForm").submit();				
				}else{
					swal('다시 입력해주세요.');
				}	
				
			});
			
		});
	
	</script>
	
		
	
	<!-- 직책 추가 확인 모달창 -->
	<div class="modal fade" id="addDutyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:400px; height: 300px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">직책 추가</h4>
				</div>
				
				<form action="addDuty.st" id="addDutyForm">
				<div class="modal-body" id="addDutyBody">
					<div class="addDutyModalDiv">
						<label class="addDutyLabel">코드 : </label>
						<input type="text" class="addDutyInput" name="dutyNo" id="dutyNo">
					</div>
					<div>
						<label id="dutyCodeCheck" class="checkCodeLabel">사용 가능한 코드입니다</label>
					</div>
					<div class="addDutyModalDiv">
						<label class="addDutyLabel">직책명 : </label>
						<input type="text" class="addDutyInput" name="dutyName" id="dutyName">
					</div>
					<div>
						<label id="dutyNameCheck" class="checkCodeLabel">사용 가능한 직위명입니다</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="addDutyBtn">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
				</form>
				
			</div>
		</div>
	</div>
	<!-- 직책 추가 확인 모달창 끝 -->

	<script>
		$(function(){
			
			var dutyNoCheck = 0;
			$("#dutyCodeCheck").html("");
			
			$("#dutyNo").keyup(function(){
				if($("#dutyNo").val() != ""){
					$("#dutyCodeCheck").html("");
					$.ajax({
						type:"POST",
		 				url :'dutyNoCheck.st',
		 				async: false,
		 				data:{
		 					"dutyNo" : $("#dutyNo").val()
		 				},
		 				success:function(data){
		 					if(data == 1){
		 						$("#dutyCodeCheck").html("불가능한 코드입니다.").css("color","red");
		 						dutyNoCheck = 0;
		 					}else {
		 						$("#dutyCodeCheck").html("사용 가능한 코드입니다.").css("color","#53C251");
		 						dutyNoCheck = 1;
		 					}		 					
		 				}
					});
				}else {
					$("#dutyCodeCheck").html("");
					dutyNoCheck = 0;
				}
			});
			
			
			var dutyNameCheck = 0;
			$("#dutyNameCheck").html("");
			
			$("#dutyName").keyup(function(){
				if($("#dutyName").val() != ""){
					$("#dutyNameCheck").html("");
					$.ajax({
						type:"POST",
		 				url :'dutyNameCheck.st',
		 				async: false,
		 				data:{
		 					"dutyName" : $("#dutyName").val()
		 				},
		 				success:function(data){
		 					if(data == 1){
		 						$("#dutyNameCheck").html("불가능한 직책명입니다.").css("color","red");
		 						dutyNameCheck = 0;
		 					}else {
		 						$("#dutyNameCheck").html("사용 가능한 직챙명입니다.").css("color","#53C251");
		 						dutyNameCheck = 1;
		 					}		 					
		 				}
					});
				}else {
					$("#dutyNameCheck").html("");
					dutyNameCheck = 0;
				}
			});
			
			
			$("#addDutyBtn").click(function(){
				if(dutyNoCheck == 1 && dutyNameCheck == 1){
					$("#addDutyForm").submit();
				}else {
					swal("다시 입력해주세요.");
				}
			});
			
		});
	</script>




	<!-- 직위 삭제 확인 모달창 -->
	<div class="modal fade" id="removePositionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:400px; height: 300px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">직위 삭제</h4>
				</div>
				
				<form action="removePosition.st" id="removePositionForm">
					<div class="modal-body" id="removePositionBody">
						<!-- <div class="addDutyModalDiv">
							<label class="removePositionLabel">코드 : </label>
							<input type="text" class="removePositionInput" id="removePositionInput" value="">
						</div> -->		
						<div class="addDutyModalDiv">
							<label class="removePositionLabel">직위명 : </label>
							<select class="removePositionInput" name="positionName" id="removePositionInput" >
								<c:forEach var="p" items="${ positionList }">
									<option value="${ p.positionName }"><c:out value="${ p.positionName }" /></option>		
								</c:forEach>	
							</select>
						</div>
						<div>
							<label id="removeCheck">삭제하면 복구되지 않습니다.</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="removePositionBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	<!-- 직위 삭제 확인 모달창 끝 -->
	<script>		
		$(function(){			
			$("#removePositionBtn").click(function(){
				$("#removePositionForm").submit();
			});			
		});
	</script>
	
	
	
	
	<!-- 직책 삭제 확인 모달창 -->
	<div class="modal fade" id="removeDutyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:400px; height: 300px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">직책 삭제</h4>
				</div>
				
				<form action="dutyRemove.st" id="dutyRemoveForm">
				<div class="modal-body" id="removeDutyBody">	
					<div class="addDutyModalDiv">
						<label class="removeDutyLabel">직책명 : </label>
						<!-- <input type="text" class="removeDutyInput" name="dutyName"> -->
						<select class="removeDutyInput" name="dutyName">
							 <c:forEach var="d" items="${ dutyList }">
					        	<c:if test="${ d.dutyNo ne 999}">
									<option value="${ d.dutyName }"><c:out value="${ d.dutyName }" /></option>												
								</c:if>
							</c:forEach>	
						</select>
					</div>
					<div>
						<label id="removeCheck">정말 삭제하시겠습니까?</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="dutyRemoveBtn">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>				
				</form>
				
			</div>
		</div>
	</div>
	<!-- 직책 삭제 확인 모달창 끝 -->
	<script>
		$(function(){			
			$("#dutyRemoveBtn").click(function(){
				$("#dutyRemoveForm").submit();
			});
		});
	
	</script>

</body>
</html>