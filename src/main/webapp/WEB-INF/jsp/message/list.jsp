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
<button id="findMember" onclick="findmember()">회원목록</button>
	<div id="showList"></div>
	<br>
	<br>
	<i class="fas fa-bell"></i>

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
	            str += "<a href='detail?memberNo="+data[i].memberNo+"'>" + "나" + '</a>';
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
	
	<script>
	  function findmember(){
          var url = "findmember";
          var option = "width = 500, height = 500, top = 100, left = 200, location = yes"
          window.open(url, "", option);
		};
	</script>
	
</body>
</html>