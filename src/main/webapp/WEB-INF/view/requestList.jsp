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
<div class="container mb-5">

    <div>
        <table style="padding: 20px;margin-bottom: 3%">
            <caption>의뢰 요청 목록
                <div class="coupon"
                     style="float: right;margin-right: 20px;margin-bottom: 20px; display: flex;gap: 1rem;justify-content: end;">
                    <label for="type"></label>
                    <select class="form-control" id="type" style="width: 20%">
                        <option value="all" ${type == 'all' ? 'selected':''}>전체</option>
                        <option value="request" ${type == 'request' ? 'selected':''}>의뢰</option>
                        <option value="nickname"${type == 'nickname' ? 'selected':''}>닉네임</option>
                    </select>
                    <input type="text" placeholder="검색어 입력"
                           style="height: 5%; width: 60%; font-size: 20px;color: black"
                           id="keyword"

                           value="${keyword == null ? '':keyword}">
                    <button type="button" class="flat-btn" id="search"
                            style="float: right;height: 33px; font-size: 15px; padding: 0; width: 24%;">
                        <i class="fa fa-search"
                           style="font-size: 15px; "></i>검색하기
                    </button>
                </div>

                <hr style="width: 10%; border: solid #ff2929;">

                <div style="text-align: right;font-size: 15px">
                    <input type="radio" name="filter" value="all" style="margin-left: 2%;"
                    ${filter == 'all' ? 'checked':''}
                           id="all">
                    <label for="all">모두 보기</label>
                    <input type="radio" name="filter" value="ing" style="margin-left: 2%;"
                    ${filter == 'ing' ? 'checked':''}
                           id="ing">
                    <label for="ing">진행중인 작업 보기</label>
                    <input type="radio" name="filter" value="done" style="margin-left: 2%;"
                    ${filter == 'done' ? 'checked':''}
                           id="done">
                    <label for="done">완료된 작업 보기</label>
                </div>


            </caption>


            <tr>
                <th class="th-text-center">주문번호</th>
                <th class="th-text-center">의뢰 이름</th>
                <th class="th-text-center">신청자 닉네임</th>
                <th class="th-text-center">의뢰 신청일자</th>
                <th class="th-text-center">여부</th>
            </tr>
            <c:forEach items="${list}" var="dto">
                <tr style="padding: 20">
                    <td class="th-text-center">${dto.paymentId}</td>
                    <td class="th-text-center">
                        <a href="/editor/request-view/${dto.paymentId}" style="text-decoration: none;color: black">
                                ${dto.name}
                        </a>
                    </td>
                    <td class="th-text-center">${dto.nickname}</td>
                    <td class="th-text-center">${dto.createdAt}</td>
                    <td class="th-text-center">${dto.state}</td>
                </tr>
            </c:forEach>

        </table>

    </div>
    <form action="/editor/request-list" name="page-form">
        <ul class="pagination" id="pagination" style="margin: 20px 0;">

            <c:if test="${pageDTO.prev}">
                <li class="disabled"><a href="#"
                                        data-page-num="${pageDTO.beginPage-1}"><span>PREV</span></a>
                </li>
            </c:if>
            <c:if test="${!pageDTO.prev}">
                <li class="disabled"><a href="#"
                                        data-page-num="${pageDTO.beginPage-1}"><span></span></a>
                </li>
            </c:if>

            <c:forEach var="num" begin="${pageDTO.beginPage}" end="${pageDTO.endPage}">
                <li class="${pageDTO.cri.pageNum == num ? 'active' : ''}">
                    <a href="#" data-page-num="${num}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageDTO.next}">
            <li><a href="#"
                   data-page-num="${pageDTO.endPage+1}"><span>NEXT</span></a></li>
        </ul>
        </c:if>
        <input type="hidden" name="page-num" value="${pageDTO.cri.pageNum}">
        <input type="hidden" name="countPerPage" value="${pageDTO.cri.countPerPage}">
        <input type="hidden" name="keyword" value="${pageDTO.cri.keyword}">
        <input type="hidden" name="type" value="${pageDTO.cri.type}">
        <input type="hidden" name="filter" value="${pageDTO.cri.filter}">

    </form>
</div>

<script>

    $(document).ready(function () {
        $('input[name="filter"]').click(function () {
            let type = $("#type").val();
            let keyword = $("#keyword").val();
            let filter = $('input[name="filter"]:checked').val();


            location.href = "/editor/request-list?type=" + type
                + "&keyword=" + keyword
                + "&filter=" + filter;
        })

        $("#search").click(function () {

            let type = $("#type").val();
            let keyword = $("#keyword").val();
            let filter = $('input[name="filter"]:checked').val();


            location.href = "/editor/request-list?type=" + type
                + "&keyword=" + keyword
                + "&filter=" + filter;

        });
        $("#keyword").keypress(function (event) {

            if (event.which == 13) {  // 13은 엔터 키의 키 코드입니다.
                let type = $("#type").val();
                let keyword = $("#keyword").val();
                let filter = $('input[name="filter"]:checked').val();

                location.href = "/editor/request-list?type=" + type
                    + "&keyword=" + keyword
                    + "&filter=" + filter;

            }
        });

        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            const value = $(this).data('page-num');
            console.log(value);

            document["page-form"]["page-num"].value = value;
            document["page-form"].type.value = $("select[name='type']").val();
            document["page-form"].keyword.value = $("#keyword").val();
            document["page-form"].filter.value = $('input[name="filter"]:checked').val()
            document["page-form"].submit();
        }); // end of #pagination
    })
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
