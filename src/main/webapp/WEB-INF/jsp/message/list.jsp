<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

.ms-pd{
  padding-top: 5px;
  padding-bottom: 0px;
}

</style>
</head>
<body style="background-color: #FFF;">

  <div class="card-header d-flex justify-content-between p-2">
	<h2>쪽지 목록</h2>
	<div style="margin-top:60px; text-align: right;">
		<i class="fas fa-bell" id="messageReadShowAll"> ${messageReadShowAll}</i>
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

				<c:set var="messageContsSub" value="${messageContsDate[i].messageContents}"></c:set>
        <c:set var="messageContsReplace" value="${fn:replace(messageContsSub,'<br>', '')}"></c:set>
				<c:set var="messageConts" value="${fn:length(messageContsReplace)}"></c:set>
				<c:choose>
					<c:when test="${loginUser.name eq messageMem[i].name}">
					<img class="avatar" onError="javascript:src='/upload/join/default.png'"
        alt="" src="/upload/join/${messageInfo[i].profilePhoto}">
						<a href=detail?memberNo=${messageMem[i].memberNo}>
							<div class="message ms-pd">
							  <div style="color: black; display: block;">나에게 쪽지</div>
							  <h6 style="color: gray; display: inline-block;">
							    <c:choose>
									  <c:when test="${messageConts ge 25}">
		  							  <c:set var="messageContsResult" value="${fn:substring(messageContsReplace,0,25)}"></c:set>
									    ${messageContsResult}..
									  </c:when>
									  <c:otherwise>
									    ${messageContsSub}
									  </c:otherwise>
								  </c:choose>
								</h6>
							  <div class="datetime"><h6>${messageContsDate[i].sendDate}</h6></div>
							</div>
						</a>
					</c:when>

					<c:otherwise>
	  				<img class="avatar" src="/upload/join/${messageMem[i].profilePhoto}">
	  				<a href=detail?memberNo=${messageMem[i].memberNo}>
							<div class="message ms-pd">
								<div style="color: black; display: block;">${messageMem[i].name}</div>
							  ${bell}
							  <h6 style="color: gray; display: inline-block;">
							    <c:choose>
								    <c:when test="${messageConts ge 20}">
		                  <c:set var="messageContsResult" value="${fn:substring(messageContsReplace,0,25)}"></c:set>
		                  ${messageContsResult}..
		                </c:when>
		                <c:otherwise>
		                  ${messageContsSub}
		                </c:otherwise>
	                </c:choose>
	              </h6>
							  <div class="datetime"><h6>${messageContsDate[i].sendDate}</h6></div>
							</div>
						</a>
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