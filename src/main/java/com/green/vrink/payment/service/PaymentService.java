package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.BuyDTO;
import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.util.Criteria;
import org.apache.el.parser.BooleanNode;
import org.springframework.http.ResponseEntity;

public interface PaymentService {
	List<PriceDTO> responsePrice(Integer editorId);
	Boolean validationPrice(ValidationDTO validationDTO);
	AutorizedCodeDTO responseCode();

	Integer insertPayment(Payment payment);

    List<Payment> responsePayment(Integer userId);
	List<BuyDTO> buyList(Integer userId, Criteria cri);
}
