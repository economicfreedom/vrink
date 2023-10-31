package com.green.vrink.payment.service;

import java.util.List;

import com.green.vrink.payment.dto.PriceDTO;

public interface PaymentService {
	List<PriceDTO> responsePrice(Integer editorId);
}
