package com.ast.eom.dao;

import com.ast.eom.domain.TeacherPhoto;

public interface TeacherPhotoDao {
  int eraseAllPhotosInAdvanceRelatedTo(int teacherNo);
  int insert(TeacherPhoto teacherPhoto);
  
}
