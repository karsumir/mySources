<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>�׷�������</h2><hr>
<form action="updateGroupMember.do" method="post" enctype="multipart/form-data">
�׷� ���̵�:${gmv.g_id }<br>
������̵�:${gmv.u_id }<br>
<input type="hidden" name="u_id" value=${gmv.u_id }>
�׷찡���� : ${gmv.u_joinD}<br>
�׷�����Ͽ��� :<input type="number" name="regY" value="${gmv.regY }"><br>
<input type="submit" value="�׷�������">
<input type="reset" value="���">
</form>
</body>
</html>