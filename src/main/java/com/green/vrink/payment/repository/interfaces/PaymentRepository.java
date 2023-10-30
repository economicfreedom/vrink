package com.green.vrink.payment.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.vrink.payment.dto.PriceDTO;

@Mapper
public interface PaymentRepository {
	List<PriceDTO> findByEditorId(Integer editorId);
}
