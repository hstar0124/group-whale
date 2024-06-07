<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${ contextPath }/resources/js/websocket.js"></script>
<title>Insert title here</title>
<style>	
	.messengerWrap { width: 380px; height: 650px; border: 1px solid #CDCDCD; text-align: center; font-family: 'Yeon Sung', cursive; }
	.settings_color { background: #0871b9; }
	.settings_font { font-family: 'Yeon Sung', cursive; }
	
	/* 상단영역 */
	.topArea { height: 50px; text-align: left; padding: 10px; }
	.topTitle { font-size: 25px; color: white; float: left; }
	.xBtn_img { width: 50px; height: 40px; float: right; text-align: right; margin-left: 200px; margin-right: -10px; margin-top: -3px;}
	.topMenubar { height: 70px; text-align: left; padding-top: 10px; }
	.menubar { width: 33.3%; height: 60px; float: left; text-align: center;}
	.menubar_img { width: 60px; height: 55px; }
	.menubar:hover { cursor: pointer; background: gray;}
	
	/* 검색영역 */
	.search_ms { height: 55px; background: #eceff1; padding: 10px;} 
	.search_ms_div { width: 100%; height: 37px; background: white; border: 1px solid #727272; text-align: left; padding: 0;} 
	.search_ms_input { width: 300px; height: 30px; font-size: 17px; border: 0; outline: 0;  padding-top: 10px; } 
	.search_img { width: 49px; height: 39px; margin-top: -5px;}
	
	/* 내용영역 */ 
	.content_ms::-webkit-scrollbar { display: none; }
	.content_ms { height: 475px; text-align: left; overflow:auto;}
	.chattingList { height: 75px; }
	.chattingList:hover{ background: #f6f6f6; }
	.chattingList_div { width: 55px; height: 55px; background: gray; float: right; border-radius: 100%; background-size: cover; 
		background-image: url("${ contextPath }/resources/images/messenger/default.jpg");}

	/* 참석자 추가 모달 스타일 끝 */
	ul, ol {list-style:none; font-size: 20px;}
	li {list-style:none; font-size: 15px;}

	/* 트리메뉴 */
	.tree_box { -webkit-transform:scale(1.3); width:380px; height:275px; /* border:1px solid #ccd3d9 */;}
	.tree_box .title { padding:5px 0 5px 19px ;background:#f8f8f9;border-bottom:1px solid #ccd3d9;}
	.tree_box .title strong {margin-right:12px;}
	.tree_menu {line-height: 30px; margin-top: 55px; padding-left: 60px;}
	.tree_menu strong {font-weight:normal;}
	.tree_menu label input {vertical-align:-2px;}
	.tree_menu .depth_1 a {cursor:pointer; vertical-align:bottom;text-decoration:none;}
	.tree_menu .depth_1 strong {padding-left:19px;background:url(http://cfile26.uf.tistory.com/image/224E6B45569458082AA795) no-repeat 0px 2px;}
	.tree_menu .depth_2 li {margin-top:-2px;background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 0px;}
	.tree_menu .depth_2 li a em {cursor:pointer;  margin-right: 3px; display:inline-block;width:31px;height:11px;background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
	.tree_menu .depth_2 li a em.on {background-position:0 100%;}
	.tree_menu li.last {margin-top: -3px; background:none;}
	.tree_menu .depth_3 {display:none; padding-left:23px;}
	.tree_menu .depth_3 li {margin:0; padding:0 0 0 14px; padding-bottom: 5px; line-height: 25px; background:url(http://cfile8.uf.tistory.com/image/2456D34B569457FC14828D) no-repeat 0 0;}
	.tree_menu .depth_3 li a {/* display:block; */ padding-left:15px;background:url(http://cfile26.uf.tistory.com/image/216841455694580A1ADE12) no-repeat 0 2px;}
	.msie6 .tree_menu .depth_3 li a { display:inline-block; }
	.tree_menu li.end {margin-top: -5px; background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}
	.form_tree_menu .depth_1 {background:url(http://cfile9.uf.tistory.com/image/22601F4B569457FF051E7E) no-repeat 5px 5px;}
	.form_tree_menu ul.depth_2 li {margin-left:6px;padding-left:27px;background:url(http://cfile25.uf.tistory.com/image/2757834B5694580514C5D6) no-repeat 0 5px;}
	.con{height: 320px;}
	.add_img {width: 43px; height: 33px; margin-left: 160px;}
	
	#modal-addListHead-div{height: 50px; background: #1990E1;}
	#modal-addListbody-div{height: 300px; border: 1px solid #ccd3d9; }
	/* 모달 스타일 끝 */
	
</style>
<script>
	/* 뒤로가기 버튼 */
	function back() {
		history.back();
	}
	
	/* 모달은 밑에 script에 있음 */
</script>

</head>
<body>
	<div class="messengerWrap">
	
	<!-- 최상단 로고 영역 -->
		<div class="topArea settings_color settings_font">
		<p class="topTitle">Whale Talk</p>
		
		<label class="dropdown">
			<div class="dd-button">
				<img onclick="back();" class="btn xBtn_img" src="${ contextPath }/resources/images/messenger/xBtn.png">
			</div> 
		</label>
		</div>
				
		<!-- 검색영역 -->
		<div class="search_ms">
			<div class="search_ms_div">
				<img class="btn search_img" src="${ contextPath }/resources/images/messenger/search_ms.png">
				<input class="search_ms_input" type="text" placeholder="이름, 채팅방을 입력해주세요.">
			</div>
		</div>
	
		
		
		<!-- 내용 영역 -->
		<div class="content_ms">
			
			<!-- 트리메뉴-->
		<!-- 마지막 리스트부분에 class="last",class="end" 넣어주세요 -->
		<div class="tree_box">
		    <div class="con">
		        <ul id="tree_menu" class="tree_menu">
		        </ul>								        
		        
		    </div>
		</div>
		<!--//트리메뉴-->
			
<script>
	//저장된 테마 색상 가져오기
	var color = "";
	$(function(){
		var empNo = "${sessionScope.loginUser.empNo}";
		$.ajax({
			type:"POST",
			url :'selectThema.ms',
			data: {
				empNo: empNo
			},
			success:function(data){
				color = data.substring(1, 8);
				
				//$(".settings_color").css("background", "#ffa524");
				$(".settings_color").css("background", color);
				
			}, 
			error:function(error) {
				$(".settings_color").css("background", '#0871b9');
			}
		});
	});

	<!-- 조직도 세팅 ajax -->
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
	                      	var $top = "<li class='depth_1'><strong style='font-size: 17px;' class='comTitle'>" 
	                      					+ data[key].deptName
	                      			 + "<img id='addMember' class='addMember btn add_img' src='${ contextPath }/resources/images/messenger/add-user2g.png'></strong></li>";	                        	
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
				
			var addMember = "";
			var roomName = "";
			
			/* 사원 가져와서 조직도에 추가하는 ajax */
			$.ajax({
				type:"POST",
				url :'selectMemberList.st',
				async: false,
				success:function(data){
					for(key in data){
						//console.log(data[key]);
						var $member = "<li class='end'><a href='#' class='check_Name'><label for='" + data[key].empName + " " + data[key].positionName + "님' style='font-size: 15px; font-weight: normal; margin-bottom: -5px;'>" + data[key].empName + " " + data[key].positionName 
														 + "<span style='display: none;'>|" + data[key].deptName + "</span>"
														 + "</label></a></li><input type='checkbox' id='" + data[key].empName + " " + data[key].positionName + "님' name='inputName' value='" + data[key].empNo + "' style='position: fixed; margin-top: -23px; margin-left: 180px;'>";
																		 
						if(data[key].empName != '관리자'){
							$(".lideptName:contains('" + data[key].deptName + "')").parent().find("ul").append($member);
						}
						//console.log(data[key].empName);
						var checkId = $("input:checkbox[id='" + data[key].empName +"']");
					}	
				}
			});
				
			// 생성버튼 클릭시 input에 checked된 것의 값만 가져오기
			$(".addMember").click(function(){
				var empNo = "";
				$("input:checkbox[name=inputName]:checked").each(function() {
					//console.log($(this).val());
					empNo = $(this).val();
					addMember += $(this).val() + ",";
					roomName += $(this).attr("id") + ", ";
				});
	
				//alert(addMember);
				//var empNo = "${ sessionScope.loginUser.empNo }";
				var sendDate = getTimeStamp();
				//location.href = "${ contextPath }/insertRoom.ms?roomName=" + roomName + "&addMember=" + addMember + "&empNo=" + empNo + "&sendDate=" + sendDate + ""
				location.href = "${ contextPath}/insertAddMember.ms?roomNo=" + ${param.roomNo} + "&empNo=" + empNo;
			});
				
				
			/* 부서명 클릭시 오른쪽 부서원 리스트 세팅하는 ajax */
			$(".lideptName").click(function(){
				//눌림 팀 이름을 구하기 위해서 뒤에서부터 3자리를 자른다
				//console.log($(this).html().substr($(this).html().length-3, 3));
				
				var $hiddenSpan = "<span style='display:none;'>" + $(this).html().substr($(this).html().length-3, 3) + "</span>"
				
				if(!$("#myModal").is(':visible')){
					$("#empListDivBody").find('span').remove();
					$("#empListDivBody").append($hiddenSpan);
				}
				
			});
			
		}); 

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
		   	
		<!-- 조직도 작동 스크립트 -->
		$(document).ready(function() {

		      $('ul.depth_2 >li > a').click(function(e) {

		          var temp_el = $(this).next('ul');
		          var depth_3 = $('.depth_3');

		          // 처음에 모두 슬라이드 업 시켜준다.
		          //depth_3.slideUp(300);
		          // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
		          //depth_3.parent().find('em').removeClass('on');

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
	
			
		</div>
	</div>
</body>
</html>