<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script>

	$(function() {
		
		
		
		$(closebtn).on("click",function(){
			self.close();
		});
		
		
		
		$("#pro").on("click", function(){
			
				$.ajax({url:'updateMember.do',
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
							
							$("body").append("회원정보가 수정되었습니다.<br>");
							$("body").append(clostBtn);
							
						}});
			
		});
		
		$("#deleteMember").on("click", function(){
			$.ajax({url:'memberDelete.do',
				type: 'post',
				data: {u_id : $("#u_id").val()},
				success: function(data){
					
					$("body").empty();	
					
					var clostBtn=$("<input>");
					$(clostBtn).attr("type","button");
					$(clostBtn).attr("value","닫기");
					$(clostBtn).on("click",function(){
						self.close();
					});
					
					$("body").append("정상적으로 탈퇴되었습니다.<br>");
					$("body").append(clostBtn);
					
				}});
			
		});
		
		
	});
</script>
</head>
<body>
	<h2>회원정보수정</h2> 
	
	<form action="updateMember.do" id="myForm" method="post">
	아이디<input type="text" readonly="readonly" value="${ vo.u_id }" name="u_id" id="u_id"><br>
	이름<input type="text" value="${ vo.u_name }" name="u_name"><br>
	주소<input type="text"value="${ vo.u_addr }" name="u_addr"><br>
	이메일<input type="text"value="${ vo.u_email }" name="u_email"><br>
	전화번호<input type="text"value="${ vo.u_tel }" name="u_tel"><br>
	<input type="button" id="pro" value="수정">
	<input type="reset" value="취소" id="closebtn">
	
	</form>
	<a href="updatePwd.do?u_id=${ vo.u_id }">비밀번호변경</a>
</body>
</html>