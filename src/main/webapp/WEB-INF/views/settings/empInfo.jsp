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

	input, select{
		font-weight: 600;
	}

	#addMemberBody{
		width: 800px;
		height: 600px;		
		margin:0 auto;
		/* background: gray; */
	}
	
	#addFormTable{
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
	
	#addFormTable td{
		border: 1px solid #c9c9c9;
	}

	button{
		cursor: pointer;
	}

</style>


</head>
<body>
	
		<div id="addMemberBody">
			<br>
			<!-- <form action="" method="post" id="empModifyForm" enctype="multipart/form-data"> -->
			<form action="updateDetail.me" method="post" id="empUpdateForm" enctype="multipart/form-data">
				<table id="addFormTable">
					<colgroup>
						<col width="27%" />
						<col width="20%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					
					<tr>
						<td colspan="2" rowspan="4">
							<img id="pictureDiv" name="pictureDiv" src="${ contextPath }/resources/uploadFiles/${ userInfo.photoName }">
							<!-- <div id="pictureDiv" name="pictureDiv"></div> -->
							<div id="addPicture">사진 수정</div>
							<input type="file" name="cngPic" id="picture" style="display:none;" onchange="LoadImg(this);">
							<input type="hidden" name="originPicture" value="${ userInfo.photoName }">
						</td>
						<td>사번</td>
						<td colspan="3" style="text-align: left;">
							<input type="text" style="margin-left: 30px;" class="addFormInput" name="empNo" id="empNo" value="${ userInfo.empNo }">
						</td>										
					</tr>
					
					<tr>
						<td>이름</td>
						<td colspan="3" style="text-align: left;"><input type="text" 
							style="margin-left: 30px;" class="addFormInput" name="empName" id="empName" value="${ userInfo.empName }">
						</td>																	
					</tr>
					
					<tr>
						<td>입사일</td>
						<td colspan="3" style="text-align: left;"><input type="date" 
							style="margin-left: 30px;"  class="addFormInput" id="enrollDate" name="entryDate" value="${ userInfo.entryDate }"></td>
						
					</tr>
					<tr>
						<td>핸드폰번호</td>
						<td colspan="3" style="text-align: left;"><input type="text" 
							style="margin-left: 30px;"  class="addFormInput" id="phone" name="phone" value="${ userInfo.phone }">
						</td>		
						
					</tr>
					<tr>
					<!--<tr>
						 <td>주민번호</td>
						<td>
							<input type="text" size="9" maxlength="6" style="height:30px" > - 
							<input type="text" size="9" maxlength="7" style="height:30px" >
						</td>	 -->
						<td>직위</td>
						<td colspan="2" style="text-align: left;">
							<select style="margin-left: 10px;" class="addMemberSelect" id="jopPosition" name="positionNo">
								<!-- <option>사원</option>
								<option>주임</option>
								<option>대리</option>
								<option>과장</option>
								<option>차장</option>
								<option>부장</option>
								<option>실장</option>
								<option>본부장</option>
								<option>이사</option>
								<option>대표이사</option> -->
							</select>
						</td>
						
						<td>직책</td>
						<td colspan="2" style="text-align: left;">
							<select style="margin-left: 30px;" class="addMemberSelect" id="jopDuty" name="dutyNo">
								<!-- <option>없음</option>											
								<option>팀장</option> -->
							</select>
						</td>
					</tr>
											
					<tr>
						
						<td>소속</td>
						<td colspan="2" style="text-align: left;">
							<select style="margin-left: 10px;" class="addMemberSelect" id="belong" name="deptNo">
								<!-- <option>미지정</option>
								<option>영업팀</option>
								<option>인사팀</option>
								<option>관리팀</option>
								<option>총무팀</option> -->
							</select>
						</td>
						
						<td>재직여부</td>
						<td colspan="2" style="text-align: left;">
							<select style="margin-left: 30px;" class="addMemberSelect" id="empStatus" name="empStatus">
								<option value="1">재직</option>
								<option value="2">휴직</option>
								<option value="3">퇴사</option>
							</select>
						</td>
					</tr>
				
					
					<tr>
						<td>우편번호</td>
						<td colspan="4"><input type="text" id="zipCode" name="zipCode" value="${ userInfo.zipCode }"><div id="zipCodeSearch">찾 기</div></td>
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
		
		
		<script>
			$(function() {
				
				
				$("#addPicture").click(function (){
					$("#picture").click();
				});
				
				$("#submitBtn").click(function(){
					
					var $address = $("#address");
					$address.val($("#address1").val() + "$" + $("#address2").val());
					
					$("#empUpdateForm").submit();	
					opener.parent.location.reload();
					//self.close();
				});
				
				$("#resetBtn").click(function(){
					self.close();
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
		
		<script>
			$(function() {
				/* 부서 가져오는 ajax */
				$.ajax({
	 				type:"POST",
	 				url :'selectDeptList.st',
	 				async: false,
	 				success:function(data){
	 					//console.log(data);
	 					for(var key in data){
	 						if(data[key].deptNo != '001'){
	 							if(data[key].deptName == '미지정'){
	 								var $option = "<option selected value='"+ data[key].deptNo +"'>" + data[key].deptName + "</option>"
		 							$("#belong").append($option);		
	 							}else {
	 								var $option = "<option value='"+ data[key].deptNo +"'>" + data[key].deptName + "</option>"
		 							$("#belong").append($option);			
	 							}
	 							
	 						}
	 					}
	 				}
				});
				/* 직위 가져오는 ajax */
				$.ajax({
	 				type:"POST",
	 				url :'selectPositionList.me',
	 				async: false,
	 				success:function(data){
	 					for(var key in data){
	 						if(data[key].positionName == '사원'){
	 							var $option = "<option selected value='"+ data[key].positionNo +"'>" + data[key].positionName + "</option>"
		 						$("#jopPosition").append($option);
	 						}else {
	 							var $option = "<option value='"+ data[key].positionNo +"'>" + data[key].positionName + "</option>"
		 						$("#jopPosition").append($option);	
	 						}	 						
	 					}
	 					
	 				}
				});
				/* 직책 가져오는 ajax */
				$.ajax({
	 				type:"POST",
	 				url :'selectDutyList.me',
	 				async: false,
	 				success:function(data){
	 						 					
	 					for(key in data){
	 						if(data[key].dutyName == '없음'){
	 							var $option = "<option selected value='"+ data[key].dutyNo +"'>" + data[key].dutyName + "</option>"
	 							$("#jopDuty").append($option);		
	 						}else {
	 							var $option = "<option value='"+ data[key].dutyNo +"'>" + data[key].dutyName + "</option>"
	 							$("#jopDuty").append($option);
	 						}
	 					}
	 				}
				});
			});
		</script>
		
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
		
		<script>
			$(function(){
				//console.log("${ userInfo }");
				
				//직위 세팅
				$("#jopPosition option").each(function(){
					if($(this).val() == "${ userInfo.positionNo }"){
						$(this).attr('selected', true);
					}
				});
				
				//부서 세팅
				$("#belong option").each(function(){
					if($(this).val() == "${ userInfo.deptNo }"){
						$(this).attr('selected', true);
					}
				});
				
				//직책 세팅
				$("#jopDuty option").each(function(){
					if($(this).val() == "${ userInfo.dutyNo }"){
						$(this).attr('selected', true);
					}
				});
				
				//재직여부 세팅
				$("#empStatus option").each(function(){
					if($(this).val() == "${ userInfo.empStatus }"){
						$(this).attr('selected', true);
					}
				});
				
				//주소 세팅
				$("#address1").val("${ userInfo.address }".split("$")[0]);
				$("#address2").val("${ userInfo.address }".split("$")[1]);
				
				
				
				
			});
		</script>
		
	
</body>
</html>