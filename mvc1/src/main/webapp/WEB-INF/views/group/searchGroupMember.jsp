<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	tr{text-align:center;}
</style>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var searchField;
	var searchSel;
	var g_id = "${g_id}";
	
	function showSearchedMemberList(){
		$.ajax({url:"searchListMember.do",
			data:{searchField:searchField, searchSel:searchSel, g_id:g_id},
			dataType:"JSON",
			success: function(data){
				var tb=$("#tb");
				$(tb).empty();
				$(tb).html("<tr><td>선택</td><td>이름</td><td>아이디</td><td>전화</td><td>e-mail</td></tr>");
				
				$(data).each(function(index, item){
					var tr=$("<tr></tr>");
					
					var chkbox = $("<input class='u_idList' type='checkbox'>");
					$(chkbox).attr("id", item['u_id']);
					var td=$("<td></td>");
					$(td).html(chkbox).appendTo(tr);
					
					for(var key in item)
					{
						$("<td></td>").html(item[key]).appendTo(tr);
					}
					$(tr).appendTo(tb);
				});
			}
		});
	}
	
	$("#saveBtn").on("click", function(event){
		event.preventDefault();
		
		var u_idListParm = '';
		var u_idList = $('.u_idList');
		$(u_idList).each(function(index, item){
			if(item.checked) {
                u_idListParm += $(item).attr('id') + ' ';
			}
		});
		
		$.ajax({
			type     : 'POST',
			url      : "saveGroupMember.do",
			data     : {g_id:g_id, u_idList:u_idListParm},
			dataType : "JSON",
			success  : function(data){
				$("#tb").empty();
				//self.close();
			},
			error: function(){
				alert('멤버 등록에 실패하였습니다.\n다시 멤버 등록하여 주십시오.');
			}
		});
	});
	
	
	$("#searchBtn").on("click", function(){
		var rbtn=$("input[type=radio]");
		searchField=$("#search").val();
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
			return false;
		}
			
		showSearchedMemberList();
		
	});
});
</script>
</head>
<body>
	<h2>그룹멤버찾기</h2>
	검색어 <input type="text" id="search" value="1">
	<input type="button" id="searchBtn" value="검색">
	<br>
	<input type="radio" name="radioBtn" value="u_id" checked="checked">아이디
	<input type="radio" name="radioBtn" value="u_name">이름
	<input type="radio" name="radioBtn" value="u_all">모두
	
	<form id="frm">
	<table border="1" width="30%" id="tb">
	</table><br>
	<input type="button" id="saveBtn" value="멤버등록">
	</form>

</body>
</html>