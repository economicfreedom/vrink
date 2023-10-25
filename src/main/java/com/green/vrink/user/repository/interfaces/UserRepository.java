package com.green.vrink.user.repository.interfaces;

import com.green.vrink.user.dto.TestDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
    public Integer requestApproval(TestDTO testDTO);


//    public Integer saveApply();


}
