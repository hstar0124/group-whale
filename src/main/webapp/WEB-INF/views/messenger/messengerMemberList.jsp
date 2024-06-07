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
	}
	
	/* 모달 스타일 끝 */
	
</style>

</head>
<body>
	<div class="messengerWrap">
		<jsp:include page="messengerMenubar.jsp" />
		
<!-- 			<div class="addMemberList" style="border: 1px solid black; padding: 10px; font-size: 20px;">
				<table>
					<tr>
						<td style="width: 300px;"><div style="border: 1px solid blue;">멤버</div></td>
						<td style="width: 100px;"><div style="border: 1px solid blue;">초대</div></td>
					</tr>
				</table>
			</div>	 -->	
		<!-- 내용 영역 -->
		<div class="content_ms">
			
			<!-- 트리메뉴-->
			<!-- 마지막 리스트부분에 class="last",class="end" 넣어주세요 -->
			<div class="tree_box">
			    <div class="con">
			        <ul id="tree_menu" class="tree_menu">
			            <li class="depth_1"><strong style="font-size: 17px;">업사이클</strong>
			                
			                <ul class="depth_2" >
			                    <li>
			                        <a href="#none"><em>폴더</em> 총무팀</a>
			                        <ul class="depth_3">
			                            <li><a href="#none">박해영 과장 <input type="checkbox"></a> </li>
			                            <li class="end"><a href="#none">차수현 대리</a></li>
			                        </ul>
			                    </li>								                    
			                </ul>   
			                
			                <ul class="depth_2" >
			                    <li>
			                        <a href="#none"><em>폴더</em> 영업팀</a>
			                        <ul class="depth_3">
			                            <li><a href="#none">황인성 과장</a></li>
			                            <li><a href="#none">이호성 대리</a></li>								                            
			                            <li class="end"><a href="#none">장대현 사원</a></li>
			                        </ul>
			                    </li>								                    
			                </ul>   
			                
			             	<ul class="depth_2" >
			                    <li>
			                        <a href="#none"><em>폴더</em> 인사팀</a>
			                        <ul class="depth_3">
			                            <li><a href="#none">이지호 차장</a></li>
			                            <li class="end"><a href="#none">박다영 대리</a></li>
			                        </ul>
			                    </li>								                    
			                </ul>   
			                
			               <ul class="depth_2" >
			                    <li>
			                        <a href="#none"><em>폴더</em> 관리팀</a>
			                        <ul class="depth_3">
			                            <li><a href="#none">이재한 과장</a></li>
			                            <li class="end"><a href="#none">김범주 대리</a></li>
			                        </ul>
			                    </li>								                    
			                </ul>   
			                
			                <ul class="depth_2" >
			                    <li class="last">
			                        <a href="#none"><em>폴더</em> 미지정</a>
			                        <ul class="depth_3">
			                            <li class="end"><a href="#none">미지정 사원</a></li>
			                        </ul>
			                    </li>								                    
			                </ul>  								                
			            </li>
			        </ul>
			    </div>
			</div>
			<!--//트리메뉴-->
			

			
<script>
	<!-- 트리 작동 스크립트 -->
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
	
	
			
		</div>
	</div>
</body>
</html>