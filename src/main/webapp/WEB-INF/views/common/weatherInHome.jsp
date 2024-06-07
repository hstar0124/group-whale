<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>	
	/* 본문 영역 */
	#nav1 {margin-right: 20px;}
	.content { 
		width: 100%; 
		height: 100%; 
		background: #f7f7f7; 	
	}
	#contentDiv {	
		width: 1060px; 
		border: 0;
		border-radius: 15px;
	}
	
	.btn2:hover{ cursor: pointer;}
	
	.weatherInDiv{
		float: left;
		width: 50%;
		height: 700px;
	}
	
	#weatherTableDiv2{
		margin-top: 30px;
	}
	
	
	#wrap{
		width: 600px;
		margin: 0 auto;		
	}
	
	#title{
		font-size: 35px;
		margin-bottom: 10px;
	}
	
	.header{
		width: 100%;
		height: 40px;
		line-height: 40px;
		border-radius: 5px;
		padding-left: 10px;
		border-top: 3px solid black;
		/* background: white;	 */	
	}
	
	.weatherSelect{
		margin-left: 5px;
		height: 23px;
	}
	
	.body{
		width: 100%;
	}
	
	.locationDiv{
		margin-top: 10px;
	}
	
	.weatherTable{
		width: 100%;
		height: 150px;
	}
	#currentWeather{
		width: 130px;
		height: 100px;
	}
	
	#weatherTableDiv1{
		margin-top: 30px;
	}
	
	.tbl_today3{
		width: 90%;
		margin: 0 auto;
	}
	
	.tbl_today3 th{
		text-align: center;
	}
	
	.tbl_today4{
		width: 90%;
		margin: 0 auto;
	}
	
	.tbl_today4 th{
		text-align: center;
	}
	
	.tbl_today3 .cell{
		width: 100%;
		text-align: center;
		margin:0 auto;
	}
	
	 .tbl_today4 .cell{
		float: left;
		width: 50%;
		text-align: center;
		margin:0 auto;
	}
	
	ul{
		list-style:none;
		padding-left:0px;
   	}
   	.w_now2{
   		width: 100%;
   		height: 210px;
   		text-align: center;
   		margin:0 auto;
   	}

	.w_now2 li{
		float: left;
	}
	
	.w_now2 li:first-child{
		width: 210px;
		height: 210px;
		text-align: center;
	}
	
	.after_h{
		width: 150px;
		height: 210px;
	}
	
	.inner{
		text-align: center;
	}
	
	h6{
		text-align: center;
	}
	
	.c_tit2{
		width: 100%;
		height: 50px;
		line-height: 50px;
	}
	
	.first{
		float: left;		
		margin: 0;
		margin-left: 10px;
	}
	
	.date2{
		float: right;
		margin: 0;
		margin-right: 10px;
	}
	
	.blind{
		display: none;
	}
	
	.tbl_today4 tbody th span {
	    display: block;
	    margin-top: 3px;
	    font-family: tahoma;
	    font-size: 13px;
	    font-weight: bold;
	    color: #767676;
	}	
	
	.tbl_today4 tbody td .text li {
	    font-size: 13px;
	    font-family: '굴림',gulim;
	}
	
	.tbl_today3 thead th span {
	    padding-left: 3px;
	    height: 29px;
	    font-family: tahoma;
	    font-size: 11px;
	    font-weight: bold;
	    color: #767676;
	}
	
	.tbl_weather tbody td .text li.nm {
	    padding: 0 2px 6px 0;
	    color: #333;
	    line-height: 1.3;
	}
	
	table, input, select {
	    font-size: 15px;
   		font-family: '돋움',Dotum,sans-serif;
	}
	
	.dgr{
		font-weight: 800;
	}
	
	.info{
		font-size: 13px;
    	font-family: '굴림',gulim;
	}
	
	.ico_wt{
		width: 110px;
		height: 110px;
	}
	
	.cell img {
		width: 65px;
		height: 65px;
	}
	
	.inner img {
		width: 65px;
		height: 65px;
	}
	
	.first{
		font-size: 20px;
		font-weight: 800;
	}
	
	.first span{
		margin-left: 5px;
		font-size: 15px;
		font-weight: 800;
	}
	
	#locationDiv2 h4{
		font-size: 20px;
		font-weight: 800;
		margin-left: 10px;
	}
	
	#locationDiv2 span{
		margin-left: 5px;
		font-size: 15px;
		font-weight: 800;
	}
	
	#chooseLocation{
		width: 100%;
		height: 30px;
		line-height: 30px;
		margin-left: 10px;	
	}
	
	#chooseLocation label{
		font-size: 15px;
	}
	
	.weatherSelect{
		width: 100px;
		height: 30px;
		margin: 0;
		margin-left: 5px;
		margin-right: 5px;
		border-radius: 5px;
	}
	
	#searchBtn{
		width: 100px;
		height: 30px;
		margin: 0;
		border: 0;
		border-radius: 5px;
		background: #0871B9;		
		color: white;
	}

	.selectShowHide{
		width: 105px;
		height: 30px;
		float: left;
	}

	#fullContent{
		padding-top: 20px;
		width: 1200px;
		height: 800px;		
	}
	
	.fl em {
		font-size: 20px;
	}
	
</style>
</head>
<body>

	
	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	
	
		<!-- 본문 영역 시작 -->
		<div class="content" style="padding: 0;">
			
			<div id="fullContent">
			<b class="contentTitle">날씨 정보</b>
			<br><br>
			<div id="contentDiv" class="contentDiv">
			
				

			
				<div class="weatherInDiv" style="border-right: 2px solid #2D527C;">
				
					<!-- <div id="title">동네별 날씨</div> -->
			
					<div id="chooseLocation">
						<label style="font-weight: 800; float:left; margin-right:15px;">지역선택</label>
						<select class="weatherSelect" id="locationSelect" style="float: left;">
							<option value="1">서울특별시</option>
							<option value="2">경기도</option>
							<option value="3">충청북도</option>
						</select>
						
						<div id="seoul" class="selectShowHide">
							<select class="weatherSelect" id="locationCodeSeoul">
								<option value="">지역 선택</option>
								<option value="09680650">강남구</option>
								<option value="09740560">강동구</option>
								<option value="09305595">강북구</option>							
							</select>
						</div>
						
						<div id="gyeonggi" class="selectShowHide" style="display: none;">
							<select class="weatherSelect" id="locationCodeGyeonggi">
								<option value="">지역 선택</option>	
								<option value="02113680">수원시</option>
								<option value="02590117">화성시</option>		
								<option value="02150576">의정부시</option>				
							</select>
						</div>
						
						<div id="chungbuk" class="selectShowHide" style="display: none;">
							<select class="weatherSelect" id="locationCodeChungbuk">
								<option value="">지역 선택</option>	
								<option value="16745310">증평군</option>				
							</select>
						</div>
						
						<button id="searchBtn" style="margin-left: 10px; float: left;">조회</button>
					</div>
					
					<div class="locationDiv" id="locationDiv1"></div>
					<div id="currentTable">
					
					</div>
					
					<div class="locationDiv" id="locationDiv2"></div>
					<div id="weatherTableDiv1">
						
							
					</div>
				
				</div>
				
				<div class="weatherInDiv">
				
					<div id="weatherTableDiv2">
				
					</div>
				
				
				</div>
			
			</div>
			
			</div>
			
		</div>
		<!-- 본문 영역 끝 -->
		


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->
	</div>
		

	
	<script>
	
	$(function(){
		
	
		var currentWeather = '${ currentWeather }';		
		$("#currentTable").append(currentWeather);
		
		var currentLocation = '${ currentLocation }';
		$("#locationDiv1").append(currentLocation);
		
		var currentLocation2 = '${ currentLocation2 }';
		$("#locationDiv2").append(currentLocation2);
		
		var weatherTable1 = '${ weatherTable1 }';
		$("#weatherTableDiv1").append(weatherTable1);
		
		var weatherTable2 = '${ weatherTable2 }';
		$("#weatherTableDiv2").append(weatherTable2);
		
		$("img").each(function(){
			//console.log($(this).attr("alt"));
			if($(this).attr("alt") == '맑음'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/sun.png");
			}else if($(this).attr("alt") == '구름많음'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/cloudy.png");
			}else if($(this).attr("alt") == '흐림'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/cloudy-1.png");
			}else if($(this).attr("alt") == '흐리고 비'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/rain-1.png");
			}else if($(this).attr("alt") == '구름 많고 한때 비'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/rain-1.png");
			}else if($(this).attr("alt") == '비'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/rain-1.png");
			}else if($(this).attr("alt") == '흐리고 가끔 비'){
				$(this).attr("src", "${ contextPath }/resources/images/weather/rain-1.png");
			}
			
		});
		
		$(".fl").find("strong").css("font-size","15px");
		console.log($(".fl").find("strong").html());
		
		
		$("#locationSelect").change(function() {
			//console.log('g2');
			if($(this).val() == 1){
				$("#seoul").show();
				$("#gyeonggi").hide();
				$("#chungbuk").hide();
			}else if($(this).val() == 2){
				$("#seoul").hide();
				$("#gyeonggi").show();
				$("#chungbuk").hide();
			}else if($(this).val() == 3){
				$("#seoul").hide();
				$("#gyeonggi").hide();
				$("#chungbuk").show();
			}	
		});
		
		$("#searchBtn").click(function(){
			var locationCode;
			if($("#locationSelect").val() == 1){
				locationCode = $("#locationCodeSeoul").val();
			}else if($("#locationSelect").val() == 2){
				locationCode = $("#locationCodeGyeonggi").val();
			}else if($("#locationSelect").val() == 3){
				locationCode = $("#locationCodeChungbuk").val();
			}
			
			location.href="${ contextPath }/weather.vi?" + locationCode;			
		});
		
	});
	
	
	
	</script>
	
</body>
</html>