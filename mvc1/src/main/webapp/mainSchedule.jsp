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
		$('#divList').empty(); //���� �˻� ��� �ʱ�ȭ
		$('#pop_up_banner').bPopup({
			easing: 'easeOutBack', //uses jQuery easing plugin
			speed: 250,
			transition: 'slideDown',
			modalClose: false
		});	
	});
	
	// ��ũ�� �̺�Ʈ �߻� ��
    $('#pop_up_banner').scroll(function () {
        // �ʿ��� ������ ���մϴ�.
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();

        // ��ũ���� ���̿� ������ ���̰� ���� ��
        if (scrollHeight == documentHeight) {
            for (var i = 0; i < 10; i++) {
                $('<h1>Infinity Scroll</h1>').appendTo('body');
            }
        }
    });
	
	//�˻��Ⱓ ����
	setDate();
	
	$('#divSearchList').hide();
	
	$('#frmSearchWord').submit(function(event){
		event.preventDefault(); //�⺻�̺�Ʈ�� ����.
		
		setSearchDiv(); // �˻� ��� ��� 
		
		setSearchPageDiv(); // �˻� �� ������ ���
	});
	
	// �˻� ��� ��� 
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
	
	// �˻� �� ������ ���
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
					event.preventDefault(); // <a> tag�� �⺻ �̺�Ʈ ����
					
					var qStr = $(this).attr('href');
					setSearchDiv(qStr); // �˻� ��� ���
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
	<h2>����ȭ��</h2>
	<hr>
	<input type="button" id="btnPopup" value="�˾�ȣ��"><br>
	�������������� �˾� �ϴ� �׽�Ʈ�Դϴ�.<br>
	<div id='pop_up_banner' style='display:none; width:500px'>
		<span class='button b-close' style='border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px; background-color:#2b91af; color:#fff; cursor: pointer; display: inline-block; text-align: center;'>
			<span>X</span> <!-- �ݱ� ��ư (��Ÿ���� �˾Ƽ� ����) -->
		</span> 
		<div class='content'>
		<table border="1" width="500" height="200" bgcolor="white">
			<tr>
				<td>
					<h2>�����˻�</h2>
					<hr>
					<form id="frmSearchWord">
					<input type="hidden" id="u_id" name="u_id">
					<input type="hidden" id="curPage" name="curPage" value="1">
					<table border="1" width="500" id="tblSearchWord">
						<tr>
							<td>�˻���</td>
							<td><input type="text" id="searchWord" name="searchWord" size="30">
								<input type="submit" id="btnSubmit" value="�˻�"> 
							</td>
						</tr>
						<tr>
							<td>���۽ð�</td>
							<td>
								<input type="date" id="searchSDate" name="searchSDate">
								<input type="number" id="searchSHour" name="searchSHour" size="3" min="0" max="23">��
							</td>
						</tr>
						<tr>
							<td>����ð�</td>
							<td>
								<input type="date" id="searchEDate" name="searchEDate">
								<input type="number" id="searchEHour" name="searchEHour" size="3" min="0" max="23">��
							</td>
						</tr>
					</table>
					</form>
					<divid="divList">
						<div id="divSearchList" style="border: 1px;padding-top: 20px;">
							<!-- ���� ��� ��� -->	
						</div>
						<div id="divSearchListPage" style="border: 1px;padding-top: 20px;text-align: center;">
							<!-- ���� ��� ����¡ -->	
						</div>
					</div>
				</td>
			</tr>
		</table>
		</div> <!-- �������� �� ���� ���� (�̹���, html ��.. ���������� �������� �θ��� �ִ�. -->
	</div>
	<div id="appList" class="bMulti">
  <div> <span class="button b-close"><span>X</span></span>   </div>
 </div>
</body>
</html>