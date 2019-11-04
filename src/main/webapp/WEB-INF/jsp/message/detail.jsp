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
	<div id="showyou"></div>
	<br>
	<br>
	<div id="showmy"></div>
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
			console.log(${memNo.memberNo});
			$.ajax({
				url : 'messageDetail',
				type : 'post',
				data : "memberNo=" + 1,
				success : function(data) {
					for ( var i = 0 in data) {
						if (data[i].receiverNo == 1) {
							var str = '<TR>';
							str += '<TD>' + data[i].messageContents + '</TD>';
							str += '</TR>';
							$("#showmy").append(str);
						} else {
							var str = '<TR>';
							str += '<TD>' + data[i].messageContents + '</TD>';
							str += '</TR>';
							$("#showyou").append(str);
						}
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		}

		$("#messageIn").click(function() {
				var messageConts = document.getElementById("messageConts").value;
					$.ajax({
						url : 'messagein',
						type : 'post',
						data : "messageConts=" + messageConts,
						success : function(result) {
							  $("#showyou").text("");
							$.ajax({
								url : 'messageDetail',
								type : 'post',
								data : "memberNo=" + 1,
								success : function(data) {
									for ( var i = 0 in data) {
										if (data[i].receiverNo == 1) {
											var str = '<TR>';
											str += '<TD>' + data[i].messageContents + '</TD>';
											str += '</TR>';
											$("#showmy").append(str);
										} else {
											var str = '<TR>';
											str += '<TD>' + data[i].messageContents + '</TD>';
											str += '</TR>';
											$("#showyou").append(str);
										}
									}
									messageConts = "";
								},
								error : function() {
									console.log("실패");
								}
							});
						},
						error : function() {
							console.log("실패");
						}
					});
				});
	</script>
</body>
</html>