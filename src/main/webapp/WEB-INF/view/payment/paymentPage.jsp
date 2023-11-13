<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
      var IMP = window.IMP;
      IMP.init("imp28453842");

      function requestPay() {
		  let options = [];
		  let prices = [];
		  let quantities = [];
		  let request = $('.cart-request textarea').val();
		  let name = '';
		  $('li').each(function() {

			  // 각 <li> 요소 내에서 "manual-adjust" 클래스를 가진 input 요소를 선택합니다.
			  let manualAdjustInput = $(this).find('.manual-adjust');

			  // "manual-adjust" 클래스를 가진 input 요소의 값이 1 이상인 경우에만 처리합니다.
			  if (parseInt(manualAdjustInput.val()) >= 1) {
				  // "options"와 "price" 요소를 선택하고 해당 텍스트를 가져옵니다.
				  options.push($(this).find('.options').text())
				  prices.push($(this).find('.mul-price').text());
				  quantities.push($(this).find('.manual-adjust').val());
			  }
		  });
		  if(options.length != 1) {
			  name = ' 외 '+(options.length-1) +'건'
		  }
        IMP.request_pay(
          {
            pg: "kcp.{TC0ONETIME}",
            pay_method: "card",
            merchant_uid: "merchant_"+new Date().getTime(),
            name: options[0] + name,
            amount: paymentPrice,
            buyer_email: '${user.email}',
            buyer_name: '${user.name}',
            buyer_tel: '${user.phone}',
            buyer_addr: "",
            buyer_postcode: "",
          },
          function (rsp) {
            if(rsp.success) {
				// 가격 검증
				let formData = new FormData();
				let editorId = '${priceDTOs[0].editorId}';
				formData.append('editorId',editorId);
				formData.append('paidAmount',rsp.paid_amount);
				let quantity = $('.manual-adjust');
				for(i=0; i<quantity.length; i++) {
					formData.append('quantity',$(quantity[i]).val());
				}
				fetch('/payment/validation', {
					method: 'POST',
					body: formData
				})
				.then(response => {
					if (response.ok) {
						// DB입력
						fetch('/payment/payment-done',{
							method: 'POST',
							headers: {
								'Content-Type': 'application/json'
							},
							body: JSON.stringify({
								editorId: '${priceDTOs[0].editorId}',
								userId : '${user.userId}',
								name : rsp.name,
								impUid: rsp.imp_uid,
								merchantUid: rsp.merchant_uid,
								totalPrice: rsp.paid_amount,
								option: options,
								price: prices,
								quantity: quantities,
								request: request
							})
						}).then(location.href="/payment/buy-list")
					} else {
						alert("결제 금액이 잘못되었습니다.");
						// 인증코드 발행
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
														imp_uid : rsp.imp_uid, // imp_uid를 환불 `unique key`로 입력
														amount: rsp.paid_amount // 가맹점 클라이언트로부터 받은 환불금액
													})
												}).then(location.reload())
											})
								})
						location.reload();
					}
				})
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
          }
        );
      }
    </script>
<style>
	.cart-request {
		position: relative;
	}
	.cart-request textarea {
		background: white none repeat scroll 0 0;
		border: medium none;
		float: left;
		font-family: Nunito;
		font-size: 15px;
		padding: 18px 80px;
		resize: none;
	}
	.cart-request i {
		color: #b5b5b5;
		font-size: 15px;
		left: 58px;
		line-height: 16px;
		margin-top: -7px;
		position: absolute;
		top: 48%;
	}
</style>
<div class="container">
	<section class="block">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-center">
					<div class="heading3">
						<h3>작가에게 의뢰 하기</h3>
						<span></span>
					</div>
					<div class="cart-lists">
						<ul>						
							<c:forEach items="${priceDTOs}" var="priceDTO">
								<li>
									<div class="cart-thumb">
										<h3><a class="options" href="#" title="">${priceDTO.options}</a></h3>
										<div class="price-cart-item">
											<span class="price-area">${priceDTO.price}</span>
										</div>
										<p></p>
									</div>
									<div class="c-input-number">
										<span><input type="number" class="manual-adjust" min="0" value="0" title="Enter &quot;+x&quot; or &quot;+x%&quot; or &quot;*x&quot;
	to change increment"></span>
									</div>
									<div class="cart-item-quantity">
										<i class="fa   fa-money"></i>
										<span class="mul-price">0</span>
									</div>
								</li>
							</c:forEach>
							<li>
								<div class="cart-thumb">
									<h3><a class="options" href="#" title="">요청사항</a></h3>
									<div class="price-cart-item">
										<span class="price-area">${priceDTO.price}</span>
									</div>
									<p></p>
								</div>
								<div class="c-input-number cart-request">
									<i class="fa fa-at"></i>
									<textarea rows="3"></textarea>
								</div>
								<div class="cart-item-quantity">

								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="block remove-top">
		<div class="container">
			<div class="row">
				<div class="col-md-6 column col-center">
					<div class="cart-total-box">
						<h2 class="cart-head-title">CART TOTAL</h2>
						<ul>
							<li><h3>총 가격</h3> <span id="total-price">0</span></li>
						</ul>
						<input type="button" value="주문하기" class="flat-btn" onclick="requestPay()">
					</div><!-- Cart  -->
				</div>
			</div>
		</div>
	</section>
</div>
<script>

	var paymentPrice = 0;
	let test = [];

	document.querySelectorAll('.manual-adjust').forEach(function (element) {
		element.addEventListener('change', function (e) {
			let price = this.closest('li').querySelector('.price-area').textContent;
			let money = this.closest('li').querySelector('.mul-price');
			let quantity = this.value;
			money.textContent = price * quantity;

			let mulPrice = document.querySelectorAll('.mul-price');
			let totalPrice = document.getElementById('total-price');
			let sum = 0;

			for (let i = 0; i < mulPrice.length; i++) {
				sum += parseFloat(mulPrice[i].textContent);
			}

			totalPrice.textContent = sum;
			paymentPrice = parseFloat(totalPrice.textContent);
		});
	});


</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>