package com.ast.eom.service;

import java.util.Map;

public interface PaymentService {
  Map<String, Object> prepareTeacherInfoMapWith() throws Exception;
  void updatePaymentInfo() throws Exception;
}
