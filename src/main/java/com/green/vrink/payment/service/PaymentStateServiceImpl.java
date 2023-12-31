package com.green.vrink.payment.service;

import com.green.vrink.payment.dto.PaymentStateDTO;
import com.green.vrink.payment.repository.interfaces.PaymentRepository;
import com.green.vrink.payment.repository.interfaces.PaymentStateRepository;
import com.green.vrink.review.repository.interfaces.ReviewRepository;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.util.Check;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import static com.green.vrink.util.Check.isNull;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentStateServiceImpl implements PaymentStateService {

    private final PaymentStateRepository paymentStateRepository;
    private final PaymentRepository paymentRepository;
    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;


    @Override
    public Integer saveCustomerConfirm(PaymentStateDTO paymentStateDTO) {

        int totalPrice = paymentRepository.findTotalPriceByPaymentId(paymentStateDTO.getPaymentId());
        int point = paymentStateDTO.getPoint();

        if (point != totalPrice) {
            return 0;
        }

        log.info("에디터 아이디 {}", paymentStateDTO.getEditorId());
        userRepository.updateEditorPoint(paymentStateDTO.getEditorId()
                , point);

        log.info("포인트 {}", paymentStateDTO.getPoint());
        paymentStateRepository.saveCustomerConfirm(paymentStateDTO);
        Integer tableExists = reviewRepository
                .isTableExists(paymentStateDTO.getUserId()
                        , paymentStateDTO.getEditorId());
        log.info("tableExists {}", tableExists);
        if (isNull(tableExists)) {
            reviewRepository.insertReviewCount(
                    paymentStateDTO.getUserId()
                    , paymentStateDTO.getEditorId()
            );
        } else {
            reviewRepository.addReviewCount(
                    paymentStateDTO.getUserId()
                    , paymentStateDTO.getEditorId()
            );
        }

        return 1;
    }

    @Override
    public int saveEditorCancel(PaymentStateDTO paymentStateDTO) {

        int totalPrice = paymentRepository.findTotalPriceByPaymentId(paymentStateDTO.getPaymentId());
        int point = paymentStateDTO.getPoint();

        if (point != totalPrice) {
            return 0;
        }
        paymentStateRepository.saveEditorCancel(paymentStateDTO);

        return 1;
    }

    @Override
    public int saveEditorDone(PaymentStateDTO paymentStateDTO) {
        int totalPrice = paymentRepository.findTotalPriceByPaymentId(paymentStateDTO.getPaymentId());
        int point = paymentStateDTO.getPoint();

        if (point != totalPrice) {
            return 0;
        }
        paymentStateRepository.saveEditorDone(paymentStateDTO);

        return 1;

    }
}
