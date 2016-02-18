<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/ui-lightness/jquery-ui-1.10.3.custom.css" />
<style type="text/css">
	form    {
		background: -webkit-gradient(linear, bottom, left 175px, from(#CCCCCC), to(#EEEEEE));
		background: -moz-linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
		margin:auto;
		position:relative;
		width:400px;
		height:375px;
		font-family: Tahoma, Geneva, sans-serif;
		font-size: 14px;
		font-style: italic;
		line-height: 24px;
		font-weight: bold;
		color: #09C;
		text-decoration: none;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		padding:10px;
		border: 1px solid #999;
		border: inset 1px solid #333;
		-webkit-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
		-moz-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
		box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	}
	input    {
		width:375px;
		display:block;
		border: 1px solid #999;
		height: 25px;
		-webkit-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
		-moz-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
		box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	}
	
	textarea{
		width:375px;
		height:150px;
	}
	
	.submit {
		width:100px;
		right:20px;
		bottom:15px;
		background:#09C;
		color:#fff;
		font-family: Tahoma, Geneva, sans-serif;
		height:30px;
		-webkit-border-radius: 15px;
		-moz-border-radius: 15px;
		border-radius: 15px;
		border: 1p solid #999;
		position: absolute;
		
	}
	.submit {
		background:#fff;
		color:#09C;
	}
	
	#add{
		left: 20px;
	}
	
	#file{
		left: 140px;
		bottom: 70px;
	}
	
	#edit{
		left: 160px;
	}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script>
	function pro(m_num){
		location.href="calendar.do?m_num="+m_num;
	}
	
	function del(m_num){
		if(confirm("삭제 하시겠습니까?"))
			location.href="deleteMemo.do?m_num="+m_num;
	}
	
</script>
</head>
<body>
	<form action="updateMemo.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="m_num" value="${m.m_num }">
		제목  <input type="text" name="m_title" value="${m.m_title }"><br>
		내용 <br><textarea cols="40" rows="10" name="m_content">${m.m_content }</textarea><br>
		<a href="resources/upload/${m.m_fname }">${m.m_fname }</a><br>
		<input type="file" name="uploadFile" class="submit" id="file">
		<input type="submit" value="수정" class="submit" id="edit">
		<input type="button" onclick="pro(${m.m_num})" value="일정에 추가" class="submit" id="add">
		<input type="button" onclick="del(${m.m_num})" value="삭제" class="submit" id="delete">
	</form>
</body>
</html>