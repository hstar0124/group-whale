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
	/* .settings_color { background: #0871b9; } */
	.settings_font { font-family: 'Yeon Sung', cursive; }
	
	/* 상단영역 */
	.topArea { height: 50px; text-align: left; padding: 10px; }
	.topTitle { font-size: 25px; color: white; float: left; }
	.plus_img { width: 50px; height: 40px; }
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
	
	
	/* Dropdown */
	.dropdown { margin-top: 0px; float: right; }
	.dd-button { display: inline-block; border: 0px solid gray; border-radius: 4px; cursor: pointer; white-space: nowrap; color: #013252; }
	.dd-button:after { display:none; content: ''; position: relative; transform: translateY(-50%); width: 0; height: 0; 
		border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 5px solid black; }
	.dd-button:hover { color: white; }
	.dd-input { display: none; }
	.dd-menu { position: absolute; top: 100%; border: 1px solid #ccc; border-radius: 4px; padding: 0; margin: 2px 0 0 0;
		box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.1); background-color: #ffffff; list-style-type: none; }
	.dd-menu_text { font-size: 15px; }
	.dd-input+.dd-menu { display: none; }
	.dd-input:checked+.dd-menu { display: block; }
	.dd-menu li { padding: 10px 20px; cursor: pointer; white-space: nowrap; }
	.dd-menu li:hover { background-color: #f6f6f6; }
	.dd-menu li a { display: block; margin: -10px -20px; padding: 10px 20px; }
	.dd-menu li.divider { padding: 0; border-bottom: 1px solid #cccccc; }
	
	.btn:hover { cursor: pointer; }	
</style>
<script>
	function showMemberList() {
		location.href = "${ contextPath }/memberList.ms;"
	}

	function showChattingList() {
		location.href = "${ contextPath }/chattingList.ms";
	}

	function showSetting() {
		location.href = "${ contextPath }/settings.ms";
	}
	
	function showAddMember() {
		location.href = "${ contextPath }/addMember2.ms";
	}
	
	// 저장된 테마 색상 가져오기
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
			error:function(data) {
				$(".settings_color").css("background", '#0871b9');
			}
		});

		
	});
	
</script>
</head>
<body>
		<!-- 최상단 로고 영역 -->
		<div class="topArea settings_color settings_font" id="settings_color1">
		<p class="topTitle">Whale Talk</p>
		
		<label class="dropdown">
			<div class="dd-button">
				<img id="addMember" onclick="showAddMember();" class="addMember btn plus_img" src="${ contextPath }/resources/images/messenger/plusBtn.png">
			</div> 
			<!-- <input type="checkbox" class="dd-input" id="test">
			<ul class="dd-menu">
				<li class="dd-menu_text" onclick="">대화방 만들기</li>
				<li class="dd-menu_text" onclick="">최소화</li>
				<li class="dd-menu_text" onclick="">웨일톡 닫기</li>
			</ul> -->
		</label>
		</div>
		
		<!-- 상단 메뉴바 영역 -->
		<div class="topMenubar settings_color" id="settings_color2">
			<div class="menubar" onclick="showMemberList()">
				<img class="btn menubar_img" src="${ contextPath }/resources/images/messenger/user_ms.png">
			</div>
			<div class="menubar" onclick="showChattingList()">
				<img class="btn menubar_img" src="${ contextPath }/resources/images/messenger/chat_ms.png">
			</div>
			<div class="menubar" onclick="showSetting()">
				<img class="btn menubar_img" src="${ contextPath }/resources/images/messenger/settings_ms.png">
			</div>
		</div>
		
		<!-- 검색영역 -->
		<div class="search_ms">
			<div class="search_ms_div">
				<img class="btn search_img" src="${ contextPath }/resources/images/messenger/search_ms.png">
				<input class="search_ms_input" type="text" placeholder="이름, 채팅방을 입력해주세요.">
			</div>
		</div>

</body>
</html>