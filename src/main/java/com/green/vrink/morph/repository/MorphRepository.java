package com.green.vrink.morph.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MorphRepository {

    String findByEditorId(Integer editorId);

}
