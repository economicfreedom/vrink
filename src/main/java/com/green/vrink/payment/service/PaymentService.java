package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.*;
import com.green.vrink.payment.repository.model.Payment;

import com.green.vrink.payment.repository.model.PaymentState;

import com.green.vrink.util.Criteria;

import org.apache.el.parser.BooleanNode;
import org.springframework.http.ResponseEntity;

public interface PaymentService {
	List<PriceDTO> responsePrice(Integer editorId);
	Boolean validationPrice(ValidationDTO validationDTO);
	AutorizedCodeDTO responseCode();

	Integer insertPayment(PaymentDTO paymentDTO);

    PaymentDTO responsePayment(Integer paymentId);


    Integer insertPaymentState(PaymentState paymentState);

	Payment responseCancelData(Integer paymentId);

	Integer selectPaymentId();

	List<BuyResponseDTO> buyList(Integer userId, Criteria cri);

	List<PaymentDetailDTO> responsePaymentDetail(Integer paymentId);

	Integer buyListTotal(Criteria cri, Integer userId);
}
