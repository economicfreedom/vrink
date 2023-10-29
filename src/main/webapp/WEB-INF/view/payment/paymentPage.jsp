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
            merchant_uid: "57008833-33004",
            name: "당근 10kg",
            amount: 39000,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
            console.log(rsp);
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
							<li>
								<div class="cart-thumb">
									<span><img src="http://artmugfile2.cafe24.com/image/goods_img1/2/28755.jpg?ver=1696564449" alt=""></span>
									<a class="delete-cart" title=""><i class="fa fa-trash-o"></i></a>
									<h3><a href="#" title="">일러스트1</a></h3>
									<div class="price-cart-item">
										<span>13,000</span>
									</div>
									<p>The best item that you can get</p>
								</div>
								<div class="c-input-number">
									<span><input id="box1" type="number" class="manual-adjust" value="0" title="Enter &quot;+x&quot; or &quot;+x%&quot; or &quot;*x&quot; 
to change increment"></span>
								</div>
								<div class="cart-item-quantity">
									<i class="fa  fa-shopping-basket"></i>
									<span>Quantity : 3</span>
								</div>
							</li>
							<li>
								<div class="cart-thumb">
									<span><img src="http://artmugfile2.cafe24.com/image/goods_img1/2/28755B.jpg?ver=1696564449" alt=""></span>
									<a class="delete-cart" title=""><i class="fa fa-trash-o"></i></a>
									<h3><a href="#" title="">일러스트2</a></h3>
									<div class="price-cart-item">
										<span>13,000</span>
									</div>
									<p>The best item that you can get</p>
								</div>
								<div class="c-input-number">
									<span><input id="box2" type="number" class="manual-adjust" value="0" title="Enter &quot;+x&quot; or &quot;+x%&quot; or &quot;*x&quot; 
to change increment"></span>
								</div>
								<div class="cart-item-quantity">
									<i class="fa  fa-shopping-basket"></i>
									<span>Quantity : 3</span>
								</div>
							</li>
							<li>
								<div class="cart-thumb">
									<span><img src="http://artmugfile2.cafe24.com/image/goods_img1/2/28755C.jpg?ver=1696564449" alt=""></span>
									<a class="delete-cart" title=""><i class="fa fa-trash-o"></i></a>
									<h3><a href="#" title="">일러스트 3</a></h3>
									<div class="price-cart-item">
										<span>13,000</span>
									</div>
									<p>The best item that you can get</p>
								</div>
								<div class="c-input-number">
									<span><input id="box3" type="number" class="manual-adjust" value="0" title="Enter &quot;+x&quot; or &quot;+x%&quot; or &quot;*x&quot; 
to change increment"></span>
								</div>
								<div class="cart-item-quantity">
									<i class="fa  fa-shopping-basket"></i>
									<span>Quantity : 3</span>
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
							<li><h3>총 가격</h3> <span id="total-price">36,000</span></li>
						</ul>
						<input type="button" value="결제하기" class="flat-btn" onclick="requestPay()">
					</div><!-- Cart  -->
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>