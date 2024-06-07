<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>	
	.addFormBtn{
		border-radius: 5px;
	}

	input, select {
		border: 1px solid #c9c9c9;
		border-radius: 5px;
	}

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
	<jsp:include page="settingsMenu.jsp" />


		<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->

		<div class="content">
			<b class="contentTitle">계정등록</b>
			<br><br>
			<div class="contentDiv" style="border: 0; border-radius: 10px;">			
				<div id="addMemberPage">				
					<div style="margin-top:10px;" id="addMemberTitle">계정 정보 입력</div>
					<br>
					<hr style="height:2px; background: #C9C9C9; margin: 2px;">
					
					<div id="addMemberBody">
						<br>
						<form action="insert.me" method="post" id="empCreateForm" enctype="multipart/form-data">
						
							<table id="addFormTable" border="1" style="border-radius: 10px;">
								<colgroup>
									<col width="27%" />
									<col width="20%" />
									<col width="20%" />
									<col width="30%" />
								</colgroup>
								
								<tr>
									<td colspan="2" rowspan="4">
										<img id="pictureDiv" name="pictureDiv">
										<!-- <div id="pictureDiv" name="pictureDiv"></div> -->
										<div id="addPicture">사진 등록</div>
										<input type="file" name="picture" id="picture" style="display:none;" onchange="LoadImg(this);">
									</td>
									<td>사번
										<input type="hidden" id="empEmail" name="empEmail">
										<input type="hidden" id="empPwd" name="empPwd">
									</td>
									<td colspan="3" style="text-align: left;">
										<input type="text" style="margin-left: 30px;" class="addFormInput" name="empNo" id="empNo" placeholder="숫자만 입력해주세요">
										<label class="checkLabel" id="empNoCheck"></label>										
									</td>										
								</tr>
								
								<tr>
									<td>이름</td>
									<td colspan="3" style="text-align: left;"><input type="text" 
										style="margin-left: 30px;" class="addFormInput" name="empName" id="empName" placeholder="2~4자리의 한글만 입력해주세요">
										<label class="checkLabel" id="empNameCheck"></label>	
									</td>																	
								</tr>
								
								<tr>
									<td>입사일</td>
									<td colspan="3" style="text-align: left;"><input type="date" 
										style="margin-left: 30px;"  class="addFormInput" id="enrollDate" name="entryDate"></td>
									
								</tr>
								<tr>
									<td>핸드폰번호</td>
									<td colspan="3" style="text-align: left;"><input type="text" 
										style="margin-left: 30px;"  class="addFormInput" id="phone" name="phone" placeholder="-없이 입력해주세요">
										<label class="checkLabel" id="phoneCheck"></label>
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
										<select style="margin-left: 30px;" class="addMemberSelect" id="jopPosition" name="empStatus">
											<option value="1">재직</option>
											<option value="2">휴직</option>
											<option value="3">퇴사</option>
										</select>
									</td>
								</tr>
							
								
								<tr>
									<td>우편번호</td>
									<td colspan="4"><input type="text" id="zipCode" name="zipCode"><div id="zipCodeSearch">찾 기</div></td>
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
										<button id="submitBtn" type="button" class="addFormBtn">등 록</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="resetBtn" class="addFormBtn">취 소</button>
										
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

		<!-- footer 영역 시작 -->
		<!-- <footer class="footer"></footer> -->
		<!-- footer 영역 끝-->
	</div>
	
	
	<!-- 유효성 검사 -->
	
	<script>
	$("#resetBtn").click(function(){
		 window.history.back();
	});
	
	
		var empNoCheck = 0;
		var empNameCheck = 0;
		var enrollDateCheck = 0;
		var phoneCheck = 0;
		
		var $empNo = $("#empNo");
		var $empName = $("#empName");
		var $enrollDate = $("#enrollDate");
		var $phone = $("#phone");
		var $zipCode = $("#zipCode");
		var $address2 = $("#address2");
		
		$(function() {			
			
			
			//empNo 유효성 결과 label
			var $empNoCheck = $("#empNoCheck");
			$empNoCheck.html("");			
			
			//empNo 유효성 검사
			$empNo.keyup(function() {
				var empNoRegExp = /^[0-9]{6,11}$/;
				
				if($empNo.val() != ""){
					if (!empNoRegExp.test($empNo.val())) {
						//console.log("사번형식에 맞춰주세요");	
						$empNoCheck.html("6~11자리의 숫자만 입력해주세요").css("color","red");
						empNoCheck = 0;
					}else {
						//console.log("적합")
						$empNoCheck.html("");
						$.ajax({
        	 				type:"POST",
        	 				url :'empNoCheck.me',
        	 				async: false,
        	 				data:{
        	 					"empNo" : $empNo.val()
        	 				},
        	 				success:function(data){
        	 					//data : 1이면 중복값 존재, 0 이면 중복값 없음
        	 					//console.log("나 에이작스 잘 다녀옴 " + data); 
        	 					if(data == 1){
        	 						$empNoCheck.html("사번이 이미 존재합니다.").css("color","red");
        	 						empNoCheck = 0;
        	 					}else {
        	 						$empNoCheck.html("사용 가능한 사번입니다.").css("color","#53C251");
        	 						empNoCheck = 1;
        	 					}
        	 				}
						});
					}
				} else {
					$empNoCheck.html("");
					empNoCheck = 0;
				}
			});
			
			
			//empName 유효성 검사
			var $empNameCheck = $("#empNameCheck");
			$empNameCheck.html("");
			
			$empName.keyup(function(){
				//console.log('뭔가 일어나고 있다.');
				var empNameRegExp = /^[가-힣]{2,4}$/; //이름 유효성 검사 2~4자 사이
				if($empName.val() != ""){
					
					if (!empNameRegExp.test($empName.val())) {
						$empNameCheck.html("2~4자리의 한글만 입력해주세요").css("color","red");
						empNameCheck = 0;
					}else {
						$empNameCheck.html("")
						empNameCheck = 1;
					}
					
				}else {
					$empNameCheck.html("");
					empNameCheck = 0;
				}
			});
			
			//전화번호 유효성 검사
			var $phoneCheck = $("#phoneCheck");
			$phoneCheck.html("");
			
			$phone.keyup(function(){
				//console.log('뭔가 일어나고 있다.');
				//var phoneRegExp = /^[0-9]{9, 12}$/; //이름 유효성 검사 9~12자 사이 숫자만
				var phoneRegExp = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;				
				if($phone.val() != ""){					
					if (!phoneRegExp.test($phone.val())) {
						$phoneCheck.html("핸드폰번호 양식에 맞춰주세요").css("color","red");
						phoneCheck = 0;
					}else {
						$phoneCheck.html("")
						phoneCheck = 1;
					}
					
				}else {
					$phoneCheck.html("");
					phoneCheck = 0;
				}
			});
			
			
		});
		
		//enrollDate 유효성 검사			
		$enrollDate.change(function(){
			console.log($enrollDate.val());
			enrollDateCheck = 1;
		});
		
		$("#submitBtn").click(function(){
			//console.log("submit 눌림")
			var picCheck;
			if($("#picture").val() == ''){
				picCheck = 0;
			} else {
				picCheck = 1;
			}
			
			if(empNoCheck == 1 && empNameCheck == 1 && enrollDateCheck == 1 && picCheck == 1 &&
					phoneCheck == 1 && $zipCode.val() != "" && $address2.val() != ""){
				var $address = $("#address");
				$address.val($("#address1").val() + "$" + $("#address2").val());
				//console.log($address.val());
				
				var $email = $("#empEmail");
				$email.val($("#empNo").val() + "@groupwhale.com");
				//console.log($email.val());
				
				var $empPwd = $("#empPwd");
				$empPwd.val($("#empNo").val());			
				
				$("#empCreateForm").submit();
			}else if(picCheck == 0){
				swal("잘못된 입력", "사진을 넣어주세요!", "error");
			}else if(empNoCheck == 0){
				swal("잘못된 입력", "사번을 제대로 입력해주세요", "error");
				//alert("사번을 제대로 입력해주세요");
			}else if(empNameCheck == 0){
				//alert("이름을 제대로 입력해주세요");
				swal("잘못된 입력", "이름을 제대로 입력해주세요", "error");
			}else if(enrollDateCheck == 0){
				//alert("입사일을 입력해주세요");
				swal("잘못된 입력", "입사일을 제대로 입력해주세요", "error");
			}else if(phoneCheck == 0){
				//alert("핸드폰번호를 입력해주세요")
				swal("잘못된 입력", "핸드폰번호를 제대로 입력해주세요", "error");
			}else if($zipCode.val() == ""){
				//alert("주소를 입력해주세요");
				swal("잘못된 입력", "주소를 제대로 입력해주세요", "error");
			}else if($address2.val() == ""){
				swal("잘못된 입력", "주소를 제대로 입력해주세요", "error");
			}
				
			
		});
	</script>
	
	<!-- 유효성 검사 끝 -->
	
	
	
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