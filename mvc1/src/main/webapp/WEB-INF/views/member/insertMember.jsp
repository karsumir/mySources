<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script>

	$(function() {
		$("#pro").on("click", function(){
			var pwd1 = $("#u_pwd").val();
			var pwd2 = $("#u_pwd_confirm").val();
			if(pwd1 != pwd2)
			{
				alert("암호가 일치하지 않습니다");
				return;
			}
			else{
				$.ajax({url:'insertMember.show',
						type: 'post',
						data: $("#myForm").serialize(),
						success: function(data){
							
							$("body").empty();	
							
							var clostBtn=$("<input>");
							$(clostBtn).attr("type","button");
							$(clostBtn).attr("value","닫기");
							$(clostBtn).on("click",function(){
								self.close();
							});
							
							$("body").append("회원가입을 축하드립니다.<br>");
							$("body").append(clostBtn);
							
						}});
			}
		});
		
		
	});
</script>
<title>회원관리 시스템 회원가입 페이지</title>
</head>
<body>
<form name="join" id="myForm" action="insertMember.show" method="post">
<center>
<table border=1>
	<tr><td>ID : </td><td><input type="text" name="u_id"/></td></tr>
	<tr><td>PWD : </td><td><input type="password" name="u_pwd" id="u_pwd"/></td></tr>
	<tr><td>PWD 확인: </td><td><input type="password" name="u_pwd_confirm" id="u_pwd_confirm"/></td></tr>
	<tr><td>이름 : </td><td><input type="text" name="u_name"/></td></tr>
	<tr><td>이메일 : </td><td><input type="email" name="u_email"/></td></tr>
	<tr><td>전화번호 : </td><td><input type="text" name="u_tel"/></td></tr>
	<tr><td>주소 : </td><td><input type="text" name="u_addr"/></td></tr>
	
	<tr><td>비밀번호 찾기 질문 : </td><td>
	<select name="u_ask">
		<option value="태어난 곳은?">태어난 곳은?</option>
		<option value="어머님 성함은?">어머님 성함은?</option>
		<option value="좋아하는 노래는?">좋아하는 노래는?</option>
		<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
		<option value="가고 싶은 곳은?">가고 싶은 곳은?</option>
	</select>
	<tr><td>비밀번호 찾기 답 : </td><td><input type="text" name="u_answr"/></td></tr>
	
	<tr>
		<td colspan="2" align=center>
		<input type="button" value="확인" id="pro"> 
		<input type="reset" value="취소"><br>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>
