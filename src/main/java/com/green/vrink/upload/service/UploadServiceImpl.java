package com.green.vrink.upload.service;

import com.green.vrink.user.dto.EditorDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class UploadServiceImpl implements UploadService {
//    @Value("${org.zerock.upload.path}")
//    @Value("${org.zerock.upload.path}")

    private final static String path = Paths.get("src", "main", "resources", "static").toString();
    ;
    private static final String USER_DIR = System.getProperty("user.dir");

    @Override
    public void imgRemove(List<String> images) {
        for (int i = 0; i < images.size(); i++) {

            String path = USER_DIR+"\\" + this.path + images.get(i);
            log.info("삭제 파일 경로 : {}", path);
            File file = new File(path);
            if (file.exists()) {
                file.delete();
            } else {
                log.info((i + 1) + "번 째 파일이 존재 하지 않습니다.");
            }
        }


    }

    @Override
    public List<String> removeExtractImages(EditorDTO editorDTO) {
        List<String> delImages = new ArrayList<>();
        if(editorDTO.getDelImage() != null) {
            if(editorDTO.getDelImage() != null) {
                for(int i = 0; i<editorDTO.getDelImage().length; i++) {
                    if(!editorDTO.getDelImage()[i].split("/")[editorDTO.getDelImage()[i].split("/").length-1].equals("no_face.png") ||
                            !editorDTO.getDelImage()[i].split("/")[editorDTO.getDelImage()[i].split("/").length-1].equals("default_image.gif")) {
                        delImages.add(editorDTO.getDelImage()[i].replace("/","\\"));
                    }
                }
            }
        }
        return delImages;
    }
}