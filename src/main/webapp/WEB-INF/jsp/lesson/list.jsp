<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<style>
</style>
</head>
 
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/bg3.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h1>Your title here</h1>
            <h3 class="title text-center">Subtitle</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <div class="section text-center">

<h1 style="font-family: 'Nanum Gothic';">수업 리스트</h1>
<c:forEach items="${lessons}" var="lesson">

  <div class="card">
  <div class="row no-gutters">
    <c:choose>
    <c:when test="${lesson.member.memberTypeNo eq 3}">
     <div class="col-md-3"> 
      <img src="<%=request.getContextPath()%>/upload/join/${lesson.member.profilePhoto}" alt="Raised Image" class="img-raised rounded img-fluid">
     </div> 
     </c:when>
      <c:otherwise> <img src="<%=request.getContextPath()%>/upload/join/${lesson.member.profilePhoto}"  class="card-img-top img-fluid" style="display:none;"> </c:otherwise>
    </c:choose>
    <div style="font-family: 'Nanum Gothic';" class="card-body">
      <h5 style="font-family: 'Nanum Gothic';" class="card-title">수업번호: ${lesson.lessonNo} </h5>
      <p class="card-text">
      <c:choose> 
      <c:when test="${lesson.member.name eq NULL}"> <td>이름: 미정<br></td> </c:when>
      <c:otherwise> <td>이름: ${lesson.member.name}<br></td> </c:otherwise>
      </c:choose>
              수업과목:
      <c:choose>
      <c:when test="${lesson.subject.schoolTypeNo eq 1}">
                  초등
      </c:when>
      <c:when test="${lesson.subject.schoolTypeNo eq 2}">
                  중등
      </c:when>
      <c:when test="${lesson.subject.schoolTypeNo eq 3}">
                  고등
      </c:when>
      <c:otherwise> 
      </c:otherwise>
      </c:choose>
       ${lesson.subjectName}<br>
            시작일: ${lesson.startDate}&ensp;종료일: ${lesson.endDate}
      </p>
<!--       <a href="detail.jsp"  class="btn btn-primary">상세보기</a> -->
       <a href="detail?lessonNo=${lesson.lessonNo}" class="btn btn-primary">상세보기</a> 
      </div>
    </div>
  </div>
</c:forEach>

      </div>
    </div>
  </div>
