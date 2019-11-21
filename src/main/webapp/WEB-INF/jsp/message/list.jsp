<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<style>

#showList {
  background-color: white;
	width: auto;
	heigh: auto;
	border: solid 1px #ccc;
}

.message {
	border-bottom: solid 1px #ccc;
	padding: 20px;
}

.avatar {
  border-radius: 30px;
  width: 50px;
  height: 50px;
	float: left;
  margin: 7px 10px 0px 10px;
}

.datetime {
	float: right;
	color: #999;
}
</style>
</head>
<body>

  <div class="card-header d-flex justify-content-between p-2" style="background-color: #FFFFFF;">
	<h2>쪽지 목록</h2>
	<div style="margin-top:60px; text-align: right;">
		<b>알림&ensp;</b>
		<i class="fas fa-bell" id="messageReadShowAll"> ${messageReadShowAll}개</i>
	</div>
	</div>

	<div id="showList">
	
	<c:choose>
		<c:when test="${messageListSize ne 0}">
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
					<img class="avatar" onError="javascript:src='/upload/join/default.png'"
        alt="" src="/upload/join/${messageInfo[i].profilePhoto}">
						<div class="message">
						  <a href=detail?memberNo=${messageMem[i].memberNo}>나에게 쪽지</a>
<!-- 						  <h6 style="color: gray; display: inline-block;"> -->
<%-- 						  ${messageContsDate[i].messageContents}</h6> --%>
<%-- 						  <div class="datetime">${messageContsDate[i].sendDate}</div> --%>
						</div>
					</c:when>

					<c:otherwise>
	  				<img class="avatar" src="/upload/join/${messageMem[i].profilePhoto}">
						<div class="message">
							<a href=detail?memberNo=${messageMem[i].memberNo}>${messageMem[i].name}</a>
						  ${bell}
<!-- 						  <h6 style="color: gray; display: inline-block;"> -->
<%-- 						  ${messageContsDate[i].messageContents}</h6> --%>
<%-- 						  <div class="datetime">${messageContsDate[i].sendDate}</div> --%>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
		
			<c:otherwise>
	      <h4>쪽지를 보낸 사람이 없습니다</h4>
	    </c:otherwise>
    </c:choose>

	</div>

</body>
</html>