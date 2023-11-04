function paymentConfirm(
    editorId
    , paymentId
    , editorRecognize
    , customerRecognize
    , point) {

    fetch('/payment-state/save-customer-confirm', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({

            editorId: editorId,
            paymentId: paymentId,
            editorRecognize: editorRecognize,
            customerRecognize: 1,
            point: point,
            state: "trade_done"
        })
    })
        .then(response => {
            if (!response.ok) {
                response.json().then(data => {

                    alert(data.message)
                });
            } else {
                alert("구매가 완료 되었습니다.")
                location.reload();
            }
        })
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));


}

function refundRequest(paymentId) {

    let btnVal = $(`#cancel-${paymentId}`).val();
    let requestRefund = $(`#request-refund-${paymentId}`);
    let forRPayment = $(`#for-r-${paymentId}`);
    let reason = $(`#reason-${paymentId}`);
    let btnOk = $(`#ok-${paymentId}`);
    let btnCancel = $(`#cancel-${paymentId}`);
    let labelE = $(`#for-e-${paymentId}`);
    let selectEtcInput = $(`#etc-${paymentId}`);
    if (requestRefund.val() == 0) {


        forRPayment.css("display", "block");
        reason.css("display", "block");


        // 이전에 바인딩된 change 이벤트 핸들러를 제거
        reason.off('change').on('change', function () {
            let reasonVal = $(this).val(); // $(this)를 사용하여 현재 변경된 요소를 참조

            if (reasonVal === "기타") {
                // 템플릿 리터럴을 사용하여 동적인 ID를 가진 요소를 선택
                labelE.css("display", "block");
                selectEtcInput.css("display", "block");
            } else {
                labelE.css("display", "none");
                selectEtcInput.css("display", "none");
            }
        });
        btnOk.css("display", "inline-block");
        btnCancel.css("display", "inline-block");

        requestRefund.val(1)

    } else {
        labelE.css("display", "none");
        selectEtcInput.css("display", "none");
        btnOk.css("display", "none");
        btnCancel.css("display", "none");
        forRPayment.css("display", "none");
        reason.css("display", "none");


        requestRefund.val(0)
        displayNone(
            labelE
            , selectEtcInput
            , btnOk
            , btnCancel
            , forRPayment
            , reason
            , requestRefund
        )

    }


}

function refundOk(paymentId,paymentStateId) {

    
    let requestRefund = $(`#request-refund-${paymentId}`);
    let forRPayment = $(`#for-r-${paymentId}`);
    let reason = $(`#reason-${paymentId}`);
    let btnOk = $(`#ok-${paymentId}`);
    let btnCancel = $(`#cancel-${paymentId}`);
    let labelE = $(`#for-e-${paymentId}`);
    let selectEtcInput = $(`#etc-${paymentId}`);
    console.log(paymentId,paymentStateId,selectEtcInput.val(),reason.val())
    fetch('/refund/request-refund', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({

            
            paymentId: paymentId,
            paymentStateId:paymentStateId,
            reason:reason.val(),
            reasonDetail:selectEtcInput.val()
            
        })
    })
        .then(response => {
            if (!response.ok) {
                alert("에러남")
            } else {

                location.reload();
            }
        })
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));


}

function refundCancel(paymentId) {
    let requestRefund = $(`#request-refund-${paymentId}`);
    let forRPayment = $(`#for-r-${paymentId}`);
    let reason = $(`#reason-${paymentId}`);
    let btnOk = $(`#ok-${paymentId}`);
    let btnCancel = $(`#cancel-${paymentId}`);
    let labelE = $(`#for-e-${paymentId}`);

    let selectEtcInput = $(`#etc-${paymentId}`);
    displayNone(
        labelE
        , selectEtcInput
        , btnOk
        , btnCancel
        , forRPayment
        , reason
        , requestRefund
    )


}

function displayNone(labelE
    , selectEtcInput
    , btnOk
    , btnCancel
    , forRPayment
    , reason
    , requestRefund) {
    labelE.css("display", "none");
    selectEtcInput.css("display", "none");
    btnOk.css("display", "none");
    btnCancel.css("display", "none");
    forRPayment.css("display", "none");
    reason.css("display", "none");
    requestRefund.val(0)
}