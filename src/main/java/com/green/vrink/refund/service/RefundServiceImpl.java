package com.green.vrink.refund.service;

import com.green.vrink.payment.dto.PaymentStateDTO;
import com.green.vrink.payment.repository.interfaces.PaymentStateRepository;
import com.green.vrink.refund.dto.RefundDetailRequestDTO;
import com.green.vrink.refund.repository.RefundRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
@Slf4j
public class RefundServiceImpl implements RefundService {

    private final RefundRepository refundRepository;
    private final PaymentStateRepository paymentStateRepository;
    @Override
    public Integer refundSave(RefundDetailRequestDTO refundDetailRequestDTO) {
        if (refundDetailRequestDTO.getReasonDetail().isEmpty()) {
            refundDetailRequestDTO.setReasonDetail(null);
        }

        PaymentStateDTO paymentStateDTO = new PaymentStateDTO();

//        paymentStateRepository.saveCustomerConfirm()



        return refundRepository.saveRefund(refundDetailRequestDTO);
    }
}
