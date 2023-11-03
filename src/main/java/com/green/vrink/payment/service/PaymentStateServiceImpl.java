package com.green.vrink.payment.service;

import com.green.vrink.payment.dto.PaymentStateDTO;
import com.green.vrink.payment.repository.interfaces.PaymentRepository;
import com.green.vrink.payment.repository.interfaces.PaymentStateRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentStateServiceImpl implements PaymentStateService {

    private final PaymentStateRepository paymentStateRepository;


    @Override
    public Integer saveState(PaymentStateDTO paymentStateDTO) {
        return paymentStateRepository.saveState(paymentStateDTO);
    }

}
