package com.green.vrink.suggest.repository.model;

import lombok.Data;

@Data
public class Suggest {
    private int suggestId;
    private int userId;
    private String title;
    private String content;
    private String createdAt;

    public void patchSuggest(String title, String content) {
        this.title = title;
        this.content = content;
    }
}
