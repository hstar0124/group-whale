<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>	
	.contentTitle {
	}
	
	.contentDiv {
	width:750px;
	height:680px;
	text-align:left;
	}
	
	table {
	border-collapse: separate;
	height:550px;
	/* width:750px; */
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
			<div class="contentDiv" style="width:850px">
				<br>
				<form method="post" action="allBoardUpdateView.bo?aBoardNo=${updateAllBoard.aBoardNo}">
				<table>
					<colgroup>
						<col width="8%" />
						<col width="77%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<td>
							<label>분류</label>
						</td>
						<td style="text-align:left;">
							<select style="border:2px solid lightgray; width:80px; height:30px; text-align-last:center;">
								<option>분류선택</option>
								<option>공통</option>
								<option>IT</option>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="test"><label>제목</label></td>
						<td style="text-align:left;"><input type="text" name="aTitle" value="${updateAllBoard.aTitle}" style="width:500px; border:2px solid lightgray;"></td>
						<td></td>
					</tr>
					<tr>
						<td><label>작성자</label></td>
						<td style="text-align:left;">
						<%-- <input type="text" name="aWriter" value="${updateAllBoard.aWriter}" style="text-align:center; width:200px; border:2px solid lightgray;"> --%>
						<img class="btn2 profile_area" style="background-image: url('${ contextPath }/resources/uploadFiles/${ sessionScope.loginUser.photoName }');">
							<input type="hidden" id="aWriter" name="aWriter" value="${loginUser.empNo }" style="text-align:center; width:150px; border:2px solid lightgray;">
							<input type="text" name="empName" value="${loginUser.empName }" style="text-align:center; width:150px; border:2px solid lightgray;" readonly>
							<input type="hidden" name="surveyNo" id="surveyNo" value="${ list3.surveyNo }">
						</td>
						<td></td>
					</tr>
					<tr rowspan="2">
						<td><label>내용</label></td>
						<td class="td1" style="text-align:left;" colspan="2">
								<form method="post">
								<div id="textDiv">
 								 <textarea id="summernote" name="aContent" style="overflow-x:hidden; overflow-y:auto;"><c:out value="${updateAllBoard.aContent}"/></textarea>
								</div>
								</form>
							</td>
						<!-- <textarea cols="80" rows="8" style="resize: none; border:2px solid lightgray;"></textarea></td> -->
						<td></td>
					</tr>
					<tr>
						<td><label>파일첨부</label></td>
						<td colspan="2" class="fileBox" style="text-align:left;">
						<div class="filebox bs3-primary">
                            <input class="upload-name" value="파일선택" disabled="disabled">
                            	<label for="ex_filename">파일첨부</label> 
                          <input type="file" id="ex_filename" class="upload-hidden"> 
                        </div>
						</td>
					</tr>
					 <tr>
                        <td colspan="3" id="btn">
                        <label>
                        <br><br>
                            <button type="submit" class="formBtn" id="insertBtn">등록</button>
                           <button type="submit" class="formBtn" id="cancelBtn" onclick="location.href='selectListAllBoard.bo;'">취소</button>
                        </label>
                        </td>
                     </tr>
				</table>
				</form>
				
			</div>
			<br><br><br><br>
			
			<!-- <b class="contentTitle">기안 진행 문서</b>
			<br><br>
			<div class="contentDiv">두번째 Div</div>
			<br><br><br><br>
			
			<b class="contentTitle">완료 문서</b>
			<br><br>
			<div class="contentDiv">세번째 Div</div> -->
		</div>
		<!-- 본문 영역 끝 -->


		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->


	</div>
</body>

<script>
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
	        height: 220,                 // 에디터 높이
	        width: 701,
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
	          
	   });
	});
	
//------------에디터 툴-------------
</script>

</html>