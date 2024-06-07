<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
 .buttonDiv{width:100%;}
 .buttonTable td { cursor: pointer; }
 .mailTable{width:100%; } 
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
			<b class="contentTitle">받은 메일함</b>
			   &nbsp;  
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

			<div class="buttonDiv" id="btn_group" style="border:1px solid white; margin-left:140px;">
            <table class="buttonTable">
            
               <tr>
         <td style="width:100px;"class="buttonTable_td"><div onclick="location.href='${ contextPath }/goPage_IS'"><img class="nav1_icons" style="width:20px;  height:20px"
               src="/gw/resources/images/mail/forbidden.png">&nbsp;스팸신고</div></td>
         <td style="width:70px;"class="buttonTable_td"><div onclick="location.href='${ contextPath }/goPage_IS'"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/return.png">&nbsp;답장</div></td>
                  <td style="width:80px;" class="buttonTable_td" >
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 3px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/bin.png">&nbsp;
                           삭제
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="">임시삭제</li>
                           <li onclick="">완전삭제</li>
                        </ul>
                     </label>
                  </div>
               </td>
                  <td style="width:65px;"class="buttonTable_td"><div onclick="location.href='${ contextPath }/goPage_IS'"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/reply.png">&nbsp;전달</div></td>
                  <td style="width:80px;"class="buttonTable_td">
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 2px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/sheet.png">&nbsp;
                           이동
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="">이동1</li>
                           <li onclick="">이동2</li>
                        </ul>
                     </label>
                  </div>
               </td>
                  <td style="width:80px;"class="buttonTable_td"><div onclick="location.href='${ contextPath }/goPage_IS'"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/save.png">&nbsp;저장</div></td>
                  <td style="width:75px;"class="buttonTable_td"><div onclick="location.href='${ contextPath }/goPage_IS'"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/ink.png">&nbsp;인쇄</div></td>
                  <td style="width:100px;"class="buttonTable_td">
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 2px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/list.png">
                           정렬기준
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="">기준1</li>
                           <li onclick="">기준2</li>
                           <li onclick="">기준3</li>
                           <li onclick="">기준4</li>
                        </ul>
                     </label>
                     </div>
                  </td> 
               </tr>
            </table>
            </div>
           
           <hr style="border:1px solid #DDDDDD">
           
           <h3 style="margin-left:130px;">제목 : ${ map.mailSubject }</h3>
           <table style="margin-top:30px; margin-left:130px; font-size:15px;">
           	<tr>
           		<td style="width:100px; height:30px;">보낸 사람</td>
           		<td><%-- ${ map.from } --%>
           		<c:set var = "from" value = "${map.from}" />
				<c:if test="${! fn : contains(from, '@groupwhale.com')}">
				<c:out value="${ map.from }"/>
				</c:if>
				<c:if test="${ fn : contains(from, '@groupwhale.com')}">
				<c:out value="${ map.empName } ${ map.positionName } <${ map.from }>"/>
				</c:if>
           		</td>
           	</tr>
           	<tr>
           		<td style="width:100px; height:30px;">받는 사람</td>
           		<td>${ sessionScope.loginUser.getEmpEmail() }</td>
           	</tr>
           	<tr>
           		<td style="width:100px; height:30px;">받은 날짜</td>
           		<td>${ map.mailEnrollDate }</td>
           	</tr>
           </table>
				<h4>첨부 파일</h4>
			<c:if test="${ empty list }">
			 <div style="background-color:lightgray;">
			 <b style="margin:80px;">첨부파일이 없습니다.</b>
			 </div>
			 </c:if>
			 <c:if test="${ !empty list}">
			 	
			 	<c:forEach var="list" items="${ list }">
			 	<div>
			<a href="download.ml?eaNo=${ list.eaNo }" name="file" onclick="fn_fileDown('${list.eaNo}'); return false;">${list.originName}
			</a>(${Math.round(list.eaSize/1024)}KB)<br>
					</div>
			 	</c:forEach>
			 </c:if>
			 <p style="padding:30px;">${ map.mailContent }<p>
	

           </div>
	</div>



</body>
</html>