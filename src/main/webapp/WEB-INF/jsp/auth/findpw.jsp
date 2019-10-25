<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<form action="pwchange" method="post">
		<h2>새 비밀번호</h2>
		<input type="text" name="newpw">
		<h2>새 비밀번호 확인</h2>
		<input type="text" name="newpwok">
		<button>비밀번호 변경</button>
	</form>
</body>
</html>