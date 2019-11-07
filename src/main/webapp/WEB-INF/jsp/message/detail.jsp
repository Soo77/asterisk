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
<h2>쪽지함</h2>
	<br>
	<br>
	<div id="chat"></div>
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
			console.log(${loginUser.memberNo}+ "sadsad"+${receiverNo});
			$.ajax({
				url : 'messageDetail',
				type : 'post',
				data : "senderNo=" + ${loginUser.memberNo} + "&receiverNo=" + ${receiverNo},
				success : function(data) {
					
					for ( var i = 0 in data) {
							var str = '<div class="whochat'+i+'">';
							str += data[i].messageContents + '</div>';
							$("#chat").append(str);
					}
					
					for ( var i = 0 in data) {
						if (data[i].receiverNo == ${loginUser.memberNo}) {
							$(".whochat"+i).css("margin-left","0px");
						} else {
					      $(".whochat"+i).css("margin-left","200px");
						}
					}

				},
				error : function() {
					console.log("실패");
				}
			});
		}
		</script>

  <script>
		$("#messageIn").click(function() {
				var messageConts = document.getElementById("messageConts").value;
					$.ajax({
						url : 'messagein',
						type : 'post',
						data : "senderNo="+${loginUser.memberNo}+"&messageConts=" + 
						messageConts + "&receiverNo=" + ${receiverNo},
						success : function(result) {
              $("#chat").text("");
              list();
						},
						error : function() {
							console.log("실패");
						}
					});
				});
	</script>
</body>
</html>