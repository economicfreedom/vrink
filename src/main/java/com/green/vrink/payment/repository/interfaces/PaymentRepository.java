package com.green.vrink.payment.repository.interfaces;

import java.util.List;


import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.dto.PaymentDTO;
import com.green.vrink.payment.dto.PaymentDetailDTO;
import com.green.vrink.payment.repository.model.Payment;

import com.green.vrink.payment.repository.model.PaymentState;

import com.green.vrink.util.Criteria;

import org.apache.ibatis.annotations.Mapper;

import com.green.vrink.payment.dto.PriceDTO;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaymentRepository {
	List<PriceDTO> findByEditorId(Integer editorId);
	Integer insertByPayment(PaymentDTO paymentDTO);

    PaymentDTO findByPaymentId(Integer paymentId);

    Integer insertByPaymentState(PaymentState paymentState);

    Payment findByCancelData(Integer paymentId);

    int findByLastPaymentId();

	List<BuyResponseDTO> findBuyListByUserId(@Param("userId") Integer userId, @Param("cri") Criteria cri);


    void insertByPaymentDetail(PaymentDetailDTO paymentDetailDTO);

    List<PaymentDetailDTO> findPaymentDetailByPaymentId(Integer paymentId);

    int findTotalPriceByPaymentId(Integer paymentId);

    Integer findBuyListTotalByCriAndUserId( @Param("cri")Criteria cri,@Param("userId") Integer userId);
}
