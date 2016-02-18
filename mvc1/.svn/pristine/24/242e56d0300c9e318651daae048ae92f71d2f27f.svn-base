<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no"/>		
	
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
    <link href="resources/css/calendar.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    	#weatherUl{
    		list-style-type: none;
    	}
    	#thisWeekWeather{
    		text-align: center;
    	}
    	#weatherTable{
    		text-align: center;    		
    	}
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>
	<script src="resources/jsList/mMemoList.js"></script>
	<script src="resources/jsList/showt.js"></script>
	<script src="resources/jsList/showInT.js"></script>


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
		
//		alert(nowY+", "+lookingY);
//		alert(now1-lookingM);
		
		var getY = lookingY - nowY;
		var cnt=0;
			cnt = getY*12;
		var getM = lookingM - now1;
			cnt +=getM;
		
//		alert(cnt);
		
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

		$('#all').trigger("create");
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
//									var td2 = $('<td align="center" rowspan="2" class="see"></td>').html("보기");
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
		
		location.href="#addSchedulePage";
/*		
		$('#pop_up_add').bPopup({
			easing: 'easeOutBack', //uses jQuery easing plugin
			speed: 250,
			transition: 'slideDown',
			modalClose: false
		});

*/
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
			var gidSelect = $('<select name="g_id" style="font-size: 20px; width: 100%"></select>');
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
		location.href="#searchSchedulePage"
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
	
//	$('.pop_up_banner').hide();
//	$('#divSearchList').hide();
	
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

$(document).on('pageshow', '#calendarPage', function(){
	getSchedules();
});

$(document).on('pageshow',"#managerScreenPage", function(){

	var searchField;
	var searchSel;
		
	showMemberList();
	
	function showMemberList(){
		$.ajax({url:"showMemberList.do",			
			success: function(data){
				var tb=("#managerTb");
				$(tb).empty();
				$(tb).html("<tr><td>이름</td><td>아이디</td><td>전화번호</td><td>이메일</td><td>삭제</td></tr>");					
				var ul=$("#managerScreenList");	
				$(ul).empty();
				$(eval(data)).each(function(index,item){
					if(item['u_id']!='manager'){
						
					var li=$("<li></li>");
									
					$(li).append("<h2>회원ID : "+item['u_id']+"</h2>");					
					$(li).append("<p>회원명 : "+item['u_name']+"</p>");
					$(li).append("<p>전화번호 : "+item['u_tel']+"</p>");
					$(li).append("<p>이메일 : "+item['u_email']+"</p>");
					
					
					var btn=$("<input></input>");
					$(btn).attr("type", "button");
					$(btn).attr("value", "삭제");
					$(btn).attr("id", item['u_id']);					
					$(btn).on("click", function(){
						var c=confirm("정말로 삭제하시겠습니까?");
						if(c){
								$.ajax({url: "deleteMember.do",
									data: {u_id:item['u_id']},
									success: function(){
										showMemberList();									
									}
								});
							}
					});
					var p=$("<p class='ul-li-aside'></p>");
					//$(p).addClass("ul-li-aside");
					$(p).append(btn);					
					$(li).append(p);
					$(li).appendTo(ul);
					
					$(ul).listview("refresh");
					}});
					
			}});
	}
	function showSearchedMemberList(){
		$.ajax({url:"searchMember.do",
			data:{searchField:searchField, searchSel:searchSel},
			success: function(data){
				var tb=("#managerTb");
				$(tb).empty();
				$(tb).html("<tr><td>이름</td><td>아이디</td><td>전화번호</td><td>이메일</td><td>삭제</td></tr>");	
				var ul=$("#managerScreenList");	
				$(ul).empty();
				$(eval(data)).each(function(index,item){
					if(item['u_id']!='manager'){
					var li=$("<li></li>");
					
					$(li).append("<h2>회원ID : "+item['u_id']+"</h2>");					
					$(li).append("<p>회원명 : "+item['u_name']+"</p>");
					$(li).append("<p>전화번호 : "+item['u_tel']+"</p>");
					$(li).append("<p>이메일 : "+item['u_email']+"</p>");
					
					var btn=$("<input></input>");
					$(btn).attr("type", "button");
					$(btn).attr("value", "삭제");
					$(btn).attr("id", item['u_id']);					
					$(btn).on("click", function(){
						var c=confirm("정말로 삭제하시겠습니까?");
						if(c){
								$.ajax({url: "deleteMember.do",
									data: {u_id:item['u_id']},
									success: function(){
										showSearchedMemberList();									
									}
								});
							}
					});
					
					var p=$("<p class='ul-li-aside'></p>");
					//$(p).addClass("ul-li-aside");
					$(p).append(btn);					
					$(li).append(p);
					$(li).appendTo(ul);
					$(ul).listview("refresh");
					}});
			}
	});
	}
	
	$("#managerShowAllBtn").on("click", function(){
		showMemberList();
	});
	

	
	
	$("#managerSearchBtn").on("click", function(){
		var rbtn=$("input[type=radio]");
		searchField=$("#managerSearch").val();
		if(rbtn[0].checked==true)//id선택
		{
			searchSel="id";
		}
		else if(rbtn[1].checked==true)//name선택
		{
			searchSel="name";
		}
		else if(rbtn[2].checked==true)//all 선택
		{
			searchSel="all";
		}
		else if(rbtn[0].checked==false && rbtn[1].checked==false && rbtn[2].checked==false)
		{
			alert("검색조건을 설정하세요");
		}
			
		showSearchedMemberList();
		
	});
});
$(document).on('pageshow',"#memoScreenPage", function(){
	mMemoList();
});
$(document).on('pageshow', "#searchIdPwd", function(){
	 var user_id;
		
		function showSelect(){			
			$("#searchIdPwdDiv").empty();
			var searchIdBtn=$("<input></input>");
			$(searchIdBtn).attr("type", "button");
			$(searchIdBtn).attr("id", "btnId");
			$(searchIdBtn).css({width : 300, height: 75});
			$(searchIdBtn).attr("value", "아이디찾기");
			//$(searchIdBtn).on('click',function(){
			$(searchIdBtn).click(function(){
				$("#searchIdPwdDiv").empty();
				var nameInput=$("<input></input>");
				$(nameInput).attr("type", "text");
				$(nameInput).attr("id", "name");	
				
				
				var emailInput=$("<input></input>");
				$(emailInput).attr("type", "email");
				$(emailInput).attr("id", "email");
				
				var confirmBtn=$("<input>");
				$(confirmBtn).attr("type","button");
				$(confirmBtn).click(function(){
					var name=$("#name").val();
					var email=$("#email").val();					
					
					
					$.ajax({
						url:"findId.show",
						data:{name : name, email:email},
						type:"post",
						success: function(data){
							
							var result="회원님의 id는 \n "+data+"입니다.";
							if(data=='')
							{
								$("#searchIdPwdSpan").empty();
								$("#searchIdPwdSpan").html("<font color='red'>존재하지 않는 회원입니다.</font>");
							}
							else{
								$("#searchIdPwdSpan").empty();
								$("#searchIdPwdDiv").empty();
								$("#searchIdPwdDiv").append(result);
								
								
								
								var returnBtn=$("<input>");
								$(returnBtn).attr("type","button");
								$(returnBtn).attr("value","처음으로");
								$(returnBtn).click(function(){
									$("#searchIdPwdSpan").empty();
									showSelect();
								});
								
								$("#searchIdPwdDiv").append("<br>");
								$("#searchIdPwdDiv").append(returnBtn);
								$("#searchIdPwdDiv").trigger('create');
								
							}
						}
					});
					
				});
				$(confirmBtn).attr("value", "확인");
				
				var resetBtn=$("<input>");
				$(resetBtn).attr("type","button");
				$(resetBtn).click(function(){
					$("#searchIdPwdSpan").empty();
					showSelect();
				});
				$(resetBtn).attr("value", "처음으로");
				
				
				$("#searchIdPwdDiv").append("이름");		
				$("#searchIdPwdDiv").append(nameInput);		
				$("#searchIdPwdDiv").append("<br>");		
				$("#searchIdPwdDiv").append("이메일");		
				$("#searchIdPwdDiv").append(emailInput);
				$("#searchIdPwdDiv").append("<br>");		
				$("#searchIdPwdDiv").append(confirmBtn);		
				$("#searchIdPwdDiv").append(resetBtn);	
				$("#searchIdPwdDiv").trigger('create');
			});
			
			
			var searchPwdBtn=$("<input></input>");
			$(searchPwdBtn).attr("type", "button");
			$(searchPwdBtn).attr("id", "btnPwd");
			$(searchPwdBtn).attr("value", "비번찾기");
			$(searchPwdBtn).css({width : 300, height: 75});
			$(searchPwdBtn).click(function(){
				$("#searchIdPwdDiv").empty();
				var idInput=$("<input></input>");
				$(idInput).attr("type", "text");
				$(idInput).attr("id", "u_id");	

				
				
				var confirmIdBtn=$("<input>");
				$(confirmIdBtn).attr("type","button");
				$(confirmIdBtn).attr("value","확인");
				$(confirmIdBtn).click(function(){
				 $.ajax({url:"findPwd.show",
						data: {u_id: $("#u_id").val()},
						success: function(data){
							
						if(data=='')
						{
							$("#searchIdPwdSpan").empty();
							$("#searchIdPwdSpan").html("<font color='red'>존재하지 않는 ID입니다.</font>");
						}
						else{
							$("#searchIdPwdSpan").empty();
							var s=data.split('//');
							var ask=s[0];
							var ans=s[1];
							var askInput=$("<input></input>");
							$(askInput).attr("type", "text");
							$(askInput).attr("value", ask);
							$(askInput).attr("readonly", "'readonly'");
							
							var ansInput=$("<input></input>");
							$(ansInput).attr("type", "text");
							$(ansInput).attr("id", "ansId");
							
							var confirmBtn02=$("<input></input>");
							$(confirmBtn02).attr("type", "button");
							$(confirmBtn02).attr("value", "확인");
							$(confirmBtn02).click(function(){
								if($(ansId).val()==ans && ans!='null')
								{
									$("#searchIdPwdSpan").empty();
									user_id=$("#u_id").val();									
									$("#searchIdPwdDiv").empty();
									var newPwd=$("<input></input>")
									$(newPwd).attr("type", "password");
									$(newPwd).attr("id", "newPwdId");
									
									var newPwdCheck=$("<input></input>")
									$(newPwdCheck).attr("type", "password");
									$(newPwdCheck).attr("id", "newPwdCheckId");
									
									var confirmBtn03=$("<input></input>");
									$(confirmBtn03).attr("type", "button");
									$(confirmBtn03).attr("value", "확인");
									$(confirmBtn03).click(function(){
										if($("#newPwdId").val()==$("#newPwdCheckId").val())
										{
											$("#searchIdPwdSpan").empty();
											$.ajax({
												url:"updateNewPwd.show",
												data:{u_id : user_id ,u_pwd :$("#newPwdId").val()},
												success: function(data){	
													$("#searchIdPwdDiv").empty();	
													
													
													
													var returnBtn=$("<input>");
													$(returnBtn).attr("type","button");
													$(returnBtn).attr("value","처음으로");
													$(returnBtn).click(function(){
														$("#searchIdPwdSpan").empty();
														showSelect();
													});
													
													$("#searchIdPwdDiv").append("비밀번호가 변경되었습니다.");
													$("#searchIdPwdDiv").append("<br>");
													$("#searchIdPwdDiv").append(returnBtn);	
													$("#searchIdPwdDiv").trigger('create');
																							
												}});
										}
										else
										{
											$("#searchIdPwdSpan").empty();
											$("#searchIdPwdSpan").html("<font color='red'>새로운 비밀번호가 서로 맞지 않습니다.</font>");
										}
									});
									
									var cancelBtn02=$("<input></input>");
									$(cancelBtn02).attr("type", "button");
									$(cancelBtn02).attr("value", "처음으로");									
									$(cancelBtn02).click(function(){
										$("#searchIdPwdSpan").empty();
										showSelect();
									});									
									
									$("#searchIdPwdDiv").append("새비밀번호");
									$("#searchIdPwdDiv").append(newPwd);
									$("#searchIdPwdDiv").append("<br>");
									$("#searchIdPwdDiv").append("비밀번호확인");
									$("#searchIdPwdDiv").append(newPwdCheck);
									$("#searchIdPwdDiv").append("<br>");
									$("#searchIdPwdDiv").append(confirmBtn03);
									$("#searchIdPwdDiv").append(cancelBtn02);
									$("#searchIdPwdDiv").trigger('create');
								}
								else{
									
									$("#searchIdPwdSpan").empty();
									$("#searchIdPwdSpan").html("<font color='red'>올바른 답이 아닙니다.</font>");
								}
							});
							
							
							var cancelBtn=$("<input></input>");
							$(cancelBtn).attr("type", "button");
							$(cancelBtn).attr("value", "처음으로");
							$(cancelBtn).click(function(){
								$("#searchIdPwdSpan").empty();
								showSelect();
							});
							
							$("#searchIdPwdDiv").append("<br>");
							$("#searchIdPwdDiv").append("질문");
							$("#searchIdPwdDiv").append(askInput);
							$("#searchIdPwdDiv").append("<br>");
							$("#searchIdPwdDiv").append("답");
							$("#searchIdPwdDiv").append(ansInput);
							$("#searchIdPwdDiv").append("<br>");
							$("#searchIdPwdDiv").append(confirmBtn02);
							$("#searchIdPwdDiv").append(cancelBtn);
							$("#searchIdPwdDiv").trigger('create');
							
						}
					}}
				 );
				
				});
				$("#searchIdPwdDiv").append("아이디");
				$("#searchIdPwdDiv").append(idInput);
				$("#searchIdPwdDiv").append(confirmIdBtn);
				$("#searchIdPwdDiv").trigger('create');
			});
			
			$("#searchIdPwdDiv").append(searchIdBtn);
			$("#searchIdPwdDiv").append("<br>");
			$("#searchIdPwdDiv").append(searchPwdBtn);
			$("#searchIdPwdDiv").trigger('create');
		
	};
		showSelect();
});

$(document).on('pageshow', '#thisWeekWeather', function(){
	var region=["서울", "인천", "부산", "대구","광주","대전","울산","수원","제주"];
	var regionCode=["1132599","1132496","1132447", "1132466","1132481","1132467","1132578","1132567","1132454"];
	
	var userRegion=region[$("#userReg").val()];
	
	
	$.ajax({url:"weatherData.show",			
		data: {code:regionCode[region.indexOf(userRegion)]},			
		success:function(datas){					
				var data=eval(datas);	
				$(data).find("item").each(function(){				
					var pubDate=$(this).find("pubDate").html(); //오늘 날짜정보
					var today=pubDate.split(" ");
					var todayYear=today[3]; // 오늘년도
					var todayMonth=today[2]; // 오늘달
					var todayDate=today[1]; // 오늘날짜
					//var presentTime=today[4]; // 현재시각
					//var todayTemp=$(this).find("condition"); // 오늘날씨정보
					var forecast=$(this).find("forecast"); // 금주 날씨정보(오늘포함)
					
					var month=["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
					var yoil=["Sun", "Mon","Tue","Wed","Thu","Fri","Sat"];
					var yoilKor=["<font color='red'>일</font>","월","화","수","목","금","<font color='blue'>토</font>"];
					
					for(var i=0; i<forecast.length;i++)	{	
					var thisWeekTable=$("<table></table>");
					$(thisWeekTable).attr("border", "1");
					$(thisWeekTable).attr("bordercolor", "#E8E7DB");
					$(thisWeekTable).attr("cellspacing", "0");		
			
					var statusTr=$("<tr bgcolor='#54BEFF'></tr>");
					var TempTr=$("<tr bgcolor='#CFFF61'></tr>");					
					var DateTr=$("<tr bgcolor='#FFF7B4'></tr>");	
					
						var f=forecast[i].getAttribute("date");
						var ff=f.split(" ");
						var nextDate=ff[0];
						
						var code=forecast[i].getAttribute("code");
						var codeImage;
						var codeStatus;
						
						switch (code) {
							case '25':case '31':case '32': case '33': case '34':case '36': codeImage='clear.JPEG'; codeStatus='맑음';break;
							case '27': case '28': case '29': case '30': codeImage='partlyCloudy.JPEG'; codeStatus='구름';break;
							case '26': case '44':codeImage='cloudy.JPEG';codeStatus='흐림';break;
							case '13': case '14': case '15': case '16':case '41':case '42':case '43': case '46':codeImage='snow.JPEG';codeStatus='눈';break;
							case '5': case '6': case '7': case '17': case '18':codeImage='sleet.JPEG';codeStatus='진눈깨비';break;
							case '1': case '2':case '4':case '3':case '8':case '9': case '10': case '35':case '37':case '38':case '39':codeImage='rain.JPEG';codeStatus='비';break;
							case '11': case '12': case '40':case '45':case '47':codeImage='rain.JPEG';codeStatus='소나기';break;
							case '19': case '20': case '21':case '22':codeImage='fog.JPEG';codeStatus='안개';break;
							case '23': case '24':codeImage='wind.JPEG';codeStatus='바람';break;	
							default: codeImage='idontknow.JPEG';break;
						}
						$("<td rowspan='3' bgcolor='#E8E7DB'></td>").html("<img src='resources/"+codeImage+"' width='115' height='115'>").appendTo(statusTr);
						$("<td></td>").html(codeStatus).appendTo(statusTr);
						$("<td></td>").html("<font color='blue'>"+forecast[i].getAttribute("low")+"</font>℃/<font color='red'>"+forecast[i].getAttribute("high")+"</font>℃").appendTo(TempTr);
						$("<td></td>").html(nextDate+"("+yoilKor[yoil.indexOf(forecast[i].getAttribute("day"))]+")").appendTo(DateTr);
	
					$(statusTr).appendTo(thisWeekTable);
					$(TempTr).appendTo(thisWeekTable);
					$(DateTr).appendTo(thisWeekTable);					
					
					var div=$("<div></div>");
					$(thisWeekTable).appendTo(div);
					$(thisWeekTable).trigger('create');
					$(div).appendTo("#thisWeekDiv");
					}			
				});				
			}});
});

$(document).on('pagebeforecreate','#deleteMemberPage', function(){
	var id=$("#hiddenID").val();
	var pwd;
		$.ajax({url:"mUpdateMember.do",
				data:{u_id:id},
				type:'get',
				success: function(data){
					var datas=eval(data);
					$(datas).each(function(index, item){
						pwd=item['u_pwd'];
						$("#delete_id").val(item['u_id']);
					});
				}});
		$("#deletePwdBtn").click(function(){
			if($("#deletePwd").val()!=pwd)
			{
				$("#noticeWrongPwd").empty();
				$("#noticeWrongPwd").html("<br><font color='red'>비밀번호가 맞지 않습니다.</font>");
			}
			else{
				$("#myDeleteMemberForm").submit();
			}
		});
	
});

$(document).on('pagebeforecreate',"#updatepage", function(){
	var id=$("#hiddenID").val();
	
	$("#updatepage").on("pageshow", function(){
		$.ajax({url:"mUpdateMember.do",
				data:{u_id:id},
				type:"get",
				success:function(data){
					var datas=eval(data);
					$(datas).each(function(index, item){
						$("#update_id").val(item['u_id']);
						$("#update_name").val(item['u_name']);
						$("#update_addr").val(item['u_addr']);
						$("#update_email").val(item['u_email']);
						$("#update_tel").val(item['u_tel']);
					});
				}});	
	});
	
	$("#updatePwdPage").on("pageshow", function(){
		var answr;
		var pwd;
		$.ajax({url:"mUpdateMember.do",
				data:{u_id:id},
				type:"get",
				success:function(data){
					var datas=eval(data);
					$(datas).each(function(index, item){
						$("#updatePwd_ask").val(item['u_ask']);
						$("#updatePwd_id").val(item['u_id']);
						answr=item['u_answr'];
						pwd=item['u_pwd'];
						
						$("#updatePwd_pwd").val("");
						$("#updatePwd_answr").val("");
						$("#updatePwd_pwdOld").val("");
						
						
					});
				}});	
		$("#updatePwdBtn").click(function(){
			if(answr!=$("#updatePwd_answr").val())
			{
				$("#updatePwdCorrectPwd").empty();
				$("#updatePwdCorrectAnswr").html("<font color='red'>답이 맞지 않습니다.</font>");
			}else if(pwd!=$("#updatePwd_pwdOld").val())
			{
				$("#updatePwdCorrectAnswr").empty();
				$("#updatePwdCorrectPwd").html("<font color='red'>비밀번호가 맞지 않습니다.</font>");
				
			}else{
				$("#myUpdatePwdForm").submit();
				location.href="#updatepage";
			}
			
		});
	});
});

function showTemp(){
	var region=["서울", "인천", "부산", "대구","광주","대전","울산","수원","제주"];
	var regionCode=["1132599","1132496","1132447", "1132466","1132481","1132467","1132578","1132567","1132454"];
	var userRegion="서울";
	var sendTemp=0;
	$("#userReg").val(0);
	var sel=$("<select></select>");
	$(sel).on("change", function(){
		userRegion=region[$(sel).val()];
		$("#userReg").val($(sel).val());
		sendTemp=$(sel).val();
		showTemp();
	});
	for(var i=0; i<region.length; i++)
	{
		$("<option value='"+i+"'>"+region[i]+"</option>").appendTo(sel);
	}
	$(sel).appendTo("#avenJavasDiv");
	
	
$.ajax({url:"weatherData.show",			
		data: {code:regionCode[region.indexOf(userRegion)]},			
		success:function(datas){	
				
				var data=eval(datas);					
				$(data).find("item").each(function(){					
				var pubDate=$(this).find("pubDate").html(); //오늘 날짜정보
				var today=pubDate.split(" ");
				var todayYear=today[3]; // 오늘년도
				var todayMonth=today[2]; // 오늘달
				var todayDate=today[1]; // 오늘날짜
				//var presentTime=today[4]; // 현재시각
				//var todayTemp=$(this).find("condition"); // 오늘날씨정보
				var forecast=$(this).find("forecast"); // 금주 날씨정보(오늘포함)
				
				var month=["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
				var yoil=["Sun", "Mon","Tue","Wed","Thu","Fri","Sat"];
				var yoilKor=["<font color='red'>일</font>","월","화","수","목","금","<font color='blue'>토</font>"];
				
				
				var weatherTable=$("#weatherTable");
				$(weatherTable).empty();
				$(weatherTable).attr("border", "1");
				
				$(weatherTable).attr("bordercolor", "#E8E7DB");
				$(weatherTable).attr("cellspacing", "0");		
				
				var titleTr=$("<tr bgcolor='#CFFF61'></tr>");
				var tr=$("<tr></tr>");
				var statusTr=$("<tr></tr>");
			
				var titleTd=$("<td></td>").html(todayYear+"년 "+(month.indexOf(todayMonth)+1)+"월 "+todayDate+"일 ("+yoilKor[yoil.indexOf(forecast[0].getAttribute("day"))]+") "+userRegion+" 날씨");
				$(titleTd).attr("colspan", "2");					
				$(titleTd).appendTo(titleTr);
				
				var ul=$("<ul id='weatherUl'></ul>");
				
				
				var code=$(this).find("condition")[0].getAttribute("code")
					var codeImage;
					var codeStatus;
					
					switch (code) {
						case '25':case '31':case '32': case '33': case '34':case '36': codeImage='clear.JPEG'; codeStatus='맑음';break;
						case '27': case '28': case '29': case '30': codeImage='partlyCloudy.JPEG'; codeStatus='구름';break;
						case '26': case '44':codeImage='cloudy.JPEG';codeStatus='흐림';break;
						case '13': case '14': case '15': case '16':case '41':case '42':case '43': case '46':codeImage='snow.JPEG';codeStatus='눈';break;
						case '5': case '6': case '7': case '17': case '18':codeImage='sleet.JPEG';codeStatus='진눈깨비';break;
						case '1': case '2':case '4':case '3':case '8':case '9': case '10': case '35':case '37':case '38':case '39':codeImage='rain.JPEG';codeStatus='비';break;
						case '11': case '12': case '40':case '45':case '47':codeImage='rain.JPEG';codeStatus='소나기';break;
						case '19': case '20': case '21':case '22':codeImage='fog.JPEG';codeStatus='안개';break;
						case '23': case '24':codeImage='wind.JPEG';codeStatus='바람';break;	
						default: codeImage='idontknow.JPEG';break;
					}
					
					$("<td bgcolor='#FF7D65'></td>").html("<img src='resources/"+codeImage+"' width='80' height='80'>").appendTo(tr);
					var tempTd=  $("<td bgcolor='#FFF7B4'></td>")
					$(tempTd).html("현재기온 : <font size='34px'>"+$(this).find("condition")[0].getAttribute("temp")+"</font>℃<br>");						
					$(tempTd).append("최저기온 : <font color='blue'>"+forecast[0].getAttribute("low")+"</font>℃<br>");
					$(tempTd).append("최고기온 : <font color='red'>"+forecast[0].getAttribute("high")+"</font>℃");
					//$("<li></li>").html("일출시간 : "+$(data).find("astronomy")[0].getAttribute("sunrise")).appendTo(ul);						
					//$("<li></li>").html("일몰시간 : "+$(data).find("astronomy")[0].getAttribute("sunset")).appendTo(ul);
					
					$(tempTd).appendTo(tr);					
					
					$("<td bgcolor='#54BEFF'></td>").html(codeStatus).appendTo(statusTr);	
					var btnTd=$("<td bgcolor='#D9B768'></td>");
					
					var nexta=$("<a href='#thisWeekWeather' data-role='button'>이번주 날씨 보기</a>");												
					$(nexta).attr("data-transition", "flip");
					
					$(nexta).appendTo(btnTd).appendTo(statusTr);	
					
		
					$(titleTr).appendTo(weatherTable);
					$(tr).appendTo(weatherTable);
					$(statusTr).appendTo(weatherTable);
					$(weatherTable).trigger('create');
					$("#avenJavasDiv").trigger('create');
			});
		}});
};

$(function(){
	
	drawCal();
	clicked();
	searchDiv();
	addSchedule();
	showGroupList();
	//getSchedules();
	goToday();
	mshowTemp();
	var sameIdExist; // 같은 아이디 있는지 확인하는 변수

	$('#insertScheduleBtn').click(function(event){
		event.preventDefault();
		$.ajax({
			url:'insertSchedule.do',
			type:'post',
			data:$("#insertForm").serialize(),
			dataType:'json',
			success:function(data){
				var item;
				$.each(data,function(i,items){
					item = items;
				});
				if(item=='true'){
					history.go(-1);
					history.go(0);
				}
			}
		});
	});
	
	$("#loginBtn").click(function(){
		$.ajax({url:"checkLoginMember.show",
			data: $("#myLoginForm").serialize(),
			type: 'post',
				success: function(data){					
					$(eval(data)).each(function(index, item){
						var login_id=item['u_id'];
						var login_pwd=$("#login_pwd").val();
						var db_pwd=item['u_pwd'];
						
						if(db_pwd!='null'){
							if(db_pwd==login_pwd)
							{
								$("#myLoginForm").submit();
							}
							else if(db_pwd!=login_pwd)
							{
								$("#noticeId").empty();
								$("#noticePwd").html("<font color='red'>비밀번호를 확인해 주세요</font>");
							}
							
						}						
						else {
							$("#noticePwd").empty();
							$("#noticeId").html("<font color='red'>없는 회원입니다.</font>");
						}
					});
				}});
	});
	
	
	$("#checkSameId").click(function(){
		$.ajax({url:"checkSameId.show",				
				success: function(data){
					var datas=eval(data);
					sameIdExist=false;
					$(datas).each(function(index, item){
															
						if(item['u_id']==$("#insert_id").val())	
						{								
							sameIdExist=true;
						}
												
					});
					if(sameIdExist)
					{								
						$("#sameId").empty();
						$("#sameId").html("<font color='red'>ID가 중복됩니다.</font>");	
					}
					else
					{
						sameIdExist=false;
						$("#sameId").empty();
						$("#sameId").html("<font color='blue'>사용하셔도 좋은 ID입니다.</font>");
					}
				}});
	});
	

	
	
	$("#insertMember").click(function(event){ 
		$.ajax({url:"checkSameId.show",				
			success: function(data){
				var datas=eval(data);
				sameIdExist=false;
				$(datas).each(function(index, item){
														
					if(item['u_id']==$("#insert_id").val())	
					{								
						sameIdExist=true;
					}									
				});	
				
				var pwd1 = $("#insert_pwd").val();
				var pwd2 = $("#insert_pwd_confirm").val();
				if(pwd1 != pwd2)
				{
					$("#joinInfo").empty();
					$("#joinInfo").html("<font color='red'>비밀번호를 확인해 주세요</font>");
					
				}
				else if(sameIdExist==true)
				{
					$("#joinInfo").empty();
					$("#joinInfo").html("<font color='red'>ID가 중복됩니다.</font>");
				}
				else {
					join.submit();
				}
				
			}
		});
	});

	$('#insertScheduleBtn').click(function(event){
		event.preventDefault();
		$.ajax({
			url:'insertSchedule.do',
			type:'post',
			data:$("#insertForm").serialize(),
			dataType:'json',
			success:function(data){
				var item;
				$.each(data,function(i,items){
					item = items;
				});
				if(item=='true'){
					history.go(-1);
					history.go(0);
				}
			}
		});
	});

});

</script>
</head>
<body>

<div data-role="page" id="mainpage">

<div  data-role="panel" id="loginPage" data-display="overlay" data-position="right" data-theme="a">
	
	<div data-role="controlgroup" data-corners="true">
		
		<c:if test="${id==null }">
		<form action="mLoginMember.show" id="myLoginForm" method="post">
		ID : <span id="noticeId"></span> 	
		<input type="text" name="u_id" id="login_id"> <br>
		PWD : <span id="noticePwd"></span> 		
		<input type="password" name="u_pwd" id="login_pwd"> <br>
		<a href="#" id="loginBtn" data-role="button" onclick="">로그인</a>
		</form>
		<a href="#registerMember" data-role="button" data-transition="flip">회원가입</a> 		
		<a href="#searchIdPwd" data-role="button">ID/PWD 찾기</a>
		</c:if>
		<c:if test="${id!=null && id!='manager' }">
		${vo.u_name }님 반갑습니다.
		<input type="hidden" value="${id}" id="hiddenID">
		<br>
		<input type="hidden" value="${vo.u_id}" id="hiddenID">
		<a data-role="button" href="#updatepage" id="updatepageBtn">회원 정보수정</a>		
		<a data-role="button" href="#deleteMemberPage">탈퇴</a>
		<input type="button" value="로그아웃" onclick="location.href='mLogOut.do'">
		</c:if>
		<c:if test="${id!=null && id=='manager'}">
		관리자로 로그인 되었습니다.
		<br>
		<a href="#managerScreenPage" data-role="button">관리자화면</a>
		<input type="button" value="로그아웃" onclick="location.href='mLogOut.do'">
		</c:if> 		
	</div>
</div>

	<div data-role="header">
		<h3>모바일 메인화면</h3>
		<a href="#loginPage" id="loginBtn" data-role="button" class="ui-btn-right"><c:if test="${id==null}">로그인</c:if><c:if test="${id!=null}">마이페이지</c:if></a>
	</div>
	<div data-role="content">	
		<div class="ui-grid-b">
			<div class="ui-block-a"><a href="#calendarPage"><img src="resources/images/icon/il02.png"/></a><br>일정</div><!-- 일정 -->
			<div class="ui-block-b"><a href="#memoScreenPage"><img src="resources/images/icon/0006.png"/></a><br>메모</div><!-- 일정 -->
		</div>
		<c:if test="${id==null || id=='manager' }">
			<div id="avenJavasDiv" align="center"></div>
			<table id="weatherTable" align="center"></table>
		</c:if>
		<input type="hidden" id="userReg">
		<c:if test="${id!=null && id!='manager' }">
		<script type="text/javascript">
		var hiddenID=$('#hiddenID').val();
		$.getJSON('getCalendar_Today.do?u_id='+hiddenID, function(data){
			var todayIljung=$('#todayIljung');
			$(todayIljung).empty();
			$(data).each(function(index, item){
				var str="";
				for(var key in item){	
					if(key!="result")
						{
						if(key=="startD")
							{
							str+=item[key];
							str+="~";
							}
						else if(key=="endD")
						{
							str+=item[key];
							str+=" : ";
						}
						else if(key == "title")
							{
							str+=item[key];
							str+="<br>";
							}
						}
				};
				$(todayIljung).append(str);
			});
		});
		$.getJSON('getCalendar_Today_Area.do?u_id='+hiddenID, function(data){
			var jinhengIljung=$('#jinhengIljung');
			$(jinhengIljung).empty();
			$(data).each(function(index, item){
				var str="";
				for(var key in item){
					if(key!="result")
						{
						if(key=="startD")
							{
							str+=item[key];
							str+="~";
							}
						else if(key=="endD")
						{
							str+=item[key];
							str+=" : ";
						}
						else if(key == "title")
							{
							str+=item[key];
							str+="<br>";
							}
						}
				};
				$(jinhengIljung).append(str);
			});
		});
		mshowTempIn();
		</script>
		<div id="avenJavasDivIn" align="center"></div>
			<table id="weatherTable2" align="center"></table>
			<div data-role="collapsible">
				<h3>오늘의 일정</h3>
				<p id="todayIljung"></p>			
			</div>
			<div data-role="collapsible">
				<h3>진행중인 일정</h3>
				<p id="jinhengIljung"></p>
			</div>
			<a href="#calendarPage" data-role="button">일정관리</a>
		</c:if>
		
			
	</div>	
</div>

	<div data-role="page" data-theme="a" id="memoScreenPage">
		<div data-role="header">
			<h1>메모</h1>
			<a href="#insertmemo" data-icon="plus" class="ui-btn-right">새 메모</a>
		</div>
		
		<div data-role="content">
			<ul data-role="listview" id="memoview">
			</ul>
		</div>
	</div>
	
	<div data-role="page" id="insertmemo">
		<div data-role="header">
			<h2>메모 등록</h2>
			<a href="#memo" class="ui-btn-left">이전</a>
		</div>
		<div data-role="content">
			<form action="insertMemo.do" method="post" enctype="multipart/form-data">
				<label for="m_title">제목</label>
				<input type="text" name="m_title">
				<label for="m_content">내용</label>
				<textarea name="m_content"></textarea>
				<input type="file" name="uploadFile">
				<input type="submit" value="등록">
			</form>
		</div>
	</div>

<div data-role="page" id="calendarPage" data-add-back-btn="true" data-back-btn-text="뒤로">
	<div data-role="header">
		<h3>일정관리</h3>
	</div>
	<div data-role="content">
		<div>
			<div id="all"></div>
		</div>
	</div>
	<br>
	<div>
		<table id="schdle">
		</table>
	</div>
</div>


<div data-role="page" id="searchSchedulePage" data-add-back-btn="true" data-back-btn-text="뒤로가기">
	<div data-role="header" >
		<h3>일정검색</h3>
	</div>
	<div data-role="content" class="center-wrapper" id="searchScheduleContent">
		<h2>일정검색</h2>
		<hr>
		<form id="frmSearchWord">
		<input type="hidden" id="u_id" name="u_id">
		<input type="hidden" id="curPage" name="curPage" value="1">
		<table border="1" width="100%" id="tblSearchWord" style="border-collapse:collapse;background-color:#f4f9fb;">
			<tr>
				<td>검색어</td>
				<td><input type="text" id="searchWord" name="searchWord" size="30">
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td>
				<table>
						<tr>
							<td>
								<input type="date" id="searchSDate" name="searchSDate">
							</td>
							<td>
								<input type="number" id="searchSHour" name="searchSHour" size="3" min="0" max="23">
							</td>
							<td>
							시
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td>
					<table>
						<tr>
							<td>
								<input type="date" id="searchEDate" name="searchEDate">
							</td>
							<td>
								<input type="number" id="searchEHour" name="searchEHour" size="3" min="0" max="23">
							</td>
							<td>
							시
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table style="width: 100%">
			<tr>
				<td>
					<input type="submit" id="btnSubmit" value="검색">
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


	</div>
</div>

<div data-role="page" id="addSchedulePage" data-add-back-btn="true" data-back-btn-text="뒤로가기">
	<div data-role="header" >
		<h3>일정추가</h3>
	</div>
	<div data-role="content" class="center-wrapper" id="addScheduleContent">
	<h2>일정등록</h2>
	
		<hr>
		<!-- 
		<form action="insertSchedule.do" method="post" enctype="multipart/form-data" id="insertForm" style="border-collapse:collapse;background-color:#f4f9fb;">
		 -->
		<form id="insertForm" action="insertSchedule.do" method="post" enctype="multipart/form-data" style="border-collapse:collapse;background-color:#f4f9fb;">
		<input type="hidden" name="u_id" value="user1">
		<table border="1" width="100%" id="tblSearchWord" style="border-collapse:collapse;background-color:#f4f9fb;">
			<tr style="vertical-align: center;"> 
				<td width="50px">그룹</td>
				<td>
					<div id="gidlist"></div>
				</td>
			</tr>
			<tr style="vertical-align: center;"> 
				<td>시작</td>
				<td>
					<table>
						<tr>
							<td><input type="date" id="sDate" name="sDate" style="font-size: 20px"></td>
							<td><input type="number" id="sHour" name="sHour" size="3" min="0" max="23" style="font-size: 20px;"></td>
							<td>시</td>
						</tr>
					</table>
				</td>
			</tr>
		     <tr style="vertical-align: center;">
			    <td>종료</td>
				<td>
					<table>
						<tr>
							<td><input type="date" id="eDate" name="eDate" style="font-size: 20px"></td>
							<td><input type="number" id="eHour" name="eHour" size="3" min="0" max="23" style="font-size: 20px;"></td>
							<td>시</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="vertical-align: center;">
				<td>파일</td>
				<td>
				     <input type="file" name="uploadFile" size="40" style="font-size: 14px"><br>
				</td>
			</tr>
		    <tr style="vertical-align: center;">
				<td>제목</td>
				<td>
					<input name="title" type="text" size="50" style="font-size: 20px; width: 99%"><br>
				</td>
			</tr>
			<tr style="vertical-align: center;">	
				<td>내용</td>
				<td>
					<textarea rows="10" cols="48" name="content" style="font-size: 20px; width: 99%"></textarea>
				</td>			
		    </tr>        
		        <tr>
				<td>장소</td>
				<td>
					<input name="place" type="text" size="50" style="font-size: 20px; width: 99%"><br>
				</td>
			</tr>
		</table>
		<table style="width: 100%">
			<tr style="vertical-align: center;">
				<!-- 
				<td width="50%"><input type="submit" id="insertScheduleBtn" value="일정등록" style="font-size: 20px;" ></td>
				 -->
				<td width="50%"><input type="submit" value="일정등록" id="insertScheduleBtn" style="font-size: 20px;" ></td>
				<td width="50%"><input type="reset" value="취소" style="font-size: 20px;"></td>
			</tr>
		</table>
		</form>	

	</div>
</div>

<div data-role="page" id="registerMember" data-add-back-btn="true" data-back-btn-text="뒤로가기">
	<div data-role="header" >
		<h3>회원가입</h3>
	</div>
	<div data-role="content" class="center-wrapper" id="insertContent">
		<form name="join" id="myForm" action="mInsertMember.show" method="post">
			
				ID : <span id="sameId"></span> 	
				<table>
					<tr>
						<td width="130%"><input type="text" name="u_id" id="insert_id" required="required"/></td>
						<td><a href="#" id="checkSameId" data-role="button">중복검사</a></td>
					</tr>
				</table>				
				PWD :<input type="password" name="u_pwd" id="insert_pwd" />
			PWD 확인: <input type="password" name="u_pwd_confirm" id="insert_pwd_confirm"/>
				이름 : <input type="text" name="u_name" required="required"/>
			이메일 : <input type="email" name="u_email"/>
			전화번호 : <input type="text" name="u_tel"/>
		주소 : <input type="text" name="u_addr"/>
				
				비밀번호 찾기 질문 :
				<select name="u_ask">
					<option value="태어난 곳은?">태어난 곳은?</option>
					<option value="어머님 성함은?">어머님 성함은?</option>
					<option value="좋아하는 노래는?">좋아하는 노래는?</option>
					<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
					<option value="가고 싶은 곳은?">가고 싶은 곳은?</option>
				</select>
				비밀번호 찾기 답 : <input type="text" name="u_answr"/>
				
				<div class="ui-grid-a">
				<div class="ui-block-a"><input type="button" value="가입" id="insertMember"></div>
				<div class="ui-block-b"><input type="reset" value="취소"></div> 
				</div>			
				<span id="joinInfo"></span>	
				
					
				
			
			</form>
	</div>
</div>
<div data-role="page" data-add-back-btn="true" data-back-btn-text="뒤로가기" id="updatepage">
	
	<div data-role="header"><h2>회원정보수정</h2> </div>
	
	
	
	<div data-role="content">
		
	<form action="mUpdateMember.do" id="myUpdateForm" method="post">
	아이디<input type="text" readonly="readonly"  name="u_id" id="update_id"><br>
	이름<input type="text"  name="u_name" id="update_name"><br>
	주소<input type="text" name="u_addr" id="update_addr"><br>
	이메일<input type="text" name="u_email" id="update_email"><br>
	전화번호<input type="text" name="u_tel" id="update_tel"><br>
	<input type="submit" value="수정" id="updateMemberBtn">
	<input type="reset" value="취소" id="closebtn">	
	</form>
	<a data-role="button" href="#updatePwdPage">비밀번호변경</a>
		</div>	
	</div>
	
	
	<div data-role="page" id="updatePwdPage" data-add-back-btn="true" data-back-btn-text="뒤로가기">
	<div data-role="header">
	<h2>회원 비밀번호 변경</h2>
	</div>
	<div data-role="content">
	<form  id="myUpdatePwdForm" action="updatePwd.do" method="post">
	<input type="hidden" name="u_id" id="updatePwd_id">
	질문<input type="text"  name="u_ask" id="updatePwd_ask"><br>
	답<span id="updatePwdCorrectAnswr"></span><input type="text" id="updatePwd_answr"><br>
	현재비번<span id="updatePwdCorrectPwd"></span><input type="password" id="updatePwd_pwdOld"> <br>
	변경비번<input type="password" name="u_pwd" id="updatePwd_pwd"> <br>
	<input type="button" value="변경" id="updatePwdBtn">
	<input type="button" value="취소" id="closebtn">
	</form>
	</div>
	</div>

	<div data-role="page" data-add-back-btn="true" data-back-btn-text="탈퇴안함!" id="deleteMemberPage">
		<div data-role="header">
			<h2>회원 탈퇴하기</h2>
		</div>
		<div data-role="content">
			<form action="mMemberDelete.do" method="post" id="myDeleteMemberForm">
			탈퇴하시려면 비밀번호를 입력해주세요 <span id="noticeWrongPwd"></span>
			<input type="text" name="u_pwd" id="deletePwd">
			<input type="hidden" name="u_id" id="delete_id">
			<a href="#" data-role="button" id="deletePwdBtn">탈퇴하기</a>
			</form>
			
		</div>
	</div>
	
	<div data-role="page" data-add-back-btn="true"  data-back-btn-text="뒤로가기" id="thisWeekWeather">
		<div data-role="header">
			<h2>이번주 날씨</h2>
		</div>
		<div data-role="content">
			<div id="thisWeekDiv" ></div>
			<input type="hidden" value="${sendTemp }" id="userReg">
			
		</div>
	</div>
	
	<div data-role="page" data-add-back-btn="true"  data-back-btn-text="뒤로가기" id="searchIdPwd">
		<div data-role="header">
			<h2>ID/비밀번호 찾기</h2>
		</div>
		<div data-role="content">
			<div id="searchIdPwdDiv" align="center"></div>
			<span id="searchIdPwdSpan"></span>		
			
		</div>
	</div>
	
		<div data-role="page" data-add-back-btn="true"  data-back-btn-text="뒤로가기" id="managerScreenPage">
		<div data-role="header">
			<h2>관리자화면</h2>
		</div>
		<div data-role="content">
		<table>
			<tr>
				<td width="130%"><input type="text" id="managerSearch"></td>
				<td><input type="button" id="managerSearchBtn" value="검색"></td>
				<td><input type="button" id="managerShowAllBtn" value="모두보기"></td>
			</tr>
		</table>
			<br>
			<div data-role="fieldcontain">
				<fieldset data-role="controlgroup" data-type="horizontal">					
					<input type="radio" name="radioBtn" value="u_id" id="mRadio1">
					<label for="mRadio1">아이디</label>
					<input type="radio" name="radioBtn" value="u_name" id="mRadio2">
					<label for="mRadio2">이름</label>
					<input type="radio" name="radioBtn" value="u_all" id="mRadio3" checked="checked">
					<label for="mRadio3">모두</label>
				</fieldset>
			</div>		
			<hr>
			<ul data-role="listview" id="managerScreenList"></ul>
			
		</div>
	</div>	
	


</body>
</html>