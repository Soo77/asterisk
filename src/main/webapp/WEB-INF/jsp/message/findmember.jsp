<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/JavaScript"
  src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>회원 목록</title>
</head>
<body>
	<h2>회원 목록</h2>
	<div id="chat"></div>
	<br>
	<br>
	<script>
		$(document).ready(function() {
			list();
		});

		function list() {
			for ( var i = 0 in ${findMember}) {
				var str = '<div class="whochsat'+i+'">';
				str += ${findMember}[i].name + '</div>';
				console.log(str);
				$("#chat").append(str);
			}
		}
	</script>
</body>
</html>