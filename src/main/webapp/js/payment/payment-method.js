class Payment {

  payByBankAccount(payerInfo) {
    // 계좌입금용 가맹점 식별코드
    IMP.init('imp86793240');

    // 계좌입금
    IMP.request_pay({
      pg: 'html5_inicis',
      pay_method: 'vbank',
      merchant_uid: 'merchant_' + new Date().getTime(),
      name: '엄과외 수업료',
      amount: payerInfo.fee,
      buyer_email: payerInfo.payerEmail,
      buyer_name: payerInfo.payerName,
      buyer_tel: payerInfo.payerTel,
      buyer_addr: '서울특별시 강남구 삼성동',
      buyer_postcode: '123-456',
      m_redirect_url: "https:google.com.au"
    }, function (rsp) {
      if (rsp.success) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        
      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
      }

      alert(msg);
      if (rsp.success)
        location.href = '/app/payment/success';
    });

  }
  payByCard(payerInfo) {
    // 카드결제용 가맹점 식별코드
    IMP.init('imp59311626');

    // 카드결제
    IMP.request_pay({
      pg: 'html5_inicis',
      pay_method: 'card',
      merchant_uid: 'merchant_' + new Date().getTime(),
      name: '엄과외 수업료',
      amount: payerInfo.fee,
      buyer_email: payerInfo.payerEmail,
      buyer_name: payerInfo.payerName,
      buyer_tel: payerInfo.payerTel,
      buyer_addr: '서울특별시 강남구 삼성동',
      buyer_postcode: '123-456',
      m_redirect_url: "https:google.com.au"
    }, function (rsp) {
      if (rsp.success) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
      }

      alert(msg);
      if (rsp.success)
        location.href = '/app/payment/success';
    });

  }
  payByKakaoPay(payerInfo) {
    // 카카오페이용 가맹점 식별코드
    IMP.init('imp99327234');

    // 카카오페이
    IMP.request_pay({
      pg: 'kakaopay',
      merchant_uid: 'merchant_' + new Date().getTime(),
      name: '엄과외 수업료',
      amount: payerInfo.fee,
      buyer_email: payerInfo.payerEmail,
      buyer_name: payerInfo.payerName,
      buyer_tel: payerInfo.payerTel,
      buyer_addr: '서울특별시 강남구 삼성동',
      buyer_postcode: '123-456',
      m_redirect_url: "https:google.com.au"
    }, function (rsp) {
      if (rsp.success) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
      }

      alert(msg);
      if (rsp.success)
        location.href = '/app/payment/success';
    });

  }

  execute(paymentMethodNo, payerInfo) {
    if (paymentMethodNo == 1) {
      this.payByBankAccount(payerInfo);

    } else if (paymentMethodNo == 2) {
      this.payByCard(payerInfo);

    } else if (paymentMethodNo == 3) {
      this.payByKakaoPay(payerInfo);

    }

  }
}
