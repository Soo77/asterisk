<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<style>
.avatar {
  border-radius: 30px;
  width: 50px;
  height: 50px;
  float: left;
  margin: 7px 10px 0px 10px;
}

.messageRow {
	background-color: white;
	width: auto;
	height: auto;
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
<body style="overflow: hidden;">
	<h2>쪽지함</h2>

	<div class="card-header d-flex justify-content-between p-2" style="background-color: #ccc;">
		<div class="d-flex">
			<div class="profile-photo">
				<img class="avatar" src="/upload/join/${messageInfo[0].profilePhoto}">
			</div>
			<div class="data">
				<h4 class="mb-0">${messageInfo[0].name}</h4>
<!-- 				<p class="text-muted mb-0">밥 뭐먹지</p> -->
			</div>
		</div>

		<div class="icons grey-text">
			<a href="/app/message/list" id="closeButton"><i class="fas fa-list-ul"></i></a>
		</div>
	</div>

	<div class="messageRow" style="min-height:300px; overflow:auto; width:500px; height:400px;">

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
								<c:if test="${loginUser.memberNo ne receiverNo}">
								${read}
								</c:if>
							<div class="datetime-right">${messageList.sendDate}</div><br>
						</div>
					</c:when>
					<c:otherwise>
						<div class="chat-left">${messageList.messageContents}</div>
						<div style="color: #999;">${messageList.sendDate}</div>
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

    <script>
      $(document).ready(function(){
    	  console.log("asd");
		    $(document).scrollTop($(document).height());
      })
    </script>

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
	        	let today = new Date();   
	        	let year = today.getFullYear(); // 년도
	        	let month = today.getMonth() + 1;  // 월
	        	let date = today.getDate();  // 날짜
	        	
	        	let str = "<div class='right'>" 
	          str += '<div class="chat-right">'+messageConts+'</div>'
	          if(${loginUser.memberNo} != ${receiverNo}){
	           str += "읽지않음"
	          }
	          str += "<div class='datetime-right'>"+year+-month+-date+"</div><br></div>"
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