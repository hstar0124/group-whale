<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	
	.table1 {
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
    margin-right: 10px;
	}
	
	#Btn {
	align:center;
	margin:0 auto;
	}
	
	#insertBtn {
	width:80px;
	height: 30px;
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
	height:30px;
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
	
	#deleteBtn {
	width:80px;
	height:30px;
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
	height:66px;
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
    
    /* 상세보기 UI */
    input {
	border:none;
	}	
	
	input:disabled {
	background:none;
	
	}
	.note-editable { background-color: white !important; }
	
	/*   	댓글       */
	.reply_create{
		margin-top: 5px;
		padding: 10px;
		width: 100%;
		min-height: 70px;
		height: auto;
		overflow: auto;
	}
	.replyTable {
		border-collapse: separate;
		height:500px;
		/* width:800px; */
		margin:auto;
		text-align:center;
		min-height: 50px;		
	}
	.reply_date{
		font-weight: 800;
		font-size: 12px;
		color: #a9a9a9;
	}
	.reply_writer{
		width: 50px;
		min-height: 50px;		
		padding-top: 15px;
		padding-bottom: 15px;
		float:left;
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
			<b class="contentTitle">전사 게시판</b>
			<br><br>
			<div class="contentDiv">
				<br>
				<table class="table1">
					<colgroup>
						<col width="8%" />
						<col width="72%" />
						<col width="20%" />
					</colgroup>
					<tr style="vertical-align: middle;">
						<td style="text-align:left; height:44px;" colspan="2" class="subject" >
							<h4>
								<b>제목 : </b>
								<input type="text" id="aTitle" name="aTitle" value="${list2.aTitle}" style="border:none" disabled="disabled">
							</h4>
						</td>
						
						<td style="text-align:right;">
							<label>작성일 : </label>
							<fmt:formatDate value="${list2.aEnrollDate}" pattern="yy/MM/dd"/>&nbsp;
						</td>
					</tr>
					<tr>
						<td style="text-align:left; height:34px;">
							<label>작성자 : </label>
						</td>
						
						<td style="text-align:left;">
							<img class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ list2.empPhoto }');">
							<label><input type="text" id="aWriter" name="aWriter" value="${list2.empName}" style="width:100px" disabled="disabled"></label>
						</td>
						
						<td style="text-align:right;">
							<label>조회수 : </label>&nbsp;
							<label><input type="text" id="aCount" name="aCount" value="${list2.aCount}" style="width:22px" disabled="disabled"></label>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" style="background:white; height:15px;"></td>
					</tr>
					<tr>
						<td colspan="3" style="background:lightgray; height:2px;"></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:left;">
							<%-- <textarea id="summernote" name="aContent" style="overflow-x:hidden; overflow-y:auto;"><c:out value="${list2.aContent}"/></textarea> --%>
							<div style="height:200px;">${list2.aContent}</div>
						</td>
					</tr>
					 <tr>
						<td><b>첨부 파일</b></td>
						<c:if test="${ empty file }">
						<td class="fileBox" style="text-align:left;">
						&nbsp;&nbsp;
						첨부파일이 없습니다.
						</td>
						</c:if>
						<c:if test="${! empty file }">
						<td class="fileBox" style="text-align:left;">
						&nbsp;&nbsp;
						<a href="download.bo?attachmentNo=${ file.attachmentNo}">
						${file.originName }
						</a>
						</td>
						</c:if>
						<td></td>
					</tr>
					<tr>
						<td colspan="3" style="background:lightgray; height:2px;"></td>
					</tr>
				<!----------------------------------------버튼---------------------------------------->
					<tr>
                        <td colspan="3" id="btn">
                        	<label style="text-align:center;">
                        <br><br>
                           <button type="submit" class="formBtn" id="insertBtn" onclick="location.href='allBoardUpdateView.bo?aBoardNo=${list2.aBoardNo}'">수정</button>
                           <button type="reset" class="formBtn" id="cancelBtn" onclick="location.href='selectListAllBoard.bo;'">목록</button>
                        	</label>
		                    <label style="text-align:right;">
		                      <br><br>
		                     <!-- Button trigger modal -->
								<button type="button" id="deleteBtn" data-toggle="modal" data-target="#exampleModal">삭제</button>
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
								        <button type="button" id="insertBtn" onclick="location.href='deleteAllBoard.bo?aBoardNo=${list2.aBoardNo}'">삭제</button>
								        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								        <button type="button" class="btn btn-primary">삭제</button> -->
								      </div>
								    </div>
								  </div>
								</div>
		                     </label>
	                     </td>
                     </tr>
                     </table>
				<!----------------------------------------버튼---------------------------------------->
					
					<!-- 댓글 -->
					<div class='reply_create'>
						<!-- <form action="insertAllboardReply.bo" id="reply_insert_form" method="post"> -->
							<input id="aBoardNo" type="hidden" name="aBoardNo" value="${list2.aBoardNo}">
							<input type="hidden" name="rWriter" value="${ sessionScope.loginUser.empNo }">
								<table id="replyTable" style="margin:0 auto;">
									<tr>
										<td style="text-align:left;" colspan="2">
											<input class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');">
												&nbsp;<b>댓글</b>
										</td>
									</tr>
									<tr>
										<td colspan="3" height="5px"></td>
									</tr>
									<tr>
										<td style="text-align:center;" colspan="3">
											<%-- <input type="hidden" id="bno" name="bno" value="${list2.aBoardNo}" /> --%>
												<textarea class="rContent" name="rContent" cols="80" rows="3" style="resize: none; border:none; border:solid 2px lightgray;"></textarea>
												<button type="button" class="reply_button" id="replyBtn" onkeyup="enterkey();">작성</button>
										</td>
									</tr>
									
									
									<c:forEach var="allBoardReplyList" items="${allBoardReplyList}">
									<tr class="replyList">
										<td style="width:100px;">
											<b>
												<img class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ allBoardReplyList.replyEmpPhoto }');">
												<input type="text" id="aWriter" name="aWriter" value="${allBoardReplyList.empName}" style="width:60px;" disabled="disabled">
											</b>
										</td>
										<td>
											<div class="reply_edit_ta" name="replyContent" readonly>${ allBoardReplyList.rContent }</div>
										</td>
										<td>
											<div style="text-align:right; padding:5px;">
												<img class="reply_edit btn2" src="${ contextPath }/resources/images/education/edit.png" style="width: 10px; margin-right: -2px; margin-right:2px;">
												&nbsp;
												<img class="reply_delete btn2" src="${ contextPath }/resources/images/education/close.png" style="width: 10px; margin-right: -2px;">
											</div>	
											<div class="reply_date" style="text-align:right;">${ allBoardReplyList.rEnrollDate }</div>		
										</td>
									</tr>
									<tr>
										<td colspan="3" height="10px"></td>
									</tr>
									<tr>
										<td colspan="3" style="background:lightgray; height:1px;"></td>
									</tr>
									<tr>
										<td colspan="3" height="10px"></td>
									</tr>
									</c:forEach>
								</table>
						<!-- </form> -->
						
						<%-- <div>
								<div>
									<img class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');">
									<label><input type="text" id="aWriter" name="aWriter" value="${allBoardReplyList.empName}" style="width:100px" disabled="disabled"></label>
									<input type="hidden" name="feedReplyNo" value="${ allBoardReplyList.aReplyNo }">
																		<textarea class="reply_edit_ta" name="replyContent" readonly>${ allBoardReplyList.rContent }</textarea>
								</div>
							</c:forEach>
						</div> --%>
					</div>
			</div>
			<br><br><br><br>
			
		</div>
		<!-- 본문 영역 끝 -->

		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->

	
	</div>
</body>

<script>


 $(function(){


	$(".reply_button").click(function(){
		 var rWriter = "${sessionScope.loginUser.empNo}";
		 var rContent = $(".rContent").val();
		 var aBoardNo = ${list2.aBoardNo};
		 
		 console.log(aBoardNo);
		 console.log(rWriter);
		 console.log(rContent);
		 
		 // 댓글 입력
		 $.ajax({
				url: "insertAllboardReply.bo",
				type: "post",
				data: {
					rWriter : rWriter,
					rContent : rContent,
					aBoardNo : aBoardNo
					
				},
				success: function(data) {
					console.log(data);
					window.location.reload();
				},
				error: function(error) {
					console.log(error)
				}
		 });
			 
		 
	 })
			
});
	 
	 /*   //댓글쓰기 버튼 (버튼을 눌러서 id값이 넘어와서 실행되는 자바스크립트 구문)
    listReply();
 	
        
    $("#btnReply").click(function(){
    console.log(listReply());
        
    var rContent = $("#rContent").val();    //댓글의 내용
    var empName =  "${allBoardReply.empName}";
    var params = {"rContent" : rContent, "empName" : empName};
    
    
    $.ajax({
        type: "post", //데이터를 보낼 방식
        url: "reply_insert.do", //데이터를 보낼 url
        data: params, //보낼 데이터
    
        
        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
            alert("댓글이 등록되었습니다.");
            listReply2();
                }
            });*/
      

</script>


<!-- <script>
//댓글 작성

			  var formObj = $(".replyForm form[role='form']");
			        
			  $(".repSubmit").click(function(){
			   formObj.attr("action", "replyWrite");
			   formObj.submit();
			   console.log();
			  });
</script> -->


<!-- <script>
  //댓글 리스트
  // 이전 코드 생략
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/selectOneAllBoard.bo";
		var paramData = {"aBoardNo" : "${allBoardDetail.aBoardNo}"};

		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
               	var htmls = "";
			if(result.length < 1){
				htmls.push("등록된 댓글이 없습니다.");
			} else {
	                    $(result).each(function(){
	                     htmls += '<div class="media text-muted pt-3" id="rid' + this.replyNo + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.empName + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.replyNo + ', \'' + this.empName + '\', \'' + this.rContent + '\' )" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.replyNo + ')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.rContent;
	                     htmls += '</p>';
	                     htmls += '</div>';

	                });	//each end
			}
			$("#replyList").html(htmls);
            }	   // Ajax success end
		});	// Ajax end
	}
</script>

<script>

	$(document).ready(function(){

		showReplyList();

	});

// 이하 코드 생략

</script>

<script>
//댓글 저장 버튼 클릭 이벤트
$(document).on('click', '#btnReplySave', function(){
	var replyContent = $('#rContent').val();
	var replyReg_id = $('#empName').val();

	var paramData = JSON.stringify({"rContent": replyContent
			, "empName": replyReg_id
			, "bid":'${allBoardDetail.aBoardNo}'
	});

	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: "${saveReplyURL}"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();

			$('#rContent').val('');

			$('#empName').val('');
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
});
</script>

<script>
function fn_editReply(replyNo, empName, rContent){

	var htmls = "";

	htmls += '<div class="media text-muted pt-3" id="replyNo' + replyNo + '">';
	htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	htmls += '<title>Placeholder</title>';
	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	htmls += '</svg>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">' + empName + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + replyNo + ', \'' + empName + '\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
	htmls += '</span>';
	htmls += '</span>';		
	htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
	htmls += content;
	htmls += '</textarea>';

	htmls += '</p>';
	htmls += '</div>';

	$('#replyNo' + replyNo).replaceWith(htmls);

	$('#replyNo' + replyNo + ' #editContent').focus();

}

htmls += '<div class="media text-muted pt-3" id="replyNo' + this.replyNo + '">';

$('#replyNo' + replyNo).replaceWith(htmls); 

</script>

<script>
//댓글 수정 내용 저장하기
function fn_updateReply(rid, reg_id){
	var replyEditContent = $('#editContent').val();

	var paramData = JSON.stringify({"rContent": replyEditContent
			, "replyNo": replyNo
	});

	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: "${updateReplyURL}"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
           	console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

</script>

<script>
function fn_deleteReply(rid){

	var paramData = {"replyNo": replyNo};

	$.ajax({
		url: "${deleteReplyURL}"
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

</script> -->



<script type="text/javascript">
/* ------------------------버튼------------------------ */
$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/allBoardUpdateView.bo");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/deleteAllBoard.bo");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				location.href = "board/allBoard/allBoardList";
			})
		})
</script>

<script>
/* ------------------------첨부파일------------------------ */
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
</script>

<script>
/* ------------------------레이어팝업------------------------ */
$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});
function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}

//------------에디터 툴-------------

$(document).ready(function() {
   //여기 아래 부분
   
   $('#summernote').summernote({
       height: 310,                 // 에디터 높이
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