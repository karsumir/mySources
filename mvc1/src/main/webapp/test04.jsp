<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
			var str = navigator.userAgent;
			str = str.toUpperCase();
			alert(str.match("MOBILE"))
			if(str.match("MOBILE")!=null)
				location.href="http://203.236.209.142:8088/controller/mStartPage.show";
	</script>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/kor/main.css">
<script src="resources/js/libs/jquery-1.11.2.min.js"></script>
<script src="resources/js/plugins/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>

<title>�Ѻ���ī���� 4���ǽ� ����� ������Ʈ</title>
<script>

$(function(){
	$("#managerScreen").click(function(){
		window.open("managerScreen.do", "������ȭ��", " width=500, height=500");
	});
});
</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
		
			<div id="header">
				<div class="inhead">
					<h1 class="logo"><a href="index.html" onfocus=blur() ><img src="resources/images/common/hanbitacademy_logo.gif" alt="�Ѻ�"></a></h1>
					<ul class="tnavi">
					
						<c:if test="${re == 0 }">
							<font color="red">��ȣ�� ���� �ʽ��ϴ�.</font>
						</c:if>
								
						<c:if test="${re == -1 }">
							<font color="red">���̵� ���� �ʽ��ϴ�.</font>
						</c:if>
		
						<form action="loginMember.show" method="post">
						<c:if test="${login != 'ok' }">
							ID &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="u_id"  id="aaa"><br>
							PWD <input type="text" name="u_pwd" >
							<input type="submit" value="�α���"><br>
							<input type="button" value="ȸ������" onclick="location.href='insertMember.show'">
							<input type="button" value="ID/PWD ã��" id="searchId"><br>
						</c:if>
						<c:if test="${login == 'ok' && vo.u_id!='manager' }">
							${vo.u_name }�� �ݰ����ϴ�.
							<input type="button" value="ȸ����������" onclick="location.href='updateMember.do?u_id=${vo.u_id}'">
							<input type="button" value="�α׾ƿ�" onclick="location.href='logOut.do'">
						</c:if>
						<c:if test="${login == 'ok' && vo.u_id=='manager'}">
							�����ڷ� �α��� �Ǿ����ϴ�.
							<input type="button" value="������ȭ��" id="managerScreen">
							<input type="button" value="�α׾ƿ�" onclick="location.href='logOut.do'">
						</c:if>
						<c:if test="${login == 'ok'}">
							<br><br><br><br><br><br>
						</c:if>
						</form>
					</ul>
				</div>
			</div>
		<c:if test="${login == 'ok'}">
			<div class="qlink_wrap">
				<div class="qlink">
					<div class="row">
						<div class="col-md-3 col-sm-3 col-xs-6">
							<a href="#" onfocus=blur() onclick="window.open('calendar.do', '', 'width=1000,height=800')"><span class="ico qico01"></span><em>��������<span><img src="resources/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
						</div>
		
						<div class="col-md-3 col-sm-3 col-xs-6">
							<a href="#" onfocus=blur() onclick="window.open('listMemo.do', '', 'width=450,height=400')"><span class="ico qico02"></span><em>�޸���<span><img src="resources/images/kor/main/right_arrow_b.png" alt=""></span></em></a>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		</div>
	</nav>


	<div class="layer_content"></div>


	<!-- //Header -->
	<div id="content">

			<div id="main_sec02">
				<div>
					<div class="mtit_area">
						<h2>����(Wheather)</h2>
						<p>������ ������ ���û���� ������ �ҽ��� ������ <span>������ Json���� ������ ������ �����Դϴ�.</span></p>
						<jsp:include page="todayWeaTher.jsp"></jsp:include>
						
					</div>
				<!-- //Section Title Area --></div>
			</div>
	</div>
	<!-- //container -->

		
<!-- //shortcut -->
<div id="footer">
	<div class="infoot">
	  <p class="address" style="text-align:center;">����Ư���� ������ ����� 23 �ű��忹���� 02-707-1480    COPYRIGHT (C)2016 �Ѻ���ī����4������. ALL RIGHTS RESERVED.</p>
	  <p class="address">&nbsp;</p>
	    <p class="address">&nbsp;</p>
	</div>
</div>
</body>
</html>