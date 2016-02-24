<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>결과</h2><hr>
<%
	int re = Integer.parseInt(request.getParameter("re"));

	String msg="";
	if(re != 0){
		msg = "성공";
	}else{
		msg = "실패";
	}
%>
<%=msg %>
</body>
</html>