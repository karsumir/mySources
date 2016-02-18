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

<h2>그룹상세목록</h2>
그룹아이디: ${gv.g_id }<br>
그룹장아이디: ${gv.u_id }<br>
그룹명: ${gv.g_name }<br>
그룹생성일: ${gv.g_joinD }<br>
그룹사용여부: <c:if test ="${ gv.g_use ==1}">그룹활동중</c:if>
          <c:if test ="${ gv.g_use ==0}">그룹비활동중</c:if><br> 
<a href="updateGroup.do?g_id=${gv.g_id }">수정</a>
<a href="deleteGroup.do?g_id=${gv.g_id }">삭제</a>
<hr>
<a href="listGroupMember.do?g_id=${gv.g_id }">멤버목록</a>
</body>
</html>