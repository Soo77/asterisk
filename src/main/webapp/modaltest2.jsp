<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="/assets/css/material-kit.min.css?v=2.0.6" rel="stylesheet" />
<style>
.messageRow {
	width: 80%;
	display: inline-block;
}
</style>
</head>
<body>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">학생초대</button>
	<i class="fas fa-bell"></i>

	<div id="exampleModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<h2>쪽지 보내기</h2>
				<div class="messageRow">
					<input type="text" id="std" placeholder="학생 아이디 입력">
					<button id="search" class="btn btn-primary btn-sm">검색</button>
				</div>

				<div id="searchResult"></div>

				<input type="text" id="choiceId" readOnly>
				<button id="lessonMessage" class="btn btn-primary btn-sm">메세지
					전송</button>
					<a href='javascript:void(0)' class="testBtn">클릭</a>
			</div>
		</div>
	</div>

	<script>
$("#search").on('click', function() {
    list();
  });
</script>

	<script>
  function list() {
	  var id = document.getElementById("std").value;
	    $.ajax({
	      url : "/app/message/searchStd",
	      type : "post",
	      data : {id : id},
	      success : function(data){
	        $("#searchResult").text("");
	        for(var i in data){
	          console.log(data);
	          var result = "아이디:"+"<a href='javascript:void(0)'"
	          result += "class='selectId' id="+data[i].memberNo+">"
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
  }
</script>

	<!-- 아이디 선택 -->
	<script>
  $(".testBtn").on('click', function(e){
    console.log("발생!");
    var stdNo = document.getElementsByClassName("selectId").id;
    var stdId = document.getElementsByClassName("selectId").value;
    console.log(stdNo);
    console.log(stdId);
    $("#choiceId").text("stdId")
  })
  </script>

	<!-- 메세지 전송 -->
	<script>
  $("#lessonMessage").on('click', function(){
    var messageConts = "<form action='invitation' method='post'>"
    messageConts += "${loginUser.name}님이<br>수업에 초대했습니다.<br>"
    messageConts += "커리큘럼을 확인해보세요!<br><br>"
    messageConts += "<button name='lessonChange' value='${lesson.lessonNo}'"
    messageConts += "class='btn btn-primary btn-sm'>커리큘럼 확인</button></form>"
      
      $.ajax({
        url:"/app/message/messagein",
        type:"post",
        data:"senderNo="+${loginUser.memberNo}+"&messageConts=" + 
        messageConts + "&receiverNo=" + ${receiverNo},
        success : function(data) {
        	$.ajax({
                url:"/app/message/lessonInvitationStd",
                type:"post",
                data:"stdNo="+${std}+"&lessonNo"+${lessonNo}, 
                success : function(result) {
                  console.log("성공");
                },
                error : function() {
                 console.log("실패");
                }
          })
         alert("초대 메세지를 보냈습니다");
        },
        error : function() {
         console.log("실패");
        }
      })
  });
  </script>

	<!--   Core JS Files   -->
	<script src="/assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="/assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/assets/js/core/bootstrap-material-design.min.js"
		type="text/javascript"></script>
	<script src="/assets/js/plugins/moment.min.js"></script>

</body>
</html>