<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="resource/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<h2>그룹수정</h2><hr>
<form action="updateGroup.do" method="post" enctype="multipart/form-data">
그룹아이디:${gv.g_id }<input type="hidden" name="g_id" value="${gv.g_id}"><br>
그룹장아이디:${gv.u_id }<br>
그룹생성일 : ${gv.g_joinD}<br>
그룹명:<input type="text" name="g_name" value="${gv.g_name}"><br>
그룹사용 :'${gv.g_use}
	<input type="radio" name="g_use" value=0 <c:if test='${gv.g_use==0}'>checked='checked'</c:if>>중지
	<input type="radio" name="g_use" value=1 <c:if test='${gv.g_use==1}'>checked='checked'</c:if>>사용<br>
				 
<input type="submit" value="그룹수정">
<input type="reset" value="취소">
</form>
</body>
</html>