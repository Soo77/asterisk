<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 폼</title>
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
	crossorigin='anonymous'>
	<script type="text/JavaScript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>

	<div id='content'>
		<h1>로그인 폼</h1>
		<form action='login' method='post'>
			아이디:<input type='text' id='id' name='id' value=''><br>
			암호:<input type='password' name=pw><br>
			<input type="checkbox" id="idmemory">아이디 기억
			<button>로그인</button>
		</form>
		<a href="../auth/find">찾기</a>
	</div>

<!--   아이디 기억 -->
	<script>

		$(document).ready(function(){
		var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
		var eq = document.getElementById("id");
		eq.value = userInputId; 
     
    if(document.getElementById("id").val != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idmemory").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }	

			document.getElementById("idmemory").onchange = function() { // 체크박스에 변화가 있다면,
        if($("#idmemory").is(":checked")) { // ID 저장하기 체크했을 때,
					var userInputId = document.getElementById("id").val;
					console.log(document.getElementById("id").val);
					setCookie("userInputId", userInputId, 5);
        }else{ // ID 저장하기 체크 해제 시,
          deleteCookie("userInputId");
        }
			};

			// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idmemory").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 5); // 7일 동안 쿠키 보관
        }
    });

		});

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

	</script>

</body>
</html>
