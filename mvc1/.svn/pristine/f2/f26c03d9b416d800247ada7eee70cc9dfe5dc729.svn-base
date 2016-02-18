<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart']}]}"></script>
<script type="text/javascript">
$(document).ready(function () {
	var aaa=document.getElementById('tempId').value;
	
    google.setOnLoadCallback(drawChart);
    function drawChart() {
		$.ajax({
		url:"favorites_Post.do",
		data:{u_id:aaa},
		success:function(da){
			var temp=[];
			var data = google.visualization.arrayToDataTable(eval(da));
			var options = {title: '사용량 그래프',is3D: true,pieSliceText: 'label'};
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(data, options);
    		}
    	})
    }
})
</script>
</head>
<body>
<input type="hidden" id="tempId" value="${req_id}">
<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>