<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
</head>
<body>
<h2>쪽지 보내기</h2>
<i class="fas fa-bell" id="messageReadShowAll"></i>
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
					$("#messageReadShowAll").html(" ${messageReadShowAll}개");
					for ( var i = 0 in data) {
						if("${loginUser.name}"==data[i].name) {
							var str = '<div>';
	            str += "<a href='detail?memberNo="+data[i].memberNo+"'>" + "나에게 쪽지" + '</a>';
						} else {
							var str = '<div>';
				      str += "<a href='detail?memberNo="+data[i].memberNo+"'>" + data[i].name + '</a>';
						}
						
						if(${messageReadList}[i] != 0){
							var mrl = " <i class='far fa-bell'> "+${messageReadList}[i]+"</i>"
						} else {
							var mrl = "";
						}
						
					$("#showList").append(str+mrl+'</div>');
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