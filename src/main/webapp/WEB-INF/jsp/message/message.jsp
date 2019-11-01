<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h2>
		<input type="text" id="messageConts" placeholder="내용을 입력">
		<button id="messageIn">입력</button>
	</h2>

	<script>
    $(document).ready(function(){
      list();
    });    
 
    function list(){
        $.ajax({
        	url : 'messagelist',
        	type : 'get',
        	data : "memberNo"+${loginUser.memberNo},
        	success : function(result){
        		console.log("성공");
        	}, error : function() {
        		  console.log("실패");
        	}
        });
    }
  </script>

	<script>
    $("#messageIn").click(function() {
    	  $.ajax({
    		  url : 'messagein',
    		  type : 'post',
    		  data : "memberNo="+${loginUser.memberNo}+"&messageConts="+messageConts,
    		  
    		  success : function(result){
    	      console.log("성공");
    	    }, error : function() {
    	        console.log("실패");
    	       }
    	  });
    });
  </script>
</body>
</html>