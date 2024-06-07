<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

</head>
<body>
   <div class="wrap">
   <!-- 메뉴바 include -->
   <jsp:include page="mailMenubar.jsp" />

			<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->
		
		<div class="content" style="background:white;">
			<b class="contentTitle">받은 메일함</b>
			   &nbsp;  <span style=" font-size:0.8em; color:gray;">전체 메일 0 / 안 읽은 메일 0</span> 
			<div class="search" style="border:1px solid black;">
			<select style="height:25px;">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input type="search" placeholder="검색" style="border:none;">
			<img class="nav1_icons" style="width:20px; height:20px;"
					src="/gw/resources/images/mail/search.png">
			</div>
			
			<hr style="border:1px solid #DDDDDD">

			<div class="buttonDiv" id="btn_group" style="border:1px solid white;">
            <table class="buttonTable">

            
               <tr>
         <td style="width:45px;"><input type="checkbox" class="checkbox checkboxAll" style="margin-left:11px"></td>
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
            
            
            <hr style="border:1px solid #DDDDDD;">
            
			<div class="hr-sect">오늘 받은 메일</div>
			
			<div class="contentDiv" style="border:1px solid white;">
			<table class="mailTable">
			<c:foreach start=1 end=5>
			<tr>
			<th style="width:35px;"><input type="checkbox" class="checkbox"></th>			
			<th><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/star.png"></th>
			<th><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/mail2.png"></th>
			<th><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/attach.png"></th>
			<td class="mailTable_td">이재한 과장</td>
			<td class="mailTable_td">[안내] 죽전사옥 데이터센터 장비 정기점검 </td>
			<td class="mailTable_td">20-03-26 10:13</td>
			<td class="mailTable_td">6.1KB</td>
			</tr>
			</c:foreach>
			</table>
			<hr style="border:1px solid #DDDDDD">
			</div>
			
			<div class="contentDiv" style="border:1px solid white;">
			<table class="mailTable">
			<c:foreach start=1 end=5>
			<tr>
			<th style="width:35px;"><input type="checkbox" class="checkbox"></th>
			<th><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/star.png"></th>
			<th><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/mail2.png"></th>
			<th><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/attach.png"></th>
			<td class="mailTable_td">이재한 과장</td>
			<td class="mailTable_td">[안내] 죽전사옥 데이터센터 장비 정기점검 </td>
			<td class="mailTable_td">20-03-26 10:13</td>
			<td class="mailTable_td">6.1KB</td>
			</tr>
			</c:foreach>
			</table>
			</div>
			</div>


	<script>
		$(function(){
			$(".mailTable").find("td").mouseenter(function(){
				$(this).parents("tr").css({"background" : "#ECECEC" , "cursor" : "pointer"})
			}).mouseout(function(){
				$(this).parents("tr").css({"background" : "white"})
			}).click(function(){
				var bid = $(this).parents().children("td").eq(0).text();//메일번호
				
				console.log(bid);
				
				location.href="recieveDetail.ml";/*?bid=" + bid;*/
			});
		});
	
		$(document).ready(function(){
    //최상단 체크박스 클릭
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
    })
});
		
		
	</script>


	</div>
	



</body>
</html>