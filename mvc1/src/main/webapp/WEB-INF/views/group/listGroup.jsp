<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>

<h2>그룹목록</h2>
<table border="1">
	<tr>
		<td>그룹아이디</td>
		<td>그룹명</td>
	</tr>
	<c:forEach items="${list }" var="l">
	<tr>
		<td><a href="detailGroup.do?g_id=${l.g_id }">${l.g_id }</a></td><td>${l.g_name }</td>			
	</tr>
	
	</c:forEach>
	<a href="insertGroup.do?">그룹등록</a>		
</table>
</body>
</html>