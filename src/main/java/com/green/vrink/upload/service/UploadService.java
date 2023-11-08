package com.green.vrink.upload.service;

import com.green.vrink.user.dto.EditorDTO;

import java.util.List;

public interface UploadService {
    void imgRemove(List<String> images);
    List<String> removeExtractImages(EditorDTO editorDTO);

}
