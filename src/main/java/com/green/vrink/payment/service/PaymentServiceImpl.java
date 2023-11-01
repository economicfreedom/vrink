package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.PaymentDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.repository.model.PaymentState;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Check;
import com.green.vrink.util.Define;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.repository.interfaces.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

import static com.green.vrink.util.Check.isNull;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentServiceImpl implements PaymentService{
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
		for(int i = 0; i<validationDTO.getQuantity().length; i++) {
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

	@Override
	public Integer insertPayment(Payment payment) {
		return paymentRepository.insertByPayment(payment);
	}

	@Override
	public List<Payment> responsePayment(Integer userId) {
		return paymentRepository.findByUserId(userId);
	}

	@Override
	public Integer insertPaymentState(PaymentState paymentState) {
		return paymentRepository.insertByPaymentState(paymentState);
	}

	@Override
	public Payment responseCancelData(Integer paymentId) {
		return paymentRepository.findByCancelData(paymentId);
	}

	@Override
	public int selectPaymentId() {
		return paymentRepository.findByPaymentId();
	}
}
