package com.ast.eom.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.BoardFile;

@Component
public class FileWriter {
  
  String uploadDir;
  
  public FileWriter(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/board");
  }
  
  public List<BoardFile> getFiles(MultipartFile[] fileName) throws Exception {
    List<BoardFile> boardFiles = new ArrayList<>();
    for (MultipartFile file : fileName) {
      if (file.isEmpty())
        continue;
      // 클라이언트가 보낸 파일을 디스크에 저장한다.
      String filename = UUID.randomUUID().toString();
      System.out.println("====>filename: " + filename);
      file.transferTo(new File(uploadDir + "/" + filename));
      // 저장한 파일명을 PhotoFile에 보관한다.
      BoardFile boardFile = new BoardFile();
      boardFile.setFileName(filename);
      boardFiles.add(boardFile);
    }
    return boardFiles;
  }
}
