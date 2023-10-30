<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
      var IMP = window.IMP;
      IMP.init("imp28453842");
 
      function requestPay() {
        IMP.request_pay(
          {
            pg: "kcp.{INIBillTst}",
            pay_method: "card",
            merchant_uid: "merchant_"+new Date().getTime(),
            name: $('.options').text(),
            amount: paymentPrice,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
            if(rsp.success) {
            	console.log(rsp);
            	
            	$.ajax({
            		type:'POST',
            		url:'/payment/'
            	})
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
          }
        );
      }
    </script>
<div class="container">
	<section class="block">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading3">
						<h3>의뢰 하기</h3>
						<span>Easy to Customize</span>
					</div>
					<div class="cart-lists">
						<ul>						
							<c:forEach items="${priceDTOs}" var="priceDTO">
								<li>
									<div class="cart-thumb">
										<span><img src="http://artmugfile2.cafe24.com/image/goods_img1/2/28755.jpg?ver=1696564449" alt=""></span>
										<a class="delete-cart" title=""><i class="fa fa-trash-o"></i></a>
										<h3><a class="options" href="#" title="">${priceDTO.options}</a></h3>
										<div class="price-cart-item">
											<span class="price-area">${priceDTO.price}</span>
										</div>
										<p>The best item that you can get</p>
									</div>
									<div class="c-input-number">
										<span><input id="box1" type="number" class="manual-adjust" min="0" value="0" title="Enter &quot;+x&quot; or &quot;+x%&quot; or &quot;*x&quot; 
	to change increment"></span>
									</div>
									<div class="cart-item-quantity">
										<i class="fa   fa-money"></i>
										<span class="mul-price">0</span>
									</div>
								</li>
							</c:forEach>
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
				<input type="button" value="테스트" id="test">
			</div>
		</div>
	</section>
</div>
<script>
let cPrice = [];
let editorId = '${priceDTOs[0].price}';
console.log(editorId);
<c:forEach items="${priceDTOs}" var="priceDTO">
	cPrice.push(${priceDTO.price});
</c:forEach>

var paymentPrice = 0;
$('.manual-adjust').change(function(e){
	let price = $(this).closest('li').find('.price-area').text();
	let money = $(this).closest('li').find('.mul-price');
	let quantity = $(this).val();
	let realPrice = cPrice[$('input[type=number]').index(this)];
	money.text(realPrice*quantity);
	let mulPrice = $('.mul-price');
	let totalPrice = $('#total-price');
	let sum = 0;
	
	for(i=0; i<mulPrice.length; i++) {
		sum += Number($(mulPrice[i]).text())
	}
	
	totalPrice.text(sum);
	paymentPrice = Number(totalPrice.text());
	

});

$('#test').on('click',function({
	let formData = new FormData();
	let editorId = '${priceDTOs[0].price}'
	formData.append("editorId",editorId);
	let quantity = $('.manual-adjust');
		for(i=0; i<quantity.length; i++) {
			formData.append(quantity[i]);
	}	
	$.ajax({
		type:'POST',
		url:'/payment/validation',
		data:formData,
		success:function(res) {
			console.log('헬로');
		},
		error : function(e) {
			console.log(e);
		}

		
	})
}))
	





</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>