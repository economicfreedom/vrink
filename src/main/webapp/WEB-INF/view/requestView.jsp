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
                <td>확인중</td>
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
                    <td>${request.options}</td>
                    <td>${request.quantity}</td>
                    <td><fmt:formatNumber value="${request.price}" pattern="#,###" />원</td>
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
                <span><fmt:formatNumber value="${detailDTO.price}" pattern="#,###" />원</span>
            </div>
        </div>
    </div>

    <div class="button-container mb-5">
        <button class="button">버튼1</button>

        <button class="button">버튼2</button>
    </div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>