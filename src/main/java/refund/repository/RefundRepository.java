package refund.repository;

import org.apache.ibatis.annotations.Mapper;
import refund.dto.RefundDetailRequestDTO;

@Mapper
public interface RefundRepository {

    Integer saveRefund(RefundDetailRequestDTO refundDetailRequestDTO);

}
