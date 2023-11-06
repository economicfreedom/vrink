<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<style>
    /* 테이블 기본 스타일링 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 1.2em; /* 폰트 사이즈 증가 */
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
        padding: 20px 30px; /* 패딩 증가 */
        text-align: center;
        border-bottom: 1px solid #dddddd;
    }

    th {
        background-color: #ff2929; /* 테이블 헤더 배경색 변경 */
        color: #ffffff;
        text-align: center;
        font-size: 1.3em; /* 테이블 헤더 폰트 사이즈 증가 */
    }

    tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    tr:last-of-type {
        border-bottom: 2px solid #ff2929;
    }


    hr {
        margin-left: 0%;
    }

    /* 테이블 헤더 텍스트 정렬 */
    .th-text-center {
        text-align: center;
        padding: 20
    }
</style>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="inner-head overlap" style="margin-bottom: 5%">
    <div data-velocity="-.2"
         style="background: url(http://placehold.it/1500x1100) repeat scroll 50% 422.28px transparent;"
         class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
    <div class="container">
        <div class="inner-content">
            <span><i class="fa fa-bolt"></i></span>
            <h2>GALLERY 3 COLUMN</h2>
            <ul>
                <li><a href="#" title="">HOME</a></li>
                <li><a href="#" title="">GALLERY 3 COLUMN</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- inner Head -->
<div class="container mb-5"  >

    <div >
        <table style="padding: 20;margin-bottom: 30%" >
            <caption>의뢰 요청 목록

                <hr style="width: 10%; border: solid #ff2929;">
                <div style="text-align: right;font-size: 15px">
                    <input type="radio" id="all" name="filter" style="margin-left: 2%;" checked>
                    <label for="all">모두 보기</label>
                    <input type="radio" id="ing" name="filter" style="margin-left: 2%;">
                    <label for="ing">진행중인 작업 보기</label>
                    <input type="radio" id="done" name="filter" style="margin-left: 2%;">
                    <label for="done">완료된 작업 보기</label>
                </div>
            </caption> <!-- 테이블 제목 추가 -->


            <tr>
                <th class="th-text-center">주문번호</th>
                <th class="th-text-center">의뢰 이름</th>
                <th class="th-text-center">신청자 닉네임</th>
                <th class="th-text-center">의뢰 신청일자</th>
                <th class="th-text-center">여부</th>
            </tr>
            <tr style="padding: 20">
                <td class="th-text-center">1</td>
                <td class="th-text-center">웹사이트 개발</td>
                <td class="th-text-center">webmaster123</td>
                <td class="th-text-center">2023-11-01</td>
                <td class="th-text-center">확인중</td>
            </tr>
            <!-- 추가적인 행들을 이곳에 삽입 -->
        </table>
    </div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
