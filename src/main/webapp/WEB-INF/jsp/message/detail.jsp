<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	  width: 40%;
	  border-radius: 5px;
    position: relative;
    padding: 5px 10px;
    background: #B5E8E2;
    border: 1px solid #d2d6de;
    margin-top: 5px;
    color: #444;
	 }
	 
	 .chat-right {
    width: 70%;
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
	<br>
	<br>
	<div id="chat"></div>
	<br>
	<br>
	
	<div>
	  <div class="messageRow">
		<input type="text" id="messageConts" name="messageConts"
		onKeypress="if(event.keyCode==13) {messageIn();}" 
		class="form-control" placeholder="내용을 입력">
	  </div>
		<button id="messageIn" name="messageIn" class="btn btn-primary btn-sm">입력</button>
	</div>
	
	<script>
    $(document).ready(function() {
      detail();
    });

    function detail() {
      $.ajax({
        url : 'messageDetail',
        type : 'post',
        data : "senderNo=" + ${loginUser.memberNo} + "&receiverNo=" + ${receiverNo},
        success : function(data) {
          for ( var i = 0 in data) {
        	  
        	  if(data[i].read==0){
        		  var mr = "읽지 않음";
        	  } else {
        		  mr = "읽음";
        	  }
        	  
            if (data[i].senderNo == ${loginUser.memberNo}) {
            	let str = "<div class='right'>" 
            	str += '<div class="chat-right">'+data[i].messageContents+'</div>';
            	str += mr+"</div>"
              $("#chat").append(str);
            } else {
            	let str = '<div class="chat-left">'+data[i].messageContents+'</div>';
              $("#chat").append(str+mr);
            }
          }

        },
        error : function() {
          console.log("실패");
        }
      });
    }
    </script>

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