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
      String filename = UUID.randomUUID().toString();
      file.transferTo(new File(uploadDir + "/" + filename));
      BoardFile boardFile = new BoardFile();
      boardFile.setFileName(filename);
      boardFiles.add(boardFile);
    }
    return boardFiles;
  }
}
