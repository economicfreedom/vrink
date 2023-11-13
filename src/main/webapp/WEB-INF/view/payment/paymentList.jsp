<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function refund(impUid, totalprice) {
    fetch('/payment/authorizedCode',{
        method:'POST'
    }).then(response=>response.json())
        .then(data =>{
            fetch('https://proxy.cors.sh/https://api.iamport.kr/users/getToken',{
                method:'POST',
                headers : {              // Http header
                    "Content-Type" : 'application/json',
                    'x-cors-api-key': 'temp_5f308d5f08b11d5fd98b779695a0382c'
                },
                body : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                    imp_key : data.apiKey,
                    imp_secret: data.apiSecret
                })
            }).then(response=>response.json())
                .then(data => {
                    // 결제 취소
                    fetch('https://proxy.cors.sh/https://api.iamport.kr/payments/cancel',{
                        method:'POST',
                        headers : {              // Http header
                            "Content-Type" : 'application/json',
                            'x-cors-api-key': 'temp_5f308d5f08b11d5fd98b779695a0382c',
                            "Authorization": data.response.access_token
                        },
                        body:JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                            reason : '환불', // 가맹점 클라이언트로부터 받은 환불사유
                            imp_uid : impUid, // imp_uid를 환불 `unique key`로 입력
                            amount: totalprice // 가맹점 클라이언트로부터 받은 환불금액
                        })
                    }).then(response=>response.json())
                        .then(data=>console.log(data))
                })
    })
}
</script>
<style>
    .hidden-row {
        display: none;
    }
</style>
<section class="block">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-center">
                <div class="heading4 mb-5">
                    <h2>구매 내역</h2>
                    <span></span>
                </div>
                <div class="cart-total-box mb-5">
                    <h2 class="cart-head-title">${payment.createdAt}</h2>
                    <ul>
                        <li><h3>상품명</h3> <span>${payment.name}</span></li>
                        <li><h3>가격</h3> <span>${payment.totalPrice}원</span></li>
                        <li><h3>판매자 연락처</h3> <span>${payment.phone}</span></li>
                        <li><h3>판매자 이메일</h3> <span>${payment.email}</span></li>
                        <c:if test="${payment.request != null}">
                        <li><h3>요청사항</h3> <span>${payment.request}</span></li>
                        </c:if>
                        <li><span id="showButton">구매내역 상세보기</span></li>
                        <c:forEach items="${paymentDetail}" var="paymentDetail">
                        <li class="hidden-row"><h3>상품이름</h3><span>${paymentDetail.options}</span></li>
                        <li class="hidden-row"><h3>개수</h3><span>${paymentDetail.quantity}개</span></li>
                        <li class="hidden-row"><h3>가격</h3><span>${paymentDetail.price}원</span></li>
                        </c:forEach>
                        <li><span><input type="button" class="flat-btn refund" value="돌아가기" onclick="location.href='/payment/buy-list'"></span></li>
                    </ul>
                </div>
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
                refund(data.impUid,data.totalPrice)
            })
    }

    $("#showButton").click(function() {
        $(".hidden-row").slideToggle(500); // Adjust the animation speed
    });
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
