<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    /* 테이블 기본 스타일링 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 1.3rem;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-width: 400px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);

    }

    caption {
        caption-side: top;
        font-size: 1.5em;
        font-weight: bold;
        color: #ff2929;
        padding: 10px;
        text-align: center;
        margin-bottom: 15px;
    }

    th, td {
        padding: 12px !important;
        text-align: left;
        border-bottom: 1px solid #dddddd;


    }

    th {

        background-color: #ff2929;
        color: #ffffff;
        text-align: center;
        font-size: 1.3em;

    }

    tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    tr:last-of-type {
        border-bottom: 2px solid #ff2929;
    }


    .button {
        padding: 10px 20px;
        background-color: #ff2929;
        color: white;
        text-decoration: none;
        margin-top: 20px;
        display: inline-block;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .button:hover {
        background-color: #e60000;
    }


    .button-container {
        text-align: right;
        margin-top: 20px;
    }

    hr {
        margin-left: 0%;
    }

    .total-quantities {
        display: flex;
        justify-content: space-between;
        margin-top: 15px;
        padding: 10px;
        background-color: #f9f9f9;
        border-top: 1px solid #ddd;
    }

    .total-quantities > div {
        margin-right: 20px;
    }

    .total-quantity strong, .total-price strong {
        margin-right: 10px;


    }

    .button2 {
        padding: 10px 20px;
        background-color: #00A8FF;
        color: white;
        text-decoration: none;
        margin-top: 20px;
        display: inline-block;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .button2:hover {
        background-color: #00A0D1;
    }
</style>
<div class="inner-head overlap" style="margin-bottom: 5%">
    <div data-velocity="-.2"
         style="background: url(http://placehold.it/1500x1100) repeat scroll 50% 422.28px transparent;"
         class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
    <div class="container">
        <div class="inner-content">
            <span><i class="fa fa-bolt"></i></span>
            <h2>의뢰 요청</h2>
            <ul>
                <li><a href="#" title="">목록</a></li>
                <li><a href="#" title="">상세보기</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- inner Head -->
<div class="container">
    <div class="title">
        <h2>의뢰 요청</h2>
    </div>
    <div>
        <table style="padding: 20; ">
            <caption style="text-align: left; color: grey"> <span>상세보기
                </span>
                <hr style="width: 10%; border: solid #ff2929; text-align: center">
            </caption>

            <tr>
                <th width="300" style="padding: 1px;">주문번호</th>
                <td>${requestDTO.paymentId}</td>
            </tr>
            <tr>
                <th>의뢰 이름</th>
                <td>${requestDTO.name}</td>
            </tr>
            <tr>
                <th>신청자 닉네임</th>
                <td>${requestDTO.nickname}</td>
            </tr>
            <tr>
                <th>신청자 연락처</th>
                <td>${requestDTO.phone}</td>
            </tr>
            <tr>
                <th>신청자 이메일</th>
                <td>${requestDTO.email}</td>
            </tr>
            <tr>
                <th>의뢰 신청일자</th>
                <td>${requestDTO.createdAt}</td>
            </tr>

            <tr>
                <th height="400">요청 사항</th>
                <td>${requestDTO.request}</td>
            </tr>
            <tr>
                <th>여부</th>
                <%--                나중에 추가--%>
                <td>${requestDTO.state}</td>
            </tr>

        </table>


    </div>
    <div>
        <table>
            <caption style="text-align: left; color: grey"> <span>상세보기
                </span>
                <hr style="width: 10%; border: solid #ff2929; text-align: center">
            </caption>
            <thead>
            <tr>
                <th>상품명</th>
                <th>상품 갯수</th>
                <th>가격</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${detailDTO.requestListDTOS}" var="request">
                <tr>
                    <td style="text-align: center;">${request.options}</td>
                    <td style="text-align: center;">${request.quantity}</td>
                    <td style="text-align: center;"><fmt:formatNumber value="${request.price}" pattern="#,###"/>원</td>
                </tr>
            </c:forEach>


            </tbody>
        </table>
        <div class="total-quantities">
            <div class="total-quantity">
                <strong>총 수량:</strong>
                <span>${detailDTO.quantity}</span>
            </div>
            <div class="total-price">
                <strong>총 가격:</strong>
                <span><fmt:formatNumber value="${detailDTO.price}" pattern="#,###"/>원</span>
            </div>
        </div>
    </div>

    <div class="button-container mb-5">

        <c:if test="${requestDTO.editorRecognize == 0}">
            <button class="button" id="done">의뢰 완료</button>
        </c:if>
        <c:if test="${requestDTO.state == '진행중'}">
            <button class="button2" id="cancel">의뢰 거절</button>
        </c:if>

    </div>
</div>
<script>
    $(document).ready(function () {

        $("#done").click(function () {

            fetch('/payment-state/editor-done', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    editorId: `${requestDTO.editorId}`,
                    paymentId: `${requestDTO.paymentId}`,
                    editorRecognize: 1,
                    customerRecognize: `${requestDTO.customerRecognize}`,
                    point: ${detailDTO.price},
                    state: 'payment_done'

                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("")
                    } else {
                        location.reload()
                    }
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));
        })


        $("#cancel").click(function () {


            fetch('/payment-state/editor-cancel', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    editorId: `${requestDTO.editorId}`,
                    paymentId: `${requestDTO.paymentId}`,
                    editorRecognize: 0,
                    customerRecognize: `${requestDTO.customerRecognize}`,
                    point: ${detailDTO.price},
                    state: 'e_cancel'


                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("")
                    } else {
                        location.reload()

                    }
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));
        })
        fetch('/payment/authorizedCode', {
            method: 'POST'
        }).then(response => response.json())
            .then(data => {
                fetch('https://cors-anywhere.herokuapp.com/https://api.iamport.kr/users/getToken', {
                    method: 'POST',
                    headers: {              // Http header
                        "Content-Type": 'application/json',
                    },
                    body: JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                        imp_key: data.apiKey,
                        imp_secret: data.apiSecret
                    })
                }).then(response => response.json())
                    .then(data => {
                        // 결제 취소
                        let totalprice = ${detailDTO.price};
                        let impUid = ${requestDTO.paymentId};
                        fetch('https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel', {
                            method: 'POST',
                            headers: {              // Http header
                                "Content-Type": 'application/json',
                                "Authorization": data.response.access_token
                            },
                            body: JSON.stringify({  // 보낼 데이터 (Object , String, Array)
                                reason: '환불', // 가맹점 클라이언트로부터 받은 환불사유
                                imp_uid: impUid, // imp_uid를 환불 `unique key`로 입력
                                amount: totalprice // 가맹점 클라이언트로부터 받은 환불금액
                            })
                        }).then(response => response.json())
                            .then(data => {
                                hide_spinner()
                                location.reload()
                            })
                    })
            })

    })
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>