<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/css/admin/list.css" rel="stylesheet" />

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>관리자 페이지</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="card card-nav-tabs">
    <div class="card-header card-header-primary">
      <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
      <div class="nav-tabs-navigation">
        <div class="nav-tabs-wrapper">
          <ul class="nav nav-tabs" data-tabs="tabs">
            <li class="nav-item">
              <a id="student-toggle-button" class="nav-link active show" href="#student" data-toggle="tab">
                <i class="material-icons">face</i> 학생
                <div class="ripple-container"></div></a>
            </li>
            <li class="nav-item">
              <a id="parents-toggle-button" class="nav-link" href="#parents" data-toggle="tab">
                <i class="material-icons">face</i> 학부모
                <div class="ripple-container"></div></a>
            </li>
            <li class="nav-item">
              <a id="teacher-toggle-button" class="nav-link" href="#teacher" data-toggle="tab">
                <i class="material-icons">face</i> 선생님
                <div class="ripple-container"></div></a>
            </li>
            <li class="nav-item">
              <a id="cancel-toggle-button" class="nav-link" href="#cancel" data-toggle="tab">
                <i class="material-icons">close</i> 중단요청
                <div class="ripple-container"></div></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="tab-content text-center">
        <div class="tab-pane active show" id="student">
          <div class="table-responsive">
            <table class='table table-hover'>
              <thead>
                <tr>
                  <th class="member-number">번호</th>
                  <th class="member-name">이름</th>
                  <th class="member-age">나이</th>
                  <th class="member-etc">비고</th>
                </tr>
              </thead>
              <tbody id="tbody-1"></tbody>
            </table>
          </div>
        </div>
        <div class="tab-pane" id="parents">
          <div class="table-responsive">
            <table class='table table-hover'>
              <thead>
                <tr>
                  <th class="member-number">번호</th>
                  <th class="member-name">이름</th>
                  <th class="member-age">나이</th>
                  <th class="member-etc">비고</th>
                </tr>
              </thead>
              <tbody id="tbody-2"></tbody>
            </table>
          </div>
        </div>
        <div class="tab-pane" id="teacher">
          <div class="table-responsive">
            <table class='table table-hover'>
              <thead>
                <tr>
                  <th class="member-number">번호</th>
                  <th class="member-name">이름</th>
                  <th class="member-age">나이</th>
                  <th class="member-etc">비고</th>
                </tr>
              </thead>
              <tbody id="tbody-3"></tbody>
            </table>
          </div>
        </div>
        <div class="tab-pane" id="cancel">
          <div class="table-responsive">
            <table class='table table-hover'>
              <thead>
                <tr>
                  <th class="member-number">번호</th>
                  <th class="member-name">이름</th>
                  <th class="member-age">나이</th>
                  <th class="member-etc">비고</th>
                </tr>
              </thead>
              <tbody id="tbody-99">
                <c:forEach begin="0" end="3">
                  <tr class="my-table-row">
                    <td>1</td>
                    <td>유관순</td>
                    <td>24세</td>
                    <td>한국대 졸업, 과외경력 20년</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/js/admin/category-controller.js"></script>
<script>
  let categoryController = new CategoryController();
  categoryController.init();
</script>