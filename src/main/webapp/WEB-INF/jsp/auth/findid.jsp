<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> -->

<style>
  .this-center{
    text-align: center;
    padding-top: 0px !important;
  }
  .card-login .card-body {
    padding: 1.25rem;
  }
  #mail1 {
  display: none;
  }
  
</style>
</head>

    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto">
          <div class="card card-login">
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">아이디 찾기</h4>
              </div>
              
					  <div class="card-body">

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="material-icons">face</i>
								</span>
							</div>
							<input type="text" placeholder="이름" id="name" class="form-control" required autofocus>
						</div>
            
            <div id=mailselect>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"> <i class="material-icons">face</i>
                </span>
              </div>
              <input type="text" placeholder="이메일" id="mail0" maxlength="50" class="form-control" required>@
            </div>
            
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"> <i class="material-icons">face</i>
                </span>
              </div>
              <input type="text" id="mail1" value="" class="form-control" required>
            </div>
            
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"> <i class="material-icons">face</i>
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
            
            <div class="text-center" id="email_check"></div>

						<div class="this-center">
							<div class="description">
								<button id="searchBtn" class="btn btn-primary">찾기</button>
							</div>
						</div>
					</div>
            
        </div>
      </div>
    </div>
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
            $('#email_check').text('이메일을 입력해주세요');
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
