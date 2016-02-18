<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-2.2.0.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.div1{
	padding:5px;
	width:350px;
	height:100px;
	background-color: #FFFFFF;
	}
	.div2{
	padding:5px;
	width:395px;
	height:100px;
	background-color: red;
	}
	.div3{
	padding:5px;
	width:250px;
	height:100px;
	background-color: #ff00ff;
	}
	.span_loginBtn{
	position:absolute;
	right:100px;
	width:150px;
	height:100px;
	background-color: yellow;
	}
	.span_icon{	
	max-width:1024px;
	width: 100%;
	height: 50px;
	background-color: orange;
	}
	.body_favoritesList{
	width: 1024px;
	height: 35px;
	background-color: #ff0000;
	}
	.body_content{
	width: 1024px;
	height: 500px;
	background-color: yellow;
	}
	.body_content_miniWindow{
	display:none;
	width: 1024px;
	height: 500px;
	background-color: navy;
	z-index: 1;
	}
	.href_nalssi{
	position:inherit;/*�Ҽӵ� �θ� ����̾�Ʈ �ȿ��� �ڸ� ��´�*/
	left:5px;
	top:5px;
	width: 500px;
	height: 100%;
	background-color: #ffffff;
	}
	.href_iljung{
	position:inherit;
	left:505px;
	top:5px;
	width: 500px;
	height: 100%;
	background-color: black;
	}
</style>
<script type="text/javascript">
	$(function () {
		var logintBtn=$('#loginBtn');
		var loginFont=$('#loginFont');
		var span_loginBtn=$('.span_loginBtn');//�α��� ��ư
		var span_loginBar=$('.span_loginBar');//�α��� ��(���̵�, ��� �Է�ĭ)
		span_loginBar.hide();//�α��� �ٸ� ���ܳ��´�.
		loginFont.attr('size', '1px');
		logintBtn.attr('src',"resources/images/login_off.png");
		$('#loginBtn').on('click',function(){
			$(span_loginBtn).hide();//�α��� ��ư�� ������� �մϴ�.
			$(span_loginBar).show();
		});
		$('#loginBtn').hover(function () {
			$(this).attr('src',"resources/images/login_on.png");
		}, function () {
			$(this).attr('src',"resources/images/login_off.png");
		});
		
	})
</script>
</head>
<body>
<font style="font-family:'���� ���', verdana, san-serif"></font>
	<table id="main_top_Table"><!-- ȭ�� ��� TOPȭ�� -->
		<tr>
			<td><div class="div1"><img src="resources/logo01.png"></div></td><!-- �ΰ� �κ� -->
			<td><div class="div2"></div></td>
			<td><div class="div3">
				<span class='span_loginBar'>
					<span><input type="text" name="u_id" id="u_id" title="Id�� �Է����ּ���." placeholder="���̵�" size="10"></span>
					<span><input type="password" name="u_pwd" id="u_pwd" title="��й�ȣ�� �Է����ּ���." placeholder="��й�ȣ" size="10"></span>
					<span><input type="button" value="�α���" onclick="" width="40px" height="100px"></span>					
				</span>
				<span class="span_loginBtn">
					<a href="#"><img  id="loginBtn"><br><font id="loginFont">Login</font></a><!-- �α��� ������ -->
				</span>
			</div></td>
		</tr>	
	</table>
	<hr>
	<div class="body_favoritesList"><!-- ���ã�� ������ ��Ƶа� -->
		<table id="main_middle_menuIcon_Table">
			<tr>
				<td><span class="span_icon">���ã�� ������</span></span></td>
			</tr>
		</table>
	</div>
	<div class="body_content_miniWindow"><!-- �̴�ȭ�� ����� -->
	</div>
	<div class="body_content">
			<table>
				<tr>
					<td valign="top"><div class="href_nalssi"><jsp:include page="todayWeaTher.jsp"></jsp:include></div></td><!-- ���� �ִ°� -->
					<td valign="top"><div class="href_iljung"><img src="resources/clear.JPEG"></div></td><!-- ���� �ִ°� -->
				</tr>
			</table>
	</div>
	<div class="body_bottom">
		<p>����Ư���� ������ ����� 23 �ű��忹���� 02-707-1480    COPYRIGHT (C)2016 �Ѻ���ī����4������. ALL RIGHTS RESERVED.</p>
	</div>
</body>
</html>