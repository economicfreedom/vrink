package com.green.vrink.ad;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ADUploadDTO {

    private String thumbnail;
    private String type;
    private Integer price;
    private String comName;
    private Integer adPeriod;

}
