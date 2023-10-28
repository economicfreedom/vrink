<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
      var IMP = window.IMP;
      IMP.init("impXXXXXXXXX");
 
      function requestPay() {
        IMP.request_pay(
          {
            pg: "kcp.{imp28453842}",
            pay_method: "card",
            merchant_uid: "57008833-33004",
            name: "당근 10kg",
            amount: 1004,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
            // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
          }
        );
      }
    </script>
<div class="container">
	<div class="row mt-5 mb-5">
		<button onclick="requestPay()">결제하기</button>
	</div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>