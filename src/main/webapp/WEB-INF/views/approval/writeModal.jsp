<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.con {
	margin-top: 10px;
}

.search_box {
	border: solid #c4c4c4 0.7px;
	height: 35px;
}

/* ul, ol, li {
	list-style: none;
	font-size: 13px;
}

.tree_box {
	width: 220px;
	margin-top: 10px;
}

.tree_box .title {
	padding: 5px 0 5px 19px;
	background: #f8f8f9;
	border-bottom: 1px solid #ccd3d9;
}

.tree_box .title strong {
	margin-right: 12px;
}

.tree_menu {
	line-height: 18px;
}

.tree_menu strong {
	font-weight: normal;
}

.tree_menu label input {
	vertical-align: -2px;
}

.tree_menu .depth_1 a {
	vertical-align: bottom;
	text-decoration: none;
}

.tree_menu .depth_1 strong {
	padding-left: 19px;
	background:
		url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795)
		no-repeat 0px 2px;
}

.tree_menu .depth_2 li {
	margin-top: -2px;
	background:
		url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E)
		no-repeat 5px 0px;
}

.tree_menu .depth_2 li a em {
	display: inline-block;
	width: 31px;
	height: 11px;
	background:
		url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;
	font-size: 0;
	line-height: 0;
	vertical-align: middle;
}

.tree_menu .depth_2 li a em.on {
	background-position: 0 100%;
}

.tree_menu li.last {
	background: none;
}

.tree_menu li.last {
	background: none;
}

.tree_menu .depth_3 {
	display: none;
	padding-left: 23px;
}

.tree_menu .depth_3 li {
	margin: 0;
	padding: 3px 0 0 14px;
	line-height: 1;
	background:
		url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D)
		no-repeat 0 0;
}

.tree_menu .depth_3 li a {
	display: block;
	padding-left: 15px;
	background:
		url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12)
		no-repeat 0 2px;
}

.msie6 .tree_menu .depth_3 li a {
	display: inline-block;
}

.tree_menu li.end {
	background:
		url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C)
		no-repeat 0 0;
}

.form_tree_menu .depth_1 {
	background:
		url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E)
		no-repeat 5px 5px;
}

.form_tree_menu ul.depth_2 li {
	margin-left: 6px;
	padding-left: 27px;
	background:
		url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6)
		no-repeat 0 5px;
} */
   .search_box {
      border: solid #c4c4c4 0.7px;
      height:35px;
   }
   #selectSgnFormDiv1 {
      text-align:right;
   }
   
   #selectSgnFormDiv2 {
      float:left;
      width:270px;
      height:350px;
      border: solid #c4c4c4 0.7px;
      margin-left:3px;
      margin-right:20px;
      overflow:auto;
   }
   #selectSgnFormDiv3 {
      float:left;
      width:270px;
      height:350px;
      border: solid #c4c4c4 0.7px;
   }
   
   .modal-footer {
      clear:both;
   }
   #detailInf {
      font-weight:bold;
      margin-top:10px;
      margin-left:5px;
      font-size:16px;
   }
   #detailTab {
      border-collapse:separate;
      border-spacing:0 5px;
      margin-left:7px;
      width:260px;
   }
   #detailTab tr {
   	  height:30px;
   }
   #detailTab td {
      width:100px;
   }
   #detailTab select {
      height:25px;
   }
	ul, ol {list-style:none; font-size: 20px;}
		li {list-style:none; font-size: 14px;}

	/* 트리메뉴 */
	.tree_box {width: 265px; height: 400px; /* border: 1px solid #ccd3d9; */ margin: 0 auto;}	
	.tree_box .title { padding:5px 0 5px 19px ;background:#f8f8f9;border-bottom:1px solid #ccd3d9;}
	.tree_box .title strong {margin-right:12px;}
	.tree_menu {line-height: 30px; margin-top: 20px; padding-left: 20px;}
	.tree_menu strong {font-weight:normal;}
	.tree_menu label input {vertical-align:-2px;}
	.tree_menu .depth_1 a {vertical-align:bottom;text-decoration:none;}
	.tree_menu .depth_1 strong, .form_tree_menu .form_depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu .depth_2 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
	.tree_menu .depth_2 li a em {display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu .depth_2 li a em.on {background-position:0 100%;}
	.tree_menu li.last {background:none;}
	.tree_menu li.last {background:none;}
	.tree_menu .depth_3 {display:none;padding-left:23px;}
	.tree_menu .depth_3 li {margin:0;padding:3px 0 0 14px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu .depth_3 li a, .depth_form {display:block;padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu .depth_3 li a {display:inline-block;}
	.tree_menu li.end, .form_tree_menu li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.form_tree_menu .depth_1 {background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 5px;}
	.form_tree_menu ul.depth_2 li {margin-left:6px;padding-left:27px;background:url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6) no-repeat 0 5px;}	
	.con{height: 320px; margin-top: 10px;}
	.depth_3_a {font-size:12px;}
	.form_box { margin-top: 20px; width:250px; height:250px;}
	.form_ul li a {font-size:12px;}
	.form_tree_menu .form_depth_1 strong {
		font-weight:normal;
	}
	.form_tree_menu li .form_ul li {margin:0;padding:3px 0 0 14px; line-height: 25px;background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.form_tree_menu li .form_ul li.end {margin:0;padding:3px 0 0 14px; line-height: 25px;background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	#searchImg {
		width: 20px; 
		height: 20px; 
		margin-left: 3px; 
		cursor:pointer;
	}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="modal fade" id="sgnWriteModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">결재양식선택</h4>
				</div>
				<div class="modal-body">
					<div id="selectSgnFormDiv1">
						<p id="addMostUseForm" style="cursor:pointer; color:#0871B9;">+ 자주쓰는 양식 추가</p>
					</div>
					<div id="selectSgnFormDiv2">
						<div class="search_box">
							<div style="margin: 5px auto; margin-left: 5px;">
								<input type="text" id="formTitle" placeholder="양식제목" style="width: 215px;">
								<img src="${ contextPath }/resources/images/approval/search.png" id="searchImg">
							</div>
						</div> 
						<div class="tree_box">
							<div class="con">
								<ul id="tree_menu1" class="tree_menu">
									
								</ul>
							</div>
						</div>
						<div class="form_box">
							<div class="form_con">
								<ul id="form_tree_menu" class="form_tree_menu">
									<li class="form_depth_1">
										<strong id="searchTitle">
										검색결과
										</strong>
										<ul class="form_ul">
										
										</ul>
									</li>
								</ul>
							</div>
						</div>

					</div>
					<div id="selectSgnFormDiv3">
						<p id="detailInf">상세정보</p>
						<table id="detailTab">
							<tr>
								<td>제목</td>
								<td id="titleTd"></td>
							</tr>
							<tr>
								<td>전사문서함</td>
								<td id="docTd"></td>
							</tr>
							<tr>
								<td>기안부서</td>
								<td>${ loginUser.deptName }</td>
							</tr>
							<tr>
								<td>보존연한</td>
								<td id="termTd"></td>
							</tr>
							<tr>
								<td>전결</td>
								<td id="delegateTd"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="sgnChkBtn">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	<script>
			$(function(){
				
				$(".form_box").hide();
				
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
		                        	$("#tree_menu1").append($top);
		                        }
						}
						 for(var i = 0; i < data.length ; i++){	
		                    	if(data[i].depth == "2"){	   
		                    		
		                    		if(data[i].cboxNo != data.length){	                    			
		                    		var $firstLevel = "<ul class='depth_2'><li><a class='depth_2_a' href='#none'><em>폴더</em>" 
		                    							+ data[i].cboxName + "<input type='hidden' value='"+ data[i].cboxNo + "'>"
		                    							+ "</a><ul class='depth_3'></ul></li></ul>";	                    							
		                    			$("#comTitle").append($firstLevel);
		                    			
		                    			
		                    		}else if(data[i].cboxNo == data.length){
		                    			var $firstLevelEnd = "<ul class='depth_2'><li class='last'><a class='depth_2_a' href='#none'><em>폴더</em>" 
		                    							+ data[i].cboxName + "<input type='hidden' value='"+ data[i].cboxNo + "'>"
		                    							+ "</a><ul class='depth_3'></ul></li></ul>";
		                    			$("#comTitle").append($firstLevelEnd);
		                    		}	                    		
		                    }
					}
					}
				});
				
				$(".depth_2_a").click(function(){
					var cboxNo = $(this).find("input").val();
					//console.log(cboxNo);
					/* 결재 양식 가져오는 AJAX */
					$.ajax({
						type: "POST",
						url: 'selectDocumentFormList.ap',
						data: {cboxNo : cboxNo},
						async: false,
						success: function(data) {
							$(".depth_3").empty();
							for(var key in data) {
								//console.log(data[key]);
								if(data[key].formNo != data.length) {
									var $li = "<li><a class='depth_3_a' href='#none'>" 
	                								+ data[key].formName + "<input type='hidden' value='"+ data[key].formNo + "'>" 
	                			 					+ "</a></li>";	                        	
	                				$(".depth_3").append($li);
								} else if(data[key].formNo == data.length) {
									var $li = "<li class='end'><a class='depth_3_a' href='#none'>" 
        								+ data[key].formName + "<input type='hidden' value='"+ data[key].formNo + "'>" 
        			 					+ "</a></li>";	                        	
        							$(".depth_3").append($li);
								}
							}
						}
					});				
					$(".depth_3_a").click(function(){
						formNo = $(this).find("input").val();
						//console.log(formNo);
						
						//상세정보 불러오기 AJAX
						$.ajax({
							type: "POST",
							url: 'selectOneDocumentForm.ap',
							data: {formNo: formNo},
							async: false,
							success: function(data){
								//console.log(data);
								$("#docTd").text(data.cboxName);
								$("#titleTd").text(data.formName);
								$("#termTd").text(data.formTerm + "년");
								if(data.formDelegate == 0) {
									$("#delegateTd").text("미허용");
								} else if(data.formDelegate == 1) {
									$("#delegateTd").text("허용");
								}
							}
						});
					});
				});
				
				$("#sgnChkBtn").click(function() {
					//console.log(formNo);
					if(formNo == "") {
						swal("양식을 선택해주세요.");
					}else {
						location.href = "${ contextPath }/goWriteForm.ap?formNo=" + formNo; 
					}
				});
				
				$("#addMostUseForm").click(function(){
					//console.log(formNo);
					if(formNo == "") {
						swal("양식을 선택해주세요.");
					}else {
						swal({
							title: "",
							text: "자주쓰는 양식으로 추가하시겠습니까?",
							icon:"info",
							buttons: ["취소", "확인"]
						}).then((YES) => {
							if(YES) {
								//확인 클릭시
								$.ajax({
									type:"POST",
									url: "insertMostUseForm.ap",
									data: {formNo:formNo},
									success:function(data){
										//console.log(data);
										if(data == 1) {
											swal("", "자주쓰는 양식으로 추가되었습니다.", "success");
										} else {
											swal("", "이미 추가된 양식입니다.", "info");
										}
									}
								});
							}else {
								//취소 클릭시
							}
						});	
					}
				});
				
				$("#formTitle").keyup(function(){
					var formTitle = $("#formTitle").val();
					if(formTitle == "") {
						$(".tree_box").show();
						$(".form_box").hide();
					} else {
						$(".tree_box").hide();
						$.ajax({
							type:"POST",
							url:"searchFormName.ap",
							data:{formTitle:formTitle},
							success:function(data) {
								$(".form_ul").empty();
								var idx = 1;
								for(var key in data) {
									//console.log(data[key]);
									var $li = "";
									
									if(idx == data.length){
										$li = "<li class='end'><a class='depth_form' href='#none'>" 
	        								+ data[key].formName + "<input type='hidden' value='"+ data[key].formNo + "'>" 
	        			 					+ "</a></li>";	
									} else {
										$li = "<li><a class='depth_form' href='#none'>" 
	        								+ data[key].formName + "<input type='hidden' value='"+ data[key].formNo + "'>" 
	        			 					+ "</a></li>";
									}
									//console.log(data.length);
									//console.log(idx);
									idx++;
        			 				$(".form_ul").append($li);
								}
								$(".form_box").show();
							}
						});
					}
				});
				
				$(document).on("click", ".depth_form", function(){
					formNo = $(this).find("input").val();

					$.ajax({
						type: "POST",
						url: 'selectOneDocumentForm.ap',
						data: {formNo: formNo},
						async: false,
						success: function(data){
							$("#docTd").text(data.cboxName);
							$("#titleTd").text(data.formName);
							$("#termTd").text(data.formTerm + "년");
							if(data.formDelegate == 0) {
								$("#delegateTd").text("미허용");
							} else if(data.formDelegate == 1) {
								$("#delegateTd").text("허용");
							}
						}
					});
				});
				/* $("#searchImg").click(function(){
					var formTitle = $("#formTitle").val();
					if(formTitle == "") {
						swal("", "양식 제목을 입력하시오.", "info");
					} else {
						//console.log(formTitle);
						$.ajax({
							type:"POST",
							url:"searchFormName.ap",
							data: {formN}
						});
					}
				}); */
			}); 
		</script>
		
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
</body>
</html>