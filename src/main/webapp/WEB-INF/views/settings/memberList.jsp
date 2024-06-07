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
#memberListDiv {
	width: 800px;
	height: 620px;
	margin: 0 auto;
	position: relative;
}

#memberListTitle {
	width: 100%;
	height: 40px;
	background: white;
}

.memberListBtn {
	float: right;
	width: 100px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	background: #0871B9;
	color: white;
	margin-right: 10px;
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
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

table th{
	border-bottom: 1px solid #0871B9;
	padding: 10px;
	text-align: center;
	height: 40px;
}

table td {
	border-bottom: 1px solid #444444;
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

tbody tr:hover {
	background-color: #c9c9c9;
}

#memberListTable{
	width: 100%;
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

	/* 조직원 추가 모달 스타일 */
	.modal-body{
		width: 750px;
		height: 380px;
	}
	
	.modal-body-div{
		height: 350px;				
		margin-left: 20px;
		float:left;
	}
	
	.model-addList-label{
		height: 50px;
		line-height: 50px;
		margin: 0;
		font-size: 20px;
		color: white;
	}
	
	#model-choose-label{
		margin-left: 10px;
		float: left;
	}
	#model-choose-cancel{
		margin-right: 10px;
		float: right;
	}
	
	#modal-body-empList{
		width: 280px;
	}
	
	#modal-body-chooseList{
		width: 380px;
		border: 1px solid #ccd3d9;
	}
	
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}

	/* 트리메뉴 */
	.tree_box { width:280px; height:350px; border:1px solid #ccd3d9;}
	
	.tree_box .title { padding:5px 0 5px 19px ;background:#f8f8f9;border-bottom:1px solid #ccd3d9;}
	.tree_box .title strong {margin-right:12px;}
	.tree_menu {line-height: 30px; margin-top: 20px; padding-left: 20px;}
	.tree_menu strong {font-weight:normal;}
	.tree_menu label input {vertical-align:-2px;}
	.tree_menu .depth_1 a {vertical-align:bottom;text-decoration:none;}
	.tree_menu .depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu .depth_2 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
	.tree_menu .depth_2 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu .depth_2 li a em.on {background-position:0 100%;}
	.tree_menu li.last {background:none;}
	.tree_menu li.last {background:none;}
	.tree_menu .depth_3 {display:none;padding-left:23px;}
	.tree_menu .depth_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu .depth_3 li a {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu .depth_3 li a {display:inline-block;}
	.tree_menu li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.form_tree_menu .depth_1 {background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 5px;}
	.form_tree_menu ul.depth_2 li {margin-left:6px;padding-left:27px;background:url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6) no-repeat 0 5px;}
	
	.con{height: 320px;}
	
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
		padding-top: 10px;
		padding-left: 10px;
	}
	
	/* 조직원 모달 스타일 끝 */

	/* 조직원 이동 확인 모달창 스타일 */
	#addEmpBody{
		width: 100%;
		height: 400px;
	}
	
	#memberListTable td{
		cursor: pointer;
		border-bottom: 1px solid #c9c9c9;
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
		
			<b class="contentTitle">계정 목록</b>
			<br><br>
			
			<div class="contentDiv" style="border: 0; border-radius: 10px;">
				
				<div id="memberListDiv">
					<div id="memberListTitle">
						<div id="mlTitle">
							<label id="mlTItleLabel">총 계정수 : <c:out value="${ CountMember.allEmp }" /> (휴직한 계정 : <c:out value="${ CountMember.leaveEmp }" />, 삭제된 계정 : <c:out value="${ CountMember.deleteEmp }" />)</label>
						</div>
						<div class="memberListBtn" id="removeEmployee" style="border: 1px solid black; background:white; color:red;">계정 삭제</div>
						<div class="memberListBtn" id="addEmployee" onclick="location.href='addMember.st'">계정 추가
							<!-- <button type="button" class="addAttendantBtn" data-toggle="modal" data-target="#myModal">계정 추가</button> -->
						</div>
					</div>
					
					<table id="memberListTable">						
						<thead>
					        <tr>
					          <th><input type="checkbox" name="chkAll"></th><th>이름</th><th>직위</th><th>직책</th><th>부서</th><th>핸드폰번호</th><th>회원상태</th>
					        </tr>
				      	</thead>
				      <tbody>
				        
				        <c:forEach var="m" items="${ list }">
						<tr>
							<td><input type="checkbox" name='chk'><input type="hidden" name="empNo" id="empNo" value="${ m.empNo }"></td>
							<td><c:out value="${ m.empName }" /></td>
							<td><c:out value="${ m.positionName }" /></td>
							<td><c:out value="${ m.dutyName }" /></td>
							<td><c:out value="${ m.deptName }" /></td>
							<td><c:out value="${ m.phone }" /></td>
							<td><c:out value="${ m.status }" /></td>					
						</tr>				
						</c:forEach>
				       	       
				      </tbody>
					</table>	
					<!-- 페이징 -->
					<div id="pagingDiv" align="center">					
							
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
								<c:url var="blistBack" value="selectMemberListPaging.st">
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
									<c:url var="blistCheck" value="selectMemberListPaging.st">
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
								<c:url var="blistEnd" value="selectMemberListPaging.st">
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
		$(function(){
			$("#memberListTable td").click(function(){
				//console.log('tr');
				//empNo
				//console.log($(this).find('input').eq(1).val());	
				if($(this).html() != $(this).parent().find('td').eq(0).html()){
					var empNo = $(this).parent().find('input').eq(1).val();
					var newWin;
					var setting = "width=850, height=650, top=0, left=200, scrollbars=auto";
					newWin = window.open("${ contextPath }/empInfo.me?empNo=" + empNo, "", setting);
					newWin.focus();					
				}				
			});
		});	
	</script>

	
	
	<!-- 계정 삭제 확인 모달창 -->
	<%-- <div class="modal fade" id="removeEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:350px; height: 500px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">계정 삭제 알림</h4>
				</div>
				<div class="modal-body" id="addEmpBody">
					<table>
						<colgroup>
							<col width="40%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<thead>
							<th>이름</th>
							<th>직책</th>
							<th>부서명</th>
						</thead>			
						<tbody>
							<tr>
								<td>김범준 대리</td>
								<td>미지정</td>
								<td>총무팀</td>							
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 계정 삭제 확인 모달창 끝 --> --%>
	
	<script>
		$("input[name=chkAll]").click(function(){
	        //클릭되었으면
	        if($("input[name=chkAll]").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);			            
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	            $("#removeEmpModalTable tbody").empty();
	        }
	    });
		
		
		$("#removeEmployee").click(function(){
			
			//console.log($("input:checkbox[name=chk]:checked").val() ==	'on');
			if($("input:checkbox[name=chk]:checked").val() == 'on'){
				swal({
					  title: "삭제 확인",
					  text: "계정 삭제시 복구하기 어렵습니다. 정말 삭제하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  
					  	var empNo = "";
						$("input:checkbox[name=chk]:checked").each(function() {
					 		//console.log($(this).next().val());
							empNo += $(this).next().val() + ",";
							
					 	});			
						empNo = empNo.substr(0, empNo.length-1);
						console.log(empNo);
						
						location.href='removeEmp.st?'+empNo;
						
					    swal("계정이 삭제되었습니다.", {
					      icon: "success",
					    });
					    
					  } else {
					    swal("취소되었습니다.");
					  }
				});
			}else {
				
				swal('먼저 삭제할 사원을 체크해주세요.');
				
			}
			
		});
		
	</script>
	
	
		
</body>
</html>