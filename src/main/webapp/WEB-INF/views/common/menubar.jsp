<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="${ contextPath }/resources/js/notification.js"></script>
<script src="${ contextPath }/resources/js/websocket.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	.wrap { width: 1200px; height: 800px; margin: auto;}
	
	.top {width: 100%; height: 100px; border-bottom: 1.5px solid #0871B9; padding-top: 10px; }
	.logoMark { width: 80px; height: 60px; margin-top:7px; margin-right:10px; margin-left:10px;}
	.logoText { width: 160px; height: 60px; margin-top:7px; margin-right:10px;}
	.log_userName { font-size: 17px; }
	.loginUser_div { width: 50px; height: 50px; background: gray; float: right; border-radius: 100%; margin-top: 13px; background-size: cover; }
	.loginUser_img { position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-repeat: no-repeat; }

	
	/* 좌측 메뉴  */
	.nav1 { width: 90px; height: 100%; background: red; float: left; background-color: #0871B9; border-right: hidden; }
	.nav2 {	width: 210px; height: 800px; background: white; float: left; border-right: 1px solid #CDCDCD; margin-right: 20px; /* display: none; */ }
	.nav1>ul { margin: 0; padding: 0; list-style: none; }
	.nav1 a { display: block; text-decoration: none; padding: 10px 20px; font-size: 12px; text-align: center; color: white; }
	.nav2>ul { margin: 0; padding: 0; list-style: none; }
	.nav2 .nav2_a { display: block; text-decoration: none; padding: 5px; padding-left: 3px; color: black; }
	.nav2 p { display: block; text-decoration: none; padding: 10px 10px; color: black; line-height: 20px; }
	.nav1 a:hover { background: #4391C6; color: white; }
	
	.menuTitle { font-size: 16px; margin-left: 5px; vertical-align: middle; }
	.menuTitle_sub1 { font-size: 13px; }
	.menuTitle_sub2 { font-size: 15px; list-style:none; padding-bottom: 5px; display: none; }
	.menuTitle_sub2:hover { color: #4391C6; }
	.menuTitlePtag {margin-top: 10px;}
	.writeBtn { width: 150px; height: 45px; background: #0871B9; color: white; font-size: 14px; font-weight: bold; text-align: center;
		border-radius: 7px; border: 1px; margin-left: 18px; }
		
	/* 좌측메뉴 아이콘 */
	.nav1_icons { width: 40px; height: 40px; }
	.menu_icons { width: 35px; height: 30px; padding-right: 5px; vertical-align: middle; }
	.setting_icons { width: 35px; height: 30px; margin-left: 12px; padding-right: 5px; vertical-align: middle; }
	.setting_a { margin-left: -1.5px; }
	.forder1 { width: 33px; height: 28px; padding-right: 5px; vertical-align: middle; margin-bottom: 5px; margin-left:12px;}
	.notifications {width: 50px; height: 35px; float: right; margin-top: 23px; /* position: absolute; right: 370px; top: 30px; */}

	/* 본문 영역 */
	.content { width: 100%; height: 100%; background: #f7f7f7; padding-top: 20px; }
	.contentTitle { font-size: 20px; }
	.contentDiv { width: 840px;  background: white; border: 2px solid #CDCDCD; padding: 10px; float: left; }
	
	/* footer 영역 */
	.footer { width: 100%; height: 50px; background: white; border-top: 1px solid #CDCDCD;}
	
	/* 상단 드롭다운영역 */
	/* Dropdown */
	.dropdown { display: inline-block; float: right; margin-top: 30px;}
	.dd-button { display: inline-block; border: 0px solid gray; border-radius: 4px; padding-right: 10px; padding-left: 5px;
		margin-right: 10px; background-color: #ffffff; cursor: pointer; white-space: nowrap; color: #013252; }
	.dd-button:after { display:none; content: ''; position: absolute; top: 50%; right: 15px; transform: translateY(-50%); width: 0; height: 0; 
		border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 5px solid black; }
	.dd-button:hover { color: #0871B9; }
	.dd-input { display: none; }
	.dd-menu { position: absolute; top: 100%; border: 1px solid #ccc; border-radius: 4px; padding: 0; margin: 2px 0 0 0;
		box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.1); background-color: #ffffff; list-style-type: none; }
	.dd-input+.dd-menu { display: none; }
	.dd-input:checked+.dd-menu { display: block; }
	.dd-menu li { padding: 10px 20px; cursor: pointer; white-space: nowrap; }
	.dd-menu li:hover { background-color: #f6f6f6; }
	.dd-menu li a { display: block; margin: -10px -20px; padding: 10px 20px; }
	.dd-menu li.divider { padding: 0; border-bottom: 1px solid #cccccc; }
	.btn:hover { cursor: pointer; }
	.btn2:hover { cursor: pointer; }
	.logo:hover { cursor: pointer; }
	
	/* todo edit버튼 */
	#todoEdit { width:80px; height:45px; text-align:center; border:1.2px solid lightgray; color:#0871B9; font-size:14px; border-radius:7px; margin-left:60px; font-weight:bold; background:white;}
	
	/* 하단 고정버튼 */
	#fixedbtn{widht: 60px; height: 60px; position:fixed;right:20px;bottom:10px;z-index:1000}

	.balloon { display: none; position:fixed;right:20px;bottom:85px;z-index:1000; padding: 10px; padding-top: 19px; text-align: center; line-height: 1em;
  		width:170px; height:50px; background: linear-gradient(135deg, #6e8efb, #a777e3); color: white; border-radius: 10px;} 
	.balloon:after { border-top: 10px solid #a777e3; border-left: 10px solid transparent; border-right: 10px solid transparent; 
 		border-bottom: 0px solid transparent; content:""; position:absolute; top:50px; left:125px; }
	.balloon2 { display: none; position:fixed;right:20px;bottom:85px;z-index:1000; padding: 10px; padding-top: 19px; text-align: center; line-height: 1em;
  		width:170px; height:120px; background: linear-gradient(135deg, #6e8efb, #a777e3); color: white; border-radius: 10px;} 
	.balloon2:after { border-top: 10px solid #a777e3; border-left: 10px solid transparent; border-right: 10px solid transparent; 
 		border-bottom: 0px solid transparent; content:""; position:absolute; top:120px; left:125px; }
 	
 	.scroll {overflow:auto; height: 80px;}	
 	.scroll::-webkit-scrollbar { display: none; }
 	.balloon_ul { list-style-type: none; margin: 5px; padding: 0; text-align: left; }
	.balloon_li { display: block; padding: 5px; text-decoration: none;}
	.balloon_li a { color: white; font-size: 12px; }
 	
</style>
<script>
/* 		nav1_mail
		nav1_approval
		nav1_calendar
		nav1_todo
		nav1_board
		nav1_messenger
		nav1_settings */

	/* nav1  클릭시 nav2 show */
	
	/* nav2 메뉴 클릭시 확장 */ 
	$(function(){
		$(".sub1_1").click(function(){
			if($(".sub2_1").is(":visible")) {
				$(".sub2_1").hide();
				$(".sub1_f1").attr({'src':'${ contextPath }/resources/images/menubar/forder2.png','width':'28px', "height":"32px"});
			} else {
				$(".sub2_1").show();
				$(".sub1_f1").attr({'src':'${ contextPath }/resources/images/menubar/forder.png','width':'40px', "height":"35px"});
			}
		})
		$(".sub1_2").click(function(){
			if($(".sub2_2").is(":visible")) {
				$(".sub2_2").hide();
				$(".sub1_f2").attr({'src':'${ contextPath }/resources/images/menubar/forder2.png','width':'28px', "height":"32px"});
			} else {
				$(".sub2_2").show();
				$(".sub1_f2").attr({'src':'${ contextPath }/resources/images/menubar/forder.png','width':'40px', "height":"35px"});
			}
		})
		
		$(".sub1_3").click(function(){
			if($(".sub2_3").is(":visible")) {
				$(".sub2_3").hide();
				$(".sub1_f3").attr({'src':'${ contextPath }/resources/images/menubar/forder2.png','width':'28px', "height":"32px"});
			} else {
				$(".sub2_3").show();
				$(".sub1_f3").attr({'src':'${ contextPath }/resources/images/menubar/forder.png','width':'40px', "height":"35px"});
			}
		})
		
		$(".sub1_4").click(function(){
			if($(".sub2_4").is(":visible")) {
				$(".sub2_4").hide();
				$(".sub1_f4").attr({'src':'${ contextPath }/resources/images/menubar/forder2.png','width':'28px', "height":"32px"});
			} else {
				$(".sub2_4").show();
				$(".sub1_f4").attr({'src':'${ contextPath }/resources/images/menubar/forder.png','width':'40px', "height":"35px"});
			}
		})
		$(".sub1_5").click(function(){
			if($(".sub2_5").is(":visible")) {
				$(".sub2_5").hide();
				$(".sub1_f5").attr({'src':'${ contextPath }/resources/images/menubar/forder2.png','width':'28px', "height":"32px"});
			} else {
				$(".sub2_5").show();
				$(".sub1_f5").attr({'src':'${ contextPath }/resources/images/menubar/forder.png','width':'40px', "height":"35px"});
			}
		})
	
		
		/* 하단 버튼 이벤트 */
		$("#fixedbtn").click(function(){
			//alert("왜 눌렀어");
			if($(".balloon").is(":visible")||$(".balloon2").is(":visible")) {
				$(".balloon").fadeOut(500);
				$(".balloon2").fadeOut(500);
			} else {
				$(".balloon").fadeIn(500);
			}
		});
		
		$(".balloon").click(function(){
			if($(".balloon2").is(":visible")) {
				$(".balloon2").fadeOut(500);
				$(".balloon").fadeIn(500);
			} else {
				$(".balloon2").fadeIn(500);
				$(".balloon").fadeOut(500);
			}
		});
		$(".balloon2").click(function(){
			$(".balloon2").fadeOut(500);
		});
	})
	
	/* 로그인  */
	function login() {
		location.href = "${ contextPath }/showloginForm"; 
	}
	
	/* 홈으로 가기  */
	function goHome() {
		location.href = "${ contextPath }/goDash.vi"; 
	}

	var ch = 0;
    
	function showMessenger() {
		class ClassStaticMethod {
			static staticMethod() {
				ch++;
			}
		}
		ClassStaticMethod.staticMethod();
		
		if(ch > 1) {
		    window.open('${ contextPath }/chattingList.ms', 'window팝업', 'width=378, height=647, all=no, location=no, menubar=no, status=no, toolbar=no, resizable=no');
		} else {
		    window.open('${ contextPath }/loading.ms', 'window팝업', 'width=378, height=647, all=no, location=no, menubar=no, status=no, toolbar=no, resizable=no');
		}
    	
    }
	
</script>
</head>
<body>
	<!-- 상단영역 시작-->
	<div class="top">
		<img class="logo logoMark" src="${ contextPath }/resources/images/menubar/logoMark.png" onclick="goHome();"> 
		<img class="logo logoText" src="${ contextPath }/resources/images/menubar/logoText.png" onclick="goHome();">

		<!-- 상단 로그정보 영역 -->
		<!-- 유저 상단 이미지 -->
		<div class="btn loginUser_div" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');"></div>
		<!-- 유저정보 -->
		<label class="dropdown userInfo">
			<div class="dd-button log_userName" style="display: inline-block" ><b>${ sessionScope.loginUser.empName }</b>님</div> 
			<input type="checkbox" class="dd-input" id="test">
			<ul class="dd-menu">
				<!-- <li class="notification" onclick="show();">알림 테스트</li> -->
				<li onclick="location.href='updateMember.me'">회원정보 수정</li>
				<li onclick="location.href = 'logout.vi'">로그아웃</li>
			</ul>
		</label>
		<!-- 알림 버튼 -->
		<img class="btn notifications" onclick="show();" src="${ contextPath }/resources/images/menubar/notifications.png">
		
		
	</div>
	<!-- 상단영역 끝-->
	

	<!-- 좌측메뉴 고정 시작 -->
	<div class="nav1" id="nav1">
		<ul>
			<li class="nav1_click nav1_home"><a href="${ contextPath }/goDash.vi"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/home.png"><br><b>HOME</b></a>
			</li>
			<li class="nav1_click nav1_mail"><a href="${ contextPath }/main.ml"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/mail.png"><br><b>메일</b></a>
			</li>
			<li class="nav1_click nav1_approval"><a href="${ contextPath }/main.ap"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/monitor.png"><br><b>전자결재</b></a>
			</li>
			<li class="nav1_click nav1_calendar"><a href="${ contextPath }/main.cl"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/calendar.png">
					<b>일정관리</b></a></li>
			<li class="nav1_click nav1_todo"><a href="${ contextPath }/main.td"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/tick.png"><br><b>TODO+</b></a>
			</li>
			<li class="nav1_click nav1_board"><a href="${ contextPath }/main.bo"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/chat.png"><br><b>게시판</b></a>
			</li>
			<li class="nav1_click nav1_messenger" onclick="showMessenger();"><a href="#"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/users.png"><br><b>메신저</b></a>
			</li>
			
			<%-- <li class="nav1_click nav1_settings"><a href="${ contextPath }/main.st"> <img class="nav1_icons"
					src="${ contextPath }/resources/images/menubar/settings.png">
					<br><b>설정</b></a>
			</li> --%>
		</ul>
	</div>
	<!-- 좌측메뉴 고정 끝 -->
	
	<div class="balloon btn2">오늘도 화이팅이에요:)</div>
	<div class="balloon2 btn2">무엇을 도와드릴까요?
		<div class="scroll">
			<ul class="balloon_ul">
				<li class="balloon_li btn2" onclick=""><a href="${ contextPath }/weather.vi">1. 날씨 정보</a></li>
				<li class="balloon_li btn2" onclick=""><a data-toggle="modal" href="#fortune">2. 오늘의 운세</a></li>
				<li class="balloon_li btn2" onclick=""><a href="${ contextPath }/selectRequestList.sa">3. 판매사이트 이동</a></li>
			</ul>
		</div>
	</div>
	<img src="${ contextPath }/resources/images/menubar/bot.png" id="fixedbtn" class="btn2">


	<!-- Modal -->
	 <div class="modal fade" id="fortune" role="dialog">
	   <div class="modal-dialog">
	   
	     <!-- Modal content-->
	     <div class="modal-content" style="margin: 0 auto; width: 400px;">
	       <div class="modal-header" style="background:#0871B9; color: white; font-family: 'Do Hyeon', sans-serif;">
	         <button type="button" class="close" data-dismiss="moda" style="color: white; text-shadow: none;">×</button>
	         <p class="modal-title" style="font-size: 25px;">오늘의 운세</p>
	       </div>
	       <div class="modal-body" style="font-size: 20px; font-family: 'Do Hyeon', sans-serif;">
			<form name=form>
				<table>
					<tr>
						<td style="width: 50px;">
							<input type=button value='뽑기' onclick="fortune();stop();" style="font-size: 17px;">						
						</td>
						<td>
							<span id=fortuneSpan>오늘의 운세를 뽑아보세요!!</span>
						</td>
					</tr>
				</table>
			</form>
	       </div>
 	       <div class="modal-footer">
	         <button type="button" class="btn btn-default" data-dismiss="modal" style="font-family: 'Do Hyeon', sans-serif;">Close</button>
	       </div> 
	     </div>

	   </div>
	 </div>

	<script>
	
		$(document).ready(function() {
		    $("#myBtn").click(function(){
		        $("#fortune").modal();
		    });
		    		    
		    $.ajax({
 				type:"POST",
 				url :'managerCheck.st',
 				async: false,
 				data:{
 					"empNo" : "${ sessionScope.loginUser.empNo }"
 				},
 				success:function(data){
 					if(data > 0){ 						
 						var $li = "<li class='nav1_click nav1_settings'><a href='${ contextPath }/main.st'>" 
				 				+ "<img class='nav1_icons'	src='${ contextPath }/resources/images/menubar/settings.png'>"
				 				+ "<br><b>설정</b></a></li>";
 						$("#nav1 ul").append($li);
 					}
 				}
			});
		    
		    
		});

		// 오늘의 운세 뽑기 기능
		var i = 0;
		function fortune(){
			var random = [	  "급한 마음에 밀어 붙이다가 낭패를 보기 쉽다."
							, "친구나 동료에게 연락하라."
							, "여행이나 출장은 되도록 피하는 게 좋다."
							, "결단력이 필요하다. 일단 저지르고 문제가 발생하면 그때 해결하라."
							, "초조하게 생각하지 마라."
							, "스스로 졌다고 생각하면 진다."
							, "욕심을 뒤로하고 힘을 모아 달성해라."
							, "너무 앞서서 생각하는 게 문제다. 김칫국부터 마시는 것은 좋지 않다."
							, "평소 때보다 외모에 신경을 쓰고 한껏 멋을 부리고 나가는 것이 도움이 될 것이다."
							, "나를 낮추고 남을 높인다면 가히 이롭고 좋으리라."
							, "서두르지 말고 차근차근 노력해라."
							, "무심코 던진 말로 인해 믿었던 사람한테 뒤통수를 맞을 수 있다."
							, "나를 낮추고 남을 높인다면 가히 이롭고 좋으리라."
							, "때와 장소를 가리고 해라. 함께 사는 세상이라는 것을 잊지 말자."
							, "옳고 그름은 명확하게 가려야 한다. 사소한 것에 연연하지 마라."
							, "너무 급한 것은 오히려 일을 그르치는 지름길이 될 수 있으니 신중하자."
							, "막연한 정보에 의한 판단으로는 아무런 기대도 하기 힘들다."
							, "친구의 유혹을 뿌리치고 집중력을 갖고 목표 달성을 위해 노력해야 할 때이다."
							, "눈치를 보지 말고 먼저 사과를 해라. 나중에 그것이 유리하게 작용한다."
							, "스스로는 완벽하다고 느낄지 모르지만 아직 검토할 사항이 많다."
							, "내가 싫다고 떠난 친구는 다시 돌아오지 않으니 빨리 잊어버리는 게 상책이다."
							, "좌절이란 있어도 포기란 없다."
							, "좋은 시절일수록 수확기의 게으른 농부가 되지 않도록 자신을 잘 추슬러야 한다."
							, "가장 높은 곳에 올라가려면, 가장 낮은 곳부터 시작하라."
							, "실수는 후회해도 소용없다. 실수하지 않도록 매사 주의해라."
							, "방해받는 일이 많다고 예민하게 반응하지 말도록."
							, "사람이 많은 곳에 가지 마라. 어울리기 힘들다."
							, "마음을 안정시키고 휴식시간을 가져라."
							, "긍정적인 생각이 좋은 결과를 낳는다."
							, "변하지 않는 것은 아무 것도 없다."];
			i = Math.floor(Math.random() * random.length);

			var fortuneText = $('#fortuneSpan').text(random[i]);
			i++;
			//console.log(fortuneText);
			if(i == random.length){
				i = 0;
			}
			T = setTimeout('fortune()', 30);
		}

		function stop(){
			setTimeout('clearTimeout(T)', 2000);
		}
		
		
		/* function openWeather(){
			var newWea;
			var setting = "width=650, height=500, top=0, left=200, scrollbars=auto";
			newWea = window.open("${ contextPath }/weather.vi", "", setting);
			newWea.focus();		
		} */
	</script>



</body>
</html>