package refund.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import refund.dto.RefundDetailRequestDTO;
import refund.repository.RefundRepository;

@RequiredArgsConstructor
@Service
@Slf4j
public class RefundServiceImpl implements RefundService {

    private final RefundRepository refundRepository;

    @Override
    public Integer refundSave(RefundDetailRequestDTO refundDetailRequestDTO) {
        return refundRepository.saveRefund(refundDetailRequestDTO);
    }
}
