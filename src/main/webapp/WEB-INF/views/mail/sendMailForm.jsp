<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<style>	
 .buttonDiv{width:100%; height:100%;}
 .buttonTable td { cursor: pointer; }
 .mailDiv{width:100%; height:100%;}
 .SendMailTable{ width:100%;  height:100%;}
 .SendMailTable td { padding: 5px; }
 .search { float:right; margin-right:5%;}
 /* .mailTable_td { width: 10%; }   */
 .checkbox{content: '';display: inline-block;width: 18px;height: 18px;line-height: 18px;text-align: center;background: #fafafa;border: 1px solid #cacece;border-radius: 3px;box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);}
.hr-sect {display: flex;flex-basis: 100%;align-items: center;color: black;font-size: 12px;margin: 8px 0px;}
.hr-sect::after {content: "";flex-grow: 1;background: black;height: 1px;font-size: 0px;line-height: 0px;margin: 0px 16px; border:1px solid #DDDDDD}

.sub2_1{
 margin-left:30px;
}
	/* 일정 반복 추가 모달 스타일  */
	.calender-modal-body{
		height: 300px;
	}
	
	/* #calender-repeat-table{
		width: 580px;
		height: 300px;
		margin: 0 auto;		
	} */
	
	#calender-modal-body-title{
		padding-top: 20px;
		width: 100%;
		height: 80px;
	}
	
	.calender-modal-repeatBtn{
		margin-left: 10px;
		margin-top: 10px;
		width: 100px;
		height: 40px;
		line-height: 40px;
		border: 1px solid #0871B9;
		text-align: center;
		float: left;
		border-radius: 5px;
		cursor: pointer;
	}
	
	.calender-modal-repeatBtn:hover{
		background: #0871B9;
		color:white;
		cursor: pointer;
	}
	
	.repeat-div{
		width: 100%;
		height: 210px;
		padding-top: 30px;
	}
	
	.cycle{
		width: 100px;
		height: 30px;
	}
	
	.repeatTable{
		width: 100%;
		height: 170px;		
	}
	
	/* 일정 반복 추가 모달 스타일 끝 */
	/* 참석자 추가 모달 스타일 */
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
	
	#modal-addListbody-div{
		height: 300px;
		border: 1px solid #ccd3d9;
		padding-top: 10px;
		padding-left: 10px;
	}
	
	#modal-body-empList{
		width: 280px;
	}
	
	#modal-body-chooseList{
		width: 300px;
		border: 1px solid #ccd3d9;
	}


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
	}
	
	/* 모달 스타일 끝 */
	
	#modal-addListbody-div{
		height: 300px;
		border: 1px solid #ccd3d9;
		padding-top: 10px;
		padding-left: 10px;
	}
	
	#modalAddMemberTable{
		width: 95%;
		border: 0px;
	}
	#modalAddMemberTable td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	height: 40px;
	}
	.empListBtn1{
	width: 60px;
	height: 25px;		
	background: white;
	border: 1px solid lightgray;
	border-radius: 10px;
	color: black;
	}

	ul, ol {list-style:none; font-size: 20px;
	padding-inline-start:10px;}
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
	
	
	
	
</style>
<script>
	
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	 <jsp:include page="mailMenubar.jsp" />

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->
		<div class="content" style="">
		
		<form method="post" action="sendMail.ml" encType="multipart/form-data" id="sendMail">
		  <div class="contentDiv" style="border:1px solid white;">


				<b class="contentTitle">메일 쓰기</b>
			<div class="search" style="border:1px solid black;">
			<select style="height:25px;">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input type="search" placeholder="검색" style="border:none;">
			<img class="nav1_icons" style="width:20px; height:20px;"
					src="/gw/resources/images/mail/search.png">
			</div>
			
			<hr style="border:1px solid #DDDDDD">

			<div class="buttonDiv" id="btn_group" style="border:1px solid white; margin-left:10px;">
            <table class="buttonTable">
            	<tr>
            		<td style="width:85px;" class="buttonTable_td">
            		<button type="button" id="submitBtn" style="border:0; outline:0; background:white;"><div><img class="nav1_icons" style="width:20px; height:20px;"
					src="/gw/resources/images/mail/send.png">&nbsp;보내기</div></button></td>
					<!-- 임시 저장누르면 임시메일함에 저장  -->
            		<td style="width:100px;" class="buttonTable_td">
            		<button type="button" style="border:0; outline:0; background:white;"><div onclick="location.reload()"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/return.png" >&nbsp;임시저장</div></button></td>
            		<td style="width:100px;" class="buttonTable_td">
            		<!-- 새로고침 -->
            		<button type="button" style="border:0; outline:0; background:white;"><div onclick="location.reload()"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/bin.png">&nbsp;다시쓰기</div></button></td>
            		<%-- <td style="width:100px;"class="buttonTable_td"><div onclick="location.href='${ contextPath }/goPage_IS'"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/reply.png">&nbsp;예약 메일</div></td> --%>
            	</tr>
            </table>
            </div>
           
           <hr style="border:1px solid #DDDDDD">
           
           <div class="mailDiv" style="">
            <table class="SendMailTable" style="">
            	<tr>
            		<td style="width:170px;">받는사람</td>
            		<td><input type="email" size="85px;" name="receiver" id="receiver"></td>
            		<td style="width:150px; text-align:center;"><p><button type="button" style="color:black;" class="empListBtn1" id="empAddBtn1">주소록</button></p></td>
            	</tr>
            	 <tr>
            		<td style="width:170px;">참조</td>
            		<td><input type="text" size="85px;" name="cc"></td>
            		<td style="width:150px; text-align:center;"><p><button type="button" style="color:black;" id="empAddBtn2" class="empListBtn1">주소록</button></p></td>
            	</tr>
            	<tr>
            		<td style="width:170px;">제목</td>
            		<td style="width:150px;"><input type="text" size="85px;" name="mailSubject" id="mailSubject"></td>
            		<td></td>
            	</tr> 
            	<tr>
            		<td style="width:170px;">첨부</td>
            		<td style="width:150px;"><input type="file" multiple="multiple" id="files-upload" size="35" name="file" style="display:none; float:left;"
            				onchange="javascript:document.getElementById('fileName').value = this.value"/>
					<label for="files-upload" style="border:1px solid black;">파일 선택</label>
					<label style="border:1px solid black;" onclick="removeFiles()">모두 삭제</label></td>
            		<td></td>
            	</tr> 
            	
            		

            	
            	
            	<tr>
            		<td></td>
            		<td>
            			<table style="border:1px solid #353535; vertical-align:top" border=1>
            				<tr style="">
            					<td width="600px">파일 이름</td>
            					<td width="100px">파일 용량</td>
            				</tr>
            				<tr>
            					<td width="500px;" height="90px;">
										<ul id="file-list" type="hidden"> 
        <li class="no-items">첨부 파일이 없습니다.</li> 
      									</ul>
								</td>
            					<!-- <td class="file_size"></td> --><td>
            							<ul id="file_size" class="file_size" type="hidden">
            							</ul>
            							</td>
            				</tr>
            			</table>
            		</td>
             				<td></td>
            	</tr> 
            	<tr>
            	<td>내용</td>
            	<td><textarea cols="80" rows="14" id="summernote" name="mailContent"></textarea></td>
            	<td></td>
            	</tr>
           
            </table>
            
            											<!-- 추가할 참석자 모달 영역 -->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModal1Label">
			<div class="modal-dialog" role="document" style="width:670px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title" id="myModal1Label">조직도</h4>
						</div>
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
									<table id="modalAddMemberTable">
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
						<button type="button" class="btn btn-primary myModal1Submit2" data-toggle="modal" >확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
            
           </div>
           </div>

	</form>
	
           </div>
	</div>
	
	
      <script>
        var filesUpload = document.getElementById("files-upload"),
            fileList = document.getElementById("file-list");
            fileSize = document.getElementById("file_size");
        function traverseFiles (files) {
          var li,
          	  li2,
              file,
              fileInfo;
          
          fileList.innerHTML = "";
          fileSize.innerHTML = "";
          for (var i=0, il=files.length; i<il; i++) {
            li = document.createElement("li");
            li2 = document.createElement("li");
            
            
            file = files[i];
           /*  var fileSize = $(".file_size").text(); */
            /*파일 사이즈 MB 소숫점 2째자리까지 계산*/
            dumpsize=file.size/1024;
            dumpsize=(Math.round(dumpsize*100))/100; 
            fileInfo = file.name;
            
            console.log(dumpsize);
			console.log(fileInfo);
            /* $(".file_size").html(dumpsize + " KB</div>"); */
            li.innerHTML = fileInfo;
            li2.innerHTML = dumpsize + "KB";
            fileList.appendChild(li);
            fileSize.appendChild(li2);
            
          };
        };
        filesUpload.onchange = function () {
          traverseFiles(this.files);
        };
      </script>
      
      <script>
      	function removeFiles(){
      		$("#file-list").html("첨부 파일이 없습니다.");
      		$(".file_size").html("");
      	}
      </script>
    
      
      

	<script>

$(document).ready(function() {
   //여기 아래 부분
   $('#summernote').summernote({
        height: 170,                 // 에디터 높이
        //width:700,
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
   });
});

</script>

<!-- 조직도 세팅 ajax -->
		<script>
			$(function(){
				
				/* 부서 가져와서 조직도에 추가하는 AJAX */
				$.ajax({
	 				type:"POST",
	 				url :'selectDeptList.st',
	 				async: false,
	 				success:function(data){
	 						                    
	                    //회사이름 생성
	                    for(var key in data){
	                        //console.log(deptList[key]);
	                        if(data[key].depth == "1"){
	                        	//console.log(deptList[key].deptName);
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
		 																	 + "<span style='display: none;'>|" + data[key].empEmail + "</span>"
		 																	 + "</a></li>";
	 						//var test = $(".lideptName").index($(".lideptName:contains('총무팀')"));
	 						//var test = $(".lideptName:contains('총무팀')");
	 						//console.log(test.html());
	 						if(data[key].empName != '관리자' && data[key].positionName != '대표이사'){
		 						$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
	 						}
	 					}
	 				}
				});
				
				
				/* 부서명 클릭시 오른쪽 부서원 리스트 세팅하는 ajax */
				$(".lideptName").click(function(){
					//눌림 팀 이름을 구하기 위해서 뒤에서부터 3자리를 자른다
					//console.log($(this).html().substr($(this).html().length-3, 3));
					
					var $hiddenSpan = "<span style='display:none;'>" + $(this).html().substr($(this).html().length-3, 3) + "</span>"
					
					if(!$("#myModal1").is(':visible')){
						$("#empListDivBody").find('span').remove();
						$("#empListDivBody").append($hiddenSpan);
					}
					//조직도 이동 모달창이 닫혀 있을 때만 작동하게 세팅
					if(!$("#myModal1").is(':visible')){
						$.ajax({						
							type: 'get',
							url: 'selectMemberListInDept.st',
							data: {
								"deptName" : $(this).html().substr($(this).html().length-3, 3)
							},
							async: false,
			 				success:function(data){
			 					console.log(data);	
			 					
			 					$("input[name=chkAll]").prop("checked",false);
			 					
			 					var $empListTable = $("#empListTable > tbody");
			 					$empListTable.empty();
			 					
			 					for(key in data){
				 						if(data[key].empName != '관리자' && data[key].positionName != '대표이사'){
				 							var $tr =  "<tr><td><input type='checkbox' name='chk'> " 
				 								 + "<input type='hidden' name='empNo' value='" + data[key].empNo + "'>"
				 								 + "<input type='hidden' name='dutyNo' value='" + data[key].dutyNo + "'>" 
				 								 + "<input type='hidden' name='empEmail' value='" + data[key].dutyNo + "'>" 
				 								 + "<input type='hidden' name='deptNo' value='" + data[key].deptNo + "'></td>" 
											     + "<td>" + data[key].empName + " " + data[key].positionName + "</td>"
											     + "<td>" + data[key].dutyName + "</td>"
											     + "<td>" + data[key].phone + "</td></tr>";
											      		 						
			 							$empListTable.append($tr);	
			 						}		
			 					}
			 				}						
						});
						
	 					if($(this).html().substr($(this).html().length-3, 3) == '미지정'){
	 						//console.log('미지정');
	 						$("#empAddBtn1").attr('disabled', false);
	 						$("#empRemoveBtn").attr('disabled', true).css({"background":"#c9c9c9", "color":"white"}); 						
	 					}else{
	 						$("#empAddBtn1").attr('disabled', false);
	 						$("#empRemoveBtn").attr('disabled', false).css({"background":"white", "color":"#FF3A3A"});
	 					}
						
					} 
					
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
		
		
		
		<!-- 이동할 부서원 모달 영역 끝-->		
		<script>
			$("#model-choose-cancel").click(function(){
				$("#modalAddMemberTable tbody").empty();
				$("#addEmpBodyTable tbody").empty();
			});
			
				//참석자 누르면 그 참석자 삭제하기
			/* 	$(".attendant").click(function(){
					console.log("왜 안나오지 다시 확인해볼것!");
					$(this).remove();
					}); */
			//작동되는 참석자 삭제
			$(document).on("click", ".attendant", function(){
				$(this).remove();
			});   
			
			

			
			$(function(){
				
				
				//참석자 추가 선택버튼
				$("#empAddBtn1").click(function(){ 
					
						//console.log($("#empListTable tbody").find('td').text());
						$("#modalAddMemberTable tbody").empty();
						//console.log($("#empListDivBody").find('span').html());
						$("#addEmpBodyTable tbody").empty();
						$("#myModal1").modal('show');	
						
					
				});
				

				
				//myModal1 모달창, empAddBtn1 참석자 선택 버튼, empRemoveBtn, btn-primary 확인, btn-default 취소
				//.myModal1Submit 확인
				
				
				//(반복) 확인 버튼 누르면 반복 모달 숨겨라!
				$(".myModal1Submit1").click(function(){
					
						$("#repeatModal").modal('hide');
						console.log("dd");
						console.log($(".cycle").val());
						
						
						//cycle,
						
						//$("#modalAddMemberTable tbody").append($tr);
						//"<input type='hidden' name='originDep' value='" + dept + "'>"
				});
				
				//(참석자 선택) 확인 버튼 누르면 선택 모달 숨겨라!
				$(".myModal1Submit2").click(function(){
					if($("#modalAddMemberTable tbody").find('td').text() == ''){
						swal("참석자 선택 후 확인을 눌러주세요.");
					}else {
						$("#myModal1").modal('hide');
						
					}
				});
				
				
				//class end 가 없는데 어떻게 동작하지?
					var emailArr = new Array(); 
				//아 트리메뉴 ..!
				$(".end").click(function(){ //모달창에서 사원 클릭시
					//console.log($(this).find('a').text());
				
					console.log("사원클릭하면 뜨지?");
				
					var name = $(this).find('a').text().split("|")[0];
					var dept = $(this).find('a').text().split("|")[1];
					var email = $(this).find('span').text().split("|")[2];
					emailArr += email +",";
					console.log(emailArr.substr(0,emailArr.length-1));
					//console.log(name);
					//console.log(dept);
					//div class="attendant
					var $tr = "<tr><td>" + name + "</td><td>" + dept + "</td></tr>" 
					+ "<input type='hidden' id='attendeeNo' name='attendeeNo' value='" + name + "'>";
					//첫번째 선택한 사람만 추가되네.... 이거 오른쪽으로 사람 옮기는거다

					var $div = "<div class='attendant'>" + name + "</div>";
					
					var $reTr = "<tr><td>" + name + "<input type='hidden' name='deptHistoryNo' value='1'><input type='hidden' id='attendeeNo' name='attendeeNo' value='" + name.substr(0,3) + "'>" + "</td><td>" 
										   + dept + "<input type='hidden' name='originDep' value='" + dept + "'>" + "</td><td>" 
										   + $("#empListDivBody").find('span').text() + "<input type='hidden' name='changeDep' value='" + $("#empListDivBody").find('span').text() + "'>" + "</td></tr>";
					console.log("$tr : " + $tr)					   
					console.log("reTr : " + $reTr);
						$("#modalAddMemberTable tbody").append($tr);
						$("#addEmpBodyTable tbody").append($reTr);
						$("#receiver").val(emailArr.substr(0,emailArr.length-1));						
						//같은 사람 추가하는거 막기
						$("#modalAddMemberTable td").each(function(){
							if($(this).html() == name){
								console.log($(this).html()+"..");//사람 이름 나온다.
								if($("#modalAddMemberTable tbody:last tr:contains(" + name + ")").length > 1){
									$("#modalAddMemberTable tbody:last tr:contains(" + name + "):last").remove();
									$("#addEmpBodyTable tbody:last tr:contains(" + name + "):last").remove();
								}
							}
						});
				});
			});					
		</script>	
<script>
//유효성 넣자! 메일제목,내용,받는사람
//var exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$("#submitBtn").click(function(){
if($("#mailSubject").val() == ''){
	swal("잘못된 입력", "메일 제목을 입력해주세요!", "error");
}else if($("#summernote").val() == ''){
	swal("잘못된 입력", "메일 내용을 입력해주세요!", "error");
}else if($("#receiver").val() == ''){
	swal("잘못된 입력", "받는 사람을 입력해주세요!", "error");
}/* else if(exptext.test($("#receiver").val()) == false){
	swal("잘못된 입력", "메일 형식이 올바르지 않습니다!", "error");
} */else {
	$("#sendMail").submit();
}

});

</script>

</body>
</html>