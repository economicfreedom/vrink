package com.green.vrink.refund.service;

import com.green.vrink.payment.dto.PaymentStateDTO;
import com.green.vrink.payment.repository.interfaces.PaymentRepository;
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
    private final PaymentRepository paymentRepository;

    @Override
    public Integer refundSave(RefundDetailRequestDTO refundDetailRequestDTO) {
        if (refundDetailRequestDTO.getReasonDetail().isEmpty()) {
            refundDetailRequestDTO.setReasonDetail(null);
        }

        PaymentStateDTO paymentStateDTO = new PaymentStateDTO();

        Byte editorRecognize = paymentStateRepository.findEditorRecognizeByPaymentId(
                refundDetailRequestDTO.getPaymentId()

        );

        paymentStateDTO.setPaymentId(
                refundDetailRequestDTO.getPaymentId()
        );

        paymentStateDTO.setEditorRecognize(
                paymentStateDTO.getEditorRecognize()
        );

        paymentStateDTO.setState("c_cancel");
        Integer paymentId = refundDetailRequestDTO.getPaymentId();
        int price = paymentRepository.findTotalPriceByPaymentId(
                paymentId
        );

        paymentStateDTO.setPoint(
                price
        );
        paymentStateDTO.setEditorRecognize(editorRecognize);
        paymentStateDTO.setCustomerRecognize((byte)2);
        paymentStateRepository.saveCustomerConfirm(paymentStateDTO);

        return refundRepository.saveRefund(refundDetailRequestDTO);
    }
}
