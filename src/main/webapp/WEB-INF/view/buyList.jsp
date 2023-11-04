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
                    <ul id="list">
                        <c:forEach items="${list}" var="dto">
                            <li>
                                <div class="cart-thumb">
                                    <span><img src="${dto.image}" alt=""/></span>
                                    <a class="delete-cart" title="의뢰내역에서 삭제합니다."><i class="fa fa-trash-o"></i></a>
                                    <h3>
                                        <a href="/payment/payment-list?payment-id=${dto.paymentId}&user-id=${dto.userId}"
                                           title="">${dto.nickname}</a></h3>
                                    <span style="margin-left: 10px">010-1234-1234</span>
                                    <br>
                                    <span style="margin-left: 10px">asdasdfasdff@asdf.com</span>
                                    <div class="price-cart-item">
                                        <span>￦${dto.point}</span>
                                    </div>

                                </div>
                                <div class="c-input-number">

                                        <%--                                <c:if test="${dto.editorRecognize == 1}">--%>

                                    <button type="button" class="flat-btn" onclick="paymentConfirm(
                                        ${dto.editorId},
                                        ${dto.paymentId}
                                            ,${dto.editorRecognize}
                                            ,${dto.customerRecognize}
                                            ,${dto.point}
                                            )"
                                            style="margin-bottom: 10px; margin-right: 10px">
                                        구매 확정
                                    </button>

                                        <%--                                </c:if>--%>

                                        <%--                                <c:if test="${dto.editorRecognize == 0}">--%>
                                    <button class="button button2" onclick="refundRequest(${dto.paymentId})"
                                            value="0"
                                            id="request-refund-${dto.paymentId}">
                                        환불 요청
                                    </button>
                                    <div class="form-group">
                                        <label for="reason-${dto.paymentId}" id="for-r-${dto.paymentId}"
                                               style="display: none">환불 사유</label>
                                        <select class="form-control"
                                                style="display: none"
                                                id="reason-${dto.paymentId}">
                                            <option value="잘못구입">잘못 구입했습니다.</option>
                                            <option value="연락두절">연락이 없어요.</option>
                                            <option value="기타">기타</option>
                                        </select>
                                        <label for="etc-${dto.paymentId}"
                                               style="display: none"
                                               id="for-e-${dto.paymentId}">기타 사유</label>
                                        <input type="text" class="form-control" id="etc-${dto.paymentId}"
                                               style="display: none">
                                        <button type="button" class="btn btn-primary"
                                                style="margin-top: 4px; display: none"
                                                onclick="refundOk(${dto.paymentId},${dto.paymentStateId})"
                                                id="ok-${dto.paymentId}">
                                            확인
                                        </button>
                                        <button type="button" class="btn btn-default"
                                                style="margin-top: 4px; display: none"
                                                id="cancel-${dto.paymentId}"
                                                onclick="refundCancel(${dto.paymentId})">
                                            취소
                                        </button>
                                    </div>
                                        <%--                                </c:if>--%>

                                </div>

                                <div class="cart-item-quantity">
                                    <i class="fa  fa-shopping-basket"></i>
                                    <span>수량 : ${dto.quantity}</span>
                                </div>

                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</section>

<script>
    let debounceTimer;
    let pageNum = 1;
    let hasNext = ${hasNext};
    $(window).scroll(function () {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(checkScrollEnd, 1000);  // 1초 동안 딜레이
    });

    function checkScrollEnd() {
        var scrollHeight = $(document).height();
        var scrollPosition = $(window).height() + $(window).scrollTop();

        if ((scrollHeight - scrollPosition) / scrollHeight < 0.10 && hasNext) {
            console.log("스크롤이 페이지의 90% 이상 도달했습니다!");
            fetchListMore();


        }
    }

    function fetchListMore() {
        pageNum++;
        const url = `/payment-state/list-more?page-num=` + pageNum + `&user-id=` + `${USER.userId}` + `&total=` + `${pageDTO.articleTotalCount}`
        let html = '';

        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                hasNext = data.hasNext
                console.log(data);
                console.log(hasNext);
                data.pageDTOs.forEach(dto => {

                    html += '<li>';
                    html += '<div class="cart-thumb">';
                    html += '<span><img src="' + dto.image + '" alt=""/></span>';
                    html += '<a class="delete-cart" title="의뢰내역에서 삭제합니다."><i class="fa fa-trash-o"></i></a>';
                    html += '<h3>';
                    html += '<a href="/payment/payment-list?payment-id=' + dto.paymentId + '&user-id=' + dto.userId + '"';
                    html += ' title="">' + dto.nickname + '</a></h3>';
                    html += '<div class="price-cart-item">';
                    html += '<span>￦' + dto.point + '</span>';
                    html += '</div>';

                    html += '</div>';
                    html += '<div class="c-input-number">';

                    if (dto.editorRecognize == 1) {

                        html += '<button type="button" className="flat-btn" ';
                        html += ' style="margin-bottom: 10px; margin-right: 10px" onclick(';
                        html += dto.paymentId;
                        html += ',' + dto.editorRecognize;
                        html += ',' + dto.customerRecognize;
                        html += ',' + dto.point;
                        html += ')>';
                        html += '구매 확정';
                        html += '</button>';
                    }
                    if (dto.editorRecognize == 0) {

                        html += '<button class="button button2" onclick="refundRequests(' + dto.paymentId + ')">환불 요청</button>';

                        html += '<div class="form-group">'
                        html += ' <label for="reason-' + dto.paymentId + '" id="for-r-' + dto.paymentId + '"'
                        html += ' style="display: none">환불 사유</label>'
                        html += '<select class="form-control" id="reason-' + dto.paymentId + '"'
                        html += ' style="display: none">'
                        html += '<option value="잘못구입">잘못 구입했습니다.</option>'
                        html += '<option value="연락두절">연락이 없어요.</option>'
                        html += '<option value="etc">기타</option>'
                        html += '</select>'
                        html += '<label for="etc-' + dto.paymentId + '"'
                        html += ' style="display: none"'
                        html += ' id="for-e-' + dto.paymentId + '+">기타 사유</label>'
                        html += '<input type="text" class="form-control" id="etc-' + dto.paymentId + '"'
                        html += ' style="display: none">'
                        html += '</div>'

                    }

                    html += '</div>'

                    html += '<div class="cart-item-quantity">';
                    html += '<i class="fa  fa-shopping-basket"></i>';
                    html += '<span>수량 : ' + dto.quantity + '</span>';
                    html += '</div>';
                    html += '</li>';

                })
                // 필요한 처리를 여기에 추가하세요.
                $("#list").append(html)


            })
            .catch(error => {
                console.error('Error:', error);
            });

    }

</script>
<script src="/js/buy-list.js"/>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
