package com.green.vrink.util;

public interface Converter<DTO,Entity> {

    public DTO toDTO(Entity entity);
    public Entity toEntity(DTO dto);



}
