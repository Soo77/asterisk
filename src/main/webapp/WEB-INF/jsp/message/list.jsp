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
</head>
<body>
<h2>쪽지 보내기</h2>
<i class="fas fa-bell"></i>
	<div id="showList"></div>
	<br>
	<br>

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
						if("${loginUser.name}"==data[i].name) {
							var str = '<div>';
	            str += "<a href='detail?memberNo="+data[i].memberNo+"'>" + "나에게 쪽지" + '</a>';
	            str += '</div>';
						} else {
							var str = '<div>';
				      str += "<a href='detail?memberNo="+data[i].memberNo+"'>" + data[i].name + '</a>';
				      str += '</div>';
						}
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