package com.green.vrink.refund.repository;

import org.apache.ibatis.annotations.Mapper;
import com.green.vrink.refund.dto.RefundDetailRequestDTO;

@Mapper
public interface RefundRepository {

    Integer saveRefund(RefundDetailRequestDTO refundDetailRequestDTO);

}
