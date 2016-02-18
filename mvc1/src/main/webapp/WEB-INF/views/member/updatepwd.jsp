<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
	
	var updateBtn=$("#updateBtn");
	var closebtn=$("#closebtn");
	
	var correctAnswr=$("#correctAnswr").val();
	var correctPwd=$("#correctPwd").val();
	
		
	$(closebtn).on("click",function(){
		location.href='updateMember.do?u_id='+$("#u_id").val();
	});
	
	$(updateBtn).on("click",function(){
		var u_answr=$("#u_answr").val();
		var u_pwdOld=$("#u_pwdOld").val();
		
		if(u_answr==correctAnswr && u_pwdOld==correctPwd)
		{
			$.ajax({url:'updatePwd.do',
				type: 'post',
				data: $("#myForm").serialize(),
				success: function(data){
					
					location.href='updateMember.do?u_id='+$("#u_id").val();
					
				}});
		}
		else
		{
			alert("입력한 정보가 맞지 않습니다.");
		}
		
	});
});
</script>
</head>
<body>
<form name="f" id="myForm" action="updatePwd.do" method="post">
질문<input type="text" value="${vo.u_ask }" name="u_ask"><br>
답<input type="text" id="u_answr"><br>
<input type="hidden" value="${vo.u_answr}" id="correctAnswr">
<input type="hidden" value="${vo.u_pwd}" id="correctPwd">
<input type="hidden" value="${vo.u_id}" name="u_id" id="u_id">
현재비번<input type="password" id="u_pwdOld"> <br>
변경비번<input type="password" name="u_pwd"> <br>
<input type="button" value="변경" id="updateBtn">
<input type="button" value="취소" id="closebtn">
</form>
</body>
</html>