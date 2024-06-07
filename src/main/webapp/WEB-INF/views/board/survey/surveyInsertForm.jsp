<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>	
	.contentTitle {
	}
	
	.contentDiv {
	/* height:700px; */
	text-align:left;
	width:850px; 
	height:700px;
	overflow: auto;
	}
	
	.contentDiv::-webkit-scrollbar { display: none; }
	
	table {
	border-collapse: separate;
	/* height:550px; */
	width:750px;
	margin:auto;
	text-align:center;
	}
	
	.formBtn{
    width: 100px;
    height: 30px;
    margin-right: 10px;
	}
	
	#Btn {
	align:center;
	margin:0 auto;
	}
	
	#insertBtn {
	width:80px;
	background-color: #0871B9;
	border: 1px solid #0871B9;
	color: white;
	padding: 7px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 5px;
	font-size: 12px;
	}
	
	#cancelBtn {
	width:80px;
	background-color: white;
	border: 1px solid lightgray;
	color: #0871B9;
	padding: 7px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 5px;
	font-size: 12px;
	}
	
	/* -파일 첨부- */
	body {margin: 10px}
	.where {
	  display: block;
	  margin: 25px 15px;
	  font-size: 12px;
	  color: #000;
	  text-decoration: none;
	  font-family: verdana;
	  font-style: italic;
	} 
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	    padding: .5em .75em;
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e2;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	
	.filebox.bs3-primary label {
		vertical-align:top;
		color: #fff;
		background-color: #0871B9;
	    border-color: #0871B9;
	    font-size:12px;
	}	
	/* -파일 첨부- */
	
	/* -에디터- */
	#textDiv {
	align:center;
	}
	
	/* -마감 날짜- */
	.dateInput {
	text-align:center;
	width:150px;
	border:2px solid lightgray;
	}
</style>
<script>
</script>
</head>
<body>
	<div class="wrap">
		<!-- 메뉴바 include -->

		<jsp:include page="../boardMenubar.jsp" />
		<!-- board 메뉴바 include -->

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">설문</b> <br>
			<br>
			<div class="contentDiv">
				<br>
				<form method="post" action="surveyInsertForm.bo"
					enctype="multipart/form-data">

					<table>
						<colgroup>
							<col width="20%" />
							<col width="70%" />
							<col width="10%" />
						</colgroup>
						<!-- <tr style="height:40px">
						<td><label>분류</label></td>
						<td style="text-align:left;">
						<select style="border:2px solid lightgray; width:100px; height:30px; text-align-last:center;">
						<option>분류선택</option>
						<option>공통</option>
						<option>IT</option>
					</select>
						</td>
						<td></td>
					</tr> -->

						<tr style="height: 40px">
							<td class="test"><label>제목</label></td>
							<td style="text-align: left;"><input type="text"
								name="sTitle" style="width: 500px; border: 2px solid lightgray;"></td>
							<!-- <td><label>상단고정 &nbsp;<input type="checkbox" value="체크박스"></label></td> -->
							<td></td>
						</tr>


						<tr style="height: 40px">
							<td><label>작성자</label></td>
							<td style="text-align: left;"><input type="hidden"
								id="sWriter" name="sWriter" value="${loginUser.empNo }"
								style="text-align: center; width: 200px; border: 2px solid lightgray;">
								<input type="text" id="empName" name="empName"
								value="${loginUser.empName }"
								style="text-align: center; width: 150px; border: 2px solid lightgray;"
								readonly></td>
							<td></td>
						</tr>

						<tr style="height: 40px">
							<td class="test"><label>마감기간 설정</label></td>
							<td style="text-align: left;">
								<input class="dateInput" type="text" name="startDate" id="calStartDate" size=7 autocomplete="off">
								&nbsp;&nbsp;~&nbsp;&nbsp; 
								<input class="dateInput" type="text" name="endDate" id="calEndDate" size=7 autocomplete="off">
							</td>
							<td></td>
						</tr>

						<tr rowspan="2" style="height: 40px">
							<td><label>내용</label></td>
							<td class="td1" style="text-align: left;" colspan="2">
								<!-- <form method="post"> -->
								<div id="textDiv">
									<textarea id="summernote" name="sContent"
										style="overflow-x: hidden; overflow-y: auto;"></textarea>
								</div>
							</td>
							<!-- <textarea cols="80" rows="8" style="resize: none; border:2px solid lightgray;"></textarea></td> -->
							<td></td>
						</tr>
					</table>
					<!-- </form> -->
					<!-- 설문 항목 입력 -->
					<table>
						<colgroup>
							<col width="13%" />
							<col width="70%" />
							<col width="17%" />
						</colgroup>
						<tr>
							<td></td>
							<td style="text-align: left; padding-left: 5px;"><label>설문
									항목 입력</label></td>

							<td style="text-align: left;">
								<!-- <label>복수 선택 &nbsp; <input type="checkbox" value="체크박스"></label> -->
							</td>
						</tr>
						<!--  -->
						<tr style="height: 40px" name="trStaff" id="memberTable">
							<td>
								<!-- <button class="btn btn-default" name="delStaff">삭제</button> -->
							</td>
							<td colspan="2" style="text-align: left;">
								<input type="text" name="surveyQuestionContent" placeholder=" 항목을 작성해주세요." style="width: 500px; border: 2px solid lightgray;">
							</td>
						</tr>
						<!--  -->
						<!-- <tr style="height:40px">
						<td></td>
						<td colspan="2" style="text-align:left;">
							<div class="addButton">
								<input type="text" name="txt" value="" style="text-align:center; width:500px; border:2px solid lightgray;"><br>
							</div>
						</td>
					</tr> -->
						<tr style="height: 40px">
							<td></td>
							<td colspan="2" style="text-align: left;"><label> <img
									style="vertical-align: top;"
									src="${ contextPath }/resources/images/board/add.png"
									width="20px"> 추가<input type="button" name="addStaff"
									class="btnAdd" value="Add" hidden> <!-- <button name="addStaff"></button> -->
							</label></td>
						</tr>
						<tr>
							<td colspan="3" id="btn"><label> <br>
								<br>
									<button type="submit" class="formBtn" id="insertBtn">등록</button>
									<button type="reset" class="formBtn" id="cancelBtn"
										onclick="location.href='survey.bo;'">취소</button>
							</label></td>
						</tr>
					</table>
				</form>

			</div>


			<br>
			<br>
			<br>
			<br>
			<!-- <button onclick="add_tr()">추가</button>
		<button onclick="delete_tr()">삭제</button>
		<table cellpadding=0 cellspacing=0 id="text_table" border="1" style="height:30px;">
		</table> -->



		</div>
		<!-- 본문 영역 끝 -->


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝 -->

	</div>
</body>

<script>
//--------------설문 항목 추가/삭제--------------
				//추가 버튼
			    $(document).on("click","input[name=addStaff]",function(){
			    	
			        var addStaffText =
			        	
			        	'<tr style="height:40px" name="trStaff" id="memberTable">'+
							'<td>'+
							'</td>'+
							'<td colspan="2" style="text-align:left;">'+
								'<input type="text" name="surveyQuestionContent" placeholder=" 항목을 작성해주세요." style="width:500px; border:2px solid lightgray;">'+
								'&nbsp;&nbsp;<button class="btn btn-default" name="delStaff">삭제</button>'+
							'</td>'+
						'</tr>';
			        	
			            
			        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
			        
			        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
			        
			    });
			    
			    //삭제 버튼
			    $(document).on("click","button[name=delStaff]",function(){
			        
			        var trHtml = $(this).parent().parent();
			        
			        trHtml.remove(); //tr 테그 삭제
			        
			    });
//--------------설문 항목 추가/삭제--------------

//------------파일첨부-------------
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name').val(filename);
	    });
	}); 
//------------파일첨부-------------	
	
//------------에디터 툴-------------
	
	$(document).ready(function() {
	   //여기 아래 부분
	   $('#summernote').summernote({
	        height: 220,                 // 에디터 높이
	        width: 650,
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
	          
	   });
	});
	
//------------에디터 툴-------------

//------------datepicker------------
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언id="endOptionDay"
            $("#calStartDate").datepicker();                    
            $("#calEndDate").datepicker();
            $(".cycleMonty").datepicker();
            $(".endOptionDay").datepicker();
            
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
        
        
      //현재 날짜랑 시간을 기본값으로 넣어주자. 

		var date1 = new Date();
		//console.log("date1 : " + date1);
		//date1 : Thu Apr 23 2020 07:12:05 GMT+0900 (대한민국 표준시)
		
		var year1 = date1.getFullYear();
		
		var month1 = date1.getMonth() + 1;
		
		var day1 = date1.getDate();
		if(month1 < 10){
			month1 = "0" + month1;
		}
		if(day1 < 10){
			day1 = "0" + day1;	
		}
		
		var hours1 = date1.getHours();
		// Minutes part from the timestamp
		var minutes1 = "0" + date1.getMinutes();
		// Seconds part from the timestamp
		var seconds1 = "0" + date1.getSeconds();
		
		var hours2 = date1.getHours() + 1 ;
		
		var hours22 = hours2;
		
		
		if(hours1 < 10){
			hours1 = "0" + hours1;
		}
		if(minutes1 < 10){
			minutes1 = "0" + minutes1;
		}
		if(seconds1 < 10){
			seconds1 = "0" + seconds1;
		}
		if(hours22 < 10){
			hours22 = "0" + hours2;
		}

		// Will display time in 10:30:23 format
		var formattedDate1 = year1 + "-" + month1 + "-" + day1; 
		var formattedTime1 = hours1 + ':' + minutes1.substr(-2) + ':' + seconds1.substr(-2);
		var formattedTime2 = hours22 + ':' + minutes1.substr(-2) + ':' + seconds1.substr(-2);
	    

		//console.log("날짜 : " + formattedDate1); 2020-0423
		//console.log("시간1 : " + formattedTime1); 07:11:19
		//console.log("시간 2: " + formattedTime2); 08:11:19
		
		//현재 시간을 일정 밸류에 넣자
		$("#calStartDate").val(formattedDate1);
		$("#calEndDate").val(formattedDate1);

//------------datepicker------------
</script>
</html>