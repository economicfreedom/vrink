package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;

import com.green.vrink.payment.repository.model.PaymentState;

import com.green.vrink.util.Criteria;

public interface PaymentService {
	List<PriceDTO> responsePrice(Integer editorId);
	Boolean validationPrice(ValidationDTO validationDTO);
	AutorizedCodeDTO responseCode();

	Integer insertPayment(Payment payment);

    List<Payment> responsePayment(Integer userId);


    Integer insertPaymentState(PaymentState paymentState);

	Payment responseCancelData(Integer paymentId);

	int selectPaymentId();

	List<BuyResponseDTO> buyList(Integer userId, Criteria cri);

}
