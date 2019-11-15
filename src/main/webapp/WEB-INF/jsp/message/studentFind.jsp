<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 초대</title>
<style>
.messageRow {
	width: 80%;
	display: inline-block;
}
</style>
</head>
<body>
<br>
<br>
<br>
	<div class="messageRow">
		<input type="text" id="std" placeholder="학생 아이디 입력">
		<button id="search" class="btn btn-primary btn-sm">검색</button>
	</div>
	
	<div id="searchResult"></div>
	<a href='javascript:void(0)' id='#selectId2'>클릭해봐</a>
	
	<input type="text" id="choiceId" readOnly>
	<button id="lessonMessage" class="btn btn-primary btn-sm">메세지 전송</button>

<!-- 학생 검색 -->
	<script>
  $("#search").on('click', function(){
	  var id = document.getElementById("std").value;
	  $.ajax({
		  url : "searchStd",
		  type : "post",
		  data : {id : id},
		  success : function(data){
			  $("#searchResult").text("");
			  for(var i in data){
				  console.log(data);
				  var result = "아이디:"+"<a href='javascript:void(0)' id='selectId'>"
				  result += data[i].id+"</a>"
				  result += " 이름:"+data[i].name
				  result += " 성별:"+data[i].gender
				  result += " 생년월일:"+data[i].dateOfBirth
				  result += " 주소:"+data[i].addressCity+" "+data[i].addressSuburb+"<br>"
				  $("#searchResult").append(result);
			  }
		  },
		  error : function(){
			  console.log("실패");
		  }
	  })
  });
  </script>
  
<!-- 아이디 선택 -->
  <script>
  $("#selectId2").on('click', function(e){
	  console.log("발생!");
	  var std = document.getElementById("selectId").value;
	  $("#choiceId").text("std")
  })
  </script>
  
<!-- 메세지 전송 -->
  <script>
  $("#lessonMessage").on('click', function(){
	  var messageConts = "<form action='invitation' method='post'>"
	  messageConts +="<button name='memberNo' value='${loginUser.memberNo}'"
	  messageConts += "class='btn btn-primary btn-sm'>초대 승인</button></form>"
		  
		  $.ajax({
		    url:"/app/message/messagein",
		    type:"post",
		    data:"senderNo="+${loginUser.memberNo}+"&messageConts=" + 
		    messageConts + "&receiverNo=" + 2,
			  success : function(result) {
			   alert("초대 메세지를 보냈습니다");
			  },
			  error : function() {
			   console.log("실패");
			  }
		  })
  });
  </script>

</body>
</html>