<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	.b-close{
		display: none;
	}
	.see{
		min-width:20px;
	}
	.fromTo{
		min-width: 130px;
	}
	#titles{
		padding-left: 10px;
		
	}
	.haveSchedule{
		background-image:url("resources/images/calendar/dot.png");
		background-repeat: no-repeat;
		background-position: center;
	}
	
	.notThis{
		color: LightGrey;
		vertical-align: top;
		padding-top: 1%;
		border-bottom: ridge;
	}
	.prev{
		border-bottom-color: LightGrey;
	}
	.this{
		vertical-align: top;
		padding-top: 1%;
		border-bottom: ridge;
		border-bottom-color: LightGrey;

	}
	.dayTd{
		border-bottom:10px;
		border-bottom: ridge;
		height: 30px;
		border-bottom-color: black;
	}
	
	.sat{
		color: Blue;
		border-bottom-color: Blue;
	}
	.sun{
		color: Red;
		border-bottom-color: Red;
	}
	#seventh{
		color: Red;
		border-top: ridge;
		border-top-color: Red;
	}
	
	#schdle{
		width:100%;
		min-width:300px;
	}
	
	#calendar{
		width:100%;
		height: 600px;
		min-width: 300px;
		border-spacing: 40px 0px;
	}

	#hereIsToday{
		background-color: Bisque;
	}
	#today{
	 	width: 98%;
	 	text-align: right;
	}
	#year{
	 	font-size: 50px; 
	 	text-align: center;
	 	width: 100%; 
	}
	#month{
		font-size: 30px; 
		width: 100%;
		text-align: center;
	}
	#noBottomLine{
		border-bottom: none;
	}
	#searchIcon{
		width: 100px;
	}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type='text/javascript' src='resources/js/jquery.bpopup-0.9.4.min.js'></script>
<script type="text/javascript" src='resources/js/jquery.easing.min.js'></script>
<script type="text/javascript">


	var date = new Date();
	
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var thisDate = date.getDate();
	
	var str = year+"년 "+month+"월 "+thisDate+"일";
	var thisY = year.toString();
	var thisM = month.toString();
	
	var day = ['일','월','화','수','목','금','토'];
	var firstDay = new Date(year, month-1, 1).getDay();
	var lastDate = new Date(year, month, 0).getDate();
	var lastDay = new Date(year, month, 0).getDay();
	var prevLastDate = new Date(year, month-1, 0).getDate();

	
	

	
	function prev(){
		
		month = month -1;
		
		date = new Date(year, month);


		firstDay = new Date(year, month-1, 1).getDay();
		lastDate = new Date(year, month, 0).getDate();
		lastDay = new Date(year, month, 0).getDay();
		prevLastDate = new Date(year, month-1, 0).getDate();
		
		if(month <=0){
			year -= 1;
			month = 12;
		}
		
		$('#all').empty();
		drawCal();
		clicked();
		getSchedules();
		searchDiv();
	}
	
	
	function next(){
		$('.this').attr("class").replace(" haveSchedule","");
		month = month +1;
		
		date = new Date(year, month);

		firstDay = new Date(year, month-1, 1).getDay();
		lastDate = new Date(year, month, 0).getDate();
		lastDay = new Date(year, month, 0).getDay();
		prevLastDate = new Date(year, month-1, 0).getDate();
		
		if(month >12){
			year += 1;
			month = 1;
		}
		
		$('#all').empty();
		drawCal();
		clicked();
		getSchedules();
		searchDiv();
	}
	
	
	function drawCal(){
		function getMonth() {

			var y = year+"년";
			var m = month+"월";
			var blank1 = "   　";
			var blank2 = "   　";

			var ydiv = $('<div id="year"></div>');
			
			var mdiv = $('<div id="month"></div>');
			
			$(ydiv).append(y);
			$(mdiv).append('<input id="btn_prev" type="button" onclick="prev()" value="<">');
			$(mdiv).append(blank1);
			$(mdiv).append(m);
			$(mdiv).append(blank2);
			$(mdiv).append('<input id="btn_next" type="button" onclick="next()" value=">">');
			
			
			
			$('#all').append(ydiv);
			$('#all').append(mdiv);
		}
		
		function getToday() {
			var tdiv = $('<div id="today"></div>');

			var today = str;
			
			var sIcon = $('<img></img>');
				sIcon.attr("src","resources/images/calendar/search.jpg");
				sIcon.attr("id","searchIcon");
			
			$(tdiv).append(today);
			$(tdiv).append(sIcon);
			
			$('#all').append(tdiv);
			
			var br = $('<br>');
			$('#all').append(br);
		}
		

		function getCal(){
			
			var tableDiv = $('<div></div>');
			var tb = $('<table id="calendar"></table>');
			
			var tr = $('<tr align="center"></tr>');
			$(day).each(function(){
				clnm = "dayTd";
				var td = $('<td></td>');
					td.attr("class",clnm);
				td.html(this);
				if(td.html()=="토"){
					td.attr("class",clnm+" sat");
				}
				if(td.html()=="일"){
					td.attr("class",clnm+" sun");
				}
				tr.append(td);
			});
				
			tb.append(tr);

			var j=0;
			var k=1;
			for(i=0-firstDay;i<lastDate+(7-lastDay);i++){
				if(i==0){
					continue;
				}
				
				if(i<0){
					var td = $('<td></td>').html(prevLastDate+i+1);
						td.attr("no",j);
						td.attr("class","notThis prev");
					if(td.attr("no")==0){
						td.attr("id","noBottomLine");
					}
				}
				
				if(i>0){
					var td = $('<td></td>').html(i);
						td.attr("no",j);
						td.attr("class","this");
					if(td.attr("no")%7==6){
						td.attr("class","this sat");
					}
					if(td.attr("no")%7==0){
						td.attr("class","this sun");
					}
					if(i==thisDate && month == thisM){
						td.attr("id","hereIsToday");
					}
					if(td.attr("no")==7)
					{
						td.attr("id","seventh");
					}
				}
		
				
				if(td.attr("no")%7==0){
					var tr = $('<tr align="center"></tr>');
				}
				
				if(i>lastDate){
					var td = $('<td></td>').html(k);
						td.attr("no",j);
						td.attr("class","notThis next");
	
					k++;
				}
				
				j++;
				
				if(j>=43){
					break;
				}
				
				tr.append(td);
				tb.append(tr);
				tableDiv.append(tb);
				
				$('#all').append(tableDiv);
			}
		}
		
		getMonth();
		getToday();
		getCal();
	}
	
	
	function getSchedules(){

		$.getJSON('calendar.do', function(data){
			
			$(data).each(function(index, value){
				for(var key in value){
					if(key=="startd" || key=="endd"){
						var start = value["startd"];		//format : yyyy-mm-dd
						var end = value["endd"];			//format : yyyy-mm-dd
						var syear = start.substring(0,4);
						var smonth = start.substring(5,7);
						var sdate = start.substring(8,10);
						
						var eyear = end.substring(0,4);
						var emonth = end.substring(5,7);
						var edate = end.substring(8,10);
						
						var watchingYear = ($('#year').text()).substring(0,4);
						var watchingMonth = (($('#month').text()).replace("월","").trim());
						if(eval(watchingMonth)<10){
							watchingMonth = "0"+watchingMonth;
						}
						
						var arr = $('.this');
						for(i=sdate;i<=edate;i++){
							$.each(arr,function(idx){
								if(syear==watchingYear && smonth==watchingMonth && idx==i-1){
									className = $(this).attr("class");
									if(!className.match(" haveSchedule")){
										$(this).attr("class",className+" haveSchedule");
									}
									
								}
							});
							
						}
						
						
					}
				}
			});
		});
		
	}
	
	function clicked(){
		$('.this').click(function(){
			$('#schdle').empty();
			
			var classes = $(this).attr("class");
			var date = $(this).html();
			
			if(classes.match("haveSchedule")){
				$.getJSON('calendar.do',{dataType:'JSON'},function(data){
					$(data).each(function(index, value){
						
						var syear = this["startd"].substring(0,4);
						var smonth = this["startd"].substring(5,7);
						var sdate = this["startd"].substring(8,10);
						var edate = this["endd"].substring(8,10);
						var watchingYear = ($('#year').text()).substring(0,4);
						var watchingMonth = (($('#month').text()).replace("월","").trim());
						if(eval(watchingMonth)<10){
							watchingMonth = "0"+watchingMonth;
						}
						if(eval(sdate)<10){
							sdate = sdate.replace("0","").trim();
						}
						if(eval(edate)<10){
							edate = edate.replace("0","").trim();
						}
						
						
						
						
						for(var i=sdate;i<=edate;i++){

							if(syear==watchingYear && smonth==watchingMonth && date==i){
								for(var key in value){
									var tr = $('<tr></tr>');
									var tr2 = $('<tr></tr>');
									if(key=="startd"){
										var startDate = value[key].substring(5);
										var endDate = value["endd"].substring(5);
										var td11 = $('<td align="center" class="fromTo"></td>').html(startDate);
											td11.attr("width","200px")
										var td21 = $('<td align="center"></td>').html(endDate);
											td21.attr("width","200px")
										
									}
									if(key=="title"){
										var td1 = $('<td id="titles" rowspan="2"></td>').html(value[key]);
											td1.attr("width","60%");
										var td2 = $('<td align="center" rowspan="2" class="see"></td>').html("보기");
		//									td2.attr("","");		//상세보러가는 링크걸기
									}
									
									tr.append(td11);
									tr.append(td1);
									tr.append(td2);
									tr2.append(td21);
									
									$('#schdle').append(tr);
									$('#schdle').append(tr2);
									
								}			
								
								
							}
							
						}
						
							
						
					});

				});
			}
		
		});
		
	}
	
	function searchDiv(){
		$('#searchIcon').click(function(e){
			$('#divSearchList').empty(); //이전 검색 결과 초기화
			$('#divSearchListPage').empty(); //이전 페이지 목록 초기화
			$('#pop_up_banner').bPopup({
				easing: 'easeOutBack', //uses jQuery easing plugin
				speed: 250,
				transition: 'slideDown',
				modalClose: false
			});	
		});
		
		// 스크롤 이벤트 발생 시
	    $('#pop_up_banner').scroll(function () {
	        // 필요한 변수를 구합니다.
	        var scrollHeight = $(window).scrollTop() + $(window).height();
	        var documentHeight = $(document).height();

	        // 스크롤의 높이와 문서의 높이가 같을 때
	        if (scrollHeight == documentHeight) {
	            for (var i = 0; i < 10; i++) {
	                $('<h1>Infinity Scroll</h1>').appendTo('body');
	            }
	        }
	    });
		
		//검색기간 설정
		setDate();
		
		$('#divSearchList').hide();
		
		$('#frmSearchWord').submit(function(event){
			event.preventDefault(); //기본이벤트를 제거.
			
			setSearchDiv(); // 검색 목록 출력 
			
			setSearchPageDiv(); // 검색 후 페이지 출력
		});
		
		// 검색 목록 출력 
		function setSearchDiv(qStr, searchWord){
			var urlParm  = 'searchSchedule.do';
			var dataParm =  $('#frmSearchWord').serialize();
			if(qStr!=null){
				urlParm  = qStr;
				dataParm = {searchWord:searchWord};
			}
			
			$.ajax({
				type: 'POST',
				url: urlParm,
				data: dataParm,
				dataType: 'json',
				success: function(data){
					$('#divSearchList').empty();
					$('#divSearchList').show();
					
					var tblSearchList = $('<table border=\'1\' width=\'500\'></table>');
					$(data).each(function(index, item){
						var tdSNum = $('<td></td>').html(item.s_num);
						var tdContents = $('<td></td>');
						
						var tblContent = $('<table></table>');
						var trContent1  = $('<tr></tr>');
						var tdSEDate = $('<td></td>').html(item.startd + '~' + item.endd);
						var tdPlace = $('<td></td>').html(item.place);
						trContent1.append(tdSEDate);
						trContent1.append(tdPlace);
						tblContent.append(trContent1);
						var trContent2  = $('<tr></tr>');
						var tdTitle = $('<td colspan=\'2\'></td>').html(item.title);
						trContent2.append(tdTitle);
						tblContent.append(trContent2);
						tdContents.append(tblContent);
						
						var trSearchList = $('<tr></tr>');
						trSearchList.append(tdSNum);
						trSearchList.append(tdContents);
						
						tblSearchList.append(trSearchList);
					});
					$('#divSearchList').append(tblSearchList);
				}
			});
		}
		
		// 검색 후 페이지 출력
		function setSearchPageDiv(qStr, searchWord){
			var urlParm  = 'searchSchedulePage.do';
			var dataParm =  $('#frmSearchWord').serialize();
			if(qStr!=null){
				urlParm  = qStr.replace('searchSchedule.do', urlParm);
				dataParm = {searchWord:searchWord}; 
			}
			$.ajax({
				type: 'POST',
				url: urlParm,
				data: dataParm,
				//dataType: 'json',
				success: function(data){
					//alert(data);
					$('#divSearchListPage').empty();
					$('#divSearchListPage').show();
					$('#divSearchListPage').html(data);
					$('#divSearchListPage > a').click(function(event){
						event.preventDefault(); // <a> tag의 기본 이벤트 제거
						
						var qStr       = $(this).attr('href');
						var searchWord = $(this).attr('searchWord');
						setSearchDiv(qStr, searchWord); // 검색 목록 출력
						setSearchPageDiv(qStr, searchWord);
					});
				}
			});
		}
		
		function setDate(){
			var curDate = new Date();
			$('#searchSDate').val(curDate.getFullYear()-1 +'-'+curDate.getMonth()+1 +'-'+curDate.getDate());
			$('#searchSHour').val(curDate.getHours());
			$('#searchEDate').val(curDate.getFullYear() +'-'+curDate.getMonth()+1 +'-'+curDate.getDate());
			$('#searchEHour').val(curDate.getHours());
		}
	}
	
	
	$(function(){
		
		drawCal();
		clicked();
		getSchedules();
		searchDiv();
	});
</script>
</head>
<body>
	<div id="all">
	</div>
	
	<br>
	
	<div>
		<table id="schdle">
		</table>
	</div>
	
	
	
	
	<div id='pop_up_banner' style='display:none; width:500px'>
		<span class='b-close' style='border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px; background-color:#2b91af; color:#fff; cursor: pointer; display: inline-block; text-align: center;'>
			<span>X</span> <!-- 닫기 버튼 (스타일은 알아서 지정) -->
		</span> 
		<div class='content'>
		<table border="1" width="500" height="200" bgcolor="white">
			<tr>
				<td>
					<h2>일정검색</h2>
					<hr>
					<form id="frmSearchWord">
					<input type="hidden" id="u_id" name="u_id">
					<input type="hidden" id="curPage" name="curPage" value="1">
					<table border="1" width="500" id="tblSearchWord">
						<tr>
							<td>검색어</td>
							<td><input type="text" id="searchWord" name="searchWord" size="30">
								<input type="submit" id="btnSubmit" value="검색"> 
							</td>
						</tr>
						<tr>
							<td>시작시간</td>
							<td>
								<input type="date" id="searchSDate" name="searchSDate">
								<input type="number" id="searchSHour" name="searchSHour" size="3" min="0" max="23">시
							</td>
						</tr>
						<tr>
							<td>종료시간</td>
							<td>
								<input type="date" id="searchEDate" name="searchEDate">
								<input type="number" id="searchEHour" name="searchEHour" size="3" min="0" max="23">시
							</td>
						</tr>
					</table>
					</form>
					<div id="divList">
						<div id="divSearchList" style="border: 1px;padding-top: 20px;">
							<!-- 일정 목록 출력 -->
						</div>
						<div id="divSearchListPage" style="border: 1px;padding-top: 20px;text-align: center;">
							<!-- 일정 목록 페이징 -->	
						</div>
					</div>
				</td>
			</tr>
		</table>
		</div> <!-- 컨텐츠가 들어갈 영역 지정 (이미지, html 등.. 여러가지를 동적으로 부를수 있다. -->
	</div>
	<div id="appList" class="bMulti">
  <div> <div class="b-close"><span>X</span></div>   </div>
 </div>
	
	
	
	
	
</body>
</html>