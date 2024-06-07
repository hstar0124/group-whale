<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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

</head>
<body>
   <div class="wrap">
   <!-- 메뉴바 include -->
   <jsp:include page="mailMenubar.jsp" />

			<!-- 본문 영역 시작 -->
		<!-- 여기 본문에서 뷰페이지 만드시면 됩니다!!  -->
		<!-- <button onclick="location.href='s3.ml'">메일 불러오기</button> -->
		<div class="content" style="background:white;">
			<b class="contentTitle">받은 메일함</b>
			   &nbsp;  <!-- <span style=" font-size:0.8em; color:gray;">전체 메일 27 / 안 읽은 메일 11</span>  -->
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
       
         <!-- 스팸신고시 휴지통으로 보낼지 스팸처리 못해주면 의미가 없는데...  --> 
         <td style="width:100px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px;  height:20px"
               src="/gw/resources/images/mail/forbidden.png">&nbsp;스팸신고</div></td>
       
         <!-- 메일쓰기 폼인데 보낸 사람 메일 + 메일 내용 추가 제목은 RE: 붙여서  -->
         <td style="width:70px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/return.png">&nbsp;답장</div></td>
  			
  				<!-- 임시삭제는 휴지통으로 완전삭제는 status 변경 -->
                  <td style="width:80px;" class="buttonTable_td" >
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 3px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/bin.png">&nbsp;
                        		   삭제
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="" class="selectDelete" <%-- data-cartNum="Number(${list.mailNo})" --%>>임시삭제</li><!-- 휴지통으로 보내기 -->
                           <li onclick="" class="selectRealDelete">완전삭제</li><!-- 삭제하기 -->
                        </ul>
                     </label>
                  </div>
               </td>
            
               		<!-- 메일 내용 추가하고 제목은 FW: 붙여서 (sendmailForm  -->
                  <td style="width:65px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/reply.png">&nbsp;전달</div></td>
             
               		<!-- 이동은 보류 갈만한 곳이 마땅치 않다. -->
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
               
               		<!-- 메일의 내용을 eml파일로 저장 -->
                  <td style="width:80px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/save.png">&nbsp;저장</div></td>
               
               		<!-- 메일의 내용을 인쇄 -->
                  <td style="width:75px;"class="buttonTable_td"><div onclick="location.href=''"><img class="nav1_icons" style="width:20px; height:20px"
               src="/gw/resources/images/mail/ink.png">&nbsp;인쇄</div></td>
               
               		<!-- 이름,날짜,보낸 사람 순으로 정렬-->
                  <td style="width:100px;"class="buttonTable_td">
                     <div>
                     <label class="dropdown mailDelete" style="margin-top: 2px; padding-top: 2px; font-weight: normal; color:black;">
                        <div class="dd-button" style="display: inline-block; color: black;" >
                              <img class="nav1_icons" style="width:20px; height:20px" src="/gw/resources/images/mail/list.png">
                   		        정렬기준
                        </div> 
                        <input type="checkbox" class="dd-input" id="test">
                        <ul class="dd-menu">
                           <li onclick="">이름</li>
                           <li onclick="">날짜</li>
                           <li onclick="">보낸 사람</li>
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
			<td style="width:30px;" class="important"><img class="nav1_icons star" style="width:20px; height:20px"
					src="/gw/resources/images/mail/star.png" onclick="changeImage(this)"></td>
					<c:if test="${m.read eq 'N' }">
			<td style="width:30px;"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/mail2.png"></td>
					</c:if>
					<c:if test="${m.read eq 'Y' }">
			<td style="width:30px;"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/mail.png"></td>
					</c:if>
					<c:if test="${ !empty m.eaSize }">
			<td style="width:30px;"><img class="nav1_icons" style="width:20px; height:20px"
					src="/gw/resources/images/mail/attach.png"></td>
					</c:if>
					<c:if test="${ empty m.eaSize }">
					<td style="width:30px;"></td>
					</c:if>
					
				 <td style="display:none;"><c:out value="${ m.mailNo }"/></td>
				<td style="width:200px; text-overflow: ellipsis; ">
				<c:set var = "from" value = "${m.from}" />
				<c:if test="${! fn : contains(from, '@groupwhale.com')}">
				<c:out value="${ m.from }"/>
				</c:if>
				<c:if test="${ fn : contains(from, '@groupwhale.com')}">
				<c:out value="${ m.empName } ${ m.positionName }"/>
				</c:if>
				</td><!--  여기는 보낸 사람 이메일-->
				<td style="width:200px;"><c:out value="${ m.mailSubject }"/></td>
				<td style="width:200px;"><c:out value="${ m.mailEnrollDate }"/></td>
				
				<c:if test="${!empty m.eaSize}">
				<td style="width:150px;"><c:out value="${ m.eaSize}"/>KB</td>
				</c:if>
				<c:if test="${ empty m.eaSize }">
				<td style="width:150px;"></td> 
				</c:if> 
				<!-- <td style="width:250px;">1</td>
				<td style="width:150px;">2</td>
				<td style="width:200px;">3</td>
				<td style="width:150px;">4</td> -->
			</tr>
			</c:forEach>
			</table>
			
			
					<div id="pagingDiv" align="center">
					<ul class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<li class="disabled">
								<a href="${ blistBack }">
									<span>«</span>
								</a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="main.ml">
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
								<c:url var="blistCheck" value="main.ml">
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
							<c:url var="blistEnd" value="main.ml">
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
				
				console.log(mailNo);
				
				location.href="receiveDetail.ml?mailNo=" + mailNo;
				}
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
	
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.663.0.min.js"></script>    
    <!-- <script src="./PhotoViewer.js"></script> -->
	
    <div id="viewer" ></div>
	<script>
	// **DO THIS**:
//  Replace BUCKET_NAME with the bucket name.
//
var albumBucketName = 'bucketgroupwhale';


//Create a new service object
var s3 = new AWS.S3({
 apiVersion: '2006-03-01',
 params: {Bucket: albumBucketName}
});
     console.log(s3);
//A utility function to create HTML.
function getHtml(template) {
 return template.join('\n');
}
//List the photo albums that exist in the bucket.
  function listAlbums(){
  s3.listObjects({Delimiter: '/'}, function(err, data) {
    if (err) {
      return alert('There was an error listing your albums: ' + err.message);
    } else {
      var albums = data.CommonPrefixes.map(function(commonPrefix) {
        var prefix = commonPrefix.Prefix;
        var albumName = decodeURIComponent(prefix.replace('/', ''));
        return getHtml([
          '<li>',
            '<button style="margin:5px;" onclick="viewAlbum(\'' + albumName + '\')">',
              albumName,
            '</button>',
          '</li>'
        ]);
      });
      var message = albums.length ?
        getHtml([
          '<p>Click on an album name to view it.</p>',
        ]) :
        '<p>You do not have any albums. Please Create album.';
      var htmlTemplate = [
        '<h2>Albums</h2>',
        message,
        '<ul>',
          getHtml(albums),
        '</ul>',
      ]
      document.getElementById('viewer').innerHTML = getHtml(htmlTemplate);
    }
  });
}

//Show the photos that exist in an album.
  function viewAlbum(albumName) {
    var albumPhotosKey = encodeURIComponent(albumName) + '/';
    s3.listObjects({Prefix: albumPhotosKey}, function(err, data) {
      if (err) {
        return alert('There was an error viewing your album: ' + err.message);
      }
      // 'this' references the AWS.Response instance that represents the response
      var href = this.request.httpRequest.endpoint.href;
      var bucketUrl = href + albumBucketName + '/';

      var photos = data.Contents.map(function(photo) {
        var photoKey = photo.Key;
        var photoUrl = bucketUrl + encodeURIComponent(photoKey);
        return getHtml([
          '<span>',
            '<div>',
              '<br/>',
              '<img style="width:128px;height:128px;" src="' + photoUrl + '"/>',
            '</div>',
            '<div>',
              '<span>',
                photoKey.replace(albumPhotosKey, ''),
              '</span>',
            '</div>',
          '</span>',
        ]);
      });
      var message = photos.length ?
        '<p>The following photos are present.</p>' :
        '<p>There are no photos in this album.</p>';
      var htmlTemplate = [
        '<div>',
          '<button onclick="listAlbums()">',
            'Back To Albums',
          '</button>',
        '</div>',
        '<h2>',
          'Album: ' + albumName,
        '</h2>',
        message,
        '<div>',
          getHtml(photos),
        '</div>',
        '<h2>',
          'End of Album: ' + albumName,
        '</h2>',
        '<div>',
          '<button onclick="listAlbums()">',
            'Back To Albums',
          '</button>',
        '</div>',
      ]
      document.getElementById('viewer').innerHTML = getHtml(htmlTemplate);
      document.getElementsByTagName('img')[0];
    });
  }
  
  let lists = [];
  s3.listObjectsV2(
      {
          Bucket: "bucketgroupwhale"
      },
      (err, data) => {
          if (err) {
              throw err;
          }
          let contents = data.Contents;
          contents.forEach((content) => {
              lists.push(content.Key); // "ex) content.Key => assets/images/1.png"
          });
          console.log(lists);
      }
  );
               		
  s3.getObject(params, (err, data) => {
	    if (err) {
	        throw err;
	    }
	    // dataURL
	    let dataURL = "data:image/jpeg;base64," + encode(data.Body);
	 
	    // blobURL
	    const blob = new Blob([data.Body], {
	        type: data.ContentType
	    });
	    const blobURL = URL.createObjectURL(blob);
	});

	</script>
	
	<script>
		(".selectDelete").click(function(){
		
			var checkArr = new Array();
	       
			$("input[class='checkboxAll']:checked").each(function(){
				checkArr.push($(this).attr("data-cartNum"));
				console.log("체크된거 추가");
			});
			
			/* $.ajax({
				url : "delete.ml",
				type : "POST",
				data : { chbox : checkArr },
				success : function(){
					location.href ="/mail/receiveMailList";
				}
			}); */
			
			
		});
	</script>
</body>
</html>