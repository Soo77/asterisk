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
	.messageRow{
	 width:60%;
	 display: inline-block;
	}
	
	 .right{
	  margin-left: 200px;
	 }
	
	 .chat-left {
	  width: 50%;
	  border-radius: 5px;
    position: relative;
    padding: 5px 10px;
    background: #B5E8E2;
    border: 1px solid #d2d6de;
    margin-top: 5px;
    color: #444;
	 }
	 
	 .chat-right {
    width: 140%;
    border-radius: 5px;
    position: relative;
    padding: 5px 10px;
    background: #FACBBA;
    border: 1px solid #d2d6de;
    margin-top: 5px;
    color: #444;
    text-align: right;
    }
	</style>
</head>
<body>
<h2>쪽지함</h2>
	<div class="messageRow">

		<c:forEach var="messageList" items="${messageList}">
			<c:choose>
				<c:when test="${messageList.read eq false}">
					<c:set var="read" value="읽지않음" />
				</c:when>
				<c:otherwise>
					<c:set var="read" value="읽음" />
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${loginUser.memberNo eq messageList.senderNo}">
					<div class='right'>
						<div class="chat-right">${messageList.messageContents}</div>
						${read}
					</div>
				</c:when>
				<c:otherwise>
					<div class="chat-left">${messageList.messageContents}</div>
	           ${read}
	         </c:otherwise>
			</c:choose>
		</c:forEach>

		<div id="chat"></div>

		<input type="text" id="messageConts" name="messageConts"
			onKeypress="if(event.keyCode==13) {messageIn();}"
			class="form-control" placeholder="내용을 입력">
	</div>
	<button id="messageIn" name="messageIn" class="btn btn-primary btn-sm">입력</button>

	<!-- 메세지 입력 -->
  <script>
    $("#messageIn").click(function() {
      messageIn();
    });
    
    function messageIn(){
      var messageConts = document.getElementById("messageConts").value;
      
      if(messageConts == ""){
    	  return false;
      } else {
	      $.ajax({
	        url : 'messagein',
	        type : 'post',
	        data : "senderNo="+${loginUser.memberNo}+"&messageConts=" + 
	        messageConts + "&receiverNo=" + ${receiverNo},
	        success : function(result) {
	        	let str = "<div class='right'>" 
	          str += '<div class="chat-right">'+messageConts+'</div>';
	          str += "읽지 않음"+"</div>"
	          $("#chat").append(str);
	          $("#messageConts").val("");
	        },
	        error : function() {
	          console.log("실패");
	        }
	      });
      }
    }
  </script>
  
</body>
</html>