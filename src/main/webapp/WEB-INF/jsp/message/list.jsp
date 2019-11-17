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
	<i class="fas fa-bell" id="messageReadShowAll">
		${messageReadShowAll}개</i>

	<div id="showList">

		<c:if test="${messageListSize ne 0}">
			<c:forEach begin="0" end="${messageListSize-1}" var="i">
				<c:choose>
					<c:when test="${messageReadList[i] ne 0}">
						<c:set var="bell"
							value="<i class='far fa-bell'> ${messageReadList[i]}</i>"></c:set>
					</c:when>

					<c:otherwise>
						<c:set var="bell" value=""></c:set>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${loginUser.name eq messageMem[i].name}">
						<a href=detail?memberNo=${messageMem[i].memberNo}>나에게 쪽지</a>
						<br>
					</c:when>

					<c:otherwise>
						<a href=detail?memberNo=${messageMem[i].memberNo}>${messageMem[i].name}</a>
					${bell}
					<br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>

	</div>

</body>
</html>