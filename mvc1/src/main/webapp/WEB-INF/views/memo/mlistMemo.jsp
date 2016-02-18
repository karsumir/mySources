<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-2.2.0.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.js"></script>
<script>
	$(function(){
		var arr;
		$.getJSON("memoList.do",function(data){
			arr = data;
			$.each(data,function(index,item){
				var li = $("<li></li>");
				var a = $("<a href='#detailmemo'></a>");
				var p1 = $("<p></p>");
				var p2 = $("<p></p>");
				var strong = $("<strong></strong>");
				
				strong.html(item["m_title"]);
				p1.append(strong);
				if(item["m_content"].length > 20)
					p2.html(item["m_content"].substr(0,20));
				else
					p2.html(item["m_content"]);
					
				$(a).click(function(){
					$("#memotitle").attr("value",item["m_title"]);				
					$("#memocontent").html(item["m_content"]);
					if(item["m_fname"] != "" && item["m_fname"] != null){						
						$("#memofile").attr("href","resources/upload/"+item["m_fname"]);
						$("#memofile").html(item["m_fname"]);
					}
					
					$("#memodelete").on("click", function(){
						if(confirm("삭제 하시겠습니까?"))
							location.href="deleteMemo.do?m_num="+item["m_num"];
					});
					
				});
				
				a.append(p1);
				a.append(p2);
				li.append(a);
				$("#memoview").append(li);
				$("#memoview").listview("refresh");
			});
			
		});
	
		$('#insertMemoBtn').click(function(event){
			event.preventDefault();
			var formData = new FormData($("#insertMemoForm"));
			$.ajax({
				url:'insertMemo.do',
				type:'post',
				data:formData,
				dataType:'json',
				success:function(data){
					location.href="listMemo.do";
				}
			});
		});
		
		$('#updateMemoBtn').click(function(event){
			event.preventDefault();
			var formData = new FormData($("#updateMemoForm"));
			$.ajax({
				url:'updateMemo.do',
				type:'post',
				data:formData,
				dataType:'json',
				success:function(data){
					location.href="listMemo.do";
				}
			});
		});
	});
	
</script>
</head>
<body>
	<div data-role="page" data-theme="a" id="memoScreenPage">
		<div data-role="header">
			<h1>메모</h1>
			<a href="#insertmemo" data-icon="plus" class="ui-btn-right">새 메모</a>
		</div>
		
		<div data-role="content">
			<ul data-role="listview" id="memoview">
			</ul>
		</div>
	</div>
	
	<div data-role="page" id="insertmemo">
		<div data-role="header">
			<h2>메모 등록</h2>
			<a href="#memoScreenPage" class="ui-btn-left">이전</a>
		</div>
		<div data-role="content">
			<form id="insertMemoForm" action="insertMemo.do" method="post" enctype="multipart/form-data">
				<label for="m_title">제목</label>
				<input type="text" name="m_title">
				<label for="m_content">내용</label>
				<textarea name="m_content"></textarea>
				<input type="file" name="uploadFile">
				<input type="submit" value="등록" id="insertMemoBtn">
			</form>
		</div>
	</div>
	
	<div data-role="page" id="detailmemo">
		<div data-role="header">
			<h2>메모 상세</h2>
			<a href="#memoScreenPage" class="ui-btn-left">이전</a>
		</div>
		<div data-role="content">
			<form id="updateMemoForm" action="updateMemo.do" method="post" enctype="multipart/form-data">
				<label for="m_title">제목</label>
				<input type="text" name="m_title" id="memotitle">
				<label for="m_content">내용</label>
				<textarea name="m_content" id="memocontent"></textarea>
				<a href="#" id="memofile"></a>
				<input type="file" name="uploadFile">
				<input type="submit" value="확인" id="updateMemoBtn">
				<input type="button" value="일정에 추가"  id="memoadd">
				<input type="button"  value="삭제" id="memodelete" data-theme="b">
			</form>
		</div>
	</div>
</body>
</html>