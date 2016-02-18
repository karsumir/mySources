<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function(){
		setGid();
		setDate1();
		$('#myform').submit(function(event){					
			event.preventDefault();
				if($('#sYear').val().length==0||
						$('#sMon').val().length==0 ||
						$('#sDay').val().length==0 ||
					    $('#sHour').val().length==0 ||
						$('#eYear').val().length==0 ||
						$('#eMon').val().length==0 ||
						$('#eDay').val().length==0 ||
						$('#eHour').val().length==0 ){
							alert('날짜입력확인.');
				}				
		})
})
function setDate1(){
		var curDate = new Date();
		$('#sYear').val(curDate.getFullYear());
		$('#sMon').val(curDate.getMonth() + 1);
		$('#sDay').val(curDate.getDate());
		$('#sHour').val(curDate.getHours());
		$('#eYear').val(curDate.getFullYear());
		$('#eMon').val(curDate.getMonth()+1);
		$('#eDay').val(curDate.getDate());
		$('#eHour').val(curDate.getHours());
	}

function setGid(){
	$.ajax({
		type: 'POST',
		url: 'selectGid.do',
		dataType: 'json',
		success: function(data){
			//alert(data);
			$('#gidlist').empty();
			var gidSelect = $('<select name="g_id"></select>');
			$(data).each(function(index, item){
				var gidOption = $('<option value='+ item.g_id +'>'+item.g_name+'</option>')
				$(gidSelect).append(gidOption);
			});
			$('#gidlist').append(gidSelect);
		}
	});
}


</script>
</head>
<body>
<form action="insertSchedule.do" method="post" enctype="multipart/form-data">
<h2>일정등록</h2>
일&nbsp&nbsp정&nbsp&nbsp번&nbsp&nbsp호 ${max }
<input type="hidden" name="s_num" value="${max }">
<input name="u_id" type="hidden" value="choa">
<table border="1" width="700">
	<tr> 
		<td>그룹</td>
		<td><div id="gidlist"></div>
		</td>
	<tr> 
		<td>시&nbsp&nbsp작&nbsp&nbsp시&nbsp&nbsp간</td>
		<td>
			<input type="number" id="sYear" name="sYear" size="5" min="0" max="9999" >년
			<input type="number" id="sMon" name="sMon" size="3" min="0" max="12" >월
			<input type="number" id="sDay" name="sDay" size="3" min="0" max="31" >일
			<input type="number" id="sHour" name="sHour" size="3" min="0" max="23" >시
		</td>
	</tr>
     <tr>
	    <td>종&nbsp&nbsp료&nbsp&nbsp시&nbsp&nbsp간</td>
		<td>
			<input type="number" id="eYear" name="eYear" size="5" min="0" max="9999">년
			<input type="number" id="eMon" name="eMon" size="3" min="0" max="12">월
			<input type="number" id="eDay" name="eDay" size="3" min="0" max="31">일
			<input type="number" id="eHour" name="eHour" size="3" min="0" max="23">시
		</td>
	</tr>
	<tr>
		<td>첨&nbsp&nbsp부&nbsp&nbsp파&nbsp&nbsp일</td>
		<td>
		     <input type="file" name="uploadFile"><br>
		</td>
	</tr>
     <tr>
		<td>&nbsp&nbsp&nbsp&nbsp제&nbsp&nbsp&nbsp&nbsp목</td>
		<td>
			<input name="title" type="text"><br>
		</td>
	</tr>
	<tr>	
		<td>&nbsp&nbsp&nbsp&nbsp내&nbsp&nbsp&nbsp&nbsp용</td>
		<td>
			<textarea rows="10" cols="90" name="content"></textarea>
		</td>			
    </tr>        
        <tr>
		<td>&nbsp&nbsp&nbsp&nbsp장&nbsp&nbsp&nbsp&nbsp소</td>
		<td>
			<input name="place" type="text"><br>
		</td>
		</tr>
</table>
<input type="submit" value="일정등록">
<input type="reset" value="취소">
</form>
</body>
</html>