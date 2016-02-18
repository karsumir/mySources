<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#searchId").on("click", function(){
		window.open("searchId.show","", "width=400, height=200");
		
	});
	
	$("#managerScreen").on("click", function(){
		window.open("managerScreen.do","", "width=800, height=500");
		
	});
});

</script>
</head>
<body>

	<c:if test="${re == 0 }">
		<font color="red">암호가 맞지 않습니다.</font>
	</c:if>
	
	<c:if test="${re == -1 }">
		<font color="red">아이디가 맞지 않습니다.</font>
	</c:if>

<form action="loginMember.show" method="post">
<c:if test="${login != 'ok' }">
ID <input type="text" name="u_id"  id="aaa"><br>
PWD <input type="text" name="u_pwd" >
<input type="submit" value="로그인"><br>
<input type="button" value="회원가입" onclick="location.href='insertMember.show'">
<input type="button" value="ID/PWD 찾기" id="searchId">		
</c:if>
<c:if test="${login == 'ok' && vo.u_id!='manager' }">
${vo.u_name }님 반갑습니다.
<input type="button" value="회원정보수정" onclick="location.href='updateMember.do?u_id=${vo.u_id}'">
<input type="button" value="로그아웃" onclick="location.href='logOut.do'">
</c:if>
<c:if test="${login == 'ok' && vo.u_id=='manager'}">
관리자로 로그인 되었습니다.
<input type="button" value="관리자화면" id="managerScreen">
<input type="button" value="로그아웃" onclick="location.href='logOut.do'">
</c:if>
</form>




</body>
</html>