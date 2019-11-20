<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
  swal({
    title: "이메일 미인증 유저",
    text: "먼저 이메일 인증을 완료하여 주세요!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonClass: "btn-danger",
    closeOnConfirm: false
  })
  .then(() => {
    location.href = '/app/auth/loginFailRedirect';
  });
</script>