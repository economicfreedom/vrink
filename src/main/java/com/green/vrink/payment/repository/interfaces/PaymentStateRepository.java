package com.green.vrink.payment.repository.interfaces;

import com.green.vrink.payment.dto.PaymentStateDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentStateRepository {


    Integer saveCustomerConfirm(PaymentStateDTO paymentStateDTO);





}
