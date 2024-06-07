<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>	
	#addMemberPage{
		width: 800px;
		height: 620px;
		margin: 0 auto; 
	}
	#addMemberTitle{
		width: 100%;
		height: 30px;
		font-size: 25px;
	}
	#addMemberBody{
		width: 800px;
		height: 600px;		
		margin:0 auto;
		/* background: gray; */
	}
	
	#updateFormTable{
		width: 800px;
		height: 470px;
		text-align: center;
		font-size: 12px;
		font-weight: 900;
		
	}
	
	.addMemberSelect{
		width: 200px;
		height: 30px;
	}
	
	.addFormInput{
		width: 200px;
		height: 30px;
	}
	
	#enrollDate{
		width: 200px;
		height: 30px;
	}
	
	#email{
		width: 115px;
		height: 30px;
	}
	
	#zipCode{
		margin-left: 10px;
		width: 85px;
		height: 30px;
		float: left;
	}
	#zipCodeSearch{
		margin-left: 10px;
		width: 55px;
		height: 30px;
		line-height: 30px;
		float: left;
		background: #0871B9;
		border: 1px solid #0871B9;
		color: white;
		cursor: pointer;
	}
	
	.addressInput{
		width: 595px;
		height: 30px;
	}
	
	#pictureDiv{
		width: 130px;
		height: 160px;
		background: gray;
		margin:0 auto;
	}
	
	#addPicture{
		width: 130px;
		height: 30px;
		line-height: 30px;
		font-size: 15px;
		background: lightgray;
		color: white;
		margin: 0 auto;
		margin-top: 10px;
		cursor: pointer;
	}
	
	#addPicture:hover{
		background: #0871B9;
	}
	
	#submitBtn{
		width: 100px;
		height: 30px;
		background: #0871B9;
		color: white;
		border: 1px solid #0871B9;
	}
	#resetBtn{
		width: 100px;
		height: 30px;
		background: white;
		color: red;
		border: 1px solid black;
	}
	
	table td {
		height: 53px;
	}
	
	/* 유효성 검사 스타일 */
	.checkLabel{
		margin: 0;
		margin-left: 10px;
		width: 180px;
		height: 20px;
		line-height: 20px;
		font-size: 10px;
	}
	

</style>

<!-- <script>
	$(function(){
		$('.nav2_settings').show();
		$('.nav1').css("margin-right", "0px");
		$('.contentDiv').css("width", "850px");
	});
</script> -->

</head>
<body>


	<div class="wrap">
	<!-- 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="infoMenu.jsp" />

		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">기본 정보</b>
			<br><br>
			<div class="contentDiv">
				<div id="addMemberPage">				
					<div style="margin-top:10px;" id="addMemberTitle">계정 정보 수정</div>
					<br>
					<hr style="height:2px; background: #C9C9C9; margin: 2px;">
					
					<div id="addMemberBody">
						<br>
						<form action="update.me" method="post" id="empUpdateForm" enctype="multipart/form-data">
						
							<table id="updateFormTable" border=1>
								<colgroup>
									<col width="27%" />
									<col width="20%" />
									<col width="20%" />
									<col width="30%" />
								</colgroup>
								
								<tr>
									<td colspan="2" rowspan="4">
										<img id="pictureDiv" name="pictureDiv" src="${ contextPath }/resources/uploadFiles/${ loginUser.photoName }">
										<!-- <div id="pictureDiv" name="pictureDiv"></div> -->
										<div id="addPicture">사진 수정</div>
										<input type="file" name="cngPic" id="picture" style="display:none;" onchange="LoadImg(this);">
										<input type="hidden" name="originPicture" value="${ loginUser.photoName }">
									</td>
									<td>사번
										<input type="hidden" id="empEmail" name="empEmail">
										<input type="hidden" id="empPwd" name="empPwd">
									</td>
									<td colspan="3" style="text-align: left;">
										<input type="text" style="margin-left: 30px; background: #e9e9e9;" class="addFormInput" 
												name="empNo" id="empNo" value="${ loginUser.empNo }" readonly>
										<label class="checkLabel" id="empNoCheck"></label>										
									</td>										
								</tr>
								
								<tr>
									<td>이름</td>
									<td colspan="3" style="text-align: left;"><input type="text" 
										style="margin-left: 30px; background: #e9e9e9;" class="addFormInput" 
										name="empName" id="empName" value="${ loginUser.empName}" readonly>
										<label class="checkLabel" id="empNameCheck"></label>	
									</td>																	
								</tr>
								
								<tr>
									<td>입사일</td>
									<td colspan="3" style="text-align: left;"><input type="date" 
										style="margin-left: 30px; background: #e9e9e9;"  class="addFormInput" 
										id="enrollDate" name="entryDate" value="${ loginUser.entryDate }" readonly></td>
									
								</tr>
								<tr>
									<td>핸드폰번호</td>
									<td colspan="3" style="text-align: left;"><input type="text" 
										style="margin-left: 30px;"  class="addFormInput" 
										id="phone" name="phone" value="${ loginUser.phone }">
										<label class="checkLabel" id="phoneCheck"></label>
									</td>		
									
								</tr>
								<tr>								
									<td>직위</td>
									<td colspan="2" style="text-align: left;">									
										<input style="margin-left: 10px; background: #e9e9e9;" class="addMemberSelect"  type="text" id="jopPosition" name="positionName" value="${ loginUser.positionName }" readonly>
										<input type="hidden" name="positionNo" value="${ loginUser.positionNo }">
									</td>
									
									<td>직책</td>
									<td colspan="2" style="text-align: left;">
										<input style="margin-left: 30px; background: #e9e9e9;" class="addMemberSelect"  type="text" id="jopDuty" name="dutyName" value="${ loginUser.dutyName }" readonly>
										<input type="hidden" name="dutyNo" value="${ loginUser.dutyNo }">
									</td>
								</tr>
														
								<tr>
									
									<td>소속</td>
									<td colspan="2" style="text-align: left;">
										<input style="margin-left: 10px; background: #e9e9e9;" class="addMemberSelect"  type="text" id="belong" name="deptName" value="${ loginUser.deptName }" readonly>
										<input type="hidden" name="deptNo" value="${ loginUser.deptNo }">
									</td>
									
									<td>재직여부</td>
									<td colspan="2" style="text-align: left;">
										
										<c:if test="${ loginUser.empStatus  eq 1}">
											<c:set var="empStatus" value="재직" />									
										</c:if>
										<c:if test="${ loginUser.empStatus  eq 2}">
											<c:set var="empStatus" value="휴직" />
										</c:if>
										<c:if test="${ loginUser.empStatus  eq 3}">
											<c:set var="empStatus" value="퇴사" />
										</c:if>
										<input style="margin-left: 30px; background: #e9e9e9;" class="addMemberSelect"  type="text" 
										id="jopDuty" value="${ empStatus }" readonly>	
										<input type="hidden" name="empStatus" value="${ loginUser.empStatus }" readonly>																		
									</td>
								</tr>
							
								
								<tr>
									<td>우편번호</td>
									<td colspan="4"><input type="text" id="zipCode" name="zipCode" value="${ loginUser.zipCode }"><div id="zipCodeSearch">찾 기</div></td>
								</tr>
								<tr>
									<td>주소<input type="hidden" name="address" id="address"></td>
									<td colspan="4" style="text-align: left;"><input style="margin-left: 10px;" class="addressInput" type="text" id="address1" name="address1"></td>
								</tr>
								<tr>
									<td>상세주소</td>
									<td colspan="4" style="text-align: left;"><input style="margin-left: 10px;" class="addressInput" type="text" id="address2" name="address2"></td>
									
								</tr>
								<tr>
									<td colspan="6">
										<button id="submitBtn" type="button">수 정</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="resetBtn">취 소</button>
										
									</td>
								</tr>		
								
							</table>
						</form>
						
					</div>
					
					
				</div>
			
			</div>
		

		<script>
			$(function() {
				$("#addPicture").click(function (){
					$("#picture").click();
				});
				
				
				$("#address1").val("${ loginUser.address}".split("$")[0]);
				$("#address2").val("${ loginUser.address}".split("$")[1]);
				
				$("#submitBtn").click(function(){
					
					var $address = $("#address");
					$address.val($("#address1").val() + "$" + $("#address2").val());
					
					$("#empUpdateForm").submit();
				});
				
			});
			
			function LoadImg(value){
				if(value.files && value.files[0]){
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#pictureDiv").attr("src", e.target.result);
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
		</script>

	</div>
	
	
	<!-- 주소 입력 -->
	<script>
		$("#zipCodeSearch").click(function() {
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            
		        	jQuery("#zipCode").val(data.zonecode);
					jQuery("#address1").val(data.address);
		        }
		    }).open();
		});
	</script>
	<!-- 주소 입력 끝 -->
	
	

</body>
</html>