<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>	
	.contentTitle {
	}
	
	.contentDiv {
	height:600px;
	}
	/* .contentDiv2 {
	width:95%;
	margin:auto;
	text-align:right;
	} */
	
	table {
	/* border:1px solid lightgray; */
	border-collapse: separate;
	width:90%;
	height:400px;
	margin:auto;
	text-align:center;
	/* width:750px; */
	/* border-bottom: 2px solid lightgray; */
	}
	
	.boardTable td {
	boarder:1px solid lightgray;
	text-align:center;
	border-bottom: 2px solid lightgray;
	}
	
	.keyword {
	vertical-align:top;
  	background-image : url('search.png'); 
 	background-position:top right; 
 	background-repeat:no-repeat;

	}

	#button2{
	width: 50px;
	height: 30px;
	border: 0px;
	background: lightgray;
	outline: none;
	float: right;
	color: white;
	}
</style>

</head>
<body>
   <div class="wrap">
   <!-- 메뉴바 include -->
   <jsp:include page="boardMenubar.jsp" />

	<!-- 게시판 메뉴 -->







     <!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">공지사항</b>
			<br><br>
			<div class="contentDiv" style="width:800px">
			<br><br>
				<%-- <div class="contentDiv2">
					<select style="border:2px solid lightgray; width:80px; height:30px; text-align-last:center;">
						<option>제목</option>
						<option>번호</option>
					</select>
					<input type="text" class="keyword" style="border:2px solid lightgray; width:200px; height:30px;">
					<button><img src="${ contextPath }/resources/images/icons/search.png" width="20px"></button>
				</div> --%>
				
					<table class="boardTable">
						<colgroup>
							<col width="10%" />
							<col width="45%" />
							<col width="15%" />
							<col width="20%" />
							<col width="10%" />
						</colgroup>
						<!-- <tr>
								<td colspan="5">
								<div id="search2">
									<input id="input2" type="text" placeholder="검색어 입력">
									<button id="button2">검색</button>
								</td>
								</div>
						</tr> -->
						<tr>
							<td colspan="5" style="text-align:right;">
								<select style="border:2px solid lightgray; width:80px; height:30px; text-align-last:center;">
									<option>제목</option>
									<option>번호</option>
								</select>
									<input type="text" class="keyword" style="border:2px solid lightgray; width:200px; height:30px;">
									<%-- <button><img src="${ contextPath }/resources/images/icons/search.png" width="20px"></button> --%>
									<button id="button2">검색</button>
							</td>
						</tr>
						<tr>
							<td><label>번호</label></td>
							<td><label>제목</label></td>
							<td><label>작성자</label></td>
							<td><label>작성일</label></td>
							<td><label>조회수</label></td>
						</tr>
						<tr style="background:#ECEFF1;">
							<td><img style="vertical-align: top;" src="${ contextPath }/resources/images/icons/notice.png" width="20px"></td>
							<td><b>최신 공지 글입니다.</b></td>
							<td><b>행정팀</b></td>
							<td><b>13:22</b></td>
							<td><b>1</b></td>
						</tr>
						<tr style="background:#ECEFF1;">
							<td><img style="vertical-align: top;" src="${ contextPath }/resources/images/icons/notice.png" width="20px"></td>
							<td><b>최신 공지 글입니다.</b></td>
							<td><b>행정팀</b></td>
							<td><b>13:22</b></td>
							<td><b>1</b></td>
						</tr>
						<tr>
							<td>8</td>
							<td>호성맛!!!궁금해 허니~</td>
							<td>호성맛</td>
							<td>13:22</td>
							<td>500</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
						<tr>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
							<td>공란</td>
						</tr>
					</tbody>
				</table>
			
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
</html>