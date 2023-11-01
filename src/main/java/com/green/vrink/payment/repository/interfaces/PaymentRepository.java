package com.green.vrink.payment.repository.interfaces;

import java.util.List;

import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.repository.model.PaymentState;
import org.apache.ibatis.annotations.Mapper;

import com.green.vrink.payment.dto.PriceDTO;

@Mapper
public interface PaymentRepository {
	List<PriceDTO> findByEditorId(Integer editorId);
	Integer insertByPayment(Payment payment);

    List<Payment> findByUserId(Integer userId);

    Integer insertByPaymentState(PaymentState paymentState);

    Payment findByCancelData(Integer paymentId);

    int findByPaymentId();
}
