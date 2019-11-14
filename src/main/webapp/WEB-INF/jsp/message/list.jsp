<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
</head>
<body>
<h2>쪽지 보내기</h2>
<i class="fas fa-bell" id="messageReadShowAll"> ${messageReadShowAll}개</i>

	<div id="showList">
	
   <c:forEach var="messageReadList" items="${messageReadList}">
     <i class='far fa-bell'> ${messageReadList}</i>
   </c:forEach><br>
   
	  <c:forEach var="messageMem" items="${messageMem}">
		   <c:choose>
	       <c:when test="${loginUser.name eq messageMem.name}">
	         <a href=detail?memberNo=${messageMem.memberNo}>나에게 쪽지</a><br>
	       </c:when>
	       
	       <c:otherwise>
	         <a href=detail?memberNo=${messageMem.memberNo}>${messageMem.name}</a><br>
	       </c:otherwise>
	     </c:choose>
   </c:forEach>
   
	</div>
	
</body>
</html>