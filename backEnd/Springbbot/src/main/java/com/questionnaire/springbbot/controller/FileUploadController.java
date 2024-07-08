package com.questionnaire.springbbot.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class FileUploadController {
    private static final String UPLOADED_FOLDER = System.getProperty("user.dir") + "/upload";

    @PostMapping("/up")
    public String uploadFile(String Name, MultipartFile file) throws IOException {
        System.out.println( "文件大小:" + file.getSize() );
        System.out.println( file.getContentType() );
        System.out.println( file.getOriginalFilename() );
        System.out.println( System.getProperty("user.dir") );
        saveFile(file);
        return "Success";
    }

    public void saveFile(MultipartFile file) throws IOException {
        File upDir = new File(UPLOADED_FOLDER);
        if ( !upDir.exists() ){
            upDir.mkdir();
        }
        File file1 = new File(UPLOADED_FOLDER + file.getOriginalFilename());
        file.transferTo(file1);
    }
}
