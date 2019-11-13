package com.ast.eom.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.ast.eom.dao.TeacherPhotoDao;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.TeacherPhoto;

@Controller
public class MypagePhotoWriter {
  
  Member member;

  @Autowired
  TeacherPhotoDao teacherPhotoDao;
  
  String profileUploadDir;
  String teacherPhotosUploadDir;
  
  
  public MypagePhotoWriter(ServletContext sc) {
    profileUploadDir = sc.getRealPath("/upload/join");
    teacherPhotosUploadDir = sc.getRealPath("/upload/teacher_photo");
  }
  
  public void upload(
      MultipartFile profilePhoto,
      MultipartFile[] teacherPhotoFiles,
      String[] teacherPhotoNames,
      Member member, HttpSession session) throws Exception {
    
    this.member = member;
    
    uploadProfilePhoto(profilePhoto);
    if (member.getMemberTypeNo() == 3) {
      uploadTeacherPhotos(teacherPhotoFiles, teacherPhotoNames, session);
      
    }
  }
  
  private void uploadProfilePhoto(MultipartFile profilePhoto) throws Exception {
    // 프로필 사진 업로드 구현 완료
    if (!profilePhoto.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      profilePhoto.transferTo(new File(profileUploadDir +"/"+ filename));
      
      member.setProfilePhoto(filename);
    }
  }

  private void uploadTeacherPhotos(
      MultipartFile[] teacherPhotoFiles,
      String[] teacherPhotoNames,
      HttpSession session) throws Exception {
    
    if (teacherPhotoFiles == null)
      return;
    
    int teacherNo = member.getMemberNo();
    teacherPhotoDao.eraseAllPhotosInAdvanceRelatedTo(teacherNo);
    
    for (int i = 0; i < teacherPhotoFiles.length; i++) {
      TeacherPhoto teacherPhoto = new TeacherPhoto();
      teacherPhoto.setTeacherNo(teacherNo);
      
      if (teacherPhotoFiles[i].isEmpty()) {
        teacherPhoto.setTeacherPhoto(teacherPhotoNames[i]);
        teacherPhotoDao.insert(teacherPhoto);
        continue;
      }
      
      String filename = UUID.randomUUID().toString();
      teacherPhotoFiles[i].transferTo(new File(teacherPhotosUploadDir + "/" + filename));
      
      teacherPhoto.setTeacherPhoto(filename);
      teacherPhotoDao.insert(teacherPhoto);
    }
    
  }



}
