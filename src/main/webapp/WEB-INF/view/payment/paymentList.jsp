<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function refund(impUid, price) {

    fetch('/payment/authorizedCode',{
        method:'POST'
    }).then(response=>response.json())
        .then(data =>{
            fetch('https://cors-anywhere.herokuapp.com/https://api.iamport.kr/users/getToken',{
                method:'POST',
                headers : {              // Http header
                    "Content-Type" : 'application/json',
                },
                body : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                    imp_key : data.apiKey,
                    imp_secret: data.apiSecret
                })
            }).then(response=>response.json())
                .then(data => {
                    // 결제 취소
                    fetch('https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel',{
                        method:'POST',
                        headers : {              // Http header
                            "Content-Type" : 'application/json',
                            "Authorization": data.response.access_token
                        },
                        body:JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                            reason : '환불', // 가맹점 클라이언트로부터 받은 환불사유
                            imp_uid : impUid, // imp_uid를 환불 `unique key`로 입력
                            amount: price // 가맹점 클라이언트로부터 받은 환불금액
                        })
                    }).then(response=>response.json())
                        .then(data => console.log(data))
                })
    })
}
</script>
<section class="block">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-center">
                <div class="heading4 mb-5">
                    <h2>구매 내역</h2>
                    <span>소개를 작성해보세요</span>
                </div>
                <c:forEach var="paymentList" items="${paymentList}">
                <div class="cart-total-box mb-5">
                    <h2 class="cart-head-title">${paymentList.createdAt}</h2>
                    <ul>
                        <li><h3>상품명</h3> <span>${paymentList.name}</span></li>
                        <li><h3>가격</h3> <span>${paymentList.price}</span></li>
                        <li><span><input type="button" class="flat-btn refund" value="환불하기" onclick="getPayment('${paymentList.paymentId}')"></span></li>
                    </ul>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<script>
    function getPayment(paymentId) {
        fetch('/payment/cancel/'+paymentId,{
            method:'GET',
        }).then(response=>response.json())
            .then(data=>{
                refund(data.impUid,data.price)
            })
    }
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
