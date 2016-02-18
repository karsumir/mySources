<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>그룹별 맴버 상세목록</h2>
그룹아이디:${gmv.g_id }<br>
멤버아이디: ${gmv.u_id }<br>
그룹가입일 : ${gmv.u_joinD }<br>
그룹장여부:<c:if test ="${ gmv.chairman ==0}">그룹원</c:if>
        <c:if test ="${ gmv.chairman ==1}">그룹장</c:if><br>        
그룹사용여부:${gmv.regY }<br>
<a href="updateGroupMember.do?u_id=${gmv.u_id }">수정</a>
<a href="deleteGroupMember.do?u_id=${gmv.u_id }">삭제</a>
</body>
</html>