package com.green.vrink.payment.repository.interfaces;

import java.util.List;

import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.repository.model.Payment;

import com.green.vrink.payment.repository.model.PaymentState;

import com.green.vrink.util.Criteria;

import org.apache.ibatis.annotations.Mapper;

import com.green.vrink.payment.dto.PriceDTO;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaymentRepository {
	List<PriceDTO> findByEditorId(Integer editorId);
	Integer insertByPayment(Payment payment);

    List<Payment> findByUserId(Integer userId);

    Integer insertByPaymentState(PaymentState paymentState);

    Payment findByCancelData(Integer paymentId);

    int findByPaymentId();

	List<BuyResponseDTO> findBuyListByUserId(@Param("userId") Integer userId, @Param("cri") Criteria cri);

}
