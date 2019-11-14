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
</head>
<body>
<button type="button" id="modalBtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  쪽지함
</button>
<i class="fas fa-bell"></i>

<div id="exampleModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
        <h2>쪽지 보내기</h2>
        <button id="findMember" onclick="findmember()">회원목록</button>
          <div id="showList"></div>
          <br>
          <br>
    </div>
  </div>
</div>

<button type="button" id="popMessage" class="btn btn-primary">
  쪽지함 팝업
</button>

<script>
$("#modalBtn").on('click', function() {
    list();
  });
  
$("#btntest").on('click', function() {
    detail();
  });
  
$("#popMessage").on('click', function() {
	  popMessage();
  });
</script>

<script>
  function list() {
    $.ajax({
      url : '/app/message/memberlist',
      type : 'post',
      data : "memberNo=" + ${loginUser.memberNo},
      success : function(data) {
        console.log(data);
        for ( var i = 0 in data) {
          console.log(data[i].name);
          var str = '<button id="btntest" data-target="#ohora">';
          str += "<a href='/app/message/detail?memberNo="+data[i].memberNo+"'>" + data[i].name + '</a>';
          str += '</button>';
        $("#showList").append(str);
        }
      },
      error : function() {
        console.log("실패");
      }
    });
  }
</script>

<script>
  function detail() {
	  consol.log("dd");
      $.ajax({
        url : '/app/message/messageDetail',
        type : 'post',
        data : "senderNo=" + ${loginUser.memberNo} + "&receiverNo=" + data[i].memberNo,
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

<script>
  function popMessage(){
	  var url = "/app/message/list";
    var option = "width = 500, height = 500, top = 100, left = 200, location = yes"
    window.open(url, "쪽지목록" ,option);
  }
</script>

<!--   Core JS Files   -->
<script src="/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="/assets/js/plugins/moment.min.js"></script>

</body>
</html>