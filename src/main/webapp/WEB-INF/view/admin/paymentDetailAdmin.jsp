<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div style="font-family: 'NanumSquareRound';">
    <div class="card-body text-black" style="margin: 25px auto;
    max-width: 600px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div class="d-flex align-items-center mb-0 pb-1" style="
        background-color: #212529;
        color: white;
        border-top-right-radius: 6px;
        border-top-left-radius: 6px;">
            <div class="d-flex align-items-center" style="margin : 0 auto; padding: 3px;">
                <i class="fa-solid fa-sack-dollar fa-2xl"></i> <span
                    class="h1 fw-bold mb-0">&nbsp;결제 상세 정보</span>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="form-outline mb-1" style="display: flex; justify-content: center;">
                <div class="user-inline me-2">
                    <label class="form-label my-0" for="customer-nickname">
                        <text style="color: blue"><i class="fa-solid fa-cart-shopping"></i> 구매자</text>
                    </label>
                    <div style="display: flex;">
                        <input type="text" id="customer-nickname" value="${adminPayment.customerNickname}"
                               class="form-control form-control input-l" readonly="readonly"/>
                    </div>
                </div>
                <div class="user-inline ml-2">
                    <label class="form-label my-0" for="editor-nickname">
                        <text style="color: red"><i class="fa-solid fa-coins"></i> 판매자</text>
                    </label>
                    <div style="display: flex;">
                        <input type="text" id="editor-nickname" value="${adminPayment.editorNickname}"
                               class="form-control form-control input-l" readonly="readonly"/>
                    </div>
                </div>
            </div>

            <div class="form-outline mb-1">
                <label class="form-label my-0" for="name">내용</label>
                <div style="display: flex;">
                    <input type="text" id="name" value="${adminPayment.name}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-1">
                <label class="form-label my-0" for="total-price">총 가격</label>
                <div style="display: flex;">
                    <input type="text"
                           id="total-price"
                           value="<fmt:formatNumber value="${adminPayment.totalPrice}" pattern="#,###"/>원"
                           class="form-control form-control input-l"
                           readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-1">
                <label class="form-label my-0" for="request">요구사항</label>
                <div style="display: flex;">
                    <input type="text"
                           id="request"
                           value="${adminPayment.request == null or adminPayment.request == '' ? '없음' : adminPayment.request}"
                           class="form-control form-control input-l"
                           readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-1" style="display: flex; justify-content: center;">
                <div class="user-inline me-2">
                    <label class="form-label my-0" for="imp-uid">imp_uid</label>
                    <div style="display: flex;">
                        <input type="text" id="imp-uid" value="${adminPayment.impUid}"
                               class="form-control form-control input-l" readonly="readonly"/>
                    </div>
                </div>
                <div class="user-inline ml-2">
                    <label class="form-label my-0" for="merchant-uid">merchant_uid</label>
                    <div style="display: flex;">
                        <input type="text" id="merchant-uid" value="${adminPayment.merchantUid}"
                               class="form-control form-control input-l" readonly="readonly"/>
                    </div>
                </div>
            </div>

            <div class="form-outline mb-1">
                <label class="form-label my-0" for="created-at">최초 결제일</label>
                <div style="display: flex;">
                    <input type="text" id="created-at" value="${adminPayment.createdAt}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-label my-2">상품 상세 목록</div>
            <c:forEach items="${adminPaymentDetailList}" var="adminPaymentDetail" varStatus="status">
                <ul class="list-group list-group-horizontal my-1">
                    <li class="list-group-item">${status.count}</li>
                    <li class="list-group-item flex-fill">${adminPaymentDetail.options}</li>
                    <li class="list-group-item flex-fill">${adminPaymentDetail.quantity}개</li>
                    <li class="list-group-item flex-fill"><fmt:formatNumber value="${adminPaymentDetail.price}"
                                                                            pattern="#,###"/>원
                    </li>
                </ul>
            </c:forEach>

            <div class="form-outline my-2" style="display: flex; justify-content: center; align-items: center;">
                <c:forEach items="${adminPaymentStateList}" var="adminPaymentState" varStatus="status">
                    <div class="mx-3" style="align-items: center; display: grid;">
                        <div class="m-auto">
                            <c:if test="${adminPaymentState.state == 'payment_done' and status.last == true}">
                                <c:set var="onlyPaid" value="true"/>
                            </c:if>
                            <c:choose>
                                <c:when test="${adminPaymentState.state == 'payment_done'}">
                                    <text style="color: blue">결제 완료 <i class="fa-regular fa-credit-card"></i></text>
                                </c:when>
                                <c:when test="${adminPaymentState.state == 'hand_over'}">
                                    <text style="color: red">인계 완료 <i class="fa-solid fa-right-left"></i></text>
                                </c:when>
                                <c:when test="${adminPaymentState.state == 'trade_done'}">
                                    <text style="color: cadetblue">거래 완료 <i class="fa-solid fa-circle-check"></i></text>
                                </c:when>
                                <c:when test="${adminPaymentState.state == 'c_cancel'}">
                                    <text style="color: lightskyblue">구매자 취소 <i class="fa-solid fa-ban"></i></text>
                                </c:when>
                                <c:when test="${adminPaymentState.state == 'admin_cancel'}">
                                    <text style="color: #7c7a5b">관리자 취소 <i class="fa-solid fa-screwdriver-wrench"></i>
                                    </text>
                                </c:when>
                            </c:choose>
                        </div>
                        <div>${fn:substring(adminPaymentState.createdAt, 0, 16)}</div>
                    </div>
                    <c:if test="${adminPaymentState.state == 'payment_done' and status.last == false}">
                        <i class="fa-solid fa-right-long fa-2xl" style="color: blue"></i>
                    </c:if>
                    <c:if test="${adminPaymentState.state == 'hand_over' and status.last == false}">
                        <i class="fa-solid fa-right-long fa-2xl" style="color: red"></i>
                    </c:if>
                </c:forEach>
            </div>

            <%--            <div class="form-outline mb-0" style="display: flex; justify-content: center;">--%>
            <%--                <div class="user-inline">--%>
            <%--                    <label class="form-label my-0" for="editor-createdAt">판매자 전환일</label>--%>
            <%--                    <div style="display: flex;">--%>
            <%--                        <input type="text" id="editor-createdAt" value="${userDetail.editorCreatedAt != null ? userDetail.editorCreatedAt : '구매자'}"--%>
            <%--                               class="form-control form-control input-l me-1" readonly="readonly"/>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="user-inline">--%>
            <%--                    <label class="form-label my-0" for="created-at">가입일</label>--%>
            <%--                    <div style="display: flex;">--%>
            <%--                        <input type="text" id="created-at" value="${userDetail.createdAt}"--%>
            <%--                               class="form-control form-control input-l ms-1" readonly="readonly"/>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <input type="hidden" id="payment-id" value="${adminPayment.paymentId}">
            <%--            <div class="form-outline mb-0 mt-2">--%>
            <%--                <label style="font-weight: bold" class="form-label my-0" for="roleId">회원등급 :--%>
            <%--                    <c:choose><c:when test="${userDetail.level == 0}"> 일반 유저 </c:when><c:otherwise> 관리자 </c:otherwise>--%>
            <%--                    </c:choose></label>--%>
            <%--                <select name="level" id="roleId" class="datatable-selector" style="padding-left: 1.125rem; padding-right: 2.125rem;">--%>
            <%--                    <c:choose>--%>
            <%--                        <c:when test="${userDetail.level == 0}">--%>
            <%--                            <option value="2" selected>관리자</option>--%>
            <%--                        </c:when>--%>
            <%--                        <c:otherwise>--%>
            <%--                            <option value="1" selected>일반유저</option>--%>
            <%--                        </c:otherwise>--%>
            <%--                    </c:choose>--%>
            <%--                </select>--%>
            <%--                <button class="btn btn-secondary btn-block btn-admin" type="button" id="changeRole">변경하기</button>--%>
            <%--            </div>--%>

            <%--            <div class="form-outline mb-0 mt-2">--%>
            <%--                <label style="font-weight: bold" class="form-label my-0" for="ableId">회원등급 :--%>
            <%--                    <c:choose><c:when test="${userDetail.enabledCheck == 0}"> 비탈퇴 회원 </c:when><c:otherwise> 탈퇴 회원 </c:otherwise>--%>
            <%--                    </c:choose></label>--%>
            <%--                <select name="able" id="ableId" class="datatable-selector" style="padding-left: 1.125rem; padding-right: 2.125rem;">--%>
            <%--                    <c:choose>--%>
            <%--                        <c:when test="${userDetail.enabledCheck == 0}">--%>
            <%--                            <option value="1" selected>탈퇴 처리</option>--%>
            <%--                        </c:when>--%>
            <%--                        <c:otherwise>--%>
            <%--                            <option value="0" selected>비탈퇴 처리</option>--%>
            <%--                        </c:otherwise>--%>
            <%--                    </c:choose>--%>
            <%--                </select>--%>
            <%--                <button class="btn btn-secondary btn-block btn-admin" type="button" id="changeAble">변경하기</button>--%>
            <%--            </div>--%>


            <div class="pt-1">

                <%--                <button class="btn btn-dark btn-lg btn-block"--%>
                <%--                        style="font-size: 0.8rem;" type="submit">정보수정--%>
                <%--                </button>--%>

                <button class="btn btn-secondary btn-block btn-admin"
                        type="button"
                        onClick="location.href='/admin/payment-admin?page=${page}'">
                    목록보기
                </button>
                <c:if test="${onlyPaid == true}">
                    <button class="btn btn-secondary btn-block btn-admin"
                            type="button"
                            onClick="cancel(${adminPayment.editorId}, ${adminPayment.paymentId}, ${adminPayment.totalPrice})">
                        취소하기
                    </button>
                </c:if>
            </div>

        </div>
    </div>

</div>
<script>

    $('#changeRole').on('click', () => {

        let idval = $('#userId').val();
        let roleval = $('#roleId').val();

        console.log(idval);
        console.log(roleval);

        $.ajax({
            type   : "POST",
            url    : "/admin/user/modify-level",
            data   : {
                "userId": idval,
                "level" : roleval
            },
            success: function (data) {
                if (data === 200) {
                    location.reload();
                }
            }
            , error: function () {
                Swal.fire({
                    icon: "error",
                    title: "에러입니다",
                });
            }
        });
    });

    $('#changeAble').on('click', () => {

        let idval = $('#userId').val();
        let ableval = $('#ableId').val();

        console.log(idval);
        console.log(ableval);

        $.ajax({
            type   : "POST",
            url    : "/admin/user/modify-able",
            data   : {
                "userId"      : idval,
                "enabledCheck": ableval
            },
            success: function (data) {
                if (data === 200) {
                    location.reload();
                }
            }
            , error: function () {
                Swal.fire({
                    icon: "error",
                    title: "에러입니다",
                });
            }
        });
    });

    function show_spinner() {
        document.getElementsByClassName('layer-popup')[0].style.display = 'block';
    }

    function hide_spinner() {
        document.getElementsByClassName('layer-popup')[0].style.display = 'none';
    }

    function cancel(editorId, paymentId, totalPrice) {
        Swal.fire({
            title             : "정말 취소처리 하시겠습니까?",
            text              : "되돌릴 수 없습니다!",
            icon              : "warning",
            showCancelButton  : true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor : "#d33",
            confirmButtonText : "취소처리"
        }).then((result) => {
            if (result.isConfirmed) {
                show_spinner();
                fetch('/payment-state/editor-cancel', {
                    method : 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body   : JSON.stringify({
                        editorId         : editorId,
                        paymentId        : paymentId,
                        editorRecognize  : 3,
                        customerRecognize: 3,
                        point            : totalPrice,
                        state            : 'admin_cancel'
                    })
                })
                    .then(response => {
                        if (!response.ok) {
                        } else {

                            fetch('/payment/cancel/' + paymentId, {
                                method: 'GET',
                            }).then(response => response.json())
                                .then(data => {
                                    refund(data.impUid, data.totalPrice)
                                })

                        }
                    })
                    .then(data => console.log(data))
                    .catch(error => console.error('Error:', error));
            }
        });
    }

    function refund(impUid, totalprice) {
        fetch('/payment/authorizedCode', {
            method: 'POST'
        }).then(response => response.json())
            .then(data => {
                fetch('https://cors-anywhere.herokuapp.com/https://api.iamport.kr/users/getToken', {
                    method : 'POST',
                    headers: {              // Http header
                        "Content-Type": 'application/json',
                    },
                    body   : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                        imp_key   : data.apiKey,
                        imp_secret: data.apiSecret
                    })
                }).then(response => response.json())
                    .then(data => {
                        // 결제 취소
                        fetch('https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel', {
                            method : 'POST',
                            headers: {              // Http header
                                "Content-Type" : 'application/json',
                                "Authorization": data.response.access_token
                            },
                            body   : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                                reason : '환불', // 가맹점 클라이언트로부터 받은 환불사유
                                imp_uid: impUid, // imp_uid를 환불 `unique key`로 입력
                                amount : totalprice // 가맹점 클라이언트로부터 받은 환불금액
                            })
                        }).then(response => response.json())
                            .then(data => {
                                hide_spinner();
                                location.reload();
                            })
                    })
            })
    }

    // Swal.fire({
    //     title             : "정말 취소처리 하시겠습니까?",
    //     text              : "되돌릴 수 없습니다!",
    //     icon              : "warning",
    //     showCancelButton  : true,
    //     confirmButtonColor: "#3085d6",
    //     cancelButtonColor : "#d33",
    //     confirmButtonText : "취소하기"
    // }).then((result) => {
    //     if (result.isConfirmed) {
    //
    //     }
    // });

    $(document).ready(function () {

    });

</script>

<style>
    .layer-popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.8);
        z-index: 1000;
        justify-content: center;
        align-items: center;
        margin: -30px 0 0 -30px;
    }

    .spinner {
        position: absolute;
        top: 50%;
        left: 50%;
        border: 8px solid #f3f3f3; /* Light grey */
        border-top: 8px solid #3498db; /* Blue */
        border-radius: 50%;
        width: 60px;
        height: 60px;
        animation: spinner 2s linear infinite;
    }

    @keyframes spinner {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }
</style>

<div class="layer-popup" style="display: none;">
    <div class="spinner"></div>
</div>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>