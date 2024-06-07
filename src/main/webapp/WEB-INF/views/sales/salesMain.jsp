<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="${ contextPath }/resources/sales/css/font-awesome.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/sales/owl-carousel/assets/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/sales/css/bootstrap.min.css">
<link rel="stylesheet" href="${ contextPath }/resources/sales/css/style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha256-8zyeSXm+yTvzUN1VgAOinFgaVFEFTyYzWShOy9w7WoQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha256-TQq84xX6vkwR0Qs1qH5ADkP+MvH0W+9E7TdHJsoIQiM=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
<title>업사이클 - 반복되는 일상에 가치를 더하다.</title>
<style>
 .requestDiv{background-color: white; box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.08); border-radius: 50px; padding-top: 30px;
    max-width: 450px; width: 100%; height: 320px; border: none; margin-bottom: 30px; padding-left: 30px; color: #000;}
 .requestTable{width: 385px; display:block; text-align:center; color: #666666}
 .requestTh{font-size: 18px; padding-bottom: 10px; color: #333333}
 .requestTh1{width:85px; padding-bottom: 5px;}
 .requestTh2{width:190px; padding-bottom: 5px;}
 .requestTh3{width:110px; padding-bottom: 5px;}
 .requestTd1{width:87px; padding-bottom: 5px;}
 .requestTd2{width:187px; padding-bottom: 5px; padding-right: 0}
 .requestTd3{width:110px; padding-bottom: 5px;}
 .request_content_div { width: 190px; padding: 10px; padding-top: 0; padding-bottom: 0; padding-right: 2px; maargin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
 a:hover { cursor: pointer; }
 .tr:hover { cursor: pointer;  background: #f1f1f1; }
 thead{display:block; width: 100%;}	
 .tbody{overflow:auto; display:block; height:220px; }	
 .tbody::-webkit-scrollbar { display: none; }
 .tbody2{overflow:auto; display:block; height:150px; }	
 .tbody2::-webkit-scrollbar { display: none; }
 
 .request_modal_table {width: 100%;}
 .request_modal_table tr{border-bottom: 1px solid #dedede;}
 .request_modal_title {background:#f4f4f4; width: 130px; padding: 10px; text-align: center; }
 .request_modal_content {width: 330px; padding: 10px;}
 .request_modal_input {width: 320px; padding: 5px; border: 1px solid #cccccc; font-size: 16px;}
 .request_modal_textarea {height: 105px; padding-left: 5px; padding-bottom: 0;}
 .requestDetailTable input,textarea:focus {outline: none;}
 .money {float: right; color: #087ECC; }
 

</style>
</head>
<body>
<!-- c:set으로 contextPath 변수 선언 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<nav class="navbar navbar-expand-lg navbar-light bg-light bg-transparent" id="gtco-main-nav">
    <div class="container"><a class="navbar-brand">Upcycle</a>
        <button class="navbar-toggler" data-target="#my-nav" onclick="myFunction(this)" data-toggle="collapse"><span
                class="bar1"></span> <span class="bar2"></span> <span class="bar3"></span></button>
        <div id="my-nav" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
                <li class="nav-item"><a class="nav-link" href="#services">제품소개</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">주요기능</a></li>
                <li class="nav-item"><a class="nav-link" href="#news">가격안내</a></li>
                <c:if test="${ sessionScope.loginClient.clientId != 'admin' }">
	                <li class="nav-item"><a class="nav-link" href="#contact">상담신청</a></li>
                </c:if>
                <c:if test="${ sessionScope.loginClient.clientId == 'admin' }">
	                <li class="nav-item"><a class="nav-link" data-toggle="modal" href="#myModal3" >매출분석</a></li>
                </c:if>
            </ul>
            <c:if test="${ empty sessionScope.loginClient }">
	           	<!-- 로그인 / 회원가입 -->
	            <form class="form-inline my-2 my-lg-0">
	                <a href="${ contextPath }/goLogin.sa" class="btn btn-outline-dark my-2 my-sm-0 mr-3 text-uppercase">login</a> 
	                <a href="${ contextPath }/goSignUp.sa" class="btn btn-info my-2 my-sm-0 text-uppercase">sign up</a>
	            </form>
            </c:if>
            <c:if test="${ !empty sessionScope.loginClient }">
	           	<!-- 로그인 / 회원가입 -->
	            <form class="form-inline my-2 my-lg-0">
	                <a href="" class="btn btn-outline-dark my-2 my-sm-0 mr-3 text-uppercase" style="background: white; color: black; text-transform: none!important;"}>
	                	<c:out value="${ sessionScope.loginClient.clientId }님" />
	                </a> 
	                <a onclick="logout();" class="btn btn-info my-2 my-sm-0 text-uppercase" style="background:orangered; border-color: orangered;">logout</a>
	            </form>
            </c:if>
        </div>
    </div>
</nav>
<script>
	function logout() {
			swal({
				title: "",
				icon: "warning",
				text: "로그아웃 하시겠습니까?",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					swal("로그아웃 되었습니다.", {
				     	icon: "success",
				    })
				    .then((willDelete) => {
						location.href = "${contextPath}/logout.sa";
					});
				} 
			});
		}
</script>

<div class="container-fluid gtco-banner-area">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1> 반복되는 일상에 <br><span  style="background: -webkit-linear-gradient(left, #1d3ede, #01e6f8); font-family: Lato-Black; -webkit-text-fill-color: transparent; 
                    -webkit-background-clip: text; font-weight: bold;" >
                                            가치</span>를 더하다.</h1>
                <p><label style="color: #0871B9; font-weight: bold; padding: 0; margin: 0;">
                	웨일(Whale)</label>은 기업의 다양한 조직들의 업무를 체계적으로 관리하고, 협업과 소통을 통해 업무를 신속하고 빠르게 처리할 수 있는 
                	<b style="color: #0871B9;">그룹웨어</b>입니다.</p>
                
                
                <a href="${ contextPath }/goWhale.sa">무료체험 <i class="fa fa-angle-right" aria-hidden="true"></i></a></div>
            <div class="col-md-6">
                <div class="card"><img class="card-img-top img-fluid" src="${ contextPath }/resources/sales/images/banner-img.png" alt=""></div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid gtco-feature" id="services">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="cover">
                    <div class="card">
                        <svg
                                class="back-bg"
                                width="100%" viewBox="0 0 900 700" style="position:absolute; z-index: -1">
                            <defs>
                                <linearGradient id="PSgrad_01" x1="64.279%" x2="0%" y1="76.604%" y2="0%">
                                    <stop offset="0%" stop-color="rgb(1,230,248)" stop-opacity="1"/>
                                    <stop offset="100%" stop-color="rgb(29,62,222)" stop-opacity="1"/>
                                </linearGradient>
                            </defs>
                            <path fill-rule="evenodd" opacity="0.102" fill="url(#PSgrad_01)"
                                  d="M616.656,2.494 L89.351,98.948 C19.867,111.658 -16.508,176.639 7.408,240.130 L122.755,546.348 C141.761,596.806 203.597,623.407 259.843,609.597 L697.535,502.126 C748.221,489.680 783.967,441.432 777.751,392.742 L739.837,95.775 C732.096,35.145 677.715,-8.675 616.656,2.494 Z"/>
                        </svg>
                        <!-- *************-->

                        <svg width="100%" viewBox="0 0 700 500">
                            <clipPath id="clip-path">
                                <path d="M89.479,0.180 L512.635,25.932 C568.395,29.326 603.115,76.927 590.357,129.078 L528.827,380.603 C518.688,422.048 472.661,448.814 427.190,443.300 L73.350,400.391 C32.374,395.422 -0.267,360.907 -0.002,322.064 L1.609,85.154 C1.938,36.786 40.481,-2.801 89.479,0.180 Z"></path>
                            </clipPath>
                            <!-- xlink:href for modern browsers, src for IE8- -->
                            <image clip-path="url(#clip-path)" xlink:href="${ contextPath }/resources/sales/images/learn-img.jpg" width="100%"
                                   height="465" class="svg__image"></image>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <h2> 가치를 만드는 <b>그룹웨어</b></h2>
                <p> 
                	<small>"<b>그룹웨어(Groupware)</b>란 '개인용 소프트웨어'와는 반대되는 개념으로 
                	기업, 기관, 단체의 구성원들이 컴퓨터로 연결된 작업장에서 서로 협력하여 업무 효율을 위해 사용하는 소프트웨어입니다."</small>
                	<br><br> 
                	
                	<label style="color: #0871B9; font-weight: bold; padding: 0; margin: 0;">
                	웨일(Whale)</label>은 중소기업들의 가능성을 발견하고 가치를 높이기 위해, 필요한 핵심 기능들을 최고의 개발자들과 함께 구현하였습니다.<br><br>
                	웨일을 통해 <b style="color: #0871B9;">업무 생산성</b>을 향상시켜보세요.<br>
                	작은 변화가  세상을 바꾸게 될 것입니다.
                </p>
                <a data-toggle="modal" href="#myModal">신청하기 <i class="fa fa-angle-right" aria-hidden="true"></i></a></div>
        </div>
    </div>
</div>
<div class="container-fluid gtco-features" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <h2><b>주요기능</b><br/>
                    <small>We Offer For You</small> </h2>
                <p> 전자결재, 전자메일, 일정관리, TODO+, 커뮤니티, 게시판, 설문, 메신저, 시스템 관리 등<small>(오늘의 운세, 날씨정보)</small><br><br> 중소기업의 생산성을 높여주고, 다양한 조직들 간의 효과적인 협업을 도와줄 
                	<label style="color: #0871B9; font-weight: bold; padding: 0; margin: 0;">12가지 기능</label>을 제공합니다.</p>

                <a href="#">All Services <i class="fa fa-angle-right" aria-hidden="true"></i></a></div>
            <div class="col-lg-8">
                <svg id="bg-services"
                     width="100%"
                     viewBox="0 0 1000 800">
                    <defs>
                        <linearGradient id="PSgrad_02" x1="64.279%" x2="0%" y1="76.604%" y2="0%">
                            <stop offset="0%" stop-color="rgb(1,230,248)" stop-opacity="1"/>
                            <stop offset="100%" stop-color="rgb(29,62,222)" stop-opacity="1"/>
                        </linearGradient>
                    </defs>
                    <path fill-rule="evenodd" opacity="0.102" fill="url(#PSgrad_02)"
                          d="M801.878,3.146 L116.381,128.537 C26.052,145.060 -21.235,229.535 9.856,312.073 L159.806,710.157 C184.515,775.753 264.901,810.334 338.020,792.380 L907.021,652.668 C972.912,636.489 1019.383,573.766 1011.301,510.470 L962.013,124.412 C951.950,45.594 881.254,-11.373 801.878,3.146 Z"/>
                </svg>
                <div class="row">
                    <div class="col">
                        <div class="card text-center">
                            <div class="oval"><img class="card-img-top" src="${ contextPath }/resources/sales/images/web-design.png" alt=""></div>
                            <div class="card-body">
                                <h3 class="card-title"><b style="color: #087ECC;">전자결재</b></h3>
                                <p class="card-text">결재는 사무실 책상에서만 해야 할까요? 빠른 의사결정을 위한 온라인 결재로 신속한 결재와 실시간 의견 공유가 가능합니다.</p>
                            </div>
                        </div>
                        <div class="card text-center">
                            <div class="oval"><img class="card-img-top" src="${ contextPath }/resources/sales/images/marketing.png" alt=""></div>
                            <div class="card-body">
                                <h3 class="card-title"><b style="color: #087ECC;">일정관리</b></h3>
                                <p class="card-text">자주 커뮤니케이션하는 동료들의 일정을 확인하세요. 일정을 공유하면 커뮤니케이션이 더 빨라집니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-center">
                            <div class="oval"><img class="card-img-top" src="${ contextPath }/resources/sales/images/seo.png" alt=""></div>
                            <div class="card-body">
                                <h3 class="card-title"><b style="color:#087ECC;">실시간 소통</b></h3>
                                <p class="card-text">머릿속에 떠오르는 대로 카드를 등록하고, 실시간으로 동료에게 메세지를 보내보세요. 해야 할 일을 관리하고 쉽게 공유하며, 소규모 프로젝트를 빠르게 진행할 수 있습니다.
                                </p>
                            </div>
                        </div>
                        <div class="card text-center">
                            <div class="oval"><img class="card-img-top" src="${ contextPath }/resources/sales/images/graphics-design.png" alt=""></div>
                            <div class="card-body">
                                <h3 class="card-title"><b style="color: #087ECC;">다양한 게시판</b></h3>
                                <p class="card-text">공지사항, 전사 게시판, 설문조사 등의 다양한 내용을 게시판을 통해  구성원들간 효과적인 의사소통을 할 수 있습니다. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid gtco-numbers-block">
    <div class="container">
        <svg width="100%" viewBox="0 0 1600 400">
            <defs>
                <linearGradient id="PSgrad_03" x1="80.279%" x2="0%"  y2="0%">
                    <stop offset="0%" stop-color="rgb(1,230,248)" stop-opacity="1" />
                    <stop offset="100%" stop-color="rgb(29,62,222)" stop-opacity="1" />

                </linearGradient>

            </defs>
            <!-- <clipPath id="clip-path3">

                                      </clipPath> -->

            <path fill-rule="evenodd"  fill="url(#PSgrad_03)"
                  d="M98.891,386.002 L1527.942,380.805 C1581.806,380.610 1599.093,335.367 1570.005,284.353 L1480.254,126.948 C1458.704,89.153 1408.314,59.820 1366.025,57.550 L298.504,0.261 C238.784,-2.944 166.619,25.419 138.312,70.265 L16.944,262.546 C-24.214,327.750 12.103,386.317 98.891,386.002 Z"></path>

            <clipPath id="ctm" fill="none">
                <path
                        d="M98.891,386.002 L1527.942,380.805 C1581.806,380.610 1599.093,335.367 1570.005,284.353 L1480.254,126.948 C1458.704,89.153 1408.314,59.820 1366.025,57.550 L298.504,0.261 C238.784,-2.944 166.619,25.419 138.312,70.265 L16.944,262.546 C-24.214,327.750 12.103,386.317 98.891,386.002 Z"></path>
            </clipPath>

            <!-- xlink:href for modern browsers, src for IE8- -->
            <image  clip-path="url(#ctm)" xlink:href="${ contextPath }/resources/sales/images/word-map.png" height="800px" width="100%" class="svg__image">

            </image>

        </svg>
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">1st</h5>
                        <p class="card-text">그룹웨어 부분</p>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">200+</h5>
                        <p class="card-text">대기업 및 그룹사</p>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">530+</h5>
                        <p class="card-text">누적 사용자 수</p>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">170</h5>
                        <p class="card-text">전문기술인력</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<p align="right" style="font-size: 15px; font-weight: bold; color: red; margin-right: 70px; ">* 희망사항</p>

<div class="container-fluid gtco-testimonials">
    <div class="container">
        <h2><b style="color: #0871B9;">Whale</b>을 사용하는 사람들</h2>
        <div class="owl-carousel owl-carousel1 owl-theme slider">
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/JinhoKim.png" alt="" style="border-color: orangered;">
                    <div class="card-body">
                        <h5><b style="color: orangered;">Jinho Kim</b><br/>
                            <span> <b>OrangeRed Company 대표</b> </span></h5>
                        <p class="card-text">“ 용량 대비 가격이 저렴하고, 타사에 비해 UX/UI가 깔끔하게 구현되어 있어 웨일(Whale)을 선택했습니다.” </p>
                    </div>
                </div>
            </div>
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/BillGates.png" alt="">
                    <div class="card-body">
                        <h5> Bill Gates <br/>
                            <span> 마이크로소프트 설립자 </span></h5>
                        <p class="card-text">“ 작은 규모의 회사에서 적당한 기능을, 합리적인 가격으로 이용할 수 있기 때문에 웨일(Whale)을 선택하였습니다. ” </p>
                    </div>
                </div>
            </div>
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/MarkZuckerberg.jpg" alt="">
                    <div class="card-body">
                        <h5>Mark Zuckerberg<br/>
                            <span> 페이스북 창립자 </span></h5>
                        <p class="card-text">“ 전자결재가 가장 큰 도입 이유였습니다. 업무효율을 높여주는 TODO+기능도 우수해서 사용하게 되었습니다. ” </p>
                    </div>
                </div>
            </div>
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/JamesGosling.jpg" alt="">
                    <div class="card-body">
                        <h5>James Gosling<br/>
                            <span> JAVA의 창시자 </span></h5>
                        <p class="card-text">“ 깔끔한 UI와 일정관리(캘린더)의 사용으로 편리성이 돋보여서 결정하게 되었습니다. ” </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	//자동 슬라이더
	var i = 0;
	$(document).ready(function() {
		autoPlay();
	});

	function slide(i) {
		$slider = $(".owl-dot > span");
		$slider[i].click();
	}
	
	// 자동실행 함수
	function autoPlay() {
  		setInterval(function() {
    		slide(i);
    		i++;
    		if(i == 4) {
    			i = 0;
    		}
  		}, 2000);
	}
	
	 

</script>


<div class="container-fluid gtco-features-list">
    <div class="container">
        <div class="row">
            <div class="media col-md-6 col-lg-4">
                <div class="oval mr-4"><img class="align-self-start" src="${ contextPath }/resources/sales/images/quality-results.png" alt=""></div>
                <div class="media-body">
                    <h5 class="mb-0"><b style="color:">합리적인 비용</b></h5>
                                            사람의 일생은 돈과 시간을 쓰는 방법에 의하여 결정된다. 이 두가지 사용법을 잘못하여서는 결코 성공할 수 없다. 
                </div>
            </div>
            <div class="media col-md-6 col-lg-4">
                <div class="oval mr-4"><img class="align-self-start" src="${ contextPath }/resources/sales/images/analytics.png" alt=""></div>
                <div class="media-body">
                    <h5 class="mb-0"><b style="color:">간편한 설문</b></h5>
					노력이란 평범한 것일지도 모른다. 하지만 평범한 일을 꾸준히 지속하면 분명히 비범한 일이 된다. 
                </div>
            </div>
            <div class="media col-md-6 col-lg-4">
                <div class="oval mr-4"><img class="align-self-start" src="${ contextPath }/resources/sales/images/affordable-pricing.png" alt=""></div>
                <div class="media-body">
                    <h5 class="mb-0"><b style="color:">실용적인 기능</b></h5>
		                          반복적으로 행동하는게 바로 우리 인간이다.  
                                            처음에는 우리가 습관을 만들지만, 그 다음에는 습관이 우리를 만든다.
                </div>
            </div>
            <div class="media col-md-6 col-lg-4">
                <div class="oval mr-4"><img class="align-self-start" src="${ contextPath }/resources/sales/images/easy-to-use.png" alt=""></div>
                <div class="media-body">
                    <h5 class="mb-0"><b style="color:">편리한 UI/UX</b></h5>
	     	                 모든 사람은 천재다. 하지만 물고기들을 나무타기 실력으로 평가한다면 물고기는 평생 자신이 형편없다고 믿으며 살아갈 것이다.
                </div>
            </div>
            <div class="media col-md-6 col-lg-4">
                <div class="oval mr-4"><img class="align-self-start" src="${ contextPath }/resources/sales/images/free-support.png" alt=""></div>
                <div class="media-body">
                    <h5 class="mb-0"><b style="color:">신속한 의사소통</b></h5>
                   	한 곳에 모이는 것은 시작이고, 같이 머무는 것은 진전이고 , 같이 일하는 것은 성공이다.
                </div>
            </div>
            <div class="media col-md-6 col-lg-4">
                <div class="oval mr-4"><img class="align-self-start" src="${ contextPath }/resources/sales/images/effectively-increase.png" alt=""></div>
                <div class="media-body">
                    <h5 class="mb-0"><b style="color:">정확한 업무처리</b></h5>
                   	자기 능력을 정확히 측정하고, 벌 수 있는 것과 쓸 수 있는 것을 많든 적든 균형을 바로 잡는 사람은 현명한 사람이다.
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid gtco-logo-area">
    <div class="container">
        <div class="row">

        </div>
    </div>
</div>
<div class="container-fluid gtco-news" id="news">
    <div class="container">
        <h2><b>가격안내</b></h2>
        <div class="owl-carousel owl-carousel2 owl-theme">
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/Basic3.png" alt="">
                    <div class="card-body text-left pr-0 pl-0">
                        <h5> <b name="100">BASIC</b> <div class="money">100만원</div> </h5>
                        <p class="card-text">전자결재, 전자메일, 일정관리, 게시판, 설문</p><br>
                        <a class="payment">결제하기 <i class="fa fa-angle-right" aria-hidden="true"></i></a></div>
                </div>
            </div>
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/Preminum3.png" alt="">
                    <div class="card-body text-left pr-0 pl-0">
                        <h5> <b name="120">PREMINUM</b> <div class="money">120만원</div> </h5>
                        <p class="card-text">전자결재, 전자메일, 일정관리, 게시판, 설문, TODO+, 메신저 </p>
                        <a class="payment">결제하기 <i class="fa fa-angle-right" aria-hidden="true"></i></a></div>
                </div>
            </div>
            <div>
                <div class="card text-center"><img class="card-img-top" src="${ contextPath }/resources/sales/images/Customizing4.png" alt="" style="height:304.81px;">
                    <div class="card-body text-left pr-0 pl-0">
                        <h5> <b>CUSTOMIZING</b><div class="money">협의</div></h5>
                        <p class="card-text">맞춤형 기능 </p><br>
                        <a data-toggle="modal" href="#myModal" class="submit-button">문의하기 <i class="fa fa-angle-right" aria-hidden="true"></i></a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="container-fluid" id="gtco-footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-6" id="contact">
                <h4><b style="color: #087ECC;">신청내역</b></h4>
                <div class="requestDiv">
					<table class="requestTable">
						<thead>
							<tr>
								<th class="requestTh requestTh1">신청자</th>
								<th class="requestTh requestTh2">문의내용</th>
								<th class="requestTh requestTh3">신청일</th>
							</tr>
						</thead>
						<tbody class="tbody">
							<c:forEach var="r" items="${ list }">
								<tr class="tr" data-toggle="modal" href="#myModal2">
									<td class="requestTd1">
										<input type="hidden" name="requestNo" value="${ r.requestNo }">
										<!-- 로그인 유저가 admin이면 풀네임이 보이고 -->
										<c:if test="${ sessionScope.loginClient.clientId == 'admin' }">
	 										<c:out value="${ r.requestName }"/>
	                					</c:if>
	                					
										<!-- admin이 아니면 ***처리 -->
										<c:if test="${ sessionScope.loginClient.clientId != 'admin' }">
											<c:set var="name" value="${ r.requestName }" />
											<c:out value="${ name.substring(0,1)}" /><c:forEach begin="1" end="${ name.length()-1 }" step="1">*</c:forEach>
										</c:if>
									</td>
									<td class="requestTd2"><div class="request_content_div">
										<c:out value="${ r.requestContent }"/></div>
									</td>
									<td class="requestTd3">
										<c:out value="${ r.requestDate.substring(0, 10).replace('-', '/') }"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>                
                </div>
                <a data-toggle="modal" href="#myModal" class="submit-button">신청하기 <i class="fa fa-angle-right" aria-hidden="true"></i></a>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-6">
                        <h4><b style="color: #087ECC;">회사소개</b></h4>
                        <ul class="nav flex-column company-nav">
                            <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">제품소개</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">주요기능</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">가격안내</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">상담신청</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">무료체험</a></li>
                        </ul>
                        <h4 class="mt-5"><b style="color: #087ECC;">Fllow Us</b></h4>
                        <ul class="nav follow-us-nav">
                            <li class="nav-item"><a class="nav-link pl-0" href="#"><i class="fa fa-facebook"
                                                                                      aria-hidden="true"></i></a></li>
                            <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-twitter"
                                                                                 aria-hidden="true"></i></a></li>
                            <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-google"
                                                                                 aria-hidden="true"></i></a></li>
                            <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-linkedin"
                                                                                 aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <h4><b style="color: #087ECC;">주요기능</b></h4>
                        <ul class="nav flex-column services-nav">
                            <li class="nav-item"><a class="nav-link" href="#">전자결재</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">일정관리</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">TODO+</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">메신저</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">시스템 관리</a></li>
                        </ul>
                    </div>
                    <div class="col-12">
                        <p>&copy; 2020. All Rights Reserved. Design by <a href="https://gettemplates.co" target="_blank">UPCYCLE</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<script>

	// 신청하기 모달
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});

	// 신청확인 모달
	$(document).ready(function() {
		$("#myBtn2").click(function() {
			$("#myModal2").modal();
		});
	});

	// 신청내역 상세조회
	$(function(){
		var requestNo = "";
		$(".tr").click(function(){
			requestNo = $(this).children().children().val();
			var $requestType = $(".requestType");
			var $requestContent = $(".requestContent");
			var $requestName = $(".requestName");
			var $requestPhone = $(".requestPhone");
			var $requestEmail = $(".requestEmail");
			
			console.log("requestNo : " +  requestNo);		
			//console.log("requestType : " +  requestType);		
			//console.log("requestContent : " +  requestContent);		
			//console.log("requestName : " +  requestName);		
			//console.log("requestPhone : " +  requestPhone);		
			//console.log("requestEmail : " +  requestEmail);		
			
			$.ajax({
				type: "post",
				url: "selectRequestDetail.sa",
				data: {
					requestNo: requestNo
				},
				success: function(data) {
					//console.log(data);
					$requestType.html(data.requestType);
					$requestContent.html(data.requestContent);
					
					if("${ sessionScope.loginClient.clientId }" == "admin") {
						$requestName.val(data.requestName);
						$requestPhone.val(data.requestPhone);
						$requestEmail.val(data.requestEmail);
					} else {
						var name = data.requestName;
						var phone = data.requestPhone;
						
						var e = data.requestEmail;
						var mail = e.substring(0, e.indexOf("@"));
						var email = e.substring(e.indexOf("@"));
						
						var s = "";
						var t = "";
						var r = "";
						
						for(var i = 0; i < name.length-1; i++){
							s += "*";
						}
						for(var i = 0; i < phone.length-1; i++){
							t += "*";
						}
						for(var i = 0; i < mail.length-1; i++){
							r += "*";
						}
						$requestName.val(name.substring(0,1) + s);
						$requestPhone.val(phone.substring(0,1) + t);
						$requestEmail.val(e.substring(0,1)+ r + email);
					}
				},
				error: function(error) {
					console.log(error);
				}
			});
			
		});
		
		//신청내역 삭제
		$(".deleteRequest").click(function(){
			swal({
				title: "",
				icon: "warning",
				text: "신청내역을 삭제하시겠습니까?",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					swal("신청내역이 삭제되었습니다.", {
				     	icon: "success",
				    })
				    .then((willDelete) => {
						location.href = "${contextPath}/deleteRequest.sa?requestNo=" + requestNo;
					});
				} 
			});
		});

		
		
	})
		
	/* 결제하기 */
	$(function(){
		$(".payment").click(function(){

			if( "${ sessionScope.loginClient }" == "") {
				swal("", "로그인 후 이용하실 수 있습니다.", "warning")
				.then((check) => {
					location.href = "${contextPath}/goLogin.sa"
				});
				
			} else {
				var p = $(this).parent().children().children().html();
				var productNo = "";
				if(p == "BASIC") {
					productNo = '1';
				} else if(p == "PREMINUM") {
					productNo = '2';
				}
				var product = '그룹웨일 '+ p;
				var payment = $(this).parent().children().children().attr('name');
				var price = payment * 10000;
				var clientNo = "${ sessionScope.loginClient.clientNo}";
				
				
				//결제 API
				// IMP.request_pay(param, callback) 호출
		    	var IMP = window.IMP; // 생략해도 괜찮습니다.
		    	IMP.init("imp18469666"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

		    	IMP.request_pay({ // param
			        pg: "inicis",
			        pay_method: "card",
			        merchant_uid: new Date().getTime(),
			        name: product,
			        amount: payment,
			        buyer_email: "${ sessionScope.loginClient.clientEmail}",
			        buyer_tel: "${ sessionScope.loginClient.clientPhone}",
			    }, function (rsp) { // callback
			    	console.log(rsp);
				    if (rsp.success) {
				    	
				    	/* DB에 결제내역 저장 */
				    	$.ajax({
							type: "post",
							url: "insertPayment.sa",
							data: {
								clientNo: clientNo,
								productNo: productNo
							},
							success: function(data) {
								//console.log(data);
								swal("Success", "결제가 완료되었습니다.", "success")
								.then((check) => {
								});
								
								
							},
							error: function(error) {
								console.log(error);
								swal("Fail", "결제가 취소되었습니다.", "error")
								.then((check) => {
								});
							}
						});      
					} else {
						swal("Fail", "결제가 취소되었습니다.", "error")
						.then((check) => {
						});
					}
				});  
				
			}
			
		});
	})
	

</script>

	<!-- 상담신청 Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background:#156eca; color: white; text-align:center;">
					<h4 class="modal-title"><b>웨일(Whale) 상담신청</b></h4>
					<button type="button" class="close" data-dismiss="modal" style="color: white">×</button>
				</div>
				<div class="modal-body" style="padding: 10px; margin: 0; display: inline-block;">
					
					<form action="insertRequest.sa" method="post">
						<table class="request_modal_table"style="width: 100%; display: inline-block; border-collapse: collapse;">
							<tr>
								<td class="request_modal_title">상담을 원하는<br>제품/서비스</td>
								<td class="request_modal_content" style="padding-left: 20px;">
									<table style="width: 100%; border: 0; border-collapse: collapse;" >
										<tr style="border: 0">
											<td style="width: 50%;">
												<input type="radio" name="wish" id="전자결재" value="전자결재">
												<label for="전자결재" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">전자결재</label>
											</td>
											<td style="width: 50%;">
												<input type="radio" name="wish" id="일정관리"  value="일정관리">
												<label for="일정관리" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">일정관리</label>
											</td>
										</tr>									
										<tr style="border: 0">
											<td style="width: 50%;">
												<input type="radio" name="wish" id="TODO" value="TODO">
												<label for="TODO" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">TODO+</label>
											</td>
											<td style="width: 50%;">
												<input type="radio" name="wish" id="게시판" value="게시판">
												<label for="게시판" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">게시판</label>
											</td>
										</tr>									
										<tr style="border: 0">
											<td style="width: 50%;">
												<input type="radio" name="wish" id="설문" value="설문">
												<label for="설문" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">설문</label>
											</td>
											<td style="width: 50%;">
												<input type="radio" name="wish" id="메신저">
												<label for="메신저" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">메신저</label>
											</td>
										</tr>									
										<tr style="border: 0">
											<td style="width: 50%;">
												<input type="radio" name="wish" id="날씨" value="날씨">
												<label for="날씨" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">오늘의 날씨</label>
											</td>
											<td style="width: 50%;">
												<input type="radio" name="wish" id="운세" value="운세">
												<label for="운세" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">오늘의 운세</label>
											</td>
										</tr>									
										<tr style="border: 0">
											<td style="width: 50%;">
												<input type="radio" name="wish" id="시스템관리" value="시스템관리">
												<label for="시스템관리" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">시스템 관리</label>
											</td>
											<td style="width: 50%;">
												<input type="radio" name="wish" id="기타" value="기타">
												<label for="기타" style="font-size: 15px; margin-left: 10px; margin: 0; margin-left: 10px;">기타</label>
											</td>
										</tr>									
									</table>
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">문의내용</td>
								<td class="request_modal_content">
									<textarea class="request_modal_input request_modal_textarea" name="requestContent" placeholder="내용을 입력해주세요"></textarea>
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">이름</td>
								<td class="request_modal_content">
									<input type="text" class="request_modal_input" name="requestName" placeholder="이름을 입력해주세요">
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">연락처</td>
								<td class="request_modal_content">
									<input type="text" class="request_modal_input" name="requestPhone" placeholder="연락처를 입력해주세요">
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">이메일</td>
								<td class="request_modal_content">
									<input type="email" class="request_modal_input" name="requestEmail" placeholder="이메일을 입력해주세요">
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">개인정보<br> 수집 및 이용</td>
								<td class="request_modal_content" style="padding-top: 15px; padding-bottom: 15px;">
									<p style="font-size:15px; margin: 0;">	
										- 수집항목 : 성명, 연락처, 이메일<br>
										- 이용목적 : 상담처리<br>
										- 보유기간 : 상담신청 후 12개월간</p>
								</td>
							</tr>
						</table>
					</form>
						<div style="text-align: center; padding: 10px; padding-top: 20px;" >
							<input type="checkbox" id="ch"><label for="ch" style="font-weight: bold; font-size: 15px; margin-left: 10px;">개인정보 수집 및 이용 동의</label>
						</div>
				</div>
				<div class="modal-footer" style="display: block; text-align: center;">
					<!-- <button onclick="insertRequest();" type="button" class="btn btn-default" style="background:#156eca; color: white; width: 80px;">신청</button> -->
					<button onclick="insertRequest();" type="submit" class="btn btn-default" style="background:#156eca; color: white; width: 80px;">신청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 80px;">취소</button>
				</div>
			</div>
		</div>
	</div>

<script>
	/* 상담 신청 */
	function insertRequest() {
		var requestType = $("input:radio[name=wish]:checked").val();
		var requestContent = $("textarea[name=requestContent]").val();
		var requestName = $("input[name=requestName]").val();
		var requestPhone = $("input[name=requestPhone]").val();
		var requestEmail = $("input[name=requestEmail]").val();

		location.href = "${ contextPath }/insertRequest.sa?requestType=" + requestType + "&requestContent=" + requestContent 
				+ "&requestName=" + requestName + "&requestPhone=" + requestPhone + "&requestEmail=" + requestEmail;
	}
	
</script>

	
	<!-- 신청확인 Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background:#156eca; color: white; text-align:center;">
					<h4 class="modal-title"><b>신청확인</b></h4>
					<button type="button" class="close" data-dismiss="modal" style="color: white">×</button>
				</div>
				<div class="modal-body" style="padding: 10px; margin: 0; display: inline-block;">
					
						<table class="request_modal_table requestDetailTable"style="width: 100%; display: inline-block; border-collapse: collapse;">
							<tr>
								<td class="request_modal_title">분류</td>
								<td class="request_modal_content" style="padding-left: 15px;">
									<div class="requestType" style="font-size: 15px;">분류</div>
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">문의내용</td>
								<td class="request_modal_content">
									<textarea class="request_modal_input request_modal_textarea requestContent" name="requestContent" placeholder="내용을 입력해주세요" readonly></textarea>
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">이름</td>
								<td class="request_modal_content">
									<input type="text" class="request_modal_input requestName" name="requestName" placeholder="이름을 입력해주세요" readonly>
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">연락처</td>
								<td class="request_modal_content">
									<input type="text" class="request_modal_input requestPhone" name="requestPhone" placeholder="연락처를 입력해주세요" readonly>
								</td>
							</tr>
							<tr>
								<td class="request_modal_title">이메일</td>
								<td class="request_modal_content">
									<input type="email" class="request_modal_input requestEmail" name="requestEmail" placeholder="이메일을 입력해주세요" readonly>
								</td>
							</tr>
						</table>
						<!-- <div style="text-align: center; padding: 10px; padding-top: 20px;"></div> -->
				</div>
				<div class="modal-footer" style="display: block; text-align: center;">
					<!-- <button onclick="insertRequest();" type="button" class="btn btn-default" style="background:#156eca; color: white; width: 80px;">신청</button> -->
					<button type="button" class="btn btn-default" data-dismiss="modal" style="background:#156eca; color: white; width: 80px;">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 80px;">취소</button>
				</div>
					<c:if test="${ sessionScope.loginClient.clientId == 'admin' }">
						<button type="button" class="btn btn-default deleteRequest" style="width: 80px; margin-left: 410px; margin-top: -52px; margin-bottom: 22px; background: white; color: red" >삭제</button>
                	</c:if>
			</div>
		</div>
	</div>
	
	
	<!-- 결제내역 Modal -->
	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 800px; height: 880px; margin-left: -100px;">
				<div class="modal-header" style="background:#156eca; color: white; text-align:center;">
					<h4 class="modal-title"><b>매출분석</b></h4>
					<button type="button" class="close" data-dismiss="modal" style="color: white">×</button>
				</div>
				<div class="modal-body" style="padding: 10px;">
					
						<!-- 기간 선택 버튼 -->
						<table style="width: 100%; margin: auto 0; background:#ecf0f7;">
							<tr>
								<td style="width: 10%; height: 70px; text-align: center;">
									<b style="padding:10px; font-size: 17px;">기간</b>
									<input type="date" name="day1"> ~ <input type="date" name="day2">
									<div class="btn searchBtn" style="background: #156eca; color: white; height: 30px; 
										padding-top: 2px; margin-top: -2px; margin-left: 5px;">검색</div>
								</td>
							</tr>
						</table>
						<br>
						
						<!-- 선택기간 조회 -->
						<table style="width: 100%; border: 1px solid #dedede; border-radius: 5px;">
							<tr style="background: #156eca; color: white;">
								<td style="width: 30%; text-align:center; height: 35px; font-size: 17px;"><b>총 매출액</b></td>
								<td style="width: 30%; text-align:center; font-size: 17px;"><b>총 판매건수</b></td>
								<td style="width: 30%; text-align:center; font-size: 17px;"><b>선택 날짜</b></td>
							</tr>
							<tr>
								<td class="totalMoney" style="width: 30%; text-align:center; height: 50px;">-</td>
								<td class="totalCount" style="width: 30%; text-align:center">-</td>
								<td class="during" style="width: 30%; text-align:center">-</td>
							</tr>
						</table>
						<br>

						<!-- 도표영역-->
						<table style="width: 100%; border: 1px solid #dedede;">
							<tr>
								<td style="width: 50%; text-align:center; height: 300px;">
									<canvas id="paymentChart_bar" width="380" height="300"></canvas>
								</td>
								<td style="width: 50%; text-align:center; height: 300px;">
									<canvas id="paymentChart_pie" width="380" height="300"></canvas>
								</td>
							</tr>
						</table>
						<br>
						
						
						<!-- 결제 리스트 -->
							<table style="width: 100%; border: 1px solid #dedede; border-radius: 5px;">
								<thead style="width: 100%;">
									<tr style="background: #156eca; color: white; border: 0px;">
										<th style="width: 220px; text-align:center; height: 35px; font-size: 17px;">결제일</th>
										<th style="width: 396px; text-align:center; font-size: 17px;">상품명</th>
										<th style="width: 234px; text-align:center; font-size: 17px;">판매금액</th>
									</tr>
								</thead>
								<tbody class="tbody2 paymentList_tbody" style="width: 100%">
									<tr class="emptyTr">
										<td style="width: 220px; text-align:center; height: 40px;">-</td>
										<td style="width: 400px; text-align:center;">-</td>
										<td style="width: 230px; padding-right: 10px; text-align:right;">-</td>
									</tr>
								</tbody>
							</table>
				</div>
				<div class="modal-footer" style="display: block; text-align: center;">
					<!-- <button onclick="insertRequest();" type="button" class="btn btn-default" style="background:#156eca; color: white; width: 80px;">신청</button> -->
					<button type="button" class="btn btn-default" data-dismiss="modal" style="background:#156eca; color: white; width: 80px;">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 80px;">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<script>

	// 검색 클릭시 매출분석
 	$('.searchBtn').click(function(){
		var startDay = $("input[name=day1]").val();
		var endDay = $("input[name=day2]").val();
 		var during = startDay + " ~ " + endDay;
		
 		var $money = $(".totalMoney").text();
 		var $count = $(".totalCount").text();
 		var $date = $(".during").text(during); 
 		var totalMoney = 0;
 		var totalCount = "";
 		
 		var totalBasic_count = 0;
 		var totalPreminum_count = 0;
 		var totalCustom_count = 0;
		
 		var $tbody = $(".paymentList_tbody");
 		
 		// 이전 결제내역 지우기
		$tbody.children().remove();
 		
 		// chart.Js 이전 데이터 리셋
 		myPieChart.reset();
 		myLineChart.reset();
 		
 		$.ajax({
			type: "post",
			url: "selectPayment.sa",
			data: {
				startDay: startDay,
				endDay: endDay
			},
			success: function(data) {
				for(var key in data) {

					// 총 매출액 
					if(data[key].productPrice != "0"){
						totalMoney += Number(data[key].productPrice);
			 		} else {
						totalMoney += Number(data[key].note);
			 		}
					
					// 총 판매건수
					totalCount = data.length;
					
					// 결제내역 조회
					var $tr = $("<tr>");
			 		var $paymentDate = '<td style="width: 220px; text-align:center; height: 40px;">' + data[key].paymentDate + '</td>';
			 		var $productName = '<td style="width: 400px; text-align:center;">그룹웨어 ' +  data[key].productName + '</td>';
			 		
			 		if(data[key].productPrice != "0"){
				 		var $productPrice = '<td style="width: 230px; padding-right: 10px; text-align:right;">' + comma(data[key].productPrice) + '원</td>';
			 		} else {
				 		var $productPrice = '<td style="width: 230px; padding-right: 10px; text-align:right;">' + comma(Number(data[key].note)) + '원</td>';
			 		}

			 		$tr.append($paymentDate);
			 		$tr.append($productName);
			 		$tr.append($productPrice);
			 		$tbody.append($tr);
			 		
			 		// 상품별 판매건수
			 		if(data[key].productName == 'Basic') {
				 		totalBasic_count += 1;
			 		} else if(data[key].productName == 'Preminum') {
				 		totalPreminum_count += 1;
			 		} else if(data[key].productName == "Customizing") {
			 			totalCustom_count += 1;
			 		}
				}
				
				$.ajax({
					type: "post",
					url: "selectDayMoney.sa",
					data: {
						startDay: startDay,
						endDay: endDay
					},
					success: function(data) {
						for(var key in data) {
				 			myLineChart.data.labels[j] =  data[key].day;
				 			myLineChart.data.datasets[0].data[j] = data[key].money;
				 			j++
						}
				 		myLineChart.update();
					},
					error: function(error){
						console.log(error);
						
					}
				});
				j = 0;
				
		 		$money = $(".totalMoney").text(comma(totalMoney) + "원");
				$count = $(".totalCount").text(totalCount + "건");
				
				var $emptyTr = $(".emptyTr").hide();	
				
				
			 	// 선 그래프 데이터 추가
		 		myLineChart.update();
			 	
				// 원 그래프 데이터 추가
				myPieChart.data.datasets[0].data[0] = totalBasic_count;
				myPieChart.data.datasets[0].data[1] = totalPreminum_count;
				myPieChart.data.datasets[0].data[2] = totalCustom_count;
				myPieChart.update();
				
			},
			error: function(error) {
				console.log(error);
				alert('조회 실패');
			}
		});      
 		
 	});
	
	
	// 3자리 수마다 콤마찍는 함수
 	function comma(num) {
 	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	}
	
	
	// chart.js - 선 그래프 
	var ctx = document.getElementById('paymentChart_bar');
	var myLineChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['1', '2', '3', '4'],
			datasets: [{
				label: 'Basic',
				data: [10000000, 24000000, 100000000, 32000000],
				backgroundColor: [
					'rgba(54, 162, 235, 0)'
				],
				borderColor: [
					'rgba(54, 162, 235, 1)'
				],
				borderWidth: 2
			}]
		},
		options: {
			responsive: false,
			title: {
				display: true,
				text: '기간별 총 매출액'
			},
			legend: {
				display: false				
			},
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true,
						userCallback: function comma(data) {
					 	    return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					 	}
					},
					gridLines:{
						lineWidth: 1
					}
				}]
			},
		}
	});

	
	// chart.js - 원 그래프 
	var ctx = document.getElementById('paymentChart_pie');
	var myPieChart = new Chart(ctx, {
		type: 'doughnut', //doughnut
		data: {
			labels: ['Basic', 'Preminum', 'Customizing'],
			datasets: [{
				label: '상품별 판매건수',
				data: [3, 3, 3],
				backgroundColor: [
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)'
				],
				borderColor: [
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			title: {
				display: true,
				text: '상품별 판매건수'
			},
			scales: {
				xAxes: [{
					ticks:{
						beginAtZero: true
						
						
					},
					gridLines:{
						lineWidth: 0
					}
				}],
				yAxes: [{
					ticks: {
						beginAtZero: true
					},
					gridLines:{
						lineWidth: 0
					}
				}]
			},
		}
	});
	
		
</script>
	


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="${ contextPath }/resources/sales/js/jquery-3.3.1.slim.min.js"></script>
<script src="${ contextPath }/resources/sales/js/popper.min.js"></script>
<script src="${ contextPath }/resources/sales/js/bootstrap.min.js"></script>
<!-- owl carousel js-->
<script src="${ contextPath }/resources/sales/owl-carousel/owl.carousel.min.js"></script>
<script src="${ contextPath }/resources/sales/js/main.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- iamport.payment.js -->

</body>
</html>
