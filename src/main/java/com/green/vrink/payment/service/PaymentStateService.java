package com.green.vrink.payment.service;


import com.green.vrink.payment.dto.PaymentStateDTO;

public interface PaymentStateService {

    Integer saveCustomerConfirm(PaymentStateDTO paymentStateDTO);


    int saveEditorCancel(PaymentStateDTO paymentStateDTO);

    int saveEditorDone(PaymentStateDTO paymentStateDTO);
}
