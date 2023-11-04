package com.green.vrink.refund.service;

import com.green.vrink.refund.repository.RefundRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.green.vrink.refund.dto.RefundDetailRequestDTO;

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
