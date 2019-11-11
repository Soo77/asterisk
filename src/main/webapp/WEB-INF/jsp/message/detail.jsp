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
	 .chat-left {
	   width: 200px;
	  border-radius: 5px;
    position: relative;
    padding: 5px 10px;
    background: #B5E8E2;
    border: 1px solid #d2d6de;
    margin: 5px 0 0 50px;
    color: #444;
	 }
	 
	 .chat-right {
   width: 200px;
    border-radius: 5px;
    position: relative;
    padding: 5px 10px;
    background: #FACBBA;
    border: 1px solid #d2d6de;
    margin: 5px 0 0 50px;
    color: #444;
    text-align: right;
    margin-left: 200px;
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
	<div class="form-row">
   <div class="col-sm-3">
		<input type="text" id="messageConts" name="messageConts"
			class="form-control" placeholder="내용을 입력">
		</div>
		<button id="messageIn" name="messageIn" class="btn btn-primary btn-sm">입력</button>
	</div>
	
	<script>
    $(document).ready(function() {
      list();
    });

    function list() {
      $.ajax({
        url : 'messageDetail',
        type : 'post',
        data : "senderNo=" + ${loginUser.memberNo} + "&receiverNo=" + ${receiverNo},
        success : function(data) {
          
          for ( var i = 0 in data) {
            if (data[i].receiverNo == ${loginUser.memberNo}) {
            	let str = '<div class="chat-left">'+data[i].messageContents+'</div>';
              $("#chat").append(str);
            } else {
            	let str = '<div class="chat-right">'+data[i].messageContents+'</div>';
              $("#chat").append(str);
            }
          }

        },
        error : function() {
          console.log("실패");
        }
      });
    }
    </script>
	
<!-- 메세지 리스트 -->
	<!-- <script>
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
						  let std = '<div class="whopeople">'+"${loginUser.name}"+'</div>';
							var str = '<div class="whochat'+i+' chat-bubble">';
							str += data[i].messageContents + '</div>';
							$("#chat").append(std+str);
					}
					
					for ( var i = 0 in data) {
						if (data[i].receiverNo == ${loginUser.memberNo}) {
							$(".whochat"+i).css("margin-left","0px");
						} else {
					      $(".whochat"+i).css("margin-left","200px");
					      $(".whochat"+i).css("text-align","right");
						}
					}

				},
				error : function() {
					console.log("실패");
				}
			});
		}
		</script> -->

<!-- 메세지 입력 -->
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
              $("#messageConts").val("");
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