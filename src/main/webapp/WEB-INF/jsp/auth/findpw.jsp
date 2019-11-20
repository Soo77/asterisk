<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> -->

<head>

<style>
.this-center {
	text-align: center;
	padding-top: 0px !important;
}

.card-login .card-body {
	padding: 1.25rem;
}

#hiddenMail {
	display: none;
}
</style>
</head>

<div class="container">
	<div class="row">
		<div class="col-lg-4 col-md-6 ml-auto mr-auto">
			<div class="card card-login">
				<div class="card-header card-header-primary text-center">
					<h4 class="card-title">비밀번호 찾기</h4>
				</div>

				<form action="findpw" method="post" class="form-signin">
					<div class="card-body">

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="material-icons">face</i>
								</span>
							</div>
							<input type="text" placeholder="이름" name="name" id="name"
								class="form-control" required autofocus>
						</div>

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="material-icons">lock_outline</i>
								</span>
							</div>
							<input type="text" placeholder="아이디" name="id" id="id"
								class="form-control" required>
						</div>

						<div id=mailselect>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="material-icons">lock_outline</i>
									</span>
								</div>
								<input type="text" placeholder="이메일" class="form-control"
									name="mail0" id="mail0" maxlength="50" required>@
							</div>

							<div id="hiddenMail">
								<div class="input-group mail1">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">lock_outline</i>
										</span>
									</div>
									<input type="text" class="form-control" name="mail1" id="mail1"
										value="" required>
								</div>
							</div>

							<div id="hiddenSelectMail">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">lock_outline</i>
										</span>
									</div>
									<select name="mail2" id="mail2" class="form-control">
										<option selected disabled>메일 선택</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="">직접 입력</option>
									</select>
								</div>
							</div>
						</div>

						<div class="text-center" id="email_check"></div>

						<div class="this-center">
							<div class="description">
								<input type="button" id="ctf" onclick='ctfft()'
									class="btn btn-primary" value="찾기">
							</div>
						</div>
						<div id="ctf_check"></div>

					</div>
				</form>

			</div>
		</div>
	</div>
</div>

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
        $.ajax({
          url : 'mailsend',
          type : 'post',
          data : "whatmail="+whatmail,
          success : function(data) {
            swal({
                  title: "비밀번호 찾기 결과",
                  text: "이메일로 비밀번호를 전송했습니다",
                  icon: "success",
                  button: "로그인",
              })
              .then((result) => {
                location.href = "/app/auth/form";
              });
          }, error : function(){
            console.log("실패");  
          }
        });
      } else {
        swal("비밀번호 찾기 결과", "가입되지 않은 정보입니다", "warning");
      }
    }, error : function() {
        console.log("실패");
    }
	});
}
</script>

<!--   메일 -->
<script>
    var dp = document.getElementById("mail1");
    
	  $("#mailselect").focusout(function () {
	    emailCheck();
	  })
	
	  $("#mail2").change(function () {
	    if ($('#mail2').val() == "") {
	      dp.style.display = 'block';
	      $('#mail2').css('display', 'none');
	    }
	    document.getElementById("mail1").value = document.getElementById("mail2").value;
	    emailCheck();
	  });

    function emailCheck() {
      if($("#mail2").val() == "") {
          dp.readOnly = false;
          $('#email_check').text("");
          $("#submit").attr("disabled", false);
        } else if($("#mail2").val() == "메일 선택") {
            dp.readOnly = true;
            $('#email_check').text('이메일을 입력해주세요');
            $('#email_check').css('color', 'red');
            $("#submit").attr("disabled", true);
         } else {
           dp.readOnly = true;
           $('#email_check').text("");
           $("#submit").attr("disabled", false);
         }
    }
</script>
