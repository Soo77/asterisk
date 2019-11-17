<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

  <style>
    #title {
      font-weight: bold;
    }
    #addReview {
      text-align: right;
    }
  </style>
  
</head>

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>후기 작성</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
      <input type="text" name="lessonNo" value="${lessonNo}">
      
      <c:if test="${memberTypeNo == 1}">
        <h4 id="title">선생님에 대한 평가를 들려주세요</h4>
      </c:if>
      <c:if test="${memberTypeNo == 3}">
        <h4 id="title">학생에 대한 평가를 들려주세요</h4>
      </c:if>
      <hr>
      
      <form id="form1" action="review" method=post>
        <div>
          <textarea name="stopReason" id="stopReason" class="form-control" rows="20" placeholder="후기를 입력하세요."></textarea>
        </div>
      </form>
      
      <div id="addReview">
        <button type="button" id="btnAdd" class="btn btn-primary" name="addReview">등록</button>
      </div>
    
  </div>
</div>



