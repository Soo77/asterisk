<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>가입 인증</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
	if(${checkKey} == true){
		swal({
      title: "이미 인증이 되었습니다",
      text: "로그인이 가능합니다",
      icon: "warning",
      button: "로그인",
    })
    .then(() => {
      location.href = '/app/auth/form';
    });
	} else{
			swal({
			    title: "인증 완료",
			    text: "로그인이 가능합니다",
			    icon: "success",
			    button: "로그인",
			})
			.then(() => {
			  location.href = '/app/auth/form';
			});
	  }
	</script>
</body>
</html>