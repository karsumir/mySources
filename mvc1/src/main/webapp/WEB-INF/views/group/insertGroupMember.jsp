<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>그룹맴버등록</h2>
<form action="insertGroupMember.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="${chairman }" value=0><br>
그룹아이디:<input type="number" name="g_id" value=${g_id }><br>
유저아이디검색 :<input type = text name="u_id" value="choa"><br>
가입일:<input type="Date" name="${u_joinD }" value="${u_joind}"><br>
그룹등록유효<input type="checkbox" name="${regy }" value=0 ><br>
<input type="submit" value="그룹멤버등록">
<input type="reset" value="취소">
</form>
</body>
</html>