<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		
	//showMemberList();
	
	function showMemberList(){
		$.ajax({url:"showMemberList.do",			
			success: function(data){
				var tb=("#tb");
				$(tb).empty();
				$(tb).html("<tr><td>이름</td><td>아이디</td><td>삭제</td></tr>");					
				$(eval(data)).each(function(index,item){
					var tr=$("<tr></tr>");							
					for(var key in item)
					{
						$("<td></td>").html(item[key]).appendTo(tr);
					}
					
					var btn=$("<input></input>");
					$(btn).attr("type", "button");
					$(btn).attr("value", "삭제");
					$(btn).attr("id", item['u_id']);					
					$(btn).on("click", function(){
						$.ajax({url: "deleteMember.do",
								data: {u_id:item['u_id']},
								success: function(){
									showMemberList();
									
								}
						});
					});
					
					var td=$("<td></td>");
					$(td).html(btn).appendTo(tr);
					$(tr).appendTo(tb);
				});
				
			}});
	}
	function showSearchedMemberList(){
		$.ajax({url:"searchMember.do",
			data:{searchField:searchField, searchSel:searchSel},
			success: function(data){
				var tb=("#tb");
				$(tb).empty();
				$(tb).html("<tr><td>이름</td><td>아이디</td><td>삭제</td></tr>");					
				$(eval(data)).each(function(index,item){
					var tr=$("<tr></tr>");							
					for(var key in item)
					{
						$("<td></td>").html(item[key]).appendTo(tr);
					}
					var btn=$("<input></input>");
					$(btn).attr("type", "button");
					$(btn).attr("value", "삭제");
					$(btn).attr("id", item['u_id']);					
					$(btn).on("click", function(){
						$.ajax({url: "deleteMember.do",
								data: {u_id:item['u_id']},
								success: function(){
									showSearchedMemberList();
									
								}
						});
					});
					
					var td=$("<td></td>");
					$(td).html(btn).appendTo(tr);
					$(tr).appendTo(tb);
				});
			}
	});
	}
	
	$("#showAllBtn").on("click", function(){
		showMemberList();
	});
	
	$("#closeBtn").on("click", function(){
		self.close();
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
		}
			
		showSearchedMemberList();
		
	});
});
</script>
</head>
<body>
<h2>관리자화면</h2>
검색 <input type="text" id="search">
<input type="button" id="searchBtn" value="검색">
<input type="button" id="showAllBtn" value="모두보기">
<br>
<input type="radio" name="radioBtn" value="u_id">아이디
<input type="radio" name="radioBtn" value="u_name">이름
<input type="radio" name="radioBtn" value="u_all">모두

<table border="1" width="30%" id="tb">

</table>

<input type="button" id="closeBtn" value="닫기">


</body>
</html>