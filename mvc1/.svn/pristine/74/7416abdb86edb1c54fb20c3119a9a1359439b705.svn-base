function mshowTemp(){
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