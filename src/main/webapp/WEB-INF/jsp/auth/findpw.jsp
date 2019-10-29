<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾기</title>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
#mail1 {
	display: none;
}

</style>
</head>
<body>	
	<form action="findpw" method="post"></form>
    <h1>비밀번호 찾기</h1>

    <h2>이름</h2>
    <input type="text" name="name" id="name" required>
    <h2>아이디</h2>
    <input type="text" name="id" id="id" required>
    <h2>이메일</h2>
    <div id=mailselect>
      <input type="text" name="mail0" id="mail0" maxlength="50" required>@
      <input type="text" name="mail1" id="mail1" value="" required> 
      <select name="mail2" id="mail2">
        <option selected disabled>메일 선택</option>
        <option value="naver.com">naver.com</option>
        <option value="daum.net">daum.net</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option>
        <option value="">직접 입력</option>
      </select>
    </div>
    <div id="email_check"></div>
    
    <input type="button" id="ctf" onclick='ctfft()' value="비밀번호 찾기">
    <div id="ctf_check"></div>
  
<!--   비밀번호 찾기 -->
  <script>
    function ctfft(){
    	var dp = document.getElementById("ctf_check");
      dp.style.display = "block";
      
      var id = $('#id').val();
      var name = $('#name').val();
    	var mail0 = $('#mail0').val();
      var mail1 = $('#mail1').val();
    	var whatmail = mail0+'@'+mail1;
    	
        $.ajax({
          url : 'findpw2',
          type : 'post',
          data : "whatmail="+whatmail+"&name="+name+"&id="+id,
          success : function(result) {
        	  if(result == 1) {
        		  alert("이메일로 임시 비밀번호 보냈다");
        		  $.ajax({
        	      url : 'mailsend',
        	      type : 'post',
        	      data : "whatmail="+whatmail,
        	      success : function(data) {
        	    	  location.href = "../auth/form";
        	      }, error : function(){
        	    	  console.log("실패");  
        	      }
        	    });
        	  } else {
        		  alert("입력 정보로 가입된 거 없다");
        	  }
    }, error : function() {
        console.log("실패");
    }
  });
  }
  </script>

<!--   메일 -->
	<script>
	$("#mailselect").change(function() {
	      var dp = document.getElementById("mail1");
	      dp.style.display = "block";
	      
	      if($("#mailselect option:selected").val() == "") {
	          dp.readOnly = false;
	          $('#email_check').text("");
	          $("#submit").attr("disabled", false);
	        } else if($("#mailselect option:selected").val() == "메일 선택") {
		          dp.readOnly = true;
		          $('#email_check').text('이메일을 입력해주세요 :)');
		          $('#email_check').css('color', 'red');
		          $("#submit").attr("disabled", true);
	         } else {
	        	 dp.readOnly = true;
	        	 $('#email_check').text("");
	        	 $("#submit").attr("disabled", false);
	         }
	});
	</script>

	<!--     메일 선택 -->
	<script>
  $("#mail2").change(function() {
      document.getElementById("mail1").value = document.getElementById("mail2").value;
      });
  </script>

</body>
</html>