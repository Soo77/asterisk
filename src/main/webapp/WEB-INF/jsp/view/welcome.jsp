<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript">
	console.log("dd");
	swal({
	    title: "인증 완료",
	    text: "로그인이 가능합니다",
	    icon: "success",
	    button: "로그인",
	  })
	  .then(() => {
	    location.href = '/app/auth/form';
	  });
</script>
</head>
<body>
  <h1>가입을 환영합니다.</h1>
</body>
</html>