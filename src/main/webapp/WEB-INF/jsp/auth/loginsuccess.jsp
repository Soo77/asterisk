<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인창</title>
</head>
<body>
<div>
<c:if test="${empty loginUser}">
  <a href='/app/auth/form' class='btn btn-outline-dark btn-sm'>로그인</a>
</c:if>
<c:if test="${not empty loginUser}">
    내 아이디는 ${loginUser.id}입니당
  <a href='/app/auth/logout' class='btn btn-outline-dark btn-sm'>로그아웃</a>
</c:if>
  </div>
</body>
</html>