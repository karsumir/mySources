<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="resources/css/calendar.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type='text/javascript' src='resources/js/libs/jquery.bpopup-0.9.4.min.js'></script>
<script type="text/javascript" src='resources/js/libs/jquery.easing.min.js'></script>
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
		searchDiv();
		addSchedule();
		showGroupList();
		getSchedules();
		goToday();
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
		searchDiv();
		addSchedule();
		showGroupList();
		getSchedules();
		goToday();
	}
	
	function goToday(){
		$('#getToday').click(function(){
			var now = $('#getToday').text();
			now1 = now.substring(6,now.lastIndexOf("월"));		//1월
			var lookingM = $('#monthTD').text();
			lookingM = lookingM.substring(0,lookingM.lastIndexOf("월"));		//1월
			
			nowY = now.substring(0,4);
			lookingY = $('#yearTD').text().substring(0,4);
			
//			alert(nowY+", "+lookingY);
//			alert(now1-lookingM);
			
			var getY = lookingY - nowY;
			var cnt=0;
				cnt = getY*12;
			var getM = lookingM - now1;
				cnt +=getM;
			
//			alert(cnt);
			
			if(cnt > 0){
				for(var i=1; i<=cnt;i++){
					prev();
				}
			}
			if(cnt < 0){
				for(var i=cnt; i<0;i++){
					next();
				}
			}

			
		});
	}
	
	function drawCal(){
		function getMonth() {

			var y = year+"년";
			var m = month+"월";
			var blank1 = "   　";
			var blank2 = "   　";

			var ydiv = $('<div id="year"></div>');
			
			var mdiv = $('<div id="month"></div>');
			
			var tb = $('<center><table></table></center>');
			
			var tr1 = $('<tr></tr>');
			var tr2 = $('<tr></tr>');
			var td1 = $('<td colspan="3" id="yearTD"></td>');
			var td21 = $('<td></td>');
			var td22 = $('<td id="monthTD"></td>');
			var td23 = $('<td></td>');
			
			$(td1).append(y);
			$(td21).append('<input id="btn_prev" class="btn" type="button" onclick="prev()" value="<">');
			$(td22).append(m);
			$(td23).append('<input id="btn_next" class="btn" type="button" onclick="next()" value=">">');
			
			$(tr1).append(td1);
			$(tr2).append(td21);
			$(tr2).append(td22);
			$(tr2).append(td23);

			$(tb).append(tr1);
			$(tb).append(tr2);
			$(tb).append('<tr><td height="20px"></td></tr>');
			$('#all').append(tb);
			
		}
		
		function getToday() {
			var tdiv = $('<div id="today"></div>');
			
			var idiv = $('<div id="icons"></div>');
			
			var today = $('<span id="getToday"></span>');
				today.html(str);
			
			var sIcon = $('<img></img>');
				sIcon.attr("src","resources/images/calendar/icon_search.png");
				sIcon.attr("class","icon");
				sIcon.attr("id","searchIcon");
			var aIcon = $('<img></img>');
				aIcon.attr("src","resources/images/calendar/icon_add.png");
				aIcon.attr("class","icon");
				aIcon.attr("id","addIcon");
			var setIcon = $('<img></img>');
				setIcon.attr("src","resources/images/calendar/icon_Glist.png");
				setIcon.attr("class","icon");
				setIcon.attr("id","setIcon");
			
			$(tdiv).append(today);
			$(idiv).append(aIcon);
			$(idiv).append(sIcon);
			$(idiv).append(setIcon);
			
			$('#all').append(tdiv);
			$('#all').append(idiv);
			
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
						td.attr("id","firstSunday");
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
					if(i==thisDate && month == thisM && year == thisY){
						td.attr("id","hereIsToday");
					}

					if(i==lastDate){
						td.attr("id","lastDate");
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

		$.getJSON('json/calendarJSON.jsp', function(data){
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
						
						var watchingYear = ($('#yearTD').text()).substring(0,4);
						var watchingMonth = (($('#monthTD').text()).replace("월","").trim());
						
						if(eval(watchingMonth)<10){
							watchingMonth = "0"+watchingMonth;
						}
						
						var arr = $('.this');
						for(i=sdate;i<=edate;i++){
							$.each(arr,function(idx){
								if(syear==watchingYear && smonth==watchingMonth && idx==i-1){
									className = $(this).attr("class");
									if(!className.match(" haveSchedule") && !className.match(" today haveSchedule")){
										$(this).attr("class",className+" haveSchedule");
									}
									if($(this).attr("id")=="hereIsToday" && !className.match("today haveSchedule")){
										$(this).attr("class",className+" today haveSchedule");
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
		$('.prev').click(function(){
			prev();
		});
		$('.next').click(function(){
			next();
		});
		
		$('.this').click(function(){
			$('#schdle').empty();
			
			if($('#clicked')){
				$('#clicked').removeAttr("id");
			}
			
			if($('#hereIsTodayClicked')){
				$('#hereIsTodayClicked').attr("id","hereIsToday");
			}
			
			var classes = $(this).attr("class");

			if($(this).attr("id")=="hereIsToday"){
				$(this).attr("id","hereIsTodayClicked");
			}else{
				$(this).attr("id","clicked");
			}
			
			var date = $(this).html();
			
			if(classes.match("haveSchedule") || classes.match("today haveSchedule")){
				$.getJSON('json/calendarJSON.jsp',{dataType:'JSON'},function(data){
					$(data).each(function(index, value){
						
						var syear = this["startd"].substring(0,4);
						var smonth = this["startd"].substring(5,7);
						var sdate = this["startd"].substring(8,10);
						var edate = this["endd"].substring(8,10);
						var watchingYear = ($('#yearTD').text()).substring(0,4);
						var watchingMonth = (($('#monthTD').text()).replace("월","").trim());
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
										var startTime = startDate.substring(7);
										var td11 = $('<td align="center" class="fromTo"></td>').html(startTime);
											td11.attr("width","25%")
		//								var td21 = $('<td align="center"></td>').html(endDate);
		//									td21.attr("width","200px")
										
									}
									if(key=="title"){
										var td1 = $('<td id="titles" rowspan="2"></td>').html(value[key]);
											td1.attr("width","75%");
//										var td2 = $('<td align="center" rowspan="2" class="see"></td>').html("보기");
		//									td2.attr("","");		//상세보러가는 링크걸기
									}
									
									tr.append(td11);
									tr.append(td1);
	//								tr.append(td2);
	//								tr2.append(td21);
									
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
	
	function setDate1(){
		var curDate = new Date();
		$('#sDate').val(curDate.getFullYear() +'-'+("0"+(curDate.getMonth()+1)).slice(-2) +'-'+("0"+curDate.getDate()).slice(-2));
		$('#sHour').val(curDate.getHours());
		$('#eDate').val(curDate.getFullYear() +'-'+("0"+(curDate.getMonth()+1)).slice(-2) +'-'+("0"+curDate.getDate()).slice(-2));
		$('#eHour').val(curDate.getHours());
	}
	
	function addSchedule(){
		$('#addIcon').click(function(){
			
			$('#pop_up_add').bPopup({
				easing: 'easeOutBack', //uses jQuery easing plugin
				speed: 250,
				transition: 'slideDown',
				modalClose: false
			});	
		});
		
		$('#pop_up_search').scroll(function () {
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
		
		setDate1();
		$('#myform').submit(function(event){
			event.preventDefault();
			if($('#sDate').val().length<10 ||
				$('#sHour').val().length==0 ||
				$('#eDate').val().length<10 ||
				$('#eHour').val().length==0 ){
				alert('날짜를 확인하여 주십시오.');
				return false;
			}				
		});
		$.ajax({
			type: 'POST',
			url: 'selectGid.do',
			dataType: 'json',
			success: function(data){
				//alert(data);
				$('#gidlist').empty();
				var gidSelect = $('<select name="g_id" style="font-size: 40px; width: 100%"></select>');
				$(data).each(function(index, item){
					var gidOption = $('<option value='+ item.g_id +'>'+item.g_name+'</option>')
					$(gidSelect).append(gidOption);
				});
				$('#gidlist').append(gidSelect);
			}
		});
		
	}

	function showGroupList(){
		$('#setIcon').click(function(e){
			location.href="listGroup.do";
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
		
		$('.pop_up_banner').hide();
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
					
					var tblSearchList = $('<table border=1 width=\'498\'></table>');
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
			$('#searchSDate').val(curDate.getFullYear() +'-'+("0"+(curDate.getMonth()+1)).slice(-2) +'-'+("0"+curDate.getDate()).slice(-2));
			$('#searchSHour').val(curDate.getHours());
			$('#searchEDate').val(curDate.getFullYear() +'-'+("0"+(curDate.getMonth()+1)).slice(-2) +'-'+("0"+curDate.getDate()).slice(-2));
			$('#searchEHour').val(curDate.getHours());
		}
	}
	
	$(function(){
		
		drawCal();
		clicked();
		searchDiv();
		addSchedule();
		showGroupList();
		getSchedules();
		goToday();
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
	
	
	
	
	<div id='pop_up_banner' class='pop_up_banner'>
		<span class='b-close' 
		style='border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px; background-color:#2b91af; color:#fff; cursor: pointer; display: inline-block; text-align: center;'>
			<span>X</span> <!-- 닫기 버튼 (스타일은 알아서 지정) -->
		</span> 
		<div class='content'>
		<table border="1" width="500" height="200" class='scheduleTbl'>
			<tr>
				<td>
					<h2>일정검색</h2>
					<hr>
					<form id="frmSearchWord">
					<input type="hidden" id="u_id" name="u_id">
					<input type="hidden" id="curPage" name="curPage" value="1">
					<table border="1" width="495" id="tblSearchWord" style="border-collapse:collapse;background-color:#f4f9fb;">
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
        <div><div class="b-close"><span>X</span></div>   
      </div>
    </div>
	
	<div id='pop_up_add' class='pop_up_banner' style="width: 90%; margin: 10%">
		<span class='b-close' style='border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px; background-color:#2b91af; color:#fff; cursor: pointer; display: inline-block; text-align: center;'>
			<span>X</span> <!-- 닫기 버튼 (스타일은 알아서 지정) -->
		</span>
		<div id="addSchedule" style="border-radius:8px;">
		<table border="0" class='scheduleTbl' style="font-size: 50px; width: 100%">
			<tr>
				<td>
					<h2>일정등록</h2>
					<hr>
					<form action="insertSchedule.do" method="post" enctype="multipart/form-data" style="border-collapse:collapse;background-color:#f4f9fb;">
					<input type="hidden" name="u_id" value="user1">
					<table border="1" width="100%" id="tblSearchWord" style="border-collapse:collapse;background-color:#f4f9fb;">
						<tr> 
							<td>그룹</td>
							<td>
								<div id="gidlist"></div>
							</td>
						</tr>
						<tr> 
							<td>시작</td>
							<td>
								<input type="date" id="sDate" name="sDate" style="font-size: 40px">
								<input type="number" id="sHour" name="sHour" size="3" min="0" max="23" style="font-size: 40px; width: 20%;">시
							</td>
						</tr>
					     <tr>
						    <td>종료</td>
							<td>
								<input type="date" id="eDate" name="eDate" style="font-size: 40px">
								<input type="number" id="eHour" name="eHour" size="3" min="0" max="23" style="font-size: 40px; width: 20%;">시
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
							     <input type="file" name="uploadFile" size="40" style="font-size: 40px"><br>
							</td>
						</tr>
					     <tr>
							<td>제목</td>
							<td>
								<input name="title" type="text" size="50" style="font-size: 40px; width: 99%"><br>
							</td>
						</tr>
						<tr>	
							<td>내용</td>
							<td>
								<textarea rows="10" cols="48" name="content" style="font-size: 40px; width: 99%"></textarea>
							</td>			
					    </tr>        
					        <tr>
							<td>장소</td>
							<td>
								<input name="place" type="text" size="50" style="font-size: 40px; width: 99%"><br>
							</td>
						</tr>
					</table>
					<input type="submit" value="일정등록" style="font-size: 40px; width: 49%; display: inline; position: relative;" >
					<input type="reset" value="취소" style="font-size: 40px; width: 49%; display: inline; position: relative;">
					</form>
				</td>
			</tr>
		</table>
		</div>
	</div>
		<div id="appList2" class="bMulti">
 			<div><div class="b-close"><span>X</span></div>
 		</div>
	</div>
	
	
	
</body>
</html>