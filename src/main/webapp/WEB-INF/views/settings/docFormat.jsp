<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.contentDiv {
		height:550px;
	}
	
	#docListDiv {
		border:1px solid #ECEFF1;
		height:530px;
		width:300px;
	}
	
	#docFormDetailDiv {
		float:right;
		border:1px solid #ECEFF1;
		height:530px;
		width:530px;	
	}
	ul, ol {list-style:none; font-size: 20px;}
		li {list-style:none; font-size: 14px;}

	/* 트리메뉴 */
	.tree_box {width: 250px; height: 350px;  border: 1px solid #ccd3d9; border-radius:5px; margin: 0 auto; overflow:auto;}	
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
	.con{height: 320px; margin-top: 10px;}
	
	.formLab {
		margin-top:7px;
		margin-left:7px;
	}
	
	#formBtnsDiv {
		margin-top:10px;
		text-align:center;
		margin-bottom:10px;
	}
	
	#addFolderBtn {
		border-radius:5px;
		background-color:#0871B9;
		color:white;
		border: 1px solid #0871B9;
	}
	
	#changeBtn {
		border-radius:5px;
		background-color:#ECEFF1;
		border:1px solid #ECEFF1;
	}
	
	#delBtn {
		border-radius:5px;
		background-color:orange;
		color:white;
		border:1px solid orange;
		
	}
	
	#docFormTab {
		margin-left:15px;
		width:90%;
		border:1px solid #ECEFF1;
		margin:auto;
		text-align:center;
	}
	
	#docFormTab th {
		text-align:center;
	}
	#docFormTab td:nth-child(1) {
		width:30px;
	}
	
	#docFormTab td:nth-child(2) {
		width:250px;
	}
	#docFormTab td:nth-child(3) {
		width:80px;
	}
	#docFormTab td:nth-child(3) {
		width:90px;
	}
	#docFormTab tr:nth-child(1) {
		background-color: #ECEFF1;
	}
	
	#detailBtnsDiv {
		margin-left:7px;
		margin-top:10px;
		margin-bottom:10px;
	}
	
	#addFormBtn {
		border-radius:5px;
		background-color:#0871B9;
		color:white;
		border: 1px solid #0871B9;
	}
	
	#delFormBtn {
		border-radius:5px;
		background-color:#ECEFF1;
		border:1px solid #ECEFF1;
	}
	.depth_3_a { font-size:12px;}
	#modalHeader {
		background-color:#0871B9;
		color:white;
		font-weight:bold;
		height:40px;
	}
	.formNameTd { cursor:pointer; text-align:left; padding-left:50px; }
	
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
			<b class="contentTitle">문서서식 관리</b>
			<br><br>
			<div class="contentDiv" style="border:0px";>
				<div id="docFormDiv">
					<div id="docListDiv" style="float:left;">
						<label class="formLab">문서양식 폴더 목록</label>
						<div id="formBtnsDiv">
							<button id="addFolderBtn">폴더추가</button> &nbsp;
							<button id="changeBtn">수정</button> &nbsp;
							<button id="delBtn">삭제</button> &nbsp;
						</div>
						<div class="tree_box">
							<div class="con">
								<ul id="tree_menu" class="tree_menu">
									
								</ul>
							</div>
						</div>
					</div>
					<div id="docFormDetailDiv">
						<label class="formLab">결재양식</label>
						<div id="detailBtnsDiv">
							<button id="addFormBtn">양식 추가</button> &nbsp;
							<button id="delFormBtn">양식 삭제</button>
						</div>
						<div>
							<table id="docFormTab">
								 <tr>
									<th style="width:30px;"><input type="checkbox" name="chkAll" id="chkAll"></th>
									<th style="width:250px;">제목</th>
									<th style="width:80px;">사용여부</th>
									<th style="width:90px;">전결여부</th>
								</tr>
								<tr>
									<td colspan="4"><hr style="margin-top:1px; margin-bottom:3px;"></td>
								</tr>
							</table>
							<form action="deleteDocumentForm.st" method="post" id="deleteForm">
								<input type="hidden" name="formNoList" id="formNoList">
							</form>
							<form action="selectOneDocumentForm.st" method="post" id="selectOneForm">
								<input type="hidden" name="so_formNo" id="so_formNo">
							</form>
						</div>
					</div>
				
				</div>
			
			
			</div>
			
		</div>
		<!-- 본문 영역 끝 -->


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->
		
		
		<!--  폴더 추가 모달  -->
		<div class="modal fade" id="addFolderModal" role="dialog">
	    <div class="modal-dialog" style="width:300px; height:200px;">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header" id="modalHeader">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h5 class="modal-title">폴더 추가</h5>
	        </div>
	        <div class="modal-body" style="text-align:center;">
	          <br>
	          <form action="insertcboxName.st" method="post" id="fileNameForm">
		         <label>폴더명 : </label>
		         <input type="text" id="cboxName" name="cboxName" placeholder="추가할 폴더명을 입력해주세요." style="font-size:12px; width:180px;height:30px;">
	          </form>
	          <div id="checkDiv" style="margin-top:10px; font-size:12px; height:17px;"></div>
	        </div>
	        <hr style="margin-top:5px;margin-bottom:5px;">
	        <div style="margin:10px; text-align:right;">
	          <button type="button" class="btn btn-primary"  id="addFolderChk" style="height:25px;width:50px;padding:0px;">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" style="height:25px;width:50px;padding:0px;">취소</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	  
	  <!-- 폴더 삭제 모달 -->
	  <div class="modal fade" id="delFolderModal" role="dialog">
	    <div class="modal-dialog" style="width:300px; height:200px;">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header" id="modalHeader">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h5 class="modal-title">폴더 삭제</h5>
	        </div>
	        <div class="modal-body" style="text-align:center;">
	          <br>
	          <form action="deletecboxName.st" method="post" id="fileDeletedForm">
		         <label>삭제할 폴더명 : </label>
				 <select id="removeFolderSelect" name="removeFolderSelect" style="width:100px; height:30px;"></select>
				 <input type="hidden" name="cboxNo" id="cboxNoInput">
	          </form>
	          <div style="margin-top:15px; font-size:12px; height:17px; color:orange;">폴더 내 문서가 있을 경우 삭제되지 않습니다.</div>
	        </div>
	        <hr style="margin-top:5px;margin-bottom:5px;">
	        <div style="margin:10px; text-align:right;">
	          <button type="button" class="btn btn-primary"  id="delFolderChk" style="height:25px;width:50px;padding:0px;">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" style="height:25px;width:50px;padding:0px;">취소</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	  
	   <!-- 폴더 수정 모달 -->
	  <div class="modal fade" id="updateFolderModal" role="dialog">
	    <div class="modal-dialog" style="width:300px; height:200px;">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header" id="modalHeader">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h5 class="modal-title">폴더 수정</h5>
	        </div>
	        <div class="modal-body" style="text-align:center;">
	          <br>
	          <form action="updatecboxName.st" method="post" id="fileUpdateForm">
		         <label>수정 전 폴더명 : </label>
				 <select id="updateFolderSelect" name="updateFolderSelect" style="width:100px; height:30px;"></select>
				 <input type="hidden" name="cboxNo" id="cboxNoInput2">
				 <div style="height:30px;"></div>
				 <label>수정 후 폴더명 : </label>
				 <input type="text" name="cboxName" id="cboxName2" style="width:100px; height:30px;">
	          </form>
	          	 <div id="checkDiv2" style="margin-top:10px; font-size:12px; height:17px;"></div>
	        </div>
	        <hr style="margin-top:5px;margin-bottom:5px;">
	        <div style="margin:10px; text-align:right;">
	          <button type="button" class="btn btn-primary"  id="upFolderChk" style="height:25px;width:50px;padding:0px;">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" style="height:25px;width:50px;padding:0px;">취소</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>


	</div>
	<script>
		$(document).ready(function(){
			var formNo = "";
			/* 전사문서함 가져오는 AJAX */
			$.ajax({
				type:"POST",
				url:'selectCompanyDocList.ap',
				async: false,
				success:function(data) {
					//console.log(data);
					
					for(var key in data) {
						//console.log(data[key]);
						 if(data[key].depth == "1"){
	                        	var $top = "<li class='depth_1'><strong id='comTitle'>" 
	                        					+ data[key].cboxName 
	                        			 + "</strong></li>";	                        	
	                        	$("#tree_menu").append($top);
	                        }
					}
					var idx = 2;
					 for(var i = 0; i < data.length ; i++){	
	                    	if(data[i].depth == "2"){	   
	                    		
	                    		if(idx != data.length){	                    			
	                    		var $firstLevel = "<ul class='depth_2'><li><a class='depth_2_a' href='#none'><em>폴더</em>" 
	                    							+ data[i].cboxName + "<input type='hidden' name='chk' value='"+ data[i].cboxNo + "'>"
	                    							+ "</a><ul class='depth_3'></ul></li></ul>";	                    							
	                    			$("#comTitle").append($firstLevel);
	                    			
	                    			
	                    		}else if(idx == data.length){
	                    			var $firstLevelEnd = "<ul class='depth_2'><li class='last'><a class='depth_2_a' href='#none'><em>폴더</em>" 
	                    							+ data[i].cboxName + "<input type='hidden' value='"+ data[i].cboxNo + "'>"
	                    							+ "</a><ul class='depth_3'></ul></li></ul>";
	                    			$("#comTitle").append($firstLevelEnd);
	                    		}
	                    		
	                    		var option = "<option value='" + data[i].cboxNo + "'>" + data[i].cboxName + "</option>";
	                    		$("#removeFolderSelect").append(option);
	                    		$("#updateFolderSelect").append(option);
	                    		
	                    		idx++;
	                    }
				}
				}
			});
			
			
			var comCboxNo;
			$(".depth_2_a").click(function(){
				var cboxNo = $(this).find("input").val();
				comCboxNo = cboxNo;
				//console.log(cboxNo);
				/* 결재 양식 가져오는 AJAX */
				$.ajax({
					type: "POST",
					url: 'selectDocumentFormListForAdmin.ap',
					data: {cboxNo : cboxNo},
					async: false,
					success: function(data) {
						$(".depth_3").empty();
						$("#docFormTab").empty();
						$("#docFormTab").append('<tr><th><input type="checkbox" name="chkAll"></th><th>제목</th><th>사용여부</th><th>전결여부</th></tr><tr><td colspan="4"><hr style="margin-top:1px; margin-bottom:3px;"></td></tr>');
						var idx= 1;
						for(var key in data) {
							//console.log(data[key]);
							var $li = "";
							var $tr = "";
							var isUse;
                			var isDelegate;
                			
                			if(data[key].formUse == 1) {
                				isUse = "사용";
                			} else {
                				isUse = "미사용";
                			}
                			
                			if(data[key].formDelegate == 1) {
                				isDelegate = "허용";
                			} else {
                				isDelegate = "비허용";
                			}

							if(idx == data.length) {
								
								$li = "<li class='end'><a class='depth_3_a' href='#none'>" 
        							+ data[key].formName + "<input type='hidden' value='"+ data[key].formNo + "'>" 
        			 				+ "</a></li>";
        			 			$tr = "<tr><td><input type='checkbox' name='chk'></td>"
            						+ "<td class='formNameTd'><img src='${contextPath}/resources/images/approval/document.png' style='width:15px; height:15px;'>&nbsp;" 
            						+ data[key].formName + "</td><td>" + isUse + "</td><td>" + isDelegate + "</td><input type='hidden' value='" + data[key].formNo  + "'></tr>";
            						
							} else {
								
								 $li = "<li><a class='depth_3_a' href='#none'>" 
         							+ data[key].formName + "<input type='hidden' value='"+ data[key].formNo + "'>" 
         			 				+ "</a></li>";	
         			 				
								 $tr ="<tr><td><input type='checkbox' name='chk'></td>"
             						+ "<td class='formNameTd'><img src='${contextPath}/resources/images/approval/document.png' style='width:15px; height:15px;'>&nbsp;" 
             						+ data[key].formName + "</td><td>" + isUse + "</td><td>" + isDelegate + "</td><input type='hidden' value='"+ data[key].formNo + "'></tr>"
             						+ "<tr><td colspan='4'><hr style='margin-top:3px; margin-bottom:3px;'></td></tr>";
							}
							idx++;
                			$(".depth_3").append($li);
                			$("#docFormTab").append($tr);
						}
					}
				});
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
			 $("#addFolderBtn").click(function(){
				$("#addFolderModal").modal(); 
			 });
			 $("#delBtn").click(function(){
				 $("#delFolderModal").modal();
			 });
			//폴더 수정
			$("#changeBtn").click(function(){
				$("#updateFolderModal").modal();
			});
			
			 $("#addFolderChk").prop("disabled", true);
			 $("#upFolderChk").prop("disabled", true);
			 $("#cboxName").keyup(function(){
				 var folderName = $("#cboxName").val();
				 $.ajax({
					type: "post",
					url: "folderNameCheck.st",
					data: {"folderName":folderName},
					success: function(data) {
						if(data == 0 && folderName != ''){
							$("#checkDiv").html("사용가능한 폴더명입니다.").css("color","#0871B9");
	 						$("#addFolderChk").prop("disabled", false);    	 						  	 						
	 					}else {
	 						if(folderName == ''){
	 							$("#checkDiv").html("폴더명을 입력해주세요.").css("color","orange");
    	 						$("#addFolderChk").prop("disabled", true);	
	 						} else {
	 							$("#checkDiv").html("폴더가 존재합니다.").css("color","orange");
    	 						$("#addFolderChk").prop("disabled", true);
	 						}
	 						
	 					}
					}
				 });
			 });
			 
			 $("#cboxName2").keyup(function(){
				 var folderName = $("#cboxName2").val();
				 $.ajax({
					type: "post",
					url: "folderNameCheck.st",
					data: {"folderName":folderName},
					success: function(data) {
						if(data == 0 && folderName != ''){
							$("#checkDiv2").html("사용가능한 폴더명입니다.").css("color","#0871B9");
	 						$("#upFolderChk").prop("disabled", false);    	 						  	 						
	 					}else {
	 						if(folderName == ''){
	 							$("#checkDiv2").html("폴더명을 입력해주세요.").css("color","orange");
    	 						$("#upFolderChk").prop("disabled", true);	
	 						} else {
	 							$("#checkDiv2").html("폴더가 존재합니다.").css("color","orange");
    	 						$("#upFolderChk").prop("disabled", true);
	 						}
	 						
	 					}
					}
				 });
			 });
			 $("#addFolderChk").click(function(){
				$("#fileNameForm").submit();				
			 }); 
			 
			 $("#upFolderChk").click(function(){
				var cboxNo = $("#updateFolderSelect option:selected").val();
				$("#cboxNoInput2").val(cboxNo);
				$("#fileUpdateForm").submit(); 
			 });
		
			$("#delFolderChk").click(function(){
				swal({
					  title: "",
					  text: "정말로 폴더를 삭제합니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						 // $("#removeDeptForm").submit();
						 var cboxNo = $("#removeFolderSelect option:selected").val();
						 $("#cboxNoInput").val(cboxNo);
						 $.ajax({
							type:"post",
							url:"delFolderChk.st",
							data: {"cboxNo":cboxNo},
							success:function(data){

								if(data == 0) {
									$("#fileDeletedForm").submit();
								} else {
									swal({
										title:"",
										text:"폴더 내 문서가 존재하여 삭제가 불가능합니다.",
										icon: "warning",
										dangerMode: true
									});
								}
							}
						 });
						 //console.log();
					  } else {
					    swal("취소 되었습니다.");
					  }
					});
			});
			
			$("#addFormBtn").click(function(){
				console.log(comCboxNo);
				if(comCboxNo == null) {
					swal({
						title:"",
						text:"폴더를 선택해주세요.",
						icon:"warning",
						dangerMode:true
					});
				} else {
					location.href="${contextPath}/addDocForm.st?cboxNo=" + comCboxNo;
				}
			});
			
			$(document).on("click", "input[name=chkAll]", function(){

				if($("input[name=chkAll]").prop("checked")){
		            
					$("input[name=chk]").prop("checked",true);	
					
		        }else{
		           
		        	$("input[name=chk]").prop("checked",false);
		        	
		        }
			});
			
			$(document).on("click", ".formNameTd", function(){
				var formNo = $(this).parent().children("input").val();
				$("#so_formNo").val(formNo);
				$("#selectOneForm").submit();
			});
			
			$("#delFormBtn").click(function(){
				var formNoList = new Array();
				
				$("input[name=chk]:checked").each(function(){
					
					var formNo = $(this).parent().parent().children("input").val();
					
					formNoList.push(formNo);
				});
				
				$("#formNoList").val(formNoList);
				
				swal({
					  title: "",
					  text: "정말로 양식을 삭제하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						$("#deleteForm").submit();
					  } 
					});
				
			});
		});
		
	</script>
</body>
</html>