package com.green.vrink.user.repository.interfaces;

import com.green.vrink.user.dto.ApprovalDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
    public Integer requestApproval(ApprovalDTO approvalDTO);


//    public Integer saveApply();


}
