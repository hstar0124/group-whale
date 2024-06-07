<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>	
 .buttonDiv{width:100%;}
 .buttonTable td { cursor: pointer; }
 .search { float:right; margin-right:5%;}
 /* .mailTable_td { width: 10%; }   */
 .checkbox{content: '';display: inline-block;width: 18px;height: 18px;line-height: 18px;text-align: center;background: #fafafa;border: 1px solid #cacece;border-radius: 3px;box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);}
.hr-sect {display: flex;flex-basis: 100%;align-items: center;color: black;font-size: 12px;margin: 8px 0px;}
.hr-sect::after {content: "";flex-grow: 1;background: black;height: 1px;font-size: 0px;line-height: 0px;margin: 0px 16px; border:1px solid #DDDDDD}

 #test_btn1{ border-radius: 5px;margin-right:-4px; } 
 #test_btn2{ border-top-right-radius: 5px; border-bottom-right-radius: 5px; margin-left:-3px; } 
 #btn_group button{ border: 1px solid #0871B9; background-color: rgba(0,0,0,0); color: #0871B9; padding: 5px; } 
 #btn_group button:hover{ color:white; background-color: #0871B9; }


</style>
<script>
	
</script>
</head>
<body>
	<div class="wrap">
	<!-- 메뉴바 include -->
	 <jsp:include page="mailMenubar.jsp" />

			<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->
		
		<div class="content" style="background:white;">
			<b class="contentTitle">보낸 메일함</b>
			<div class="search" style="border:1px solid black;">
			<select style="height:25px;" id="searchCondition" name="searchCondition">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input type="search" placeholder="검색" style="border:none;" name="searchValue" id="searchValue">
			<img class="nav1_icons" style="width:20px; height:20px;" onclick="searchMail()"
					src="/gw/resources/images/mail/search.png">
			</div>
			
			<script>
				function searchMail(){
					var searchCondition = $("#searchCondition").val();
					var searchValue = $("#searchValue").val();
					
					location.href="search.ml?searchCondition=" + searchCondition +"&searchValue=" + searchValue;
				}
			</script>
			
			<hr style="border:1px solid #DDDDDD">

			<div class="buttonDiv" id="btn_group" style="border:1px solid white;">
             <table class="buttonTable">
               <tr>
         <td style="width:45px;"><input type="checkbox" class="checkbox checkboxAll" style="margin-left:11px"></td>
                  <td style="width:80px;" class="buttonTable_td" >
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 2px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/bin.png">&nbsp;
                           삭제
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="location.href=''">임시삭제</li>
                           <li onclick="location.href=''">완전삭제</li>
                        </ul>
                     </label>
                  </div>
               </td>
                  <td style="width:75px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/reply.png">&nbsp;전달</div></td>
                  <td style="width:80px;"class="buttonTable_td">
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 3px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/sheet.png">&nbsp;
                           이동
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="location.href=''">이동1</li>
                           <li onclick="location.href=''">이동2</li>
                        </ul>
                     </label>
                  </div>
               </td>
                  <td style="width:80px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/save.png">&nbsp;저장</div></td>
                  <td style="width:75px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/ink.png">&nbsp;인쇄</div></td>
                  <td style="width:100px;"class="buttonTable_td">
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 3px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/list.png">
                           정렬기준
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="location.href=''">기준1</li>
                           <li onclick="location.href=''">기준2</li>
                           <li onclick="location.href=''">기준3</li>
                           <li onclick="location.href=''">기준4</li>
                        </ul>
                     </label>
                     </div>
                  </td> 
               </tr>
            </table>
            
            </div>
            
            
            <hr style="border:1px solid #DDDDDD;">
            
			
			<div class="contentDiv" style="border:1px solid white; padding:0px; padding-left:10px;">
			<table class="mailTable">
			
			<c:forEach var="m" items="${ list }">
			<tr style="height:45px;">
						<td style="width:50px;"><input type="checkbox" class="checkbox"></td>			
			<td style="width:30px;"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/star.png"></td>
			<td style="width:30px;"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/mail.png"></td>
					<c:if test="${ !empty m.eaSize }">
			<td style="width:30px;"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/attach.png"></td>
					</c:if>
					<c:if test="${ empty m.eaSize }">
					<td style="width:30px;"></td>
					</c:if>
				<td style="display:none;"><c:out value="${ m.mailNo }"/></td>
				<td style="width:300px;"><c:out value="${ m.receiver }"/></td> <!-- 여기는 받은 사람 이메일 -->
				<td style="width:250px;"><c:out value="${ m.mailSubject }"/></td>
				<td style="width:200px;"><c:out value="${ m.mailEnrollDate }"/></td>
				<c:if test="${!empty m.eaSize}">
				<td style="width:150px;"><c:out value="${ m.eaSize}"/>KB</td>
				</c:if>
				<c:if test="${ empty m.eaSize }">
				<td style="width:150px;"></td>
				</c:if> 
			</tr>
			</c:forEach>
			
			</table>
			
			</div>
			<!-- <b class="contentTitle">기안 진행 문서</b>
			<br><br>
			<div class="contentDiv">두번째 Div</div>
			<br><br><br><br>
			
			<b class="contentTitle">완료 문서</b>
			<br><br>
			<div class="contentDiv">세번째 Div</div>
		</div> -->
	
								<div id="pagingDiv" align="center">
					<ul class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<li class="disabled">
								<a href="${ blistBack }">
									<span>«</span>
								</a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="send.ml">
								<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
							</c:url>
							<li>
								<a href="${ blistBack }">
									<span>«</span>
								</a>
							</li>
						</c:if>
							 
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<li class="active"><a href="#">${ p }</a></li>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="send.ml">
									<c:param name="currentPage" value="${ p }" />
								</c:url>
								<li><a href="${ blistCheck }">${ p }</a></li>
							</c:if>				
						</c:forEach>
							
							
						<c:if test="${ pi.currentPage >= pi.endPage }">
							<li class="disabled">
								<a href="${ blistBack }">
									<span>»</span>
								</a>
							</li>
						</c:if>
							
						<c:if test="${ pi.currentPage < pi.endPage }">
							<c:url var="blistEnd" value="send.ml">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
							</c:url>
							<li>
								<a href="${ blistEnd }">
									<span>»</span>
								</a>
							</li>								 
						</c:if>	
					</ul>
				</div>
					
			</div>
		
		
		</div>
		<!-- 본문 영역 끝 -->
	<script>
		$(function(){
			$(".mailTable").find("td").mouseenter(function(){
				$(this).parents("tr").css({"background" : "#ECECEC" , "cursor" : "pointer"})
			}).mouseout(function(){
				$(this).parents("tr").css({"background" : "white"})
			}).click(function(){
				if($(this).html() != $(this).parent().find('td').eq(0).html()
						&& $(this).html() != $(this).parent().find('td').eq(1).html()
						&& $(this).html() != $(this).parent().find('td').eq(2).html()
						&& $(this).html() != $(this).parent().find('td').eq(3).html()
						){
				var mailNo = $(this).parents().children("td").eq(4).text();//메일번호
				var receiver = $(this).parents().children("td").eq(5).text();//받는 사람
				
				console.log(mailNo);
				
				location.href="sendDetail.ml?mailNo=" + mailNo + "&receiver=" + receiver;
				}
			});
		});
		
		
		    $(".checkboxAll").click(function(){
        //클릭되었으면
        if($(".checkboxAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $(".checkbox").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $(".checkbox").prop("checked",false);
        }
    });

	
	</script>

	<script>
		$(function(){
			console.log(${m.eaSize});
		});
	</script>
	



</body>
</html>