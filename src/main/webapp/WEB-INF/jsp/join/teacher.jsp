<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 화면</title>
<script type="text/JavaScript"
  src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            
            if(!document.userInfo.filePath.value){
                alert("프로필 사진을 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.okpw.value){
                alert("비밀번호 확인을 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.name.value){
              alert("이름을 입력하세요.");
              return false;
            }
            
            if(!document.userInfo.email.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.gender.value){
              alert("성별을 선택하세요.");
              return false;
            }
            
            if(isNaN(form.birthyy.value)) {
              alert("년도는 숫자만 입력가능합니다.");
              return false;
            }
        }
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goLoginForm() {
            location.href="../board/list.jsp";
        }
    </script>
<style>
#view_file {
	display: none;
}

#mail {
  display: none;
}
</style>
</head>
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">선생님 회원가입</font></b> <br>
		<br> <br>

		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="join" name="userInfo"
			enctype="multipart/form-data" onsubmit="return checkValue()">

			프로필 사진: <input type='file' id='filePath' name='filePath'>
			<img id="view_file" src="#" width="400px" height="200px" />

			<table>
				<tr>
					<td id="title">회원구분</td>
					<td><select name="memberTypeNo">
					<option value="" selected disabled>회원 구분</option>
							<option value="3">teacher</option>
					</select>
				</tr>


				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" id="id" maxlength="50">
						<div id="id_check"></div></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" id="pw"
						maxlength="50" class="pwchange"></td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="okpw" id="okpw"
						maxlength="50" class="pwchange">
						<div id="pw_check"></div></td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" id="name" maxlength="50"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="M" checked>남 <input
						type="radio" name="gender" value="F">여</td>
				</tr>

				<tr>
          <td id="title">생년월일</td>
          <td>
            <select name="birthyy" id="YEAR" title="년도" class="select w80"></select> 
            <select name="birthmm" id="MONTH" title="월" class="select w80"></select>
            <select name="birthdd" id="DAY" title="일" class="select w80"></select>
          </td>
        </tr>

				<tr>
					<td id="title">이메일</td>
					<td>
					<div id=mailselect>
					<input type="text" name="email" id="email" maxlength="50">@
						<input type="text" name="mail" id="mail" value="">
						<select name="mail2" id="mail2">
						  <option selected disabled>메일 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="">직접 입력</option>
					</select>
					</div>
					<div id="email_check"></div></td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="tel" id="tel"/>
					<div id="tel_check"></div></td>
				</tr>

			</table>
			
			<input type="text" name="addressCity" id="sido"placeholder="주소">
			<input type="text" name="addressSuburb" id="sigungu"placeholder="상세주소">
			<input type="button" onclick="execDaumPostcode()" value="주소 찾기"><br><br>
			
			고등학교명
			<input type="text"><br>
			대학교명
      <input type="text"><br>
            전공
      <input type="text"><br>
      
            과외 신고서
      <input type='file'>
<!--       <img id="view_file" src="#" width="400px" height="200px" /> -->
      <br>
      
            전문 과목
      <select name="subject">
         <optgroup label="초등학교">
           <option value="수학">수학</option>
           <option value="영어">영어</option>
         </optgroup>
         <optgroup label="중학교">
           <option value="수학">수학</option>
           <option value="영어">영어</option>
         </optgroup>
         <optgroup label="고등학교">
           <option value="수학">수학</option>
           <option value="영어">영어</option>
         </optgroup>
      </select><br>
      
            과외 가능 요일
      <input type="checkbox">일<input type="checkbox">월<input type="checkbox">화
      <input type="checkbox">수<input type="checkbox">목<input type="checkbox">금
      <input type="checkbox">토<br>
      
            과외 가능 시간
      <select>
         <option>12:00</option>
         <option>13:00</option>
         <option>14:00</option>
      </select>
      ~
      <select>
         <option>15:00</option>
         <option>16:00</option>
         <option>17:00</option>
      </select><br>
      
            수업료
      <input type="text">만원<br>
      
            은행명/계좌번호
      <select>
         <option>국민은행</option>
         <option>신한은행</option>
      </select>
      
            자기소개<br>
      <textarea rows="10" cols="30"></textarea><br>
			
			<button type="submit" id="submit">가입</button>
			<input id="cancelbtn" type="button" value="취소">

		</form>
	</div>
	
<!-- 	생년월일 -->
	<script>
    $(document).ready(function(){
        setDateBox();
    });    
 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-118); y <= (com_year); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
            $("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }
        
        var day;
        $("#DAY").append("<option value=''>일</option>");
        for(var i = 1; i <= 31; i++){
            $("#DAY").append("<option value='"+ i +"'>"+ i + " 일" +"</option>");
        }
    }
	</script>

  <!-- 취소 -->
	<script>
    var cbtn = document.querySelector("#cancelbtn");
    cbtn.addEventListener("click", function(){
      location.href = "../board/list";
    });
    
  </script>

	<!-- 다음 우편 API -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sido').value = data.sido;
                document.getElementById('sigungu').value = data.sigungu;
            }
        }).open();
    }
</script>

	<!-- 프로필 사진 -->
	<script>
    $("#filePath").change(function() {
    	  var input = document.getElementById("filePath");
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#view_file').attr('src', e.target.result);
                }
            reader.readAsDataURL(input.files[0]);
        }
        var dp = document.getElementById("view_file");
        dp.style.display = "block";
        
    });
	 </script>

	<!-- 아이디 유효성 검사(1 = 중복 / 0 != 중복) -->
	<script>
  $("#id").blur(function() {
    var id = $('#id').val();
    $.ajax({
      url : 'idCheck',
      type : 'get',
      data : "id="+id,
      success : function(result) {
        if (result == 1) {
            $("#id_check").text("사용중인 아이디입니당");
            $("#id_check").css("color", "red");
            $("#id").css("color", "red");
            $("#submit").attr("disabled", true);
          } else {
            if(id){
              $("#id_check").text("사용 가능한 아이디입니당");
              $("#id_check").css("color", "green");
              $("#id").css("color", "green");
              $("#submit").attr("disabled", false);
            } else if(id == ""){
              $('#id_check').text('아이디를 입력해주세요 :)');
              $('#id_check').css('color', 'red');
              $("#submit").attr("disabled", true);
            }
          }
        }, error : function() {
            console.log("실패");
        }
      });
    });
</script>

	<!-- 비밀번호 확인 -->
	<script>
  $(".pwchange").blur(function() {
        var pw = document.getElementById("pw").value;
        var okpw = document.getElementById("okpw").value;
        
        if (pw != okpw) {
            $("#pw_check").text("비밀번호가 틀립니다");
            $("#pw_check").css("color", "red");
            $("#okpw").css("color", "red");
            $("#submit").attr("disabled", true);
        } else if(okpw == ""){
              $('#pw_check').text('비밀번호를 입력해주세요 :)');
              $('#pw_check').css('color', 'red');
              $("#submit").attr("disabled", true);        
          } else {
              $("#pw_check").text("비밀번호가 일치합니당");
              $("#pw_check").css("color", "green");
              $("#okpw").css("color", "green");
              $("#submit").attr("disabled", false);
            }
    });
    </script>

<!--   이메일 확인 -->
  <script>
  $("#mailselect").change(function() {
	    var dp = document.getElementById("mail");
	    dp.style.display = "block";
	    
	    var email = $('#email').val();
	    var mail = $('#mail').val();
	    var addmail = email+'@'+mail;
	    
	    if(mail == ""){
	    	dp.readOnly = false;
	    	$('#email_check').text('이메일을 입력해주세요 :)');
        $('#email_check').css('color', 'red');
        $("#submit").attr("disabled", true);
	    	return false;
	    } else {
	    	dp.readOnly = true;
		    $.ajax({
		      url : 'emailCheck',
		      type : 'get',
		      data : "email="+addmail,
		      success : function(result) {
		        if (result == 1) {
		            $("#email_check").text("사용중인 이메일입니당");
		            $("#email_check").css("color", "red");
		            $("#email").css("color", "red");
		            $("#mail").css("color", "red");
		            $("#submit").attr("disabled", true);
		          } else {
		            if(email){
		              $("#email_check").text("사용 가능한 이메일입니당");
		              $("#email_check").css("color", "green");
		              $("#email").css("color", "green");
		              $("#mail").css("color", "green");
		              $("#submit").attr("disabled", false);
		            } else if(email == ""){
		              $('#email_check').text('이메일을 입력해주세요 :)');
		              $('#email_check').css('color', 'red');
		              $("#submit").attr("disabled", true);
		            }
		          }
		        }, error : function() {
		            console.log("실패");
		        }
		      });
		    }
	    });
  </script>
  
<!--     메일 선택 -->
  <script>
  $("#mail2").change(function() {
      document.getElementById("mail").value = document.getElementById("mail2").value;
      });
  </script>

<!--   휴대전화 중복 -->
  <script>
  $("#tel").blur(function() {
    var tel = $('#tel').val();
    $.ajax({
      url : 'telCheck',
      type : 'get',
      data : "tel="+tel,
      success : function(result) {
        if (result == 1) {
            $("#tel_check").text("사용중인 번호입니당");
            $("#tel_check").css("color", "red");
            $("#tel").css("color", "red");
            $("#submit").attr("disabled", true);
          } else {
            if(id){
              $("#tel_check").text("가입 가능한 번호입니당");
              $("#tel_check").css("color", "green");
              $("#tel").css("color", "green");
              $("#submit").attr("disabled", false);
            } else if(id == ""){
              $('#tel_check').text('번호 입력해주세요 :)');
              $('#tel_check').css('color', 'red');
              $("#submit").attr("disabled", true);
            }
          }
        }, error : function() {
            console.log("실패");
        }
      });
    });
    </script>
<!-- <script src="/node_modules/jquery/dist/jquery.min.js"></script> -->
</body>
</html>