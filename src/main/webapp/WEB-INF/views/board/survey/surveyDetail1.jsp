<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha256-8zyeSXm+yTvzUN1VgAOinFgaVFEFTyYzWShOy9w7WoQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha256-TQq84xX6vkwR0Qs1qH5ADkP+MvH0W+9E7TdHJsoIQiM=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>

<title>Insert title here</title>
<style>	
	.contentTitle {
	}
	
	.contentDiv {
	text-align:left;
	width:850px; 
	height:700px;
	overflow: auto;
	}
	
	.contentDiv::-webkit-scrollbar { display: none; }
	
	table {
	border-collapse: separate;
	height:500px;
	width:750px;
	margin:auto;
	text-align:center;
	}
	.subject {
	text-align:left;
	
	}
	.formBtn{
    width: 100px;
    height: 30px;
    margin-right: 2px;
	}
	
	#Btn {
	align:center;
	margin:0 auto;
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
	
	#submitBtn {
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
	#deadlineBtn {
	width:70px;
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
	#insertBtn {
	width:70px;
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
	#deleteBtn {
	width:70px;
	background-color: ECEFF1;
	border: 1px solid lightgray;
	color: black;
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
	
	#replyBtn {
	width:80px;
	height:68px;
	background-color: #0871B9;
	border: 1px solid #0871B9;
	color: white;
	padding: 7px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 5px;
	font-size: 12px;
	vertical-align:top;
	}
	/* textarea.replyText {
	border : 1px #c9c9c9 solid;
	} */
	
	.profile_area {
	width: 30px;
	height: 30px;
	background: gray;
	border-radius: 100%;
	margin: auto;
	/* margin-top: 20px;
	margin-bottom: 30px; */
	background-size: cover; 
    background-image: url("${ contextPath }/resources/images/board/user.jpg");
    }
    
    
    /* -----항목 고르기----- */
	.box-radio-input input[type="radio"]{
	display:none;
	}

	.box-radio-input input[type="radio"] + span{
    display:inline-block;
    /* background:none; */
    background:white;
    border:2px solid lightgray;    
    padding:0px 10px;
    text-align:center;
    width:200px;
    height:35px;
    line-height:33px;
    font-weight:500;
    cursor:pointer;
    border-radius: 5px;
	}


	.box-radio-input input[type="radio"]:checked + span{
    border:2px solid #0871B9;
	font-weight:700;
    background:white;
    color:black;
	}

	.box-radio-input input[type="radio"] + span:hover{
	  border:2px solid #0871B9;
	  font-weight:700;
	}
	
	
	/* -----항목 고르기(비활성화)----- */
	.box-radio-input-N input[type="radio"]{
	display:none;
	}
	
	.box-radio-input-N {
	font-weight:700;
    background:lightgrey;
    color:black;
    border-radius: 5px;
	}
	
	.box-radio-input-N input[type="radio"] + span{
    display:inline-block;
    background:white;
    border:2px solid lightgray;    
    padding:0px 10px;
    text-align:center;
    width:200px;
    height:35px;
    line-height:33px;
    font-weight:500;
    border-radius: 5px;
	}
	
	/* 상세보기 UI */
    input {
	border:none;
	}	
	
	input:disabled {
	background:none;
	
	}
	.note-editable { background-color: white !important; }

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
			<b class="contentTitle">설문</b>
			<br><br>
			<div class="contentDiv" style="width:800px">
				<br>
				<!-- <form method="post" action="surveyDetail1.bo"  enctype="multipart/form-data"> -->
				<table>
					<colgroup>
						<col width="8%" />
						<col width="42%" />
						<col width="50%" />
					</colgroup>
					<tr style="vertical-align: middle;">
						<td style="text-align:left;" colspan="2" class="subject" >
							<h4><b>제목 : </b><input type="text" id="aTitle" name="aTitle" value="${list3.sTitle}" style="width:320px; border:none;" disabled="disabled"/></h4>
						<td style="text-align:right;"><b>설문기간 : </b>
							<fmt:formatDate value="${list3.startDate }" pattern="yy/MM/dd"/>&nbsp;~&nbsp;
							<fmt:formatDate value="${list3.endDate }" pattern="yy/MM/dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<label>조회수 :&nbsp;<input type="text" id="sCount" name="sCount" value="${list3.sCount}" style="width:22px; border:none;" disabled="disabled"></label>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; height:40px;">
							<label>작성자 : </label>
						</td>
	                  	<td style="text-align:left;">
	                  		<img class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ list3.empPhoto }');">
							<label><input type="text" id="empName" name="empName" value="${list3.empName}" style="width:100px" disabled="disabled"></label>
							<input type="hidden" id="aWriter" name="aWriter" value="${loginUser.empNo }" style="text-align:center; width:150px; border:2px solid lightgray;">
							<%-- <input type="text" name="empName" value="${loginUser.empName }" style="text-align:center; width:150px; border:2px solid lightgray;" readonly> --%>
							<input type="hidden" name="surveyNo" id="surveyNo" value="${ list3.surveyNo }">
						</td>
	                    <%-- <td style="text-align:right;">
							<fmt:formatDate value="${list.nEnrollDate }" pattern="yyyy/MM/dd"/>&nbsp;
						</td> --%>
						<td style="text-align:right;">
						  <c:if test="${ list3.sWriter eq sessionScope.loginUser.empNo }">
							<c:if test="${list3.endStatus=='Y'}">
                          		<button type="button" class="formBtn" id="deadlineBtn" data-toggle="modal" data-target="#exampleModal2">마감</button>
                          	</c:if>
                          		<button type="submit" class="formBtn" id="insertBtn" onclick="location.href='surveyInsertForm.bo;'">수정</button>
							<label style="text-align:right;">
		                      <!-- ------------------------------------------------------------------- -->
		                      
		                     <!-- Button trigger modal -->
								<button type="button" class="formBtn" id="deleteBtn" data-toggle="modal" data-target="#exampleModal">삭제</button>
                          </c:if>
								<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">삭제</button> -->
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document" style="width:300px;">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel"></h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body" style="text-align:center;">
								       	정말 삭제하시겠습니까?
								      </div>
								      <div class="modal-footer" style="text-align:center;">
								        <button type="button" id="cancelBtn" data-dismiss="modal">닫기</button>
								        <button type="button" id="insertBtn">삭제</button>
								        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								        <button type="button" class="btn btn-primary">삭제</button> -->
								      </div>
								    </div>
								  </div>
								</div>
		                     	
		                     </label>
		                     
		                     <label style="text-align:right;">
		                      <!-- ------------------------------------------------------------------- -->
		                      
		                     <!-- Button trigger modal -->
								<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">삭제</button> -->
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document" style="width:300px;">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel"></h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body" style="text-align:center;">
								       	정말 마감하시겠습니까?
								      </div>
								      <div class="modal-footer" style="text-align:center;">
								        <button type="button" id="cancelBtn" data-dismiss="modal">닫기</button>
								        <button type="button" id="insertBtn" onclick="location.href='deadLine.bo?surveyNo=${list3.surveyNo}'">마감</button>
								        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								        <button type="button" class="btn btn-primary">삭제</button> -->
								      </div>
								    </div>
								  </div>
								</div>
		                     	
		                     </label>
		                     
						</td>
					</tr>
					<tr>
						<td colspan="3" style="height:5px;"></td>
					</tr>
					<tr>
						<td colspan="3" style="background:lightgray; height:2px;"></td>
					</tr>
					<tr>
						<td colspan="3" style="height:10px;"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;">
							<%-- <textarea id="summernote" name="aContent" style="overflow-x:hidden; overflow-y:auto;"><c:out value="${list3.sContent}"/></textarea> --%>
							<div style="height:150px;">${list3.sContent}</div>
						</td>
						<td colspan="1" rowspan="3">
							<div style="width: 250px; height: 250px;">
								<!-- chart js -->
								<canvas id="myChart" width="100px" height="100px"></canvas>
							</div>
						</td>
					</tr>
					
<!-- ---------------------------------------------------------------------------------------------------------------- -->					

					<!-- 항목 고르기 -->
					<!-- <input type="hidden" name="sqn" id="surveyQuestionNo"> -->
					<c:forEach var="Question" items="${ list4 }" varStatus="status">
					<tr style="height:40px">
						<td colspan="3" style="text-align:left;">
							<c:choose>
								<c:when test="${list3.endStatus=='Y'}">
									<label class="box-radio-input">
										<input type="radio" id="surveyQuestionNo" name="surveyQuestionNo" value="${Question.surveyQuestionNo}">
										<span style="text-align:left;">${Question.surveyQuestionContent}</span>
									</label>
								</c:when>
								<c:when test="${list3.endStatus=='N'}">
									<label class="box-radio-input-N">
										<input type="radio" id="surveyQuestionNo" name="surveyQuestionNo" value="${Question.surveyQuestionNo}">
										<span style="text-align:left;">${Question.surveyQuestionContent}</span>
									</label>
								</c:when>
							</c:choose>     
						</td>
					</tr>
					</c:forEach>
					
					
					
<!-- ---------------------------------------------------------------------------------------------------------------- -->
					
					<!-- <tr>
						<td><label>파일첨부</label></td>
						<td class="fileBox" style="text-align:left;">
						<div class="filebox bs3-primary">
                            <input class="upload-name" value="파일선택" disabled="disabled">
                            	<label for="ex_filename">파일첨부</label> 
                          <input type="file" id="ex_filename" class="upload-hidden"> 
                        </div>
						</td>
						<td></td>
					</tr> -->
					<tr>
						<td colspan="3" style="height:10px;"></td>
					</tr>
					<tr><td colspan="3" style="background:lightgray; height:2px;"></td></tr>
					
					<!-- 댓글 -->
					<tr>
						<td colspan="3" style="height:10px;"></td>
					</tr>
					<tr style="height:40px;">
						<td colspan="3" style="text-align:left; padding-left:30px;">
							<input class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');">
								&nbsp;&nbsp;<b>댓글(0)</b>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:center;" colspan="2">
							<textarea class="replyText" cols="80" rows="3" style="resize: none; border:none; border:solid 2px lightgray;"></textarea>
							<button type="submit" id="replyBtn">작성</button>
						</td>
					</tr>
					
					 <!-- <tr>
					 <td></td>
                        <td id="btn">
                        <label>
                        <br><br>
                           <button type="submit" class="formBtn" id="insertBtn">수정</button>
                           <button type="reset" class="formBtn" id="cancelBtn">목록</button>
                        </label>
                        </td>
	                     <td style="text-align:right;">
		                     <label>
		                      <br><br>
		                     	<button type="reset" class="formBtn" id="deleteBtn">삭제</button>
		                     </label>
	                     </td>
                     </tr> -->
                     <tr>
                        <td colspan="3" id="btn">
                        	<label style="text-align:center;">
                        <br><br>
							<%-- <c:choose> --%>
								<c:if test="${list3.endStatus=='Y'}">
									 <button type="submit" class="formBtn" id="submitBtn" >제출</button>
								</c:if>
								<%-- <c:when test="${list3.endStatus=='N'}">
									<button type="" class="formBtn" id="submitBtn" style="background:lightgray; border:1px solid gray; color:gray;" disabled>제출</button>
								</c:when>
							</c:choose>   --%>                      
                           <button type="reset" class="formBtn" id="cancelBtn" onclick="location.href='survey.bo;'">목록</button>
                        	</label>
	                     </td>
                     </tr>
				</table>
				<!-- </form> -->
				
			</div>
			<br><br><br><br>
		</div>
		<!-- 본문 영역 끝 -->


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>
<script type="text/javascript">


//마감처리 시 비활성화
/* $(function(){
	if(${list3.endStatus}.val() == 'N'){
		$("#surveyQuestionNo").attr("disabled",true);
		$("#submitBtn").attr("disabled",true);
	}
}); */




$(document).ready(function(){
	 $("#submitBtn").click(function(){
	  $.ajax({
		type : "POST",
		url : "surveyDetail1.bo",
		dataType:"json",
		data : {
			"surveyNo":$("#surveyNo").val(),
			"surveyQuestionNo": $("#surveyQuestionNo").val(),
			"aWriter" : $("#aWriter").val()
		},
		error:function(){
			alert("이미 투표가 완료 되었습니다.");
		},
		success : function(data){
			console.log(data);
			for(var key in data){
				console.log(key);
			}
			//if(data[key].aWriter == "${ sessionScope.loginUser.empNo }"){
				
			// chart js	
			var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'doughnut',
			    data: {
			        labels: ['만족', '불만족'],
			        datasets: [{
			            label: '# of Votes',
			            data: [1, 0],
			            backgroundColor: [
			                'yellowgreen',
			                'orangered'
			                /* 'rgba(54, 162, 235, 1)' */
			            ],
			            borderColor: [
			                'yellowgreen',
			                'orangered'
			                /* 'rgba(54, 162, 235, 1)' */
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			        	xAxes: [{
							ticks:{
								beginAtZero: true
							},
							gridLines:{
								lineWidth: 0
							}
						}],
						yAxes: [{
							ticks: {
								beginAtZero: true
							},
							gridLines:{
								lineWidth: 0
							}
						}]
			        }
			    }
			});	//chart
			
			//}	//if
			
		}	//success
		  
	  });
	
	 });
	 
	  
});
  
  $("input:radio[name=surveyQuestionNo]").click(function(){
	    $(this).prop("checked", true);
	    $("form").val();
	});
	 
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
	

//------------에디터 툴-------------

$(document).ready(function() {
   //여기 아래 부분
   
   $('#summernote').summernote({
        height: 200,                 // 에디터 높이
        width: 747,					 // 에디터 길이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: ''   //placeholder 설정
          
   });
   $('#summernote').summernote('disable');
});

//------------에디터 툴-------------

	
</script>



</html>