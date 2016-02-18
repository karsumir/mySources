<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/ui-lightness/jquery-ui-1.10.3.custom.css" />
<style>
	#divMemo{
	    margin: 5px;
	    padding: 5px;
	    float: left;
	}
	.cursor{
		cursor: pointer;
	}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script>
	var arr;
	
	$(function () {
		
		$("#addMemo").hover(function(){
			$(this).addClass("cursor");
		}, function(){
			$(this).removeClass("cursor");				
		});
		
		$("#addMemo").on("click",function(){
			location.href="insertMemo.do";
		});
		
		arr = $("a");
		
		$(".tr").each(function(index){
			
			$(this).children("td").hover(function(){
				$(this).addClass("ui-state-highlight");
			}, function(){
				$(this).removeClass("ui-state-highlight");				
			});
			
			var td = $("<td></td>");
			var span = $("<span></span>");
			var del = $(this).children("td").children("input").attr("value");
			
			$(span).attr("class","ui-icon ui-icon-close" );
			$(span).attr("delete", del);
			$(td).html(span);
			$(this).append(td);
			
			$(td).on("click",function(){
				if(confirm("삭제 하시겠습니까?")){
					var str = $(this).children("span").attr("delete");
					alert(str);
					location.href="deleteMemo.do?m_num="+str;
	    		}
	    		else{}
			});
			
			$(td).hover(function(){
				$(this).addClass("ui-state-error");
				$(this).addClass("cursor");
			} ,function(){
				$(this).removeClass("ui-state-error");
				$(this).removeClass("cursor");				
			} );
			
			
		});
		
	});
</script>
</head>
<body>
	<div class="ui-state-default ui-corner-all" id="divMemo">
		<table id="listMemo">
		</table>
		<table border="2" id="tb">
			<tr>
				<td width="350" style="table-layout: fixed;">
					메모장
				</td>
				<td><span class="ui-icon ui-icon-plus" id="addMemo"></span></td>
			</tr>
			<c:forEach items="${list }" var="m">
				<tr class="tr">
					<td>
						<input type="hidden" value="${m.m_num }">
						<a href="detailMemo.do?m_num=${m.m_num }">
						제목 : ${m.m_title }<br>
						내용 : ${m.m_temp }</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>