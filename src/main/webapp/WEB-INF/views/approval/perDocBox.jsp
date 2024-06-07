<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#perTab {	
		border-collapse:separate;
		border-spacing:0 8px;
	}
	.sg_status {
		border-radius:5px;
		background-color:#FFC462;
		color:white;
		text-align:center;
		width:80px;
	}
	.contentDiv {
		height: 715px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- 메뉴바 include -->
		<jsp:include page="../common/menubar.jsp" />
   		<jsp:include page="../approval/approvalMenubar.jsp"/>

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle" style="font-size: 18px;">개인문서함</b> <br>
			<br>
			<div class="contentDiv" style="border: 0px;">
				<div class="searchDiv" style="text-align: right; height: 50px;">
					<select style="height: 23px;">
						<option>통합검색</option>
					</select> &nbsp;
					<div style="float: right; border: 0.5px solid #C4C4C4;">
						<input type="text" style="border: none;"> <img
							src="${ contextPath }/resources/images/approval/search.png"
							class="searchImg" style="width: 20px; height: 20px;">
					</div>
				</div>
				<div style="height: 370px;">
					<table id="perTab">
						<tr>
							<td colspan="9"><hr
									style="margin-top: 0px; margin-bottom: 3px;"></td>
						</tr>
						<tr>
							<th style="width: 100px;">NO</th>
							<th style="width: 300px;">결재양식</th>
							<th style="width: 100px;">긴급</th>
							<th style="width: 100px;">유형</th>
							<th style="width: 400px;">제목</th>
							<th style="width: 150px;">기안자</th>
							<th style="width: 150px;">기안일</th>
							<th style="width: 80px;">결재일</th>
							<th style="width: 150px;">결재상태</th>
						</tr>
						<tr>
							<td colspan="9"><hr
									style="margin-top: 2px; margin-bottom: 2px;"></td>
						</tr>
						<tr>
							<td>10</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>9</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>8</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>열람</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>7</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>6</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>열람</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>5</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>열람</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>4</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>3</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>2</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td>1</td>
							<td>출장여비신청</td>
							<td><img
								src="${contextPath }/resources/images/approval/alert.png"
								style="width: 17px; height: 17px"></td>
							<td>참조</td>
							<td>3월 국내 출장 여비 신청 건</td>
							<td>박해영</td>
							<td>20/03/18</td>
							<td>20/03/19</td>
							<td><div class="sg_status">반려</div></td>
						</tr>
						<tr>
							<td colspan="9"><hr
									style="margin-top: 0px; margin-bottom: 3px;"></td>
						</tr>
					</table>
				</div>
				<div style="text-align: center;">◀ < 1 2 3 4 5 6 7 8 9 10 > ▶
				</div>
			</div>
		</div>
		<!-- 본문 영역 끝 -->
		
		<jsp:include page="../approval/writeModal.jsp"/>
		<!-- footer 영역 시작 -->
		<footer class="footer"></footer>
		<!-- footer 영역 끝-->

	</div>
</body>
</html>