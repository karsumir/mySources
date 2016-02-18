<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table{ text-align: center; font-size: 20px;}
	
</style>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
	
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
					
					
					var thisWeekTable=$("#thisWeekTable");
					$(thisWeekTable).attr("border", "1");
					$(thisWeekTable).attr("bordercolor", "#E8E7DB");
					$(thisWeekTable).attr("cellspacing", "0");		
					
					var titleTr=$("<tr bgcolor='#FF7D65'></tr>");
					var imgTr=$("<tr></tr>");
					var statusTr=$("<tr bgcolor='#54BEFF'></tr>");
					var TempTr=$("<tr bgcolor='#CFFF61'></tr>");					
					var DateTr=$("<tr bgcolor='#FFF7B4'></tr>");	
					
					var titleTd=$("<td></td>").html("이번주 "+userRegion+" 날씨");
					$(titleTd).attr("colspan", "5");					
					$(titleTd).appendTo(titleTr);
					
					
					
					for(var i=0; i<forecast.length;i++)	{
						
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
						$("<td></td>").html("<img src='resources/"+codeImage+"' width='115' height='115'>").appendTo(imgTr);
						$("<td></td>").html(codeStatus).appendTo(statusTr);
						$("<td></td>").html("<font color='blue'>"+forecast[i].getAttribute("low")+"</font>℃/<font color='red'>"+forecast[i].getAttribute("high")+"</font>℃").appendTo(TempTr);
						$("<td></td>").html(nextDate+"("+yoilKor[yoil.indexOf(forecast[i].getAttribute("day"))]+")").appendTo(DateTr);
						
					}
					$(titleTr).appendTo(thisWeekTable);
					$(imgTr).appendTo(thisWeekTable);
					$(statusTr).appendTo(thisWeekTable);
					$(TempTr).appendTo(thisWeekTable);
					$(DateTr).appendTo(thisWeekTable);
						
					
				});
			}});

	$("#closeBtn").on("click",function(){
		window.close();
	});
	
});

</script>
</head>
<body>

<table id="thisWeekTable"></table>

<input type="button" value="일정에 추가" id="btn">
<input type="button" value="닫기" id="closeBtn">
<input type="hidden" value="${sendTemp }" id="userReg">

</body>
</html>