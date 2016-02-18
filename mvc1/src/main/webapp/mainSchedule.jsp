<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src='http://code.jquery.com/jquery-1.10.2.js'></script>
<script type='text/javascript' src='resources/js/jquery.bpopup-0.9.4.min.js'></script>
<script type="text/javascript" src='resources/js/jquery.easing.min.js'></script>
<script>
$(function() {
	$('#btnPopup').click(function(e){
		$('#divList').empty(); //이전 검색 결과 초기화
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
});
</script>
</head>
<body>
	<h2>메인화면</h2>
	<hr>
	<input type="button" id="btnPopup" value="팝업호출"><br>
	메인페이지에서 팝업 하는 테스트입니다.<br>
	<div id='pop_up_banner' style='display:none; width:500px'>
		<span class='button b-close' style='border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px; background-color:#2b91af; color:#fff; cursor: pointer; display: inline-block; text-align: center;'>
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
					<divid="divList">
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
  <div> <span class="button b-close"><span>X</span></span>   </div>
 </div>
</body>
</html>