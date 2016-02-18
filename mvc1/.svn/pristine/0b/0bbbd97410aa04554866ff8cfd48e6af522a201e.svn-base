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

<h2>그룹아이디별 멤버목록</h2>
<table border="1">
	<tr>
		<td>그룹아이디</td>
		<td>그룹장아이디</td>		
		<td>그룹원아이디</td>		
	</tr>
	<c:forEach items="${list }" var="l">
	<tr>
	<td><a href="insertGroupMember.do?g_id=${l.g_id }">${l.g_id }</a></td>
	<td>${l.chief_u_id }</td>
	<td><a href="detailGroupMember.do?g_id=${l.g_id }&u_id=${l.u_id }">${l.u_id }</a></td>				
	<c:set var="g_id" value="${l.g_id}"/>
	</tr>
	</c:forEach>
</table><br>
<a href="searchGroupMember.do?g_id=${g_id }">멤버찾기</a>
</body>
</html>