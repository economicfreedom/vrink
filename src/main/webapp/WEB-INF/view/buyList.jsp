<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>


    .button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
    }

    .button2 {
        background-color: #00ccff;
        color: white;
        border: 1px solid #00ccff;
        font-weight: bold;
        font-size: 15px;
        border-radius: 3px;
        position: relative;
        top: -3px;
        width: 123.5px;
        height: 54px;
    }

    .button2:hover {
        background-color: white;

        color: #00ccff;
    }

    @media only screen and (max-width: 768px) {
        .button2 {
            font-size: 13px;
            padding: 10px 20px;

        }

        .flat-btn {
            font-size: 13px;
            padding: 10px 20px;
        }
    }

    @media only screen and (max-width: 480px) {
        .button2 {
            font-size: 11px;
            padding: 8px 16px;
        }

        .flat-btn {
            font-size: 11px;
            padding: 8px 16px;
        }
    }

</style>
<div class="inner-head overlap">
    <div data-velocity="-.2"
         style="background: url(/image/grey.png) repeat scroll 50% 422.28px transparent; width:100%;height: 100%"
         class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
    <div class="container">
        <div class="inner-content">
            <span><i class="fa fa-bolt"></i></span>
            <h2>의뢰 목록</h2>


            <ul>

                <li><a href="#" title=""></a></li>


            </ul>

        </div>
    </div>
</div>
<!-- inner Head -->

<section class="block">
    <div class="container">
        <div class="coupens-area">

            <div class="row">
                <div class="col-md-12">
                    <div class="heading3">
                        <h3>VRINK를 이용해주셔서 감사합니다.</h3>
                        <span>Easy to Customize</span>
                    </div>
                    <div class="coupon" style="float: right;margin-right: 20px;margin-bottom: 20px;">

                        <input type="text" class="" placeholder="검색어 입력" style="height: 49px;" id="keyword">
                        <button type="submit" class="flat-btn"><i class="fa fa-search"></i>검색하기</button>
                    </div>
                </div>
                <div class="cart-lists">
                    <ul>
                        <%--                        <c:forEach items="${list}" var="dto">--%>
                        <li>
                            <div class="cart-thumb">
                                <span><img src="http://placehold.it/270x371" alt=""/></span>
                                <a class="delete-cart" title="의뢰내역에서 삭제합니다."><i class="fa fa-trash-o"></i></a>
                                <h3>
                                    <a href="http://localhost/payment/payment-list?payment-id=${dto.paymentId}&user-id=${dto.userId}"
                                       title="">${dto.nickname}</a></h3>
                                <div class="price-cart-item">
                                    <span>￦${dto.point}</span>
                                </div>

                            </div>
                            <div class="c-input-number">

                                <button type="button" class="flat-btn" style="margin-bottom: 10px; margin-right: 10px">
                                    구매 확정
                                </button>
                                <button class="button button2">환불 요청</button>


                            </div>
                            <div class="cart-item-quantity">
                                <i class="fa  fa-shopping-basket"></i>
                                <span>수량 : ${dto.quantity}</span>
                            </div>
                        </li>
                        <%--                        </c:forEach>--%>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
