package com.ast.eom.service;

import java.util.Map;

public interface AdminService {
  Object loadMemberInfoMapOf(int memberTypeNo) throws Exception;
  Map<String, Object> getInfoMap(int memberNo, int memberTypeNo) throws Exception;
  
}
