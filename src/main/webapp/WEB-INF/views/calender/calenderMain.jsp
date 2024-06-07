<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- <script src='resources/fullcalendar/packages/moment/main.js'></script> moment는 못불러오는데? -->
    

    <!-- 기본세팅 -->
    <link href='resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
    <link href='resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
    <link href='resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
  
    <script src='resources/fullcalendar/packages/core/main.js'></script>
    <script src='resources/fullcalendar/packages/daygrid/main.js'></script>
    <script src='resources/fullcalendar/packages/interaction/main.js'></script>
    <script src='resources/fullcalendar/packages/timegrid/main.js'></script>
    <script src='resources/fullcalendar/packages/list/main.js'></script>
    <script src='resources/fullcalendar/packages/rrule/main.js'></script>
    <script src='resources/fullcalendar/packages/rrule/rrule.js'></script>
	
<title>GroupWhale</title>
<style>
#mainCalenderPage {
	width: 800px;
	height: 550px;
	margin: 0 auto;
}

#mainCalenderHead {
	width: 100%;
	height: 40px;
	background: white;
}

#calHeadTable {
	float: left;
	width: 240px;
	height: 40px;
	border-spacing: 5px;
	border-collapse: separate;
}

.CalHeadTableTd {
	width: 60px;
	text-align: center;
	vertical-align: bottom;
	font-weight: 800;
}


.calChangeTd {
	cursor: pointer;
}

.CalenderBodyDiv {
	width: 100%;
	height: 500px;
	/* background: lightgray; */
}

.arrowImg {
	width: 20px;
	height: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

#calHeadStatus {
	float: left;
	width: 300px;
	height: 75px;
	line-height: 75px;
	text-align: center;
}

#currentCal {
	margin: 0;
	font-size: 20px;
}

#calendar1 {
	border:1px solid black;
    vertical-align:middle;
    height:500px;
}
/* 달력 td*/
#calendar1 td {
	width: 200px;
	height: 60px;
	font-size: 12px;
	border-radius: 8px; /*모서리 둥글게*/
	border:1px solid black;
	vertical-align: text-top;
	
}
#calendar1 > table > tbody > tr:nth-child(1) {
background-color:#000;
color:#FFF;
}

#calendar { 
	max-height: 800px;
	margin: 0 auto; 
}

.fc-sat { color:blue; }
.fc-sun { color:red;  }

.fc-button-primary {
 background-color: #0871B9;
 border-color : black;
}
.fc-button-primary:disabled{
 background-color: #0871B9;
 border-color : black;
}
.fc-button-primary:not(:disabled).fc-button-active {
 background-color: #0871B9;
 border-color : black;
}

</style>


</head>
<body>
	<div class="wrap">
		<!-- 메뉴바 include -->
		<jsp:include page="../common/menubar.jsp" />
		<!-- 서브메뉴바 include -->
		<jsp:include page="calenderMenu.jsp" />

		
		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">일정목록</b> <br> <br>
			<div class="contentDiv" style="height:90%">

				<div id="mainCalenderPage">

					<div id='calendar'></div>
				
				</div>

			</div>
		</div>

		 <script>
			$(function(){
				$("#listCal").hide();
				$("#weekCal").hide();
				$("#dayCal").hide();	
			});
		
			function changeCal(id) {
				//console.log($(id).html());
				if($(id).html() == '월간'){
					$("#monthCal").show();
					$("#listCal").hide();
					$("#weekCal").hide();
					$("#dayCal").hide();					
				}
				if($(id).html() == '목록'){
					$("#monthCal").hide();
					$("#listCal").show();
					$("#weekCal").hide();
					$("#dayCal").hide();		
				}
				if($(id).html() == '주간'){
					$("#monthCal").hide();
					$("#listCal").hide();
					$("#weekCal").show();
					$("#dayCal").hide();		
				}
				if($(id).html() == '일간'){
					$("#monthCal").hide();
					$("#listCal").hide();
					$("#weekCal").hide();
					$("#dayCal").show();		
				}
			}		
		</script>

	</div>

    <!-- 풀캘린더 -->
       <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
            /* dateClick 사용하기 위해 interaction 플러그인 추가 */
            plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list', 'rrule'],
        	/* 상단 header의 display 설정*/
        	/* 왼쪽에 prev 버튼, 중앙에 title, 오른쪽에 next 버튼 */
			header: { left: 'prev,next,today'
					, center: 'title'
					, right: 'dayGridMonth,timeGridWeek,listWeek,timeGridDay'
					},
           	 defaultView: 'dayGridMonth', //기본으로 보여질 view
           	 defaultDate: new Date(), 
           	 nowIndicator : true,
           	 theme: true,    
           	 themeSystem : 'Start',
             eventTimeFormat: { // like '14:30:00'
            	    hour: '2-digit',
            	    minute: '2-digit',
            	    meridiem: false
            	  },
            	  
            /* 한글로 표시. */
            /* locale을 바꾸는 방법도 있지만 그 방법으로 했을 때, */
            /* 1일 2일 23일로 표시되어 columnHeader를 바꾸는 방법을 선택 */
            /* (오로지 숫자로만 표시하고 싶음.) */
            columnHeaderText: function(date) {
            	let weekList = ["일", "월", "화", "수", "목", "금", "토"];
            	return weekList[date.getDay()];
            },
            /* default는 높이 고정. auto로 설정하면 높이 자동조절 */
            /* 4주 달력과 5주 달력의 뷰 높이가 다름. */
            contentHeight: "50",
            height:"600",
            
            // 이벤트를 클릭했을 때 실행되는 함수
            /* 필요한 경우, info 객체를 사용하여 원하는 값 출력 */
            /* 나는 이벤트를 클릭했을 때, 그 이벤트의 상세내역을 확인할수 있도록 할 거임  dateClick도 있다*/
            /* 따로 상세보기 할 수 있는 공간이 없으니 이거는 필수 사항일 것 같다.*/
            eventClick: function(info) {
				console.log("일정 상세확인!!!");
            		(info);
				console.log(info.event.title);
				console.log(info.event.extendedProps.calNo);
				var no = info.event.extendedProps.calNo;
				console.log(no);
				//이 info 객체 담아서 어떻게 넘길까?
		
				location.href = "detail.cl?no="+no;
            	//여기에서 팝업이든 모달이든 상세확인가능할수 있도록 하기
            	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
            	//어떤식으로 일정 내용을 보여줄까?
			},
            //선빈이꺼랑 버전이 다른가 이건 안먹네. -> 일자를 눌러야 먹는다!!!
            dateClick: function(info) {
				//여기는 일자 클릭했을때 뜨는 창이라 필수적일 것 같진 않다.                
                //info.dayEl.style.backgroundColor = 'orangered';
             },
            
            // 이벤트를 불러오는 옵션
            /* 이벤트를 불러오는 방법은 여러가지가 있으므로 공식 문서를 참고해보자 ! */
/*              eventSource : [ 
             {
            	url: "/getAllEvents",

             } 
             ] */
            //이런식으로 불러올 수 있다.

            // 6주로 고정시킬 것인가? 에 대한 설정
            fixedWeekCount: false,
            
            // 하루에 일정(evnet)을 3개만 보여주고 그 이상은 more로 처리할지 여부 결정
            eventLimit : true,
            views: {
            		timeGrid:{
            		eventLimit: 5
            				 }
            	   }

        });//FullCalendar.Calendar
          calendar.render();
        
   	      //#myCal,#allCal,#exCal,#myTeamCal checked 유무에 따라 
   	      //받아오는 값들 다르게 해야함
   	      //if문 주지 말고 ajax 다른거 호출해야 할수도  -> 그렇게 해보자 
   	      //했는데 그냥 같은 calendar에 추가하는거라서 애마하다...ajax에서 checked 체크할까
   	      //className주는게 따로 있었다. 이거 이용해보자 -> 해결 a태그에 className이 추가된다.
   	      
   	      //내 일정//////////////////////////////////////////////////
          //if(내 일정이 체크드면) 보여주고 아님 이거 숨겨야하는데 숨기는거를 좀 더 생각해봐야할듯
          //어차피 ajax라서 요쪽 숨겨버리면 저절로 데이터 나오려나 한번 해보자
   	      $.ajax({
       	      url : "<%=request.getContextPath()%>/selectMy.cl",
         	  data : {requestEntNo : '${loginUser.getEmpNo()}'},
         	  type : "get",
         	  async : false, 
         	  success : function (data){
         		  //data 여러가지 받아와야겠는데?
           	 /* -------------------받아온 데이터를 달력에 표시 ---------------------*/
           	 	    console.log(data);
           	        
             		for(var i = 0; i < data.length; i++){
               		var calStart = data[i].calStart;
               		var calEnd = data[i].calEnd;
               		var calTitle = data[i].calTitle;
               		var calCategory = data[i].calCategory;
               		var calKind = data[i].calKind;
               		var calNo = data[i].calNo;
               		var calRepeat = data[i].calRepeat;
               		if(calRepeat == "Y"){
               		var cycleWeek = data[i].calenderrepeat.cycleWeek;
               		var cycleMonty = data[i].calenderrepeat.cycleMonty;
               		var endOptionDay = data[i].calenderrepeat.endOptionDay;
               		}
               		 //console.log(calrepeat); //Y
               	    //console.log(cycleWeek);		//5
               	    //console.log(cycleMonty);	//2020-04-21
               	    //console.log(endOptionDay);  //2020-04-30 
               		//calStart, calEnd 뒤에서 부터 5자리가 00000이면 종일로 판단가능 
               		// --> 판단 안된다.. 시간 잘라서 00:00:00 인거 구분 해 와야 한다!@
               		//시작,끝,제목 가져오고싶다..
               		//console.log("calStart : " + calStart); 
               		//console.log("calEnd : " + calEnd);   
               		//console.log(calStart); 
               		//console.log("자르자 : " + calStart) 이건 긴 숫자나옴 종일 판단 불가
               		var date = new Date(calStart);
               		
               		//console.log("내 일정 date : " + date);
               		var hour = date.getHours(); 
               		if(hour < 10){
               			hour = "0" + date.getHours();
               		}
               		var min = date.getMinutes();
               		if(min < 10){
               			min = "0" + date.getMinutes();
               		}
               		var sec =  date.getSeconds();
               		if(sec < 10){
               			sec = "0" + date.getSeconds();
               		}
               		var time = hour + ":" + min + ":" + sec ;
               		//console.log("내 일정 시간 : " + time); "0:00:00 으로 구분하자 .."
               		
               		//console.log(calCategory);//가져왔다.
               		//가져왔는데, 시간이 좀 길다..? 3자리가 더 길어->인식한다.
             	    //캘린더 변수명  이벤트추가하기.
             	    //버전이 달라서 그런가 이걸로는 일정이 추가 안되는데?
             	    //디코드가 필요없구나 ..........-> 해결
             	    
             	    //범주에 따른 색상 ,all-day 여부,반복여부
             	    //반복여부가 Y일 때 조건이 복잡해짐
             	    //checked에 유무에 따라서 리스트가 달라져야하는데,어떤식으로 해야할지?
             	    //종일여부 판단해서 'allDay'에 true,false값 주기
             	    
             	    //여기 종일 일때잖아...? calRepeat,cycleWeek,cyclleMonty,endOptionDay 4개
             	    ///,'daysOfWeek' : [1,2,3,4,5] // 나옵니다. 이것만 적으면 무한반복
             	    
             	    // 종일 일정인 내 일정입니다! + 반복여부도 판단
             	    
             	    //반복 일정이 아니면 !!! 
             	    if(calRepeat == 'N'){
             	    
					if((calKind == '내 일정' && time == "0:00:00" ) || (calKind == '내 일정' && time =="00:00:00")){ 
						
             	    if(calCategory == '업무'){
                	 calendar.addEvent( {'title':calTitle, 
                						'start' : calStart,
                						'end' : calEnd,
                						'color':'#3E97FF',
                						'textColor':'white',
                						'allDay' : true,
                						'className' : 'myCalendar',
                						'calNo' : calNo
                						}); 
             	     }
             	     if(calCategory == '중요'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#FF4747',
                    						'textColor':'white',
                    						'allDay' : true,
                    						'className' : 'myCalendar',
                    						'calNo' : calNo
                    						}); 
                 	 }
             	     if(calCategory == '출장'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#00E432',
                    						'textColor' : 'white',
                    						'allDay' : true,
                    						'className' : 'myCalendar',
                    						'calNo' : calNo
                    						}); 
                 	 }
             	     if(calCategory == '휴가'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#F9E000',
                    						'textColor' : 'white',
                    						'allDay' : true,
                    						'className' : 'myCalendar',
                    						'calNo' : calNo,
                    						}); 
                 	 }
             	     if(calCategory == '영업활동'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#FF46B5',
                    						'textColor':'white',
                    						'allDay' : true,
                    						'className' : 'myCalendar',
                    						'calNo' : calNo
                    						});
                 	  }
             	     
					}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
					else if((calKind == '내 일정' && time != "0:00:00") || (calKind == '내 일정' && time != "00:00:00")){ // 종일입니다!
						
		             	    if(calCategory == '업무'){
		                	 calendar.addEvent( {'title':calTitle, 
		                						'start' : calStart,
		                						'end' : calEnd,
		                						'color':'#3E97FF',
		                						'textColor':'white',
		                						'className' : 'myCalendar',
		                						'calNo' : calNo
		                						}); 
		             	     }
		             	     if(calCategory == '중요'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#FF4747',
		                    						'textColor':'white',
		                    						'className' : 'myCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '출장'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#00E432',
		                    						'textColor' : 'white',
		                    						'className' : 'myCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '휴가'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#F9E000',
		                    						'textColor' : 'white',
		                    						'className' : 'myCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '영업활동'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#FF46B5',
		                    						'textColor':'white',
		                    						'className' : 'myCalendar',
		                    						'calNo' : calNo
		                    						});
					}
						}//else if 종일입니다. 
             	    }//repeat if 
             		else if(calRepeat == 'Y'){//반복일정 Y 일때는!!!! calRepeat,cycleWeek,cycleMonty,endOptionDay 4개
             			/////////////////////////////////////////////////////////////////////////////
    					if((calKind == '내 일정' && time == "0:00:00" ) || (calKind == '내 일정' && time =="00:00:00")){ 
    						
    	             	    if(calCategory == '업무'){
    	                	 calendar.addEvent( {'title':calTitle, 
    	                						'color':'#3E97FF',
    	                						'textColor':'white',
    	                						'allDay' : true,
    	                						'className' : 'myCalendar',
    	                						'calNo' : calNo,
    	                						'daysOfWeek' : [cycleWeek],
    	                						'startRecur' : cycleMonty,
    	                						'endRecur' : endOptionDay
    	                						}); 
    	             	     }
    	             	     if(calCategory == '중요'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#FF4747',
    	                    						'textColor':'white',
    	                    						'allDay' : true,
    	                    						'className' : 'myCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '출장'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#00E432',
    	                    						'textColor' : 'white',
    	                    						'allDay' : true,
    	                    						'className' : 'myCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '휴가'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#F9E000',
    	                    						'textColor' : 'white',
    	                    						'allDay' : true,
    	                    						'className' : 'myCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '영업활동'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#FF46B5',
    	                    						'textColor':'white',
    	                    						'allDay' : true,
    	                    						'className' : 'myCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						});
    	                 	  }
    	             	     
    						}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
    						else if((calKind == '내 일정' && time != "0:00:00") || (calKind == '내 일정' && time != "00:00:00")){ // 종일입니다!
    							
    			             	    if(calCategory == '업무'){
    			                	 calendar.addEvent( {'title':calTitle, 
    			                						'start' : calStart,
    			                						'end' : calEnd,
    			                						'color':'#3E97FF',
    			                						'textColor':'white',
    			                						'className' : 'myCalendar',
    			                						'calNo' : calNo,
    	    	                						'daysOfWeek' : [cycleWeek],
    	    	                						'startRecur' : cycleMonty,
    	    	                						'endRecur' : endOptionDay
    			                						}); 
    			             	     }
    			             	     if(calCategory == '중요'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#FF4747',
    			                    						'textColor':'white',
    			                    						'className' : 'myCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '출장'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#00E432',
    			                    						'textColor' : 'white',
    			                    						'className' : 'myCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '휴가'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#F9E000',
    			                    						'textColor' : 'white',
    			                    						'className' : 'myCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '영업활동'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#FF46B5',
    			                    						'textColor':'white',
    			                    						'className' : 'myCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						});
    						}
    							}//else if 종일입니다. 
             	    }
				
         	  
         	  
         	  }//for

				
         	},//success 
            error : function(error){
         		alert("데이터 못불러옴");
            }
       	}); //ajax
       	  // 이벤트 추가한것도 렌더 ! 
      	   calendar.render(); 
           	        
       	
       	
       	
	         //전사 일정//////////////////////////////////////////////////
   	      $.ajax({
       	      url : "<%=request.getContextPath()%>/selectAll.cl",
         	  data : {requestEntNo : '${loginUser.getEmpNo()}'},
         	  type : "get",
         	  async : false, 
         	  success : function (data){
         		  //data 여러가지 받아와야겠는데?
           	 /* -------------------받아온 데이터를 달력에 표시 ---------------------*/
           	 	    console.log(data);
           	        
             		for(var i = 0; i < data.length; i++){
               		var calStart = data[i].calStart;
               		var calEnd = data[i].calEnd;
               		var calTitle = data[i].calTitle;
               		var calCategory = data[i].calCategory;
               		var calKind = data[i].calKind;
               		var calNo = data[i].calNo;
               		var calRepeat = data[i].calRepeat;
               		if(calRepeat == "Y"){
               		var cycleWeek = data[i].calenderrepeat.cycleWeek;
               		var cycleMonty = data[i].calenderrepeat.cycleMonty;
               		var endOptionDay = data[i].calenderrepeat.endOptionDay;
               		}
               		 //console.log(calrepeat); //Y
               	    //console.log(cycleWeek);		//5
               	    //console.log(cycleMonty);	//2020-04-21
               	    //console.log(endOptionDay);  //2020-04-30 
               		//calStart, calEnd 뒤에서 부터 5자리가 00000이면 종일로 판단가능 
               		// --> 판단 안된다.. 시간 잘라서 00:00:00 인거 구분 해 와야 한다!@
               		//시작,끝,제목 가져오고싶다..
               		//console.log("calStart : " + calStart); 
               		//console.log("calEnd : " + calEnd);   
               		//console.log(calStart); 
               		//console.log("자르자 : " + calStart) 이건 긴 숫자나옴 종일 판단 불가
               		var date = new Date(calStart);
               		
               		//console.log("내 일정 date : " + date);
               		var hour = date.getHours(); 
               		if(hour < 10){
               			hour = "0" + date.getHours();
               		}
               		var min = date.getMinutes();
               		if(min < 10){
               			min = "0" + date.getMinutes();
               		}
               		var sec =  date.getSeconds();
               		if(sec < 10){
               			sec = "0" + date.getSeconds();
               		}
               		var time = hour + ":" + min + ":" + sec ;
               		//console.log("내 일정 시간 : " + time); "0:00:00 으로 구분하자 .."
               		
               		//console.log(calCategory);//가져왔다.
               		//가져왔는데, 시간이 좀 길다..? 3자리가 더 길어->인식한다.
             	    //캘린더 변수명  이벤트추가하기.
             	    //버전이 달라서 그런가 이걸로는 일정이 추가 안되는데?
             	    //디코드가 필요없구나 ..........-> 해결
             	    
             	    //범주에 따른 색상 ,all-day 여부,반복여부
             	    //반복여부가 Y일 때 조건이 복잡해짐
             	    //checked에 유무에 따라서 리스트가 달라져야하는데,어떤식으로 해야할지?
             	    //종일여부 판단해서 'allDay'에 true,false값 주기
             	    
             	    //여기 종일 일때잖아...? calRepeat,cycleWeek,cyclleMonty,endOptionDay 4개
             	    ///,'daysOfWeek' : [1,2,3,4,5] // 나옵니다. 이것만 적으면 무한반복
             	    
             	    // 종일 일정인 내 일정입니다! + 반복여부도 판단
             	    
             	    //반복 일정이 아니면 !!! 
             	    if(calRepeat == 'N'){
             	    
					if((calKind == '전사 일정' && time == "0:00:00" ) || (calKind == '전사 일정' && time =="00:00:00")){ 
						
             	    if(calCategory == '업무'){
                	 calendar.addEvent( {'title':calTitle, 
                						'start' : calStart,
                						'end' : calEnd,
                						'color':'#3E97FF',
                						'textColor':'white',
                						'allDay' : true,
                						'className' : 'allCalendar',
                						'calNo' : calNo
                						}); 
             	     }
             	     if(calCategory == '중요'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#FF4747',
                    						'textColor':'white',
                    						'allDay' : true,
                    						'className' : 'allCalendar',
                    						'calNo' : calNo
                    						}); 
                 	 }
             	     if(calCategory == '출장'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#00E432',
                    						'textColor' : 'white',
                    						'allDay' : true,
                    						'className' : 'allCalendar',
                    						'calNo' : calNo
                    						}); 
                 	 }
             	     if(calCategory == '휴가'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#F9E000',
                    						'textColor' : 'white',
                    						'allDay' : true,
                    						'className' : 'allCalendar',
                    						'calNo' : calNo,
                    						}); 
                 	 }
             	     if(calCategory == '영업활동'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#FF46B5',
                    						'textColor':'white',
                    						'allDay' : true,
                    						'className' : 'allCalendar',
                    						'calNo' : calNo
                    						});
                 	  }
             	     
					}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
					else if((calKind == '전사 일정' && time != "0:00:00") || (calKind == '전사 일정' && time != "00:00:00")){ // 종일입니다!
						
		             	    if(calCategory == '업무'){
		                	 calendar.addEvent( {'title':calTitle, 
		                						'start' : calStart,
		                						'end' : calEnd,
		                						'color':'#3E97FF',
		                						'textColor':'white',
		                						'className' : 'allCalendar',
		                						'calNo' : calNo
		                						}); 
		             	     }
		             	     if(calCategory == '중요'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#FF4747',
		                    						'textColor':'white',
		                    						'className' : 'allCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '출장'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#00E432',
		                    						'textColor' : 'white',
		                    						'className' : 'allCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '휴가'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#F9E000',
		                    						'textColor' : 'white',
		                    						'className' : 'allCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '영업활동'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#FF46B5',
		                    						'textColor':'white',
		                    						'className' : 'allCalendar',
		                    						'calNo' : calNo
		                    						});
					}
						}//else if 종일입니다. 
             	    }//repeat if 
             		else if(calRepeat == 'Y'){//반복일정 Y 일때는!!!! calRepeat,cycleWeek,cycleMonty,endOptionDay 4개
             			/////////////////////////////////////////////////////////////////////////////
    					if((calKind == '전사 일정' && time == "0:00:00" ) || (calKind == '전사 일정' && time =="00:00:00")){ 
    						
    	             	    if(calCategory == '업무'){
    	                	 calendar.addEvent( {'title':calTitle, 
    	                						'color':'#3E97FF',
    	                						'textColor':'white',
    	                						'allDay' : true,
    	                						'className' : 'allCalendar',
    	                						'calNo' : calNo,
    	                						'daysOfWeek' : [cycleWeek],
    	                						'startRecur' : cycleMonty,
    	                						'endRecur' : endOptionDay
    	                						}); 
    	             	     }
    	             	     if(calCategory == '중요'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#FF4747',
    	                    						'textColor':'white',
    	                    						'allDay' : true,
    	                    						'className' : 'allCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '출장'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#00E432',
    	                    						'textColor' : 'white',
    	                    						'allDay' : true,
    	                    						'className' : 'allCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '휴가'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#F9E000',
    	                    						'textColor' : 'white',
    	                    						'allDay' : true,
    	                    						'className' : 'allCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '영업활동'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#FF46B5',
    	                    						'textColor':'white',
    	                    						'allDay' : true,
    	                    						'className' : 'allCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						});
    	                 	  }
    	             	     
    						}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
    						else if((calKind == '전사 일정' && time != "0:00:00") || (calKind == '전사 일정' && time != "00:00:00")){ // 종일입니다!
    							
    			             	    if(calCategory == '업무'){
    			                	 calendar.addEvent( {'title':calTitle, 
    			                						'start' : calStart,
    			                						'end' : calEnd,
    			                						'color':'#3E97FF',
    			                						'textColor':'white',
    			                						'className' : 'allCalendar',
    			                						'calNo' : calNo,
    	    	                						'daysOfWeek' : [cycleWeek],
    	    	                						'startRecur' : cycleMonty,
    	    	                						'endRecur' : endOptionDay
    			                						}); 
    			             	     }
    			             	     if(calCategory == '중요'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#FF4747',
    			                    						'textColor':'white',
    			                    						'className' : 'allCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '출장'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#00E432',
    			                    						'textColor' : 'white',
    			                    						'className' : 'allCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '휴가'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#F9E000',
    			                    						'textColor' : 'white',
    			                    						'className' : 'allCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '영업활동'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#FF46B5',
    			                    						'textColor':'white',
    			                    						'className' : 'allCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						});
    						}
    							}//else if 종일입니다. 
             	    }
				
         	  
         	  
         	  }//for

				
         	},//success 
            error : function(error){
         		alert("데이터 못불러옴");
            }
       	}); //ajax
       	  // 이벤트 추가한것도 렌더 ! 
      	   calendar.render(); 
           	
        	//임원 일정이랑 팀 일정은 나머지 상세 기능들 추가 하고 나서 2개 붙여 넣기
        	
        	//임원 일정//////////////////////////////////////////////////
   	      $.ajax({
       	      url : "<%=request.getContextPath()%>/selectEx.cl",
         	  data : {requestEntNo : '${loginUser.getDutyNo()}'},
         	  type : "get",
         	  async : false, 
         	  success : function (data){
         		  //data 여러가지 받아와야겠는데?
           	 /* -------------------받아온 데이터를 달력에 표시 ---------------------*/
           	 	    console.log(data);
           	        
             		for(var i = 0; i < data.length; i++){
               		var calStart = data[i].calStart;
               		var calEnd = data[i].calEnd;
               		var calTitle = data[i].calTitle;
               		var calCategory = data[i].calCategory;
               		var calKind = data[i].calKind;
               		var calNo = data[i].calNo;
               		var calRepeat = data[i].calRepeat;
               		if(calRepeat == "Y"){
               		var cycleWeek = data[i].calenderrepeat.cycleWeek;
               		var cycleMonty = data[i].calenderrepeat.cycleMonty;
               		var endOptionDay = data[i].calenderrepeat.endOptionDay;
               		}
               		 //console.log(calrepeat); //Y
               	    //console.log(cycleWeek);		//5
               	    //console.log(cycleMonty);	//2020-04-21
               	    //console.log(endOptionDay);  //2020-04-30 
               		//calStart, calEnd 뒤에서 부터 5자리가 00000이면 종일로 판단가능 
               		// --> 판단 안된다.. 시간 잘라서 00:00:00 인거 구분 해 와야 한다!@
               		//시작,끝,제목 가져오고싶다..
               		//console.log("calStart : " + calStart); 
               		//console.log("calEnd : " + calEnd);   
               		//console.log(calStart); 
               		//console.log("자르자 : " + calStart) 이건 긴 숫자나옴 종일 판단 불가
               		var date = new Date(calStart);
               		
               		//console.log("내 일정 date : " + date);
               		var hour = date.getHours(); 
               		if(hour < 10){
               			hour = "0" + date.getHours();
               		}
               		var min = date.getMinutes();
               		if(min < 10){
               			min = "0" + date.getMinutes();
               		}
               		var sec =  date.getSeconds();
               		if(sec < 10){
               			sec = "0" + date.getSeconds();
               		}
               		var time = hour + ":" + min + ":" + sec ;
               		//console.log("내 일정 시간 : " + time); "0:00:00 으로 구분하자 .."
               		
               		//console.log(calCategory);//가져왔다.
               		//가져왔는데, 시간이 좀 길다..? 3자리가 더 길어->인식한다.
             	    //캘린더 변수명  이벤트추가하기.
             	    //버전이 달라서 그런가 이걸로는 일정이 추가 안되는데?
             	    //디코드가 필요없구나 ..........-> 해결
             	    
             	    //범주에 따른 색상 ,all-day 여부,반복여부
             	    //반복여부가 Y일 때 조건이 복잡해짐
             	    //checked에 유무에 따라서 리스트가 달라져야하는데,어떤식으로 해야할지?
             	    //종일여부 판단해서 'allDay'에 true,false값 주기
             	    
             	    //여기 종일 일때잖아...? calRepeat,cycleWeek,cyclleMonty,endOptionDay 4개
             	    ///,'daysOfWeek' : [1,2,3,4,5] // 나옵니다. 이것만 적으면 무한반복
             	    
             	    // 종일 일정인 내 일정입니다! + 반복여부도 판단
             	    
             	    //반복 일정이 아니면 !!! 
             	    if(calRepeat == 'N' && ${loginUser.getDutyNo()} == '900'){
             	    
					if((calKind == '임원 일정' && time == "0:00:00" ) || (calKind == '임원 일정' && time =="00:00:00")){ 
						
             	    if(calCategory == '업무'){
                	 calendar.addEvent( {'title':calTitle, 
                						'start' : calStart,
                						'end' : calEnd,
                						'color':'#3E97FF',
                						'textColor':'white',
                						'allDay' : true,
                						'className' : 'exCalendar',
                						'calNo' : calNo
                						}); 
             	     }
             	     if(calCategory == '중요'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#FF4747',
                    						'textColor':'white',
                    						'allDay' : true,
                    						'className' : 'exCalendar',
                    						'calNo' : calNo
                    						}); 
                 	 }
             	     if(calCategory == '출장'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#00E432',
                    						'textColor' : 'white',
                    						'allDay' : true,
                    						'className' : 'exCalendar',
                    						'calNo' : calNo
                    						}); 
                 	 }
             	     if(calCategory == '휴가'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#F9E000',
                    						'textColor' : 'white',
                    						'allDay' : true,
                    						'className' : 'exCalendar',
                    						'calNo' : calNo,
                    						}); 
                 	 }
             	     if(calCategory == '영업활동'){
                    	 calendar.addEvent( {'title':calTitle, 
                    						'start' : calStart,
                    						'end' : calEnd,
                    						'color':'#FF46B5',
                    						'textColor':'white',
                    						'allDay' : true,
                    						'className' : 'exCalendar',
                    						'calNo' : calNo
                    						});
                 	  }
             	     
					}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
					else if((calKind == '임원 일정' && time != "0:00:00") || (calKind == '임원 일정' && time != "00:00:00")){ // 종일입니다!
						
		             	    if(calCategory == '업무'){
		                	 calendar.addEvent( {'title':calTitle, 
		                						'start' : calStart,
		                						'end' : calEnd,
		                						'color':'#3E97FF',
		                						'textColor':'white',
		                						'className' : 'exCalendar',
		                						'calNo' : calNo
		                						}); 
		             	     }
		             	     if(calCategory == '중요'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#FF4747',
		                    						'textColor':'white',
		                    						'className' : 'exCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '출장'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#00E432',
		                    						'textColor' : 'white',
		                    						'className' : 'exCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '휴가'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#F9E000',
		                    						'textColor' : 'white',
		                    						'className' : 'exCalendar',
		                    						'calNo' : calNo
		                    						}); 
		                 	 }
		             	     if(calCategory == '영업활동'){
		                    	 calendar.addEvent( {'title':calTitle, 
		                    						'start' : calStart,
		                    						'end' : calEnd,
		                    						'color':'#FF46B5',
		                    						'textColor':'white',
		                    						'className' : 'exCalendar',
		                    						'calNo' : calNo
		                    						});
					}
						}//else if 종일입니다. 
             	    }//repeat if 
             		else if(calRepeat == 'Y' && ${loginUser.getDutyNo()} == '900'){//반복일정 Y 일때는!!!! calRepeat,cycleWeek,cycleMonty,endOptionDay 4개
             			/////////////////////////////////////////////////////////////////////////////
    					if((calKind == '임원 일정' && time == "0:00:00" ) || (calKind == '임원 일정' && time =="00:00:00")){ 
    						
    	             	    if(calCategory == '업무'){
    	                	 calendar.addEvent( {'title':calTitle, 
    	                						'color':'#3E97FF',
    	                						'textColor':'white',
    	                						'allDay' : true,
    	                						'className' : 'exCalendar',
    	                						'calNo' : calNo,
    	                						'daysOfWeek' : [cycleWeek],
    	                						'startRecur' : cycleMonty,
    	                						'endRecur' : endOptionDay
    	                						}); 
    	             	     }
    	             	     if(calCategory == '중요'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#FF4747',
    	                    						'textColor':'white',
    	                    						'allDay' : true,
    	                    						'className' : 'exCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '출장'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#00E432',
    	                    						'textColor' : 'white',
    	                    						'allDay' : true,
    	                    						'className' : 'exCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '휴가'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#F9E000',
    	                    						'textColor' : 'white',
    	                    						'allDay' : true,
    	                    						'className' : 'exCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						}); 
    	                 	 }
    	             	     if(calCategory == '영업활동'){
    	                    	 calendar.addEvent( {'title':calTitle, 
    	                    						'start' : calStart,
    	                    						'end' : calEnd,
    	                    						'color':'#FF46B5',
    	                    						'textColor':'white',
    	                    						'allDay' : true,
    	                    						'className' : 'exCalendar',
    	                    						'calNo' : calNo,
        	                						'daysOfWeek' : [cycleWeek],
        	                						'startRecur' : cycleMonty,
        	                						'endRecur' : endOptionDay
    	                    						});
    	                 	  }
    	             	     
    						}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
    						else if((calKind == '임원 일정' && time != "0:00:00") || (calKind == '임원 일정' && time != "00:00:00")){ // 종일입니다!
    							
    			             	    if(calCategory == '업무'){
    			                	 calendar.addEvent( {'title':calTitle, 
    			                						'start' : calStart,
    			                						'end' : calEnd,
    			                						'color':'#3E97FF',
    			                						'textColor':'white',
    			                						'className' : 'exCalendar',
    			                						'calNo' : calNo,
    	    	                						'daysOfWeek' : [cycleWeek],
    	    	                						'startRecur' : cycleMonty,
    	    	                						'endRecur' : endOptionDay
    			                						}); 
    			             	     }
    			             	     if(calCategory == '중요'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#FF4747',
    			                    						'textColor':'white',
    			                    						'className' : 'exCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '출장'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#00E432',
    			                    						'textColor' : 'white',
    			                    						'className' : 'exCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '휴가'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#F9E000',
    			                    						'textColor' : 'white',
    			                    						'className' : 'exCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						}); 
    			                 	 }
    			             	     if(calCategory == '영업활동'){
    			                    	 calendar.addEvent( {'title':calTitle, 
    			                    						'start' : calStart,
    			                    						'end' : calEnd,
    			                    						'color':'#FF46B5',
    			                    						'textColor':'white',
    			                    						'className' : 'exCalendar',
    			                    						'calNo' : calNo,
    		    	                						'daysOfWeek' : [cycleWeek],
    		    	                						'startRecur' : cycleMonty,
    		    	                						'endRecur' : endOptionDay
    			                    						});
    						}
    							}//else if 종일입니다. 
             	    }
				
         	  
         	  
         	  }//for

				
         	},//success 
            error : function(error){
         		alert("데이터 못불러옴");
            }
       	}); //ajax
       	  // 이벤트 추가한것도 렌더 ! 
      	   calendar.render(); 
       	
       	
       	
       	
	         //내 팀 일정//////////////////////////////////////////////////
    	      $.ajax({
        	      url : "<%=request.getContextPath()%>/selectMyTeam.cl",
          	  data : {requestEntNo : '${loginUser.getDeptNo()}'},
          	  type : "get",
          	  async : false, 
          	  success : function (data){
          		  //data 여러가지 받아와야겠는데?
            	 /* -------------------받아온 데이터를 달력에 표시 ---------------------*/
            	 	    console.log(data);
            	        
              		for(var i = 0; i < data.length; i++){
                		var calStart = data[i].calStart;
                		var calEnd = data[i].calEnd;
                		var calTitle = data[i].calTitle;
                		var calCategory = data[i].calCategory;
                		var calKind = data[i].calKind;
                		var calNo = data[i].calNo;
                		var calRepeat = data[i].calRepeat;
                		if(calRepeat == "Y"){
                		var cycleWeek = data[i].calenderrepeat.cycleWeek;
                		var cycleMonty = data[i].calenderrepeat.cycleMonty;
                		var endOptionDay = data[i].calenderrepeat.endOptionDay;
                		}
                		 //console.log(calrepeat); //Y
                	    //console.log(cycleWeek);		//5
                	    //console.log(cycleMonty);	//2020-04-21
                	    //console.log(endOptionDay);  //2020-04-30 
                		//calStart, calEnd 뒤에서 부터 5자리가 00000이면 종일로 판단가능 
                		// --> 판단 안된다.. 시간 잘라서 00:00:00 인거 구분 해 와야 한다!@
                		//시작,끝,제목 가져오고싶다..
                		//console.log("calStart : " + calStart); 
                		//console.log("calEnd : " + calEnd);   
                		//console.log(calStart); 
                		//console.log("자르자 : " + calStart) 이건 긴 숫자나옴 종일 판단 불가
                		var date = new Date(calStart);
                		
                		//console.log("내 일정 date : " + date);
                		var hour = date.getHours(); 
                		if(hour < 10){
                			hour = "0" + date.getHours();
                		}
                		var min = date.getMinutes();
                		if(min < 10){
                			min = "0" + date.getMinutes();
                		}
                		var sec =  date.getSeconds();
                		if(sec < 10){
                			sec = "0" + date.getSeconds();
                		}
                		var time = hour + ":" + min + ":" + sec ;
                		//console.log("내 일정 시간 : " + time); "0:00:00 으로 구분하자 .."
                		
                		//console.log(calCategory);//가져왔다.
                		//가져왔는데, 시간이 좀 길다..? 3자리가 더 길어->인식한다.
              	    //캘린더 변수명  이벤트추가하기.
              	    //버전이 달라서 그런가 이걸로는 일정이 추가 안되는데?
              	    //디코드가 필요없구나 ..........-> 해결
              	    
              	    //범주에 따른 색상 ,all-day 여부,반복여부
              	    //반복여부가 Y일 때 조건이 복잡해짐
              	    //checked에 유무에 따라서 리스트가 달라져야하는데,어떤식으로 해야할지?
              	    //종일여부 판단해서 'allDay'에 true,false값 주기
              	    
              	    //여기 종일 일때잖아...? calRepeat,cycleWeek,cyclleMonty,endOptionDay 4개
              	    ///,'daysOfWeek' : [1,2,3,4,5] // 나옵니다. 이것만 적으면 무한반복
              	    
              	    // 종일 일정인 내 일정입니다! + 반복여부도 판단
              	    
              	    //반복 일정이 아니면 !!! 
              	    if(calRepeat == 'N'){
              	    
 					if((calKind == '팀 일정' && time == "0:00:00" ) || (calKind == '팀 일정' && time =="00:00:00")){ 
 						
              	    if(calCategory == '업무'){
                 	 calendar.addEvent( {'title':calTitle, 
                 						'start' : calStart,
                 						'end' : calEnd,
                 						'color':'#3E97FF',
                 						'textColor':'white',
                 						'allDay' : true,
                 						'className' : 'myTeamCalendar',
                 						'calNo' : calNo
                 						}); 
              	     }
              	     if(calCategory == '중요'){
                     	 calendar.addEvent( {'title':calTitle, 
                     						'start' : calStart,
                     						'end' : calEnd,
                     						'color':'#FF4747',
                     						'textColor':'white',
                     						'allDay' : true,
                     						'className' : 'myTeamCalendar',
                     						'calNo' : calNo
                     						}); 
                  	 }
              	     if(calCategory == '출장'){
                     	 calendar.addEvent( {'title':calTitle, 
                     						'start' : calStart,
                     						'end' : calEnd,
                     						'color':'#00E432',
                     						'textColor' : 'white',
                     						'allDay' : true,
                     						'className' : 'myTeamCalendar',
                     						'calNo' : calNo
                     						}); 
                  	 }
              	     if(calCategory == '휴가'){
                     	 calendar.addEvent( {'title':calTitle, 
                     						'start' : calStart,
                     						'end' : calEnd,
                     						'color':'#F9E000',
                     						'textColor' : 'white',
                     						'allDay' : true,
                     						'className' : 'myTeamCalendar',
                     						'calNo' : calNo,
                     						}); 
                  	 }
              	     if(calCategory == '영업활동'){
                     	 calendar.addEvent( {'title':calTitle, 
                     						'start' : calStart,
                     						'end' : calEnd,
                     						'color':'#FF46B5',
                     						'textColor':'white',
                     						'allDay' : true,
                     						'className' : 'myTeamCalendar',
                     						'calNo' : calNo
                     						});
                  	  }
              	     
 					}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
 					else if((calKind == '팀 일정' && time != "0:00:00") || (calKind == '팀 일정' && time != "00:00:00")){ // 종일입니다!
 						
 		             	    if(calCategory == '업무'){
 		                	 calendar.addEvent( {'title':calTitle, 
 		                						'start' : calStart,
 		                						'end' : calEnd,
 		                						'color':'#3E97FF',
 		                						'textColor':'white',
 		                						'className' : 'myTeamCalendar',
 		                						'calNo' : calNo
 		                						}); 
 		             	     }
 		             	     if(calCategory == '중요'){
 		                    	 calendar.addEvent( {'title':calTitle, 
 		                    						'start' : calStart,
 		                    						'end' : calEnd,
 		                    						'color':'#FF4747',
 		                    						'textColor':'white',
 		                    						'className' : 'myTeamCalendar',
 		                    						'calNo' : calNo
 		                    						}); 
 		                 	 }
 		             	     if(calCategory == '출장'){
 		                    	 calendar.addEvent( {'title':calTitle, 
 		                    						'start' : calStart,
 		                    						'end' : calEnd,
 		                    						'color':'#00E432',
 		                    						'textColor' : 'white',
 		                    						'className' : 'myTeamCalendar',
 		                    						'calNo' : calNo
 		                    						}); 
 		                 	 }
 		             	     if(calCategory == '휴가'){
 		                    	 calendar.addEvent( {'title':calTitle, 
 		                    						'start' : calStart,
 		                    						'end' : calEnd,
 		                    						'color':'#F9E000',
 		                    						'textColor' : 'white',
 		                    						'className' : 'myTeamCalendar',
 		                    						'calNo' : calNo
 		                    						}); 
 		                 	 }
 		             	     if(calCategory == '영업활동'){
 		                    	 calendar.addEvent( {'title':calTitle, 
 		                    						'start' : calStart,
 		                    						'end' : calEnd,
 		                    						'color':'#FF46B5',
 		                    						'textColor':'white',
 		                    						'className' : 'myTeamCalendar',
 		                    						'calNo' : calNo
 		                    						});
 					}
 						}//else if 종일입니다. 
              	    }//repeat if 
              		else if(calRepeat == 'Y'){//반복일정 Y 일때는!!!! calRepeat,cycleWeek,cycleMonty,endOptionDay 4개
              			/////////////////////////////////////////////////////////////////////////////
     					if((calKind == '팀 일정' && time == "0:00:00" ) || (calKind == '팀 일정' && time =="00:00:00")){ 
     						
     	             	    if(calCategory == '업무'){
     	                	 calendar.addEvent( {'title':calTitle, 
     	                						'color':'#3E97FF',
     	                						'textColor':'white',
     	                						'allDay' : true,
     	                						'className' : 'myTeamCalendar',
     	                						'calNo' : calNo,
     	                						'daysOfWeek' : [cycleWeek],
     	                						'startRecur' : cycleMonty,
     	                						'endRecur' : endOptionDay
     	                						}); 
     	             	     }
     	             	     if(calCategory == '중요'){
     	                    	 calendar.addEvent( {'title':calTitle, 
     	                    						'start' : calStart,
     	                    						'end' : calEnd,
     	                    						'color':'#FF4747',
     	                    						'textColor':'white',
     	                    						'allDay' : true,
     	                    						'className' : 'myTeamCalendar',
     	                    						'calNo' : calNo,
         	                						'daysOfWeek' : [cycleWeek],
         	                						'startRecur' : cycleMonty,
         	                						'endRecur' : endOptionDay
     	                    						}); 
     	                 	 }
     	             	     if(calCategory == '출장'){
     	                    	 calendar.addEvent( {'title':calTitle, 
     	                    						'start' : calStart,
     	                    						'end' : calEnd,
     	                    						'color':'#00E432',
     	                    						'textColor' : 'white',
     	                    						'allDay' : true,
     	                    						'className' : 'myTeamCalendar',
     	                    						'calNo' : calNo,
         	                						'daysOfWeek' : [cycleWeek],
         	                						'startRecur' : cycleMonty,
         	                						'endRecur' : endOptionDay
     	                    						}); 
     	                 	 }
     	             	     if(calCategory == '휴가'){
     	                    	 calendar.addEvent( {'title':calTitle, 
     	                    						'start' : calStart,
     	                    						'end' : calEnd,
     	                    						'color':'#F9E000',
     	                    						'textColor' : 'white',
     	                    						'allDay' : true,
     	                    						'className' : 'myTeamCalendar',
     	                    						'calNo' : calNo,
         	                						'daysOfWeek' : [cycleWeek],
         	                						'startRecur' : cycleMonty,
         	                						'endRecur' : endOptionDay
     	                    						}); 
     	                 	 }
     	             	     if(calCategory == '영업활동'){
     	                    	 calendar.addEvent( {'title':calTitle, 
     	                    						'start' : calStart,
     	                    						'end' : calEnd,
     	                    						'color':'#FF46B5',
     	                    						'textColor':'white',
     	                    						'allDay' : true,
     	                    						'className' : 'myTeamCalendar',
     	                    						'calNo' : calNo,
         	                						'daysOfWeek' : [cycleWeek],
         	                						'startRecur' : cycleMonty,
         	                						'endRecur' : endOptionDay
     	                    						});
     	                 	  }
     	             	     
     						}//calKind == 내 일정 종일이 아닐때!!!!!!!!! // 종일 일정이 아닌 내 일정입니다!
     						else if((calKind == '팀 일정' && time != "0:00:00") || (calKind == '팀 일정' && time != "00:00:00")){ // 종일입니다!
     							
     			             	    if(calCategory == '업무'){
     			                	 calendar.addEvent( {'title':calTitle, 
     			                						'start' : calStart,
     			                						'end' : calEnd,
     			                						'color':'#3E97FF',
     			                						'textColor':'white',
     			                						'className' : 'myTeamCalendar',
     			                						'calNo' : calNo,
     	    	                						'daysOfWeek' : [cycleWeek],
     	    	                						'startRecur' : cycleMonty,
     	    	                						'endRecur' : endOptionDay
     			                						}); 
     			             	     }
     			             	     if(calCategory == '중요'){
     			                    	 calendar.addEvent( {'title':calTitle, 
     			                    						'start' : calStart,
     			                    						'end' : calEnd,
     			                    						'color':'#FF4747',
     			                    						'textColor':'white',
     			                    						'className' : 'myTeamCalendar',
     			                    						'calNo' : calNo,
     		    	                						'daysOfWeek' : [cycleWeek],
     		    	                						'startRecur' : cycleMonty,
     		    	                						'endRecur' : endOptionDay
     			                    						}); 
     			                 	 }
     			             	     if(calCategory == '출장'){
     			                    	 calendar.addEvent( {'title':calTitle, 
     			                    						'start' : calStart,
     			                    						'end' : calEnd,
     			                    						'color':'#00E432',
     			                    						'textColor' : 'white',
     			                    						'className' : 'myTeamCalendar',
     			                    						'calNo' : calNo,
     		    	                						'daysOfWeek' : [cycleWeek],
     		    	                						'startRecur' : cycleMonty,
     		    	                						'endRecur' : endOptionDay
     			                    						}); 
     			                 	 }
     			             	     if(calCategory == '휴가'){
     			                    	 calendar.addEvent( {'title':calTitle, 
     			                    						'start' : calStart,
     			                    						'end' : calEnd,
     			                    						'color':'#F9E000',
     			                    						'textColor' : 'white',
     			                    						'className' : 'myTeamCalendar',
     			                    						'calNo' : calNo,
     		    	                						'daysOfWeek' : [cycleWeek],
     		    	                						'startRecur' : cycleMonty,
     		    	                						'endRecur' : endOptionDay
     			                    						}); 
     			                 	 }
     			             	     if(calCategory == '영업활동'){
     			                    	 calendar.addEvent( {'title':calTitle, 
     			                    						'start' : calStart,
     			                    						'end' : calEnd,
     			                    						'color':'#FF46B5',
     			                    						'textColor':'white',
     			                    						'className' : 'myTeamCalendar',
     			                    						'calNo' : calNo,
     		    	                						'daysOfWeek' : [cycleWeek],
     		    	                						'startRecur' : cycleMonty,
     		    	                						'endRecur' : endOptionDay
     			                    						});
     						}
     							}//else if 종일입니다. 
              	    }
 				
          	  
          	  
          	  }//for

 				
          	},//success 
             error : function(error){
          		alert("데이터 못불러옴");
             }
        	}); //ajax
        	  // 이벤트 추가한것도 렌더 ! 
       	   calendar.render(); 
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
       	<!-- 내 일정 클릭시 -->
		//내일정////////////////////////////////////////////////////////
		//change 함수를 ajax 안에다가 넣어볼까?
				
 		 $("#myCal").change(function(){
        if($("#myCal").prop("checked") == true){
				$(".myCalendar").show();
        	}else{
        	//calendar.removeAllEvents(); 다 지워 버린다.
        		$(".myCalendar").hide();
  	    	//체크헤제할때 나옴 이때 내 일정 리스트 없애줘야해
  	    	//되긴하는데 이건 모든 일정 보여주고 지우는거라
  	    	//내 일정만 지우는거 따로 생각해봐야겠다. ajax를 따로 둬야하려나..
   	      }
   	   		});//change 
   	 
   	   
   	   		<!-- 전사 일정 클릭시 -->	
   	   //전사일정////////////////////////////////////////////////////////
   	   //fc-day-grid-event fc-h-event fc-event fc-not-start fc-end myCalendar   
   	   //fc-day-grid-event fc-h-event fc-event fc-start fc-end allCalendar
    	   console.log($("#allCal").prop("checked"));
    	   $(".allCalendar").hide();
   	   $("#allCal").change(function(){
          if($("#allCal").prop("checked") == true){
			$(".allCalendar").show();        	  
        	  
   	      }else{
			$(".allCalendar").hide();   	    	  
   	    	  //체크헤제할때 나옴 이때 내 일정 리스트 없애줘야해
   	    	  //되긴하는데 이건 모든 일정 보여주고 지우는거라
   	    	  //내 일정만 지우는거 따로 생각해봐야겠다. ajax를 따로 둬야하려나..
   	      }
   	   		});//change  
   	   		
   	   		
   	   		<!--임원일정 클릭 시 -->
   	   	$(".exCalendar").hide();
   	   	$("#exCal").change(function(){
            if($("#exCal").prop("checked") == true){
  			$(".exCalendar").show();        	  
          	  
     	      }else{
  			$(".exCalendar").hide();   	    	  
     	    	  //체크헤제할때 나옴 이때 내 일정 리스트 없애줘야해
     	    	  //되긴하는데 이건 모든 일정 보여주고 지우는거라
     	    	  //내 일정만 지우는거 따로 생각해봐야겠다. ajax를 따로 둬야하려나..
     	      }
     	   		});//change 
     	   		
     	   	<!--내 팀 일정 클릭시 -->
     	   $(".myTeamCalendar").hide();
     	   	$("#myTeamCal").change(function(){
     	          if($("#myTeamCal").prop("checked") == true){
     				$(".myTeamCalendar").show();        	  
     	        	  
     	   	      }else{
     				$(".myTeamCalendar").hide();   	    	  
     	   	    	  //체크헤제할때 나옴 이때 내 일정 리스트 없애줘야해
     	   	    	  //되긴하는데 이건 모든 일정 보여주고 지우는거라
     	   	    	  //내 일정만 지우는거 따로 생각해봐야겠다. ajax를 따로 둬야하려나..
     	   	      }
     	   	   		});//change 
   	   		
      });//addEventListner
 
    </script>
    

    
    
    
    
</head>
</body>
</html>