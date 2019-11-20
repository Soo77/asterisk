<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾기</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
<style>
body {
  height: 100%;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

#content{
  margin: auto;
}

.btn{
  display: inline-block;
    font-weight: 400;
    color: #212529;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color 
    .15s ease-in-out,box-shadow .15s ease-in-out;
    width: 100%;
    margin-top: 10px;
    
}

.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}
#mail1 {
	display: none;
}

</style>
</head>
<body class="text-center">
<div id='content'>
		<h1>아이디 찾기</h1>

		<input type="text" placeholder="이름" id="name" class="form-control" required autofocus>
		<div id=mailselect>
			<input type="text" placeholder="이메일" id="mail0" maxlength="50" class="form-control" required>@
			<input type="text" id="mail1" value="" class="form-control" required> 
			<select	name="mail2" id="mail2" class="form-control">
				<option selected disabled>메일 선택</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
				<option value="">직접 입력</option>
			</select>
		</div>
		<div id="email_check"></div>
		
		<button id="searchBtn" class="btn btn-primary">아이디를 찾아줘</button>
	</div>
	
	<script>
	$("#searchBtn").click(function() {
		var mail0 = document.getElementById("mail0").value;
		var mail1 = document.getElementById("mail1").value;
		var name = document.getElementById("name").value;
		$.ajax({
			url: 'searchId',
			type: 'post',
			data: "mail0="+mail0+"&mail1="+mail1+"&name="+name,
			success: function(data){
				if(data == ""){
					swal("아이디 찾기 결과", "가입되지 않은 정보입니다", "warning");
				} else{
					swal({
						  title: "아이디 찾기 결과",
						  text: "당신의 아이디는 "+data+"입니다",
						  icon: "success",
						  button: "로그인",
					})
					.then((result) => {
						location.href = "/app/auth/form";
					});
				}
			}
			
		})
	})
	</script>
	
<!--   메일 -->
	<script>
	$("#mailselect").change(function() {
	      var dp = document.getElementById("mail1");
	      dp.style.display = "block";
	      
	      var mail0 = $('#mail0').val();
	      var mail1 = $('#mail1').val();
	      var mail = mail0+'@'+mail1;
	      
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