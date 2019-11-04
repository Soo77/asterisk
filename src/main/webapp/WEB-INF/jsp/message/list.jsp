<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#showmy {
	margin-left: 50px;
}
</style>
</head>
<body>
	<div id="showList"></div>
	<br>
	<br>
	<h2>
		<input type="text" id="messageConts" name="messageConts"
			placeholder="내용을 입력">
		<button id="messageIn" name="messageIn">입력</button>
	</h2>

	<script>
		$(document).ready(function() {
			list();
		});

		function list() {
			$.ajax({
				url : 'memberlist',
				type : 'post',
				data : "memberNo=" + ${loginUser.memberNo},
				success : function(data) {
					console.log(data);
					for ( var i = 0 in data) {
						console.log(data[i].name);
						var str = '<TR>';
			      str += '<TD>' + "<a href='detail?memberNo="+data[i].memberNo+"'>" + data[i].name + '</a>' +'</TD>';
			      str += '</TR>';
					$("#showList").append(str);
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		}
	</script>
</body>
</html>