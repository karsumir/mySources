<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
 $(function(){
	 
	 var user_id;
		
		function showSelect(){			
			$("body").empty();
			var searchIdBtn=$("<input></input>");
			$(searchIdBtn).attr("type", "button");
			$(searchIdBtn).attr("id", "btnId");
			$(searchIdBtn).css({width : 300, height: 75});
			$(searchIdBtn).attr("value", "아이디찾기");
			$(searchIdBtn).on("click",function(){
				$("body").empty();
				var nameInput=$("<input></input>");
				$(nameInput).attr("type", "text");
				$(nameInput).attr("id", "name");	
				
				
				var emailInput=$("<input></input>");
				$(emailInput).attr("type", "email");
				$(emailInput).attr("id", "email");
				
				var confirmBtn=$("<input>");
				$(confirmBtn).attr("type","button");
				$(confirmBtn).on("click", function(){
					var name=$("#name").val();
					var email=$("#email").val();
					
					$.ajax({
						url:"findId.show",
						data:{name : name, email:email},
						success: function(data){
							
							var result="회원님의 id는 \n "+data+"입니다.";
							if(data=='')
							{
								alert("존재하지 않는 회원입니다.")
							}
							else{
								$("body").empty();
								$("body").append(result);
								
								var clostBtn=$("<input>");
								$(clostBtn).attr("type","button");
								$(clostBtn).attr("value","닫기");
								$(clostBtn).on("click",function(){
									self.close();
								});
								
								var returnBtn=$("<input>");
								$(returnBtn).attr("type","button");
								$(returnBtn).attr("value","처음으로");
								$(returnBtn).on("click",function(){
									showSelect();
								});
								
								$("body").append("<br>");
								$("body").append(returnBtn);
								$("body").append(clostBtn);
							}
						}
					});
					
				});
				$(confirmBtn).attr("value", "확인");
				
				var resetBtn=$("<input>");
				$(resetBtn).attr("type","button");
				$(resetBtn).on("click", function(){
					showSelect();
				});
				$(resetBtn).attr("value", "취소");
				
				
				$("body").append("이름");		
				$("body").append(nameInput);		
				$("body").append("<br>");		
				$("body").append("이메일");		
				$("body").append(emailInput);
				$("body").append("<br>");		
				$("body").append(confirmBtn);		
				$("body").append(resetBtn);		
			});
			
			
			var searchPwdBtn=$("<input></input>");
			$(searchPwdBtn).attr("type", "button");
			$(searchPwdBtn).attr("id", "btnPwd");
			$(searchPwdBtn).attr("value", "비번찾기");
			$(searchPwdBtn).css({width : 300, height: 75});
			$(searchPwdBtn).on("click", function(){
				$("body").empty();
				var idInput=$("<input></input>");
				$(idInput).attr("type", "text");
				$(idInput).attr("id", "u_id");	

				
				
				var confirmIdBtn=$("<input>");
				$(confirmIdBtn).attr("type","button");
				$(confirmIdBtn).attr("value","확인");
				$(confirmIdBtn).on("click",function(){
				 $.ajax({url:"findPwd.show",
						data: {u_id: $("#u_id").val()},
						success: function(data){
							
						if(data=='')
						{
							alert("존재하지 않는 id입니다.");
						}
						else{
							var s=data.split('//');
							var ask=s[0];
							var ans=s[1];
							var askInput=$("<input></input>");
							$(askInput).attr("type", "text");
							$(askInput).attr("value", ask);
							$(askInput).attr("readonly", "'readonly'");
							
							var ansInput=$("<input></input>");
							$(ansInput).attr("type", "text");
							$(ansInput).attr("id", "ansId");
							
							var confirmBtn02=$("<input></input>");
							$(confirmBtn02).attr("type", "button");
							$(confirmBtn02).attr("value", "확인");
							$(confirmBtn02).on("click", function(){
								if($(ansId).val()==ans && ans!='null')
								{
									user_id=$("#u_id").val();									
									$("body").empty();
									var newPwd=$("<input></input>")
									$(newPwd).attr("type", "password");
									$(newPwd).attr("id", "newPwdId");
									
									var newPwdCheck=$("<input></input>")
									$(newPwdCheck).attr("type", "password");
									$(newPwdCheck).attr("id", "newPwdCheckId");
									
									var confirmBtn03=$("<input></input>");
									$(confirmBtn03).attr("type", "button");
									$(confirmBtn03).attr("value", "확인");
									$(confirmBtn03).on("click", function(){
										if($("#newPwdId").val()==$("#newPwdCheckId").val())
										{
											$.ajax({
												url:"updateNewPwd.show",
												data:{u_id : user_id ,u_pwd :$("#newPwdId").val()},
												success: function(data){	
													$("body").empty();	
													
													var clostBtn=$("<input>");
													$(clostBtn).attr("type","button");
													$(clostBtn).attr("value","닫기");
													$(clostBtn).on("click",function(){
														self.close();
													});
													
													var returnBtn=$("<input>");
													$(returnBtn).attr("type","button");
													$(returnBtn).attr("value","처음으로");
													$(returnBtn).on("click",function(){
														showSelect();
													});
													
													$("body").append("비밀번호가 변경되었습니다.");
													$("body").append("<br>");
													$("body").append(returnBtn);													
													$("body").append(clostBtn);													
												}});
										}
										else
										{
											alert("새로운 비밀번호가 서로 맞지 않습니다.")
										}
									});
									
									var cancelBtn02=$("<input></input>");
									$(cancelBtn02).attr("type", "button");
									$(cancelBtn02).attr("value", "취소");									
									$(cancelBtn02).on("click", function(){
										showSelect();
									});									
									
									$("body").append("새비밀번호");
									$("body").append(newPwd);
									$("body").append("<br>");
									$("body").append("비밀번호확인");
									$("body").append(newPwdCheck);
									$("body").append("<br>");
									$("body").append(confirmBtn03);
									$("body").append(cancelBtn02);
								}
								else{
									
									alert("올바른 답이 아닙니다.");
								}
							});
							
							
							var cancelBtn=$("<input></input>");
							$(cancelBtn).attr("type", "button");
							$(cancelBtn).attr("value", "취소");
							$(cancelBtn).on("click", function(){
								showSelect();
							});
							
							$("body").append("<br>");
							$("body").append("질문");
							$("body").append(askInput);
							$("body").append("<br>");
							$("body").append("답");
							$("body").append(ansInput);
							$("body").append("<br>");
							$("body").append(confirmBtn02);
							$("body").append(cancelBtn);
							
						}
					}}
				 );
				
				});
				$("body").append("아이디");
				$("body").append(idInput);
				$("body").append(confirmIdBtn);
			});
			
			$("body").append(searchIdBtn);
			$("body").append("<br>");
			$("body").append(searchPwdBtn);
		
 	}
		showSelect();
 });
</script>
</head>
<body>

</body>
</html>