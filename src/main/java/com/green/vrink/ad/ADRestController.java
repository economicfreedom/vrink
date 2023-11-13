package com.green.vrink.ad;

import com.green.vrink.upload.dto.UploadResponseDTO;
import com.green.vrink.upload.dto.UploadResultDTO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@Slf4j
public class ADRestController {


	private final static String uploadPath = Paths.get("src", "main", "resources", "static").toString();
    @PostMapping("/ad-upload")
    public ResponseEntity<?> upload(
        @RequestParam("uploadFiles") MultipartFile[] uploadFiles
      , @RequestParam("w") Integer w
      , @RequestParam("h") Integer h
      , @RequestParam("type") String type
      , @RequestParam("price") Integer price
      , @RequestParam("comName") String comName
      , @RequestParam("adPeriod") Integer adPeriod){
         List<UploadResultDTO> resultDTOList = new ArrayList<>();

        UploadResponseDTO uploadResponseDTO = null;
        for (MultipartFile uploadFile : uploadFiles) {
            if (!uploadFile.getContentType().startsWith("image")) {
                log.warn("this file is not image type");
                return new ResponseEntity<>(HttpStatus.FORBIDDEN);
            }

            // 실제 파일 이름 IE나 Edge는 전체 경로가 들어오므로
            String originalName = uploadFile.getOriginalFilename();
            String fileName = originalName
                    .substring(originalName.lastIndexOf("\\") + 1);
            log.info("fileName: {}", fileName);

            // 날짜 폴더 생성
            String folderPath = makeFolder(type);
            // UUID
            String uuid = UUID.randomUUID().toString();


            // 저장할 파일 이름 중간에 "_"를 이용해서 구분
            String saveName = uploadPath
                    + File.separator
                    + type
                    + File.separator
                    + folderPath
                    + File.separator
                    + uuid
                    + "_" + fileName;

            log.info("저장된 파일 경로 : {} ", saveName);
            Path savePath = Paths.get(saveName);
            uploadResponseDTO = null;
            try {
                //원본 파일 저장
                uploadFile.transferTo(savePath);
                //섬네일 생성
                String thumbnailSaveName = uploadPath + File.separator + type + File.separator + folderPath + File.separator
                        + "s_" + uuid + "_" + fileName;
                String thumbnailSaveDB = File.separator + type + File.separator + folderPath + File.separator
                        + "s_" + uuid + "_" + fileName;
                String saveNameDB = File.separator
                        + type
                        + File.separator
                        + folderPath
                        + File.separator
                        + uuid
                        + "_" + fileName;
                //섬네일 파일 이름은 중간에 s_로 시작하도록
                File thumbnailFile = new File(thumbnailSaveName);
                Thumbnailator.createThumbnail(savePath.toFile(), thumbnailFile
                        , w
                        , h);

                resultDTOList.add(new UploadResultDTO(fileName, uuid, folderPath));
                uploadResponseDTO = UploadResponseDTO.builder()
                        .uploadResultDTOList(resultDTOList)
                        .thumbnailURL(thumbnailSaveDB)
                        .originalURL(saveNameDB).build();

            } catch (IOException e) {
                e.printStackTrace();
            }

            String thumbnailURL = uploadResponseDTO.getThumbnailURL();

            ADUploadDTO thumbnail = ADUploadDTO.builder()
                    .adPeriod(adPeriod)
                    .price(price)
                    .comName(comName)
                    .thumbnail(thumbnailURL).build();




        } // end of for
        return ResponseEntity.ok().build();
    }
        private String makeFolder(String type) {

        String str = LocalDate.now()
                .format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));

        String folderPath = str.replace("/", File.separator);


        // make folder -------
        File uploadPathFolder = new File(uploadPath, type + "/" + folderPath);

        if (uploadPathFolder.exists() == false) {
            uploadPathFolder.mkdirs();
        }
        return folderPath;
    }
}
