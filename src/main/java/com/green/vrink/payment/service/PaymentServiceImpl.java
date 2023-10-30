package com.green.vrink.payment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.repository.interfaces.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentServiceImpl implements PaymentService{
	private final PaymentRepository paymentRepository;
	
	@Override
		public List<PriceDTO> responsePrice(Integer editorId) {
				
			return paymentRepository.findByEditorId(editorId);
		}
}
