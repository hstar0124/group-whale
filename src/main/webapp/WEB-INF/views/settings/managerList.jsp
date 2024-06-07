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

#pagingDiv{
	width: 100%;
	height: 100px;
	line-height: 100px;
	text-align: center;
	background: white;
	position: absolute;
	bottom: 0px;
}


#memberListTitle {
	width: 100%;
	height: 40px;
	background: white;
}

.managerListBtn {
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

#managerListTable{
	width: 100%;
}
#managerListTable td{
	border-bottom: 1px solid #ccd3d9;
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
		width: 300px;
		border: 1px solid #ccd3d9;
	}
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}

	/* 트리메뉴 */
	.tree_box { width:280px; height:350px; border:1px solid #ccd3d9; margin:0 auto;}
	
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
	}
	#modalManagerTable{
		border: 0;
	}
	#modalManagerTable td{
		border-bottom: 1px solid #c9c9c9;
	}
	
	/* 조직원 모달 스타일 끝 */
	
	
	/* 매니저 삭제 스타일 */

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
	
	#memberListTable{
		width: 100%;
	}
	
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}
	
	#removeManagerBody{
		width: 100%;
	}
	
	/* 매니저 삭제 스타일 끝 */

	#removeManagerTable td{
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
		
			<b class="contentTitle">관리자 설정</b>
			<br><br>
			
			<div class="contentDiv" style="border: 0; border-radius: 10px;">
				
				<div id="memberListDiv">
					<div id="memberListTitle">
						<div id="mlTitle">
							<label id="mlTItleLabel">총 관리자수 : <c:out value="${ managerCount }" /> 명</label>
						</div>
						<div class="managerListBtn" id="removeManager" 
							style="border: 1px solid black; background:white; color:red;">관리자 삭제</div>
						<div class="managerListBtn" id="addManager">관리자 추가</div>
					</div>
					
					<table id="managerListTable">						
						 <thead>
				        <tr>
				          <th><input type="checkbox" name="chkAll"></th><th>이름</th><th>부서</th><th>직책</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach var="m" items="${ managerList }">
							<tr>
								<td><input type="checkbox" name='chk'></td>
								<td><c:out value="${ m.empName }" /><input type="hidden" name="empNo" value="${ m.empNo }"></td>
								<td><c:out value="${ m.deptName }" /></td>
								<td><c:out value="${ m.positionName }" /></td>		
							</tr>				
						</c:forEach>
				       	       
				      </tbody>
					</table>	
					
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width:670px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">조직도</h4>
					</div>
					
					
					
					<form action="insertManager.st" id="managerAddForm">
					<div class="modal-body">
						<div class="modal-body-div" id="modal-body-empList">
							<!-- 트리메뉴-->
							<!-- 마지막 리스트부분에 class="last",class="end" 넣어주세요 -->
							<div class="tree_box">
							    <div class="con">
							        <ul id="tree_menu" class="tree_menu">
							            
							            
							            
							        </ul>
							    </div>
							</div>
							<!--//트리메뉴-->
						</div>
						
						
						<div class="modal-body-div" id="modal-body-chooseList">
							<div id="modal-addListHead-div" class="modal-addList">	
								<label id="model-choose-label" class="model-addList-label">선택</label>
								<label id="model-choose-cancel" class="model-addList-label">X</label>															
							</div>
							<div id="modal-addListbody-div" class="modal-addList">
								<!-- 김범준 대리 | 총무팀 -->
								<table id="modalManagerTable">
									<colgroup>
										<col width="60%" />
										<col width="40%" />
									</colgroup>
									<tr>
										<td>test</td>
										<td>1234</td>
									</tr>
								</table>
							</div>				
							
						</div>
					</div>
					<div class="modal-footer">
					<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addEmpModal"  data-dismiss="modal">확인</button> -->
					<button type="button" class="btn btn-primary" data-toggle="modal" id="myModalSubmit">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					
					</div>
					</form>
					
					
					
				</div>
			</div>
		</div>
		
			
	
		<!-- 조직도 세팅 ajax -->
		<script>
			$(function(){
				
				$("#modalManagerTable tbody").empty();
				
				/* 부서 가져와서 조직도에 추가하는 AJAX */
				$.ajax({
	 				type:"POST",
	 				url :'selectDeptList.st',
	 				async: false,
	 				success:function(data){
	 						                    
	                    //회사이름 생성
	                    for(var key in data){
	                        if(data[key].depth == "1"){
	                        	var $top = "<li class='depth_1'><strong style='font-size: 20px;' class='comTitle'>" 
	                        					+ data[key].deptName 
	                        			 + "</strong></li>";	                        	
	                        	$(".tree_menu").append($top);
	                        }	                        
	                    }
	                    
	                    //부서 생성
	                    for(var i = 0; i < data.length ; i++){	
	                    	if(data[i].depth == "2"){	   
	                    		
	                    		if(data[i].deptNo != 999){	                    			
	                    			var $firstLevel = "<ul class='depth_2'><li><a class='lideptName'><em>폴더</em>" 
	                    							+ data[i].deptName
	                    							+ "</a><ul class='depth_3'></ul></li></ul>";	                    							
	                    			$(".comTitle").append($firstLevel);
	                    			
	                    			//부서 삭제 모달창에도 부서 추가
	                    			var option = "<option value='" + data[i].deptName + "'>" + data[i].deptName + "</option>";
		                    		$("#removeDeptSelect").append(option);
	                    			
	                    		}else if(data[i].deptNo == 999){
	                    			var $firstLevelEnd = "<ul class='depth_2'><li class='last'><a class='lideptName'><em>폴더</em>" 
	                    							+ data[i].deptName
	                    							+ "</a><ul class='depth_3'></ul></li></ul>";
	                    			$(".comTitle").append($firstLevelEnd);
	                    		}	                    		
	                    	}	                    	
	                    }
	                    
	 				}
				});
				
				
				/* 사원 가져와서 조직도에 추가하는 ajax */
				$.ajax({
	 				type:"POST",
	 				url :'selectMemberList.st',
	 				async: false,
	 				success:function(data){
	 					for(key in data){
		 					//console.log(data[key]);
		 					var $member = "<li class='end'><a href='#none'>" + data[key].empName + " " 
		 																	 + data[key].positionName 
		 																	 + "<span style='display: none;'>|" + data[key].deptName + "</span>"
		 																	 + "<span id='empNo' style='display: none;'>|" + data[key].empNo + "</span>"
		 																	 + "</a></li>";
	 						if(data[key].empName != '관리자' && data[key].positionName != '대표이사'){
		 						$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
	 						}
	 					}
	 				}
				});
				
				
				/* 부서명 클릭시 오른쪽 부서원 리스트 세팅하는 ajax */
				$(".lideptName").click(function(){
					var $hiddenSpan = "<span style='display:none;'>" + $(this).html().substr($(this).html().length-3, 3) + "</span>"
					if(!$("#myModal").is(':visible')){
						$("#empListDivBody").find('span').remove();
						$("#empListDivBody").append($hiddenSpan);
					}					
					
				});
				
			}); 
		</script>
		
		<script>
			$("#model-choose-cancel").click(function(){
				$("#modalManagerTable tbody").empty();
			});
			
			
			$(function(){
				
				$("#addManager").click(function(){
						$("#modalManagerTable tbody").empty();
						$("#myModal").modal('show');		
				});
			
				$("#myModalSubmit").click(function(){
					if($("#modalManagerTable tbody").find('td').text() == ''){
						swal("관리자로 설정할 부서원을 선택해주세요.");
					}else {
						$("#managerAddForm").submit();
					}
				});
				
				
				$(".end").click(function(){
					var name = $(this).find('a').text().split("|")[0];
					var dept = $(this).find('a').text().split("|")[1];
					var empNo = $(this).find('a').text().split("|")[2]
					
					var $tr = "<tr><td>" + name + "<input type='hidden' name='empNo' value='" + empNo + "'>" + "</td><td>" + dept + "</td></tr>"
					
						
					$("#modalManagerTable tbody").append($tr);
					/* console.log(name);
					console.log($("#modalManagerTable td").html().substr(0,6)); */
					//같은 사람 추가하는거 막기
					$("#modalManagerTable td").each(function(){
						if($(this).html().substr(0,6) == name){
							if($("#modalManagerTable tbody:last tr:contains(" + name + ")").length > 1){
								$("#modalManagerTable tbody:last tr:contains(" + name + "):last").remove();
							}
						}
					});			
				});			
			});					
			
		</script>


		<!-- 조직도 작동 스크립트 -->
		<script>
		$(document).ready(function() {

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
		
		
		
		
		<!-- 매니저 삭제 확인 모달창 -->
		<div class="modal fade" id="removeEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width:350px; height: 500px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModalLabel">관리자 삭제 알림</h4>
					</div>
					
					
					<form action="removeManager.st" id="removeModalForm">
					<div class="modal-body" id="removeManagerBody">
						<table id="removeManagerTable">
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
						<button type="button" class="btn btn-primary" id="removeManagerBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
					</form>
					
					
					
				</div>
				
				
			</div>
		</div>
		<!-- 매니저 삭제 확인 모달창 끝 -->

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
		 	
		 	$(function(){
		 		var checkCount = 0;
		 		
		 		
		 		
		 	 	$("#removeManager").click(function(){
				 	$("#removeManagerTable tbody").empty();
					
				 	$("input:checkbox[name=chk]:checked").each(function() {
				 		//console.log($(this).parent().parent().find('td').eq(1).text());
				 		//$(this).parent().parent().find('td').eq(0) - 체크박스
				 		//$(this).parent().parent().find('td').eq(1) - 이름
				 		//$(this).parent().parent().find('td').eq(2) - 부서
				 		//$(this).parent().parent().find('td').eq(3) - 직책
				 		var $tr = "<tr><td>" 
				 				 + $(this).parent().parent().find('td').eq(1).html()				 				 
				 				 + "</td><td>" 
				 				 + $(this).parent().parent().find('td').eq(2).html() 
				 				 + "</td><td>" 
				 				 + $(this).parent().parent().find('td').eq(3).html()
				 				 + "</td></tr>";				
				 				 
						$("#removeManagerTable tbody").append($tr);
						
						
				 	});				 
				 	
				 	if(!$("#removeManagerTable tbody").find('td').text() == ''){
					 	$("#removeEmpModal").modal();
				 	}else{
				 		swal('먼저 매니저에서 삭제할 사원을 클릭하세요');
				 	}
				 	
				 	
			 	});
		 	 	
		 	 	
		 	 	$("#removeManagerBtn").click(function(){
		 	 		$("#removeModalForm").submit();	
		 	 	});
			 	
		 	});
		 	
		</script>

</body>
</html>