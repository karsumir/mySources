<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert Page</title>
</head>
<body>
<h2>INSERT PAGE</h2><hr>
<form action="insert.do" method="POST">
	<table>
		<tr>
			<td>
				ID
			</td>
			<td>
				<input type="text" name="id" required="required">
			</td>
		</tr>
		<tr>
			<td>
				Title
			</td>
			<td>
				<input type="text" name="title" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea rows="20" cols="50" required="required"></textarea>			
			</td>
		</tr>
	</table>
	<input type="submit" value="등록">
</form>
</body>
</html>