<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>

	body{
		/* background: linear-gradient(135deg, #6e8efb, #a777e3); */
		/* background-image: url('https://mblogthumb-phinf.pstatic.net/20160710_11/wkao9489_1468119893212fIAVj_JPEG/NaverBlog_20160710_120452_00.jpg?type=w2'); */
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
	
	.tbl_today3{
		width: 100%;
	}
	
	.tbl_today4{
		width: 100%;
	}
	
	.cell{
		float: left;
		width: 50%;
		text-align: center;
	}
	
	ul{
		list-style:none;
		padding-left:0px;
   	}
   	.w_now2{
   		width: 100%;
   		height: 230px;
   	}

	.w_now2 li{
		float: left;
	}
	
	.w_now2 li:first-child{
		width: 300px;
		height: 230px;
		text-align: center;
	}
	
	.after_h{
		width: 140px;
		height: 230px;
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
	}
	
	.date2{
		float: right;
		margin: 0;
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
	
</style>

</head>
<body>
	<%--  ${ doc } --%>

	<div id="wrap">
		<div id="title">동네별 날씨</div>
		
		<div class="header">
			<label style="font-weight: 800;">지역선택</label>
			<select class="weatherSelect">
				<option>서울특별시</option>
			</select>
			<select class="weatherSelect">
				<option>강남구</option>
			</select>
			<select class="weatherSelect">
				<option>역삼2동</option>
			</select>
			<button>조회</button>
		</div>
		
		<div class="body">
		
			<div class="locationDiv" id="locationDiv1"></div>
			<div id="currentTable">
			
			</div>
			
			<div class="locationDiv" id="locationDiv2"></div>
			<div id="weatherTableDiv1">
				
					
			</div>
			
			<div id="weatherTableDiv2">
				
			</div>
			
		</div>
		
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
			}
			
			
			
		});
		
	});
	</script>

</body>
</html>