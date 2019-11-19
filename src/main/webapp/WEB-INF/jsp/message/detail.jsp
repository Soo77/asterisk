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
.messageRow {
  background-color: white;
  width: auto;
  heigh: auto;
  border: solid 1px #ccc;
}

.datetime-right {
  float: right;
  color: #999;
}

.datetime-left {
  float: left;
  color: #999;
}

.right {
	margin-left: 200px;
}

.chat-left {
	width: 50%;
	border-radius: 10px;
	padding: 5px 10px;
	background: #B5E8E2;
	border: 1px solid #ccc;
	margin-top: 5px;
}

.chat-right {
	border-radius: 10px;
	padding: 5px 10px;
	background: #FACBBA;
	border: 1px solid #ccc;
	margin-top: 5px;
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
						<div class="datetime-right">${messageList.sendDate}</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="chat-left">${messageList.messageContents}</div>
	           ${read}
	           <div class="datetime-left">${messageList.sendDate}</div>
	         </c:otherwise>
			</c:choose>
		</c:forEach>

		<div id="chat"></div>

	</div>
	
	<br>
	<div style="width: 400px; display: inline-block;">
		<input type="text" id="messageConts" name="messageConts"
			onKeypress="if(event.keyCode==13) {messageIn();}"
			class="form-control" placeholder="내용을 입력">
	</div>
	<button id="messageIn" name="messageIn" class="btn btn-primary btn-sm">입력</button>
	<br>
	<br>
	<a href="/app/message/list">쪽지목록</a>

	<script>
    $("#messageIn").click(function() {
      messageIn();
    });
    </script>
    
    <!-- 메세지 입력 -->
    <script>
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
  
<!--   커리큘럼 확인 -->
  <script>
  function lessonMatchingStd(lessonCheck){
	  var memberNo = lessonCheck.value;
	  var lessonNo = lessonCheck.name;
	  
	  console.log(memberNo);
	  console.log(lessonNo);
	  
	  if(${loginUser.memberNo} != memberNo){
		  return false;
	  }
	  
	  $.ajax({
          url:"/app/message/lessonInvitationCheck",
          type:"post",
          data:"lessonNo="+lessonNo,
          success : function(result) {
<<<<<<< HEAD
=======
            console.log(result);
>>>>>>> soohyun
        	  if(result != ""){
        		  alert("이미 등록된 수업입니다")
        		  return false;
        	  } else{
        		  $.ajax({
        	          url:"/app/message/lessonInvitationStd",
        	          type:"post",
        	          data:"stdNo="+memberNo+"&lessonNo="+lessonNo,
        	          success : function(result) {
        	            var url = "/app/lesson/list";
        	            alert("나의 수업을 확인해주세요");
        	            window.open(url);
        	          },
        	          error : function() {
        	           console.log("실패");
        	          }
        	    })
        	  }
          },
          error : function() {
           console.log("실패");
          }
    })
	  
  }
  </script>

</body>
</html>