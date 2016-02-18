<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		setDate(); //검색기간 설정
		
		$('#divSearchList').hide();
		
		$('#frmSearchWord').submit(function(event){
			event.preventDefault(); //기본이벤트를 제거.
			
			setSearchDiv(); // 검색 목록 출력 
			
			setSearchPageDiv(); // 검색 후 페이지 출력
		});
	});
	
	// 검색 목록 출력 
	function setSearchDiv(qStr){
		var urlParm  = 'searchSchedule.do';
		var dataParm =  $('#frmSearchWord').serialize();
		if(qStr!=null){
			urlParm  = qStr;
			dataParm = null; 
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
	function setSearchPageDiv(qStr){
		var urlParm  = 'searchSchedulePage.do';
		var dataParm =  $('#frmSearchWord').serialize();
		if(qStr!=null){
			urlParm  = qStr.replace('searchSchedule.do', urlParm);
			dataParm = null; 
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
					
					var qStr = $(this).attr('href');
					setSearchDiv(qStr); // 검색 목록 출력
					setSearchPageDiv(qStr);
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
</script>
</head>
<body>
	<h2>일정검색</h2>
	<hr>
	<form id="frmSearchWord">
	<input type="hidden" name="u_id">
	<input type="hidden" name="curPage" value=1>
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
	<div id="divSearchList"     style="border: 1px;padding-top: 20px;"></div>
	<div id="divSearchListPage" style="border: 1px;padding-top: 20px;"></div>
</body>
</html>
