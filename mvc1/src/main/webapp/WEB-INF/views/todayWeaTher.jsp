<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table{ text-align: center; font-size: 20px;}
	li{list-style: none;}
</style>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var region=["����", "��õ", "�λ�", "�뱸","����","����","���","����","����"];
	var regionCode=["1132599","1132496","1132447", "1132466","1132481","1132467","1132578","1132567","1132454"];
	
	var userRegion="����";
	$("#userReg").val(0);
	var sendTemp=0;
	showTemp();
	
	
	
		var sel=$("<select></select>");
		
		
		for(var i=0; i<region.length; i++)
		{
			$("<option value='"+i+"'>"+region[i]+"</option>").appendTo(sel);
		}
		$(sel).appendTo("#avenJavasDiv");
		
		var selInputBtn=$("<input>");
		$(selInputBtn).attr("type", "button");
		$(selInputBtn).attr("value", "����");
		$(selInputBtn).on("click", function(){
			userRegion=region[$(sel).val()];
			$("#userReg").val($(sel).val());
			sendTemp=$(sel).val();
			showTemp();
		});
		$(selInputBtn).appendTo("#avenJavasDiv");
	
	
	
	
	function showTemp(){	
	$.ajax({url:"weatherData.show",			
			data: {code:regionCode[region.indexOf(userRegion)]},			
			success:function(datas){	
					
					var data=eval(datas);					
					$(data).find("item").each(function(){					
					var pubDate=$(this).find("pubDate").html(); //���� ��¥����
					var today=pubDate.split(" ");
					var todayYear=today[3]; // ���ó⵵
					var todayMonth=today[2]; // ���ô�
					var todayDate=today[1]; // ���ó�¥
					//var presentTime=today[4]; // ����ð�
					//var todayTemp=$(this).find("condition"); // ���ó�������
					var forecast=$(this).find("forecast"); // ���� ��������(��������)
					
					var month=["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
					var yoil=["Sun", "Mon","Tue","Wed","Thu","Fri","Sat"];
					var yoilKor=["<font color='red'>��</font>","��","ȭ","��","��","��","<font color='blue'>��</font>"];
					
					
					var weatherTable=$("#weatherTable");
					$(weatherTable).empty();
					$(weatherTable).attr("border", "1");
					$(weatherTable).attr("width", "30%");
					$(weatherTable).attr("bordercolor", "#E8E7DB");
					$(weatherTable).attr("cellspacing", "0");		
					
					var titleTr=$("<tr bgcolor='#CFFF61'></tr>");
					var tr=$("<tr></tr>");
					var statusTr=$("<tr></tr>");
				
					var titleTd=$("<td></td>").html(todayYear+"�� "+(month.indexOf(todayMonth)+1)+"�� "+todayDate+"�� ("+yoilKor[yoil.indexOf(forecast[0].getAttribute("day"))]+") "+userRegion+" ����");
					$(titleTd).attr("colspan", "2");					
					$(titleTd).appendTo(titleTr);
					
					var ul=$("<ul></ul>");
					
					
					var code=$(this).find("condition")[0].getAttribute("code")
						var codeImage;
						var codeStatus;
						
						switch (code) {
							case '25':case '31':case '32': case '33': case '34':case '36': codeImage='clear.JPEG'; codeStatus='����';break;
							case '27': case '28': case '29': case '30': codeImage='partlyCloudy.JPEG'; codeStatus='����';break;
							case '26': case '44':codeImage='cloudy.JPEG';codeStatus='�帲';break;
							case '13': case '14': case '15': case '16':case '41':case '42':case '43': case '46':codeImage='snow.JPEG';codeStatus='��';break;
							case '5': case '6': case '7': case '17': case '18':codeImage='sleet.JPEG';codeStatus='��������';break;
							case '1': case '2':case '4':case '3':case '8':case '9': case '10': case '35':case '37':case '38':case '39':codeImage='rain.JPEG';codeStatus='��';break;
							case '11': case '12': case '40':case '45':case '47':codeImage='rain.JPEG';codeStatus='�ҳ���';break;
							case '19': case '20': case '21':case '22':codeImage='fog.JPEG';codeStatus='�Ȱ�';break;
							case '23': case '24':codeImage='wind.JPEG';codeStatus='�ٶ�';break;	
							default: codeImage='idontknow.JPEG';break;
						}
						
						$("<td bgcolor='#FF7D65'></td>").html("<img src='resources/"+codeImage+"' width='130' height='130'>").appendTo(tr);
						
						$("<li></li>").html("������ : <font size='34px'>"+$(this).find("condition")[0].getAttribute("temp")+"</font>��").appendTo(ul);						
						$("<li></li>").html("������� : <font color='blue'>"+forecast[0].getAttribute("low")+"</font>��").appendTo(ul);
						$("<li></li>").html("�ְ��� : <font color='red'>"+forecast[0].getAttribute("high")+"</font>��").appendTo(ul);
						$("<li></li>").html("����ð� : "+$(data).find("astronomy")[0].getAttribute("sunrise")).appendTo(ul);						
						$("<li></li>").html("�ϸ��ð� : "+$(data).find("astronomy")[0].getAttribute("sunset")).appendTo(ul);
						
						$("<td bgcolor='#FFF7B4'></td>").append(ul).appendTo(tr);					
						
						$("<td bgcolor='#54BEFF'></td>").html(codeStatus).appendTo(statusTr);	
						var btnTd=$("<td bgcolor='#D9B768'></td>");
						
						var nextInput=$("<input></input>");
						$(nextInput).attr("type", "button");
						$(nextInput).css({width:"75%", height: "110%"});						
						$(nextInput).attr("type", "button");
						$(nextInput).attr("value", "�̹��� ���� ����");
						$(nextInput).on("click", function(){
							window.open("weaTher.show?sendTemp="+sendTemp,"","width=800, height=500");
						});
						
						var closeInput=$("<input></input>");
						$(closeInput).attr("type", "button");
						$(closeInput).css({width:"25%", height: "110%"});			
						$(closeInput).attr("value", "�ݱ�");
						$(closeInput).on("click", function(){
							self.close();
						});
						
						$(nextInput).appendTo(btnTd).appendTo(statusTr);	
						$(closeInput).appendTo(btnTd).appendTo(statusTr);	
						
						
						
						$(titleTr).appendTo(weatherTable);
						$(tr).appendTo(weatherTable);
						$(statusTr).appendTo(weatherTable);
				});
			}});
	};

});

</script>
</head>
<body>
<div id="avenJavasDiv" align="center"></div>
<table id="weatherTable" align="center"></table>
<input type="hidden" id="userReg">


</body>
</html>