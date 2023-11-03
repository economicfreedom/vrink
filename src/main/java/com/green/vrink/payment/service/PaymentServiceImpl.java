package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.*;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.repository.model.PaymentState;
import com.green.vrink.util.Criteria;
import org.springframework.stereotype.Service;

import com.green.vrink.payment.repository.interfaces.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentServiceImpl implements PaymentService {
	private final PaymentRepository paymentRepository;
	private final HttpSession session;
	private static final String API_KEY = "5245526256803155";
	private static final String API_SECRET = "9nDFaQDdNkSAvkhRmplND7KeQJxWTzvKxZZQZVwF1TLQC8ly851e69UOO3pfysh6bliEX4KofE97Y5Cd";

	@Override
	public List<PriceDTO> responsePrice(Integer editorId) {

		return paymentRepository.findByEditorId(editorId);
	}

	@Override
	public Boolean validationPrice(ValidationDTO validationDTO) {
		List<PriceDTO> priceDTOs = responsePrice(validationDTO.getEditorId());
		int sum = 0;
		for (int i = 0; i < validationDTO.getQuantity().length; i++) {
			sum += validationDTO.getQuantity()[i] * priceDTOs.get(i).getPrice();
		}
		return validationDTO.getPaidAmount() == sum;
	}

	@Override
	public AutorizedCodeDTO responseCode() {
		AutorizedCodeDTO autorizedCodeDTO = new AutorizedCodeDTO();
		autorizedCodeDTO.setApiKey(API_KEY);
		autorizedCodeDTO.setApiSecret(API_SECRET);
		return autorizedCodeDTO;
	}

	@Transactional
	@Override
	public Integer insertPayment(PaymentDTO paymentDTO) {
		paymentRepository.insertByPayment(paymentDTO);
		Integer paymentId = selectPaymentId();
		PaymentState paymentState = new PaymentState();
		paymentState.setPaymentId(paymentId);
		paymentState.setPoint(paymentDTO.getTotalPrice());
		PaymentDetailDTO paymentDetailDTO = new PaymentDetailDTO();
		for(int i = 0; i<paymentDTO.getOption().length; i++) {
			String option = paymentDTO.getOption()[i];
			Integer price = paymentDTO.getPrice()[i];
			Integer quantity = paymentDTO.getQuantity()[i];

			paymentDetailDTO.setPaymentId(paymentId);
			paymentDetailDTO.setOptions(option);
			paymentDetailDTO.setPrice(price);
			paymentDetailDTO.setQuantity(quantity);
			log.info("paymentdetail {}",paymentDetailDTO);
			paymentRepository.insertByPaymentDetail(paymentDetailDTO);
		}
		return insertPaymentState(paymentState);
	}

	@Override
	public Payment responsePayment(Integer paymentId) {
		return paymentRepository.findByPaymentId(paymentId);
	}
	@Transactional
	@Override
	public Integer insertPaymentState(PaymentState paymentState) {
		return paymentRepository.insertByPaymentState(paymentState);
	}

	@Override
	public Payment responseCancelData(Integer paymentId) {
		return paymentRepository.findByCancelData(paymentId);
	}

	@Override
	public Integer selectPaymentId() {
		return paymentRepository.findByLastPaymentId();
	}
	public List<BuyResponseDTO> buyList (Integer userId, Criteria cri){
		return paymentRepository.findBuyListByUserId(userId, cri);

	}

	@Override
	public List<PaymentDetailDTO> responsePaymentDetail(Integer paymentId) {
		return paymentRepository.findPaymentDetailByPaymentId(paymentId);
	}
}