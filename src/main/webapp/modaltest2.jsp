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
	<button type="button" class="btn btn-primary float-right" 
	data-toggle="modal" data-target="#exampleModal">학생초대</button>&ensp;&ensp;

	<div id="exampleModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>×</span>
					</button>
				</div>
				<span class="messageLessonNo" id="1">수업번호 : ${lesson.lessonNo}</span>
				<div class="messageRow">
					<input type="text" id="std" placeholder="학생 아이디 입력">
					<button id="search" class="btn btn-primary btn-sm">검색</button>
				</div>

				<div id="searchResult"></div>

				<input type="text" id="choiceId" readOnly>
				<button id="lessonMessage" class="btn btn-primary btn-sm">메세지
					전송</button>
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
	          var result = "아이디:<a href='javascript:void(0)'"
	          result += "onclick='selectId(this)'"
	          result += "id="+data[i].memberNo+">"+data[i].id+"</a>"
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
  function selectId(clickId){
	var no = clickId.id;
	var val = clickId.text;
    $("#choiceId").attr("placeholder",val)
    $("#lessonMessage").attr("value",no)
  }
  </script>

	<!-- 메세지 전송 -->
	<script>
  $("#lessonMessage").on('click', function(){
	var memberNo = document.getElementById("lessonMessage").value;
	var lessonNo = document.getElementsByClassName("messageLessonNo")[0].id;
	console.log(memberNo);
	console.log(lessonNo);
    var messageConts = "${loginUser.name}님이<br>수업에 초대했습니다.<br>"
    messageConts += "커리큘럼을 확인해보세요!<br><br>"
    messageConts += "<button onclick='lessonMatchingStd(this)' name="+lessonNo
    messageConts += " class='btn btn-primary btn-sm'>커리큘럼 확인</button>"
    
    if(memberNo == ""){
    	alert("학생을 선택해주세요");
    	return false;
    }
      
      $.ajax({
        url:"/app/message/messagein",
        type:"post",
        data:"senderNo="+${loginUser.memberNo}+"&messageConts=" + 
        messageConts + "&receiverNo=" + memberNo,
        success : function(data) {
//         	lesson_stat 2로 변경
        	$.ajax({
                url:"/app/message/lessonInvitationStd",
                type:"post",
                data:"stdNo="+memberNo+"&lessonNo="+lessonNo,
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
         console.log("실패2");
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