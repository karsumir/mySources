<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/jquery.bxslider.css">
<link rel="stylesheet" href="resource/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/kor/main.css">
<script src="resources/js/libs/jquery-1.11.2.min.js"></script>
<script src="resources/js/plugins/bootstrap.min.js"></script>
<script src="resources/js/plugins/jquery.bxslider.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/mobile_menu.js"></script>

<title>한빛아카데미 4기수료생 프로젝트</title>
<script>

function mainSlider(){
	$('#visual_slider').bxSlider({
		speed:500,
		slideMargin:0,
		adaptiveHeight:false,
		adaptiveHeightSpeed:500,
		pager:true,
		pagerType:"full",
		pagerShortSeparator:" / ",
		pagerSelector:null,
		controls:false,
		nextText:"Next",
		prevText:"Prev",
		nextSelector:null,
		prevSelector:null,
		autoControls:false,
		startText:"Start",
		stopText:"Stop",
		autoControlsCombine:false,
		auto:true,
		pause:4000,
		autoStart:true,
		autoHover:true,
		minSlides:1,
		maxSlides:1,
		moveSlides:0,
		onSliderResize:function(){}
	});
}
</script>
</head>
<body>

<!-- Skip Navigation -->
<div class="skip_navi">
	<a href="#content">본문 바로가기</a>
</div>
<!-- //Skip Navigation -->

<div id="wrap">

<div id="header">
	<div>
		<div class="inhead">
			<h1 class="logo"><a href="index.html" onfocus=blur() ><img src="resources/images/common/hanbitacademy_logo.gif" alt="한빛"></a></h1>
			<ul class="tnavi">
					<c:if test="${re == 0 }">
						<font color="red">암호가 맞지 않습니다.</font>
						</c:if>
						
						<c:if test="${re == -1 }">
							<font color="red">아이디가 맞지 않습니다.</font>
						</c:if>

							<form action="loginMember.show" method="post">
							<c:if test="${login != 'ok' }">
							ID <input type="text" name="u_id"  id="aaa"><br>
							PWD <input type="text" name="u_pwd" >
							<input type="submit" value="로그인"><br>
							<input type="button" value="회원가입" onclick="location.href='insertMember.show'">
							<input type="button" value="ID/PWD 찾기" id="searchId">		
							</c:if>
							<c:if test="${login == 'ok' && vo.u_id!='manager' }">
							${vo.u_name }님 반갑습니다.
							<input type="button" value="회원정보수정" onclick="location.href='updateMember.do?u_id=${vo.u_id}'">
							<input type="button" value="로그아웃" onclick="location.href='logOut.do'">
							</c:if>
							<c:if test="${login == 'ok' && vo.u_id=='manager'}">
							관리자로 로그인 되었습니다.
							<input type="button" value="관리자화면" id="managerScreen">
							<input type="button" value="로그아웃" onclick="location.href='logOut.do'">
							</c:if>
							</form>
				
					<div class="lan_box">
						<div>
							<span class="pointer"></span>
							
						</div>
					</div>
				</li>
			</ul>
		</div>

		<div class="gnb">
			<div>
				<div class="gnb_box">
					<ul class="gnb_ul">
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="qlink_wrap">
			<div class="qlink">
				<div class="roqlink_wrapw">
				<!--<div class="col-md-3 col-sm-3 col-xs-6">
						<a href="#" onfocus=blur() ><span class="ico qico01"></span><em>일정관리<span><img src="resource/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
					</div>

					<div class="col-md-3 col-sm-3 col-xs-6">
						<a href="#"onfocus=blur() ><span class="ico qico02"></span><em>메모장<span><img src="resource/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
					</div>

					<div class="col-md-3 col-sm-3 col-xs-6">
						<a href="#" onfocus=blur()  ><span class="ico qico03"></span><em>날씨<span><img src="resource/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
					</div>
				  -->
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a href="#" onfocus=blur() ><span class="ico qico01"></span><em>일정관리<span><img src="resource/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
						<a href="#" onfocus=blur() ><span class="ico qico02"></span><em>메모장<span><img src="resource/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
						<a href="#" onfocus=blur() ><span class="ico qico03"></span><em>날씨<span><img src="resource/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
					</div>

				</div>
			</div>
			</div>

	<!-- //Header -->
	<div id="content">
			<div id="main_sec01">
				<div>
					<div class="mtit_area">
						<h2>일정 </h2>
						<p>한빛아카데미 4생들이 만든일정입니다.</p>
					</div>
					<!-- //Section Title Area -->
					<div class="row boxwrap">
						<div class="col-md-5 col-sm-5">
							<div class="ir_graph">
								<div>
									<!-- iframe --><!-- //iframe -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //Investor Relations -->

			<div id="main_sec02">
				<div>
					<div class="mtit_area" align="center">
						<h2>날씨(Wheather)</h2>
						<p>기상청에서 소스를 가져와 구현한 <span>오늘의 날씨입니다.</span></p>
						<jsp:include page="WEB-INF/views/todayWeaTher.jsp"></jsp:include>
					</div>
				<!-- //Section Title Area --></div>
			</div>
			<!-- //Sustainability Management -->
		
				</div>
			</div>
			<!-- //Global Network -->
		</div>
		<!-- //contents -->
	</div>
	<!-- //container -->

	
<div class="shortcut">
	<div class="insc"></div>
</div>




	<div id="container">
		<div id="main_slider">
			<div class="slider1" id="visual_slider">
				<div class="slide">
					<div class="slide_con bg_ms01">
						<div>
							<strong>한빛교육센터 <span>Spring 프로젝트</span></strong>
							<p>스마트한 IT 세상을 위한 열정과 도전, <span>행복을 마주하는 순간과 함께합니다.</span></p>
						</div>
					</div>
				</div>
				<!-- //item01 -->

				<div class="slide">
					<div class="slide_con bg_ms02">
						<div>
							<strong>Happy memory, <span>Share happiness</span></strong>
							<p>한빛아카데미프로젝트로, <span>더 나은 내일을 꿈꿉니다.</span></p>
						</div>
					</div>
				</div>
				<!-- //item02 -->

				<div class="slide">
					<div class="slide_con bg_ms03">
						<div>
							<strong>Growing together <span>for better tomorrow</span></strong>
							<p>일정.메모.날씨.게시판등 필요한것들을 정리해봤습니다.</span></p>
						</div>
					</div>
				</div>
				<!-- //item03 -->
			</div>

			
		</div>
		<!-- //Main Slider  -->

		
<!-- //shortcut -->
<div id="footer">
	<div class="infoot">
	  <p class="address">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp서울특별시 마포구 백범로 23 거구장예식장 02-707-1480    COPYRIGHT (C)2016 한빛아카데미4기수료생. ALL RIGHTS RESERVED.</p>
	  <p class="address">&nbsp;</p>
	    <p class="address">&nbsp;</p>
	</div>
</div>
<!-- //footer -->
</div>
<script>
mainSlider();
</script>

<div class="layer_content"></div>
</body>



</html>