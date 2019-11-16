<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  /* * {
    border: 1px solid powderblue;
  } */

  .my-container {
    padding: 20px;
  }

  .my-payment-content {
    width: 450px;
    padding: 20px;
    float: left;
    flex-basis: 60%;
  }

  .my-sidebar-right {
    width: 160px;
    padding: 20px;
    float: right;
    flex-basis: 40%;
  }

  .payer-info {
    border: 1px solid #d2d2d2;
    border-radius: 0.35rem;
    margin: 20px 0;
  }

  .payment-method {
    border: 1px solid #d2d2d2;
    border-radius: 0.35rem;
    margin: 20px 0;
  }

  .payment-amount {
    border: 1px solid #d2d2d2;
    border-radius: 0.35rem;
    margin: 20px 0;
  }

  .teacher-info {
    border: 1px solid #d2d2d2;
    border-radius: 0.35rem;
    margin: 20px 0;
    padding-bottom: 33px;
  }

  .teacher-profile-photo {
    width: 150px;
    height: 150px;
  }
  h3,h4 {
    color: #3C4858;
  }
  p {
    color: #AAAAAA;
  }
</style>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>과외비 결제</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container">
    <form>
      <div class="row">
        <div class="col my-container d-flex">
          <div class="my-payment-content mx-3">
            <div class="payer-info px-3 pb-3">
              <h3>결제 고객</h3>
              <div class="form-group bmd-form-group">
                <label for="name" class="bmd-label-static">이름</label>
                <input type="text" class="form-control" id="name" name="name">
              </div>
              <div class="form-group bmd-form-group">
                <label for="tel" class="bmd-label-static">연락처</label>
                <input type="text" class="form-control" id="tel" aria-describedby="tel" name="tel">
                <small id="tel" class="form-text text-muted">11자리의 숫자를 '-' 없이 입력하세요</small>
              </div>
              <div class="form-group bmd-form-group">
                <label for="inputEmail" class="bmd-label-static">이메일</label>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" id="inputEmail" name="email1">
                  </div>
                  <div class="col">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">@</div>
                      </div>
                      <input type="text" class="form-control" id="inputEmail2" name="email2">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="payment-method px-3 pb-3">
              <h3>결제방법</h3>
              <div class="form-check form-check-radio">
                <label class="form-check-label">
                  <input class="form-check-input" type="radio" name="paymentMethod" id="payment-method-radio"
                    value="bank" checked="">
                  실시간 계좌이체
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-radio">
                <label class="form-check-label">
                  <input class="form-check-input" type="radio" name="paymentMethod" id="payment-method-radi"
                    value="card">
                  카드 결제
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-radio">
                <label class="form-check-label">
                  <input class="form-check-input" type="radio" name="paymentMethod" id="payment-method-radi"
                    value="kakao">
                  카카오 페이
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            </div>
          </div>
          <div class="my-sidebar-right">
            <div class="payment-amount px-3 pb-3">
              <h3>결제 금액</h3>
              <div class="form-group bmd-form-group">
                <label for="name" class="bmd-label-static">수업료</label>
                <input type="text" class="form-control" id="lesson-fee" name="lessonFee" value="200,000원" readonly>
              </div>
              <div class="form-group bmd-form-group">
                <label for="name" class="bmd-label-static">수업기간</label>
                <input type="text" class="form-control" id="lesson-months" name="lessonMonths" value="1달" readonly>
              </div>
              <hr>
              <p class="text-right">200,000원</p>
            </div>
            <div class="teacher-info px-3">
              <h3>강사정보</h3>
              <div class="row">
                <div class="col">
                  <img src="/upload/join/a.gif" class="img-fluid teacher-profile-photo">
                </div>
                <div class="col">
                  <h4>엄선생님</h4>
                  <p>비트대학교 졸업</p>
                  <p>비트교육센터 강사</p>
                </div>
              </div>
            </div>
            <div class="text-right">
              <button type="button" class="btn btn-primary">결제하기</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>