<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>
    /* 테이블 기본 스타일링 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 1.3rem; /* 폰트 사이즈 증가 */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-width: 400px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);

    }

    caption {
        caption-side: top; /* 제목을 위쪽에 배치 */
        font-size: 1.5em; /* 제목 폰트 사이즈 */
        font-weight: bold; /* 폰트 굵기 */
        color: #ff2929; /* 제목 색상 */
        padding: 10px; /* 패딩 */
        text-align: center; /* 텍스트 중앙 정렬 */
        margin-bottom: 15px; /* 제목과 테이블 사이 간격 */
    }

    th, td {
        padding: 12px !important; /* 패딩 증가 */
        text-align: left;
        border-bottom: 1px solid #dddddd;


    }

    th {

        background-color: #ff2929; /* 테이블 헤더 배경색 변경 */
        color: #ffffff;
        text-align: center; /* 텍스트 정렬을 왼쪽으로 변경 */
        font-size: 1.3em; /* 테이블 헤더 폰트 사이즈 증가 */

    }

    tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    tr:last-of-type {
        border-bottom: 2px solid #ff2929;
    }


    /* 버튼 스타일링 */
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

    /* 아래 정렬을 위한 컨테이너 */
    .button-container {
        text-align: right; /* 버튼을 오른쪽 정렬 */
        margin-top: 20px;
    }

    hr {
        margin-left: 0%;
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
            <caption style="text-align: left; color: grey"> <span >상세보기
                </span>
                <hr style="width: 10%; border: solid #ff2929; text-align: center">
            </caption> <!-- 테이블 제목 추가 -->
            <!-- 세로로 데이터를 표시하는 행들 -->
            <tr>
                <th width="300" style="padding: 1px;">주문번호</th>
                <td>1</td>
            </tr>
            <tr>
                <th>의뢰 이름</th>
                <td>웹사이트 개발</td>
            </tr>
            <tr>
                <th>신청자 닉네임</th>
                <td>webmaster123</td>
            </tr>
            <tr>
                <th>신청자 연락처</th>
                <td>010-5899-9057</td>
            </tr>
            <tr>
                <th>신청자 이메일</th>
                <td>asdfasd@naver.com</td>
            </tr>
            <tr>
                <th>의뢰 신청일자</th>
                <td>2023-11-01</td>
            </tr>
            <tr>
                <th height="400">요청 사항</th>
                <td>ㄴㅁㅇㄹㅇㅁㄶㄴㅇㄻㄴㅇㅁㄹ</td>
            </tr>
            <tr>
                <th>여부</th>
                <td>확인중</td>
            </tr>

        </table>
        <div class="button-container mb-5">
            <button class="button">버튼1</button>

            <button class="button">버튼2</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>