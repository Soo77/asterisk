<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/css/payment/detail.css" rel="stylesheet" />

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/payment/bg4.jpg')">
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
            <div class="payment-method px-3">
              <h3>결제방법</h3>
              <div class="form-check form-check-radio">
                <label class="form-check-label">
                  <input class="form-check-input" type="radio" name="paymentMethod" id="payment-method-radio" value="1"
                    checked="">
                  실시간 계좌이체
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-radio">
                <label class="form-check-label">
                  <input class="form-check-input" type="radio" name="paymentMethod" id="payment-method-radi" value="2">
                  카드 결제
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-radio">
                <label class="form-check-label">
                  <input class="form-check-input" type="radio" name="paymentMethod" id="payment-method-radi" value="3">
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
                <div class="d-flex">
                  <div class="flex-item" style="flex-basis: 95%;">
                    <input type="text" class="form-control text-right pr-2" id="lesson-fee" name="lessonFee" value="${lessonFee}" readonly>
                  </div>
                  <div class="flex-item align-self-center pl-1" style="flex-basis: 5%;">
                    <span>원</span>
                  </div>
                </div>
              </div>
              <div class="form-group bmd-form-group">
                <label for="lesson-months" class="bmd-label-static">수업기간</label>
                <div class="d-flex">
                  <div class="flex-item" style="flex-basis: 95%;">
                    <select class="form-control selectpicker pr-2" data-style="btn btn-link"
                      id="lesson-months" name="lessonMonths" style="direction:rtl;">
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="0.001">테스트용 가격</option>
                    </select>
                  </div>
                  <div class="flex-item align-self-center pl-1" style="flex-basis: 5%;">
                    <span>달</span>
                  </div>
                </div>
              </div>
              <hr>
              <p id="lesson-fee-sum"class="text-right">${lessonFee}</p>
            </div>
            <div class="teacher-info px-3 pb-3">
              <h3>강사정보</h3>
              <div class="row">
                <div class="col">
                  <img src="/upload/join/${teacherInfoMap.member.profilePhoto}" class="img-fluid teacher-profile-photo">
                </div>
                <div class="col">
                  <h4>${teacherInfoMap.member.name}</h4>
                  <p class="teacher-school">
                    ${teacherInfoMap.teacher.schools[1].schoolName}
                  </p>
                  <p class="teacher-major">
                      ${teacherInfoMap.teacher.schools[1].major} 전공
                  </p>
                </div>
              </div>
            </div>
            <div class="text-right">
              <button type="button" class="btn btn-primary payment-button">결제하기</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- 페이지 로딩 시 결제금액 출력 -->
<script src="/js/payment/number-formatter.js"></script>
<script>
  let myLessonFee = numberFormat(${lessonFee});
  document.getElementById('lesson-fee').value = myLessonFee;
  document.getElementById('lesson-fee-sum').innerHTML = myLessonFee+' 원';
  console.log('${lessonInfoForPayment}');
</script>

<!-- 결제 금액을 변경하면 합계에 반영 -->
<script>
  let lessonMonthOption = document.getElementById('lesson-months');
  let lessonFeeSum = document.getElementById('lesson-fee-sum');
  lessonMonthOption.addEventListener('change', () => {
    lessonFeeSum.innerHTML = numberFormat(${lessonFee} * lessonMonthOption.value) + ' 원';
  });
</script>

<!-- 결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/js/payment/payment-method.js"></script>
<script>
  let paymentButton = document.getElementsByClassName('payment-button')[0];
  let payment = new Payment();
  
  paymentButton.addEventListener('click', () => {
    let paymentMethodNo = document.querySelector('input[name="paymentMethod"]:checked').value;
    let lessonFeeForPayment = (${lessonFee} * lessonMonthOption.value);

//     if (lessonFeeForPayment < ${lessonFee}) {
//       swal({
//         title: "오류 발생",
//         text: "결제 금액을 다시 한번 확인해주세요!",
//         confirmButtonClass: "btn-danger",
//         icon: "warning"
//       });
//       return;
//     }

    let payerInfo = {
      'payerName': document.getElementById('name').value,
      'payerTel': document.getElementById('tel').value,
      'payerEmail': document.getElementById('inputEmail').value + '@'
        + document.getElementById('inputEmail2').value,
      'fee': lessonFeeForPayment
    }
    payment.execute(paymentMethodNo, payerInfo);
  });
</script>
