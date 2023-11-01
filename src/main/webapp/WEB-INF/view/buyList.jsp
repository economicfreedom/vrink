<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>


    table {
        width: 100%;
        border-collapse: collapse;


    }

    th, td {
        padding: 10px;
        border: 3px solid black;
        text-align: left;
        font-weight: bold;
    }

    th {
        background-color: #ff2911;
        color: #f2dede;
        font-weight: bold;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    button {
        padding: 5px 10px;
        font-size: 12px;
        cursor: pointer;
    }
</style>
<div class="container">
    <div>
        <h1>구매 목록</h1>
        <table>

            <tr>
                <th>구매 날짜</th>
                <th>작가</th>
                <th>이름</th>
                <th>가격</th>
                <th>액션</th>
            </tr>
            <tr>
                <td>2023-10-01</td>
                <td>홍길동</td>
                <td>작품 A</td>
                <td>₩10,000</td>
                <td>
                    <button type=button class="flat-btn" id="apply" style="border-radius: 40px;">수락</button>
                </td>
            </tr>

        </table>
    </div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
