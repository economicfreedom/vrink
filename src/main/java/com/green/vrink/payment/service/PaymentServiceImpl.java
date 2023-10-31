package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.util.Check;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.repository.interfaces.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import static com.green.vrink.util.Check.isNull;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentServiceImpl implements PaymentService{
	private final PaymentRepository paymentRepository;
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
}
