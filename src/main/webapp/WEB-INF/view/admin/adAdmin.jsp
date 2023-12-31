<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<style>
    .table {
        /* 	width: 100%; */
        border-collapse: collapse;
        margin-left: 25px;
        margin-top: 20px;
    }

    .tab--ad li {
        margin-right: 8px !important;
        width: 112px !important;
    }

    .t-head {
        background-color: #ececec;
    }

    .table td {
        padding: 1px !important;
        vertical-align: baseline !important;
        padding-left: 8px !important;
    }

    .card-header {
        padding-left: 23px;
    }

    p {
        margin: 0;
    }

    td:nth-child(1) {
        padding: 1px;
    }

    td:nth-child(2) {
        width: 20%;
    }

    td:last-child {
        text-align: right;
        padding-right: 10px !important;
    }

    td {
        vertical-align: middle;
    }

    td a {
        color: black;
        text-decoration: none !important;
    }

    h4 {
        margin-top: 5px;
        font-size: 20px;
    }

    .classification {
        display: inline-block;
        font-weight: bold;
        padding: 8px 0;
    }

    .classification2 {
        display: inline-block;
    }

    .classification3 {
        display: inline-block;
    }

    .write-btn {
        text-align: right;
    }

    .title--ad {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--ad {
        margin-top: 8px;
        margin-left: 24px;
        margin-bottom: 0;
        padding: 0;
        overflow: hidden;
    }

    .tab--ad :hover {
        cursor: pointer;
    }

    .tab--ad li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--ad li:last-child {
        border-right: none;
    }

    .tab--ad li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--ad > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--ad > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
        border-radius: 9px;
    }

    .tab--ad::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--ad li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
        border-radius: 10px;
    }

    .tab--ad li.active a {
        font-weight: bold;
        color: black;
    }

    .paging {
        text-align: center;
        margin-top: 40px;
        margin-bottom: 40px;
    }

    .pagination {
        display: inline-block;
    }

    .pagination li {
        display: inline-block;
        list-style: none;
    }

    .pagination li a {
        display: inline-block;
        padding: 5px 10px;
        border: 1px solid #ddd;
        background-color: #fff;
        color: #151432;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s, color 0.3s;
    }

    .pagination li a:hover {
        background-color: #151432;
        color: #fff;
    }

    .pagination li.active a {
        background-color: #151432;
        color: #fff;
    }

    .write-btn {
        display: inline-block;
        padding: 10px 20px;
        border: 1px solid black;
        background-color: #fff;
        color: #151432;
        margin-bottom: 50px;
        text-decoration: none !important;
        transition: background-color 0.3s, color 0.3s;
    }

    .write-btn:hover {
        background-color: #151432;
        color: #fff;
    }
</style>

<%--		<c:if test="${ad.roleTypeId == 2}">--%>
<%--			<a href="/customerservice/ad/write" class="write-btn">글쓰기</a>--%>
<%--		</c:if>--%>

<%--<c:forEach items="${adList}" var="dto">--%>
<%--    <h1>${dto.nickname}</h1>--%>
<%--</c:forEach>--%>
<div class="card m-4">
    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 배너 목록</h3></div>

    <ul class="tab--ad cl1">
        <c:choose>
            <c:when test="${uClassification == '전체' or empty uClassification}">
                <li class="active" data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="1"><a href="#">게시중</a></li>
                <li data-classification="0"><a href="#">비게시</a></li>
            </c:when>
            <c:when test="${uClassification == '1'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li class="active" data-classification="1"><a href="#">게시중
                </a></li>
                <li data-classification="0"><a href="#">비게시</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="1"><a href="#">게시중</a></li>
                <li class="active" data-classification="0"><a href="#">비게시</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <ul class="tab--ad cl2">
        <c:choose>
            <c:when test="${uClassification2 == '전체' or empty uClassification2}">
                <li class="active" data-classification2="전체"><a href="#">전체</a></li>
                <li data-classification2="0"><a href="#">메인</a></li>
                <li data-classification2="1"><a href="#">사이드</a></li>
            </c:when>
            <c:when test="${uClassification2 == '0'}">
                <li data-classification2="전체"><a href="#">전체</a></li>
                <li class="active" data-classification2="0"><a href="#">메인
                </a></li>
                <li data-classification2="1"><a href="#">사이드</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification2="전체"><a href="#">전체</a></li>
                <li data-classification2="0"><a href="#">메인</a></li>
                <li class="active" data-classification2="1"><a href="#">사이드</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <ul class="tab--ad cl3">
        <c:choose>
            <c:when test="${uClassification3 == '전체' or empty uClassification3}">
                <li class="active" data-classification3="전체"><a href="#">전체</a></li>
                <li data-classification3="0"><a href="#">외부광고</a></li>
                <li data-classification3="1"><a href="#">공지사항</a></li>
            </c:when>
            <c:when test="${uClassification3 == '0'}">
                <li data-classification3="전체"><a href="#">전체</a></li>
                <li class="active" data-classification3="0"><a href="#">외부광고
                </a></li>
                <li data-classification3="1"><a href="#">공지사항</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification3="전체"><a href="#">전체</a></li>
                <li data-classification3="0"><a href="#">외부광고</a></li>
                <li class="active" data-classification3="1"><a href="#">공지사항</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <form style="width: 95%;" action="#" name="pageForm">
        <div class="mt-2 mx-4">
            <select name="searchType"
                    id="searchType"
                    class="datatable-selector"
                    style="padding-left: 1.125rem; padding-right: 2.125rem;">
                <c:choose>
                    <c:when test="${uSearchType == '회사이름'}">
                        <option value="전체">전체</option>
                        <option value="회사이름" selected>회사이름</option>
                        <option value="가격">가격</option>
                        <option value="기간">기간</option>
                    </c:when>
                    <c:when test="${uSearchType == '가격'}">
                        <option value="전체">전체</option>
                        <option value="회사이름">회사이름</option>
                        <option value="가격" selected>가격</option>
                        <option value="기간">기간</option>
                    </c:when>
                    <c:when test="${uSearchType == '기간'}">
                        <option value="전체">전체</option>
                        <option value="회사이름">회사이름</option>
                        <option value="가격">가격</option>
                        <option value="기간" selected>기간</option>
                    </c:when>

                    <c:otherwise>
                        <option value="전체" selected>전체</option>
                        <option value="회사이름">회사이름</option>
                        <option value="가격">가격</option>
                        <option value="기간">기간</option>
                    </c:otherwise>
                </c:choose>

            </select> <input type="text" id="keyword" name="keyword" class="datatable-input"
                             placeholder="검색어를 입력해주세요" value="${uKeyword}">
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="searchButton">검색
            </button>
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="resetButton"
                    onClick="location.href='/admin/ad-admin?reset=1'">검색초기화
            </button>

            <button class="btn btn-secondary btn-block btn-admin"
                    type="button"
                    style="position: relative; top: -1px; margin-right: -50px; float: right;"
                    id="writeButton"
                    onClick="location.href='/admin/ad-admin/write'">배너 등록
            </button>
        </div>
        <table class="datatable-table table">
            <tbody id="ad-list-container">
            </tbody>
        </table>
        <div class="paging">
            <div class="text-center clearfix">
                <ul class="pagination" id="pagination--a">
                    <c:if test="${pagination.prev}">
                        <li class="page-item "><a class="page-list" href="#"
                                                  data-page="${pagination.beginPage-1}">Prev</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${pagination.beginPage}"
                               end="${pagination.endPage}">
                        <li
                                class="${pagination.paging.page == num ? 'page-item active mx-1' : 'mx-1'} page-item"><a
                                class="page-list" href="#" data-page="${num}">${num}</a></li>
                    </c:forEach>

                    <c:if test="${pagination.next}">
                        <li class="page-item"><a class="page-list" href="#"
                                                 data-page="${pagination.endPage+1}">Next</a></li>
                    </c:if>
                </ul>

                <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                <input type="hidden" id="page" name="page" value="${pagination.paging.page}"> <input type="hidden"
                                                                                                     name="recordSize"
                                                                                                     value="${pagination.paging.recordSize}">
            </div>
        </div>
    </form>
</div>

<script>

    function changeApply(adId, status) {

        $.ajax({
            type   : "POST",
            url    : "/admin/change-ad",
            data   : {
                "adId"  : adId,
                "status": status
            },
            success: function (data) {
                if (data === 200) {
                    window.location.href = "/admin/ad-admin";
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "에러입니다",
                    });
                }
            }
            , error: function () {
                Swal.fire({
                    icon: "error",
                    title: "에러입니다",
                });
            }
        });

    }

    $(document).ready(function () {

            setupPaginationEventHandlers();

            loadads(`${uClassification}`, `${uClassification2}`, `${uClassification3}`,
                `${pagination.paging.page}`, `${uSearchType}`,
                `${uKeyword}`);

            let classifi = `${uClassification}`;
            let classifi2 = `${uClassification2}`;
            let classifi3 = `${uClassification3}`;

            $('#searchButton').on(
                'click',
                function () {
                    loadads(classifi, classifi2, classifi3, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            $('input[type="text"]').keydown(function (key) {
                if (key.keyCode === 13) {
                    key.preventDefault();
                }
                ;
            });

            $("#keyword").on("keyup", function (key) {
                if (key.keyCode == 13) {
                    loadads(classifi, classifi2, classifi3, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                }
            });

        $('.cl2 li').click(
            function () {
                classifi2 = $(this).data(
                    'classification2');
                $('.cl2 li').removeClass('active');
                $(this).addClass('active');

                loadads(classifi, classifi2, classifi3, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

        $('.cl3 li').click(
            function () {
                classifi3 = $(this).data(
                    'classification3');
                $('.cl3 li').removeClass('active');
                $(this).addClass('active');

                loadads(classifi, classifi2, classifi3, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

        $('.cl1 li').click(
            function () {
                classifi = $(this).data(
                    'classification');
                $('.cl1 li').removeClass('active');
                $(this).addClass('active');

                loadads(classifi, classifi2, classifi3, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

            function setupPaginationEventHandlers() {
                $(document).on('click', '.pagination li a',
                    function (e) {
                        e.preventDefault();
                        const value = $(this).data('page');
                        // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                        loadads($('.tab--ad li.active').data('classification'), $('.cl2 li.active').data('classification2'), $('.cl3 li.active').data('classification3'), value, $('#searchType').val(), $('#keyword').val());
                    });
            }


            function loadads(classification, classification2, classification3, page, searchType, keyword) {
                $.ajax({
                    type   : 'GET',
                    url    : '/admin/ad-admin/classification',
                    data   : {
                        classification: classification,
                        classification2: classification2,
                        classification3: classification3,
                        page          : page,
                        searchType    : searchType,
                        keyword       : keyword
                    }, // 페이지 번호와 카테고리 정보를 전달합니다.
                    success: function (data) {

                        var adList = data.adList;
                        var pagination = data.pagination;
                        var adListHTML = '<tr class="t-head">'
                            + '<td><h4>상태</h4></td>'
                            + '<td><h4>회사이름</h4></td>'
                            + '<td style="width: 140px;"><h4>이미지</h4></td>'
                            + '<td><h4>가격</h4></td>'
                            + '<td><h4>기간</h4></td>'
                            + '<td><h4>위치</h4></td>'
                            + '<td><h4>종류</h4></td>'
                            + '<td><h4>의뢰일</h4></td>'
                            + '</tr>';
                        for (var i = 0; i < adList.length; i++) {
                            var ad = adList[i];
                            let stt = 0;

                            if (ad.status === 1) {
                                ad.status = '<text style="color: blue"><i class="fa-solid fa-signs-post"></i> 게시중</text>';
                                stt = 1;
                            } else {
                                ad.status = '<text style="color: red"><i class="fa-regular fa-circle-xmark"></i> 비게시</text>';
                                stt = 0;
                            }
                            let regData = ad.createdAt.substring(0, 16);

                            let m_image = '';
                            let v_image = '';
                            let h_image = '';

                            let thisCategory;
                            let thisNotice;

                            if (ad.category === 0) thisCategory = '<text style="color: purple"><i class="fa-solid fa-house"></i> 메인</text>';
                            else thisCategory = '<text style="color: #ff5722"><i class="fa-solid fa-ruler-combined"></i> 사이드</text>';

                            if (ad.isNotice === 0) thisNotice = '<text style="color: green"><i class="fa-brands fa-adversal"></i> 외부광고</text>';
                            else thisNotice = '<text style="color: red"><i class="fa-solid fa-exclamation"></i> 공지사항</text>';

                            if (ad.mainImage !== "undefined" && ad.category === 0) {
                                m_image = '<img style="width: 75px; height: 50px; border: 1px solid #535353; position: relative; left: 29px;" src="' +
                                    ad.mainImage
                                    + '">';
                            } else m_image = '';

                            if (ad.vvvvImage !== "undefined" && ad.category === 1) {
                                v_image = '<img style="width: 25px; height: 75px; border: 1px solid #535353; position: relative; left: 14px;" src="' +
                                    ad.vvvvImage
                                    + '">&nbsp;';
                            } else v_image = '';

                            if (ad.hhhhImage !== "undefined" && ad.category === 1) {
                                h_image = '<img style="width: 75px; height: 30px; border: 1px solid #535353; position: relative; left: 14px;" src="' +
                                    ad.hhhhImage
                                    + '">';
                            } else h_image = '';

                            let ad_com_name;

                            if (ad.adComName === "Vrink") {
                                ad_com_name = '<text style="color: hotpink"><i class="fa-solid fa-circle-chevron-down"></i></i> Vrink</text>';
                            } else {
                                ad_com_name = ad.adComName;
                            }

                            let ad_price = (ad.price).toLocaleString('ko-KR') + "원";
                            if (ad_price === "0원") ad_price = '<text style="color: red"><i class="fa-solid fa-exclamation"></i></i> 공지사항</text>';

                            let ad_period;
                            if(ad.adPeriod === 0) ad_period = '<text style="color: #b1b1b1;"> 만료됨</text>'
                            else ad_period = ad.adPeriod + '일 남음';

                            adListHTML += '<tr>'
                                + '<td style="width: 145px;"><p class="classification" style="min-width: 70px;">'
                                + ad.status
                                + '</p> <button class="btn btn-secondary btn-block btn-admin" type="button" onclick="changeApply(' + ad.adId + ',' + stt + ')">변경</button></td>'
                                + '<td><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + ad_com_name
                                + '</a></td>'
                                + '<td><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + m_image + v_image + h_image
                                + '</a></td>'
                                + '<td><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + ad_price
                                + '</a></td>'
                                + '<td><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + ad_period
                                + '</a></td>'
                                + '<td><p class="classification2"><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + thisCategory
                                + '</a></p></td>'
                                + '<td><p class="classification3"><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + thisNotice
                                + '</a></p></td>'
                                + '<td><a href="/admin/ad-admin/detail?page='
                                + pagination.paging.page
                                + '&id='
                                + ad.adId
                                + '">'
                                + regData
                                + '</a></td>'
                                + '</tr>';
                        }
                        var paginationHTML = '';
                        if (pagination.prev) {
                            paginationHTML += '<li class="page-item"><a class="page-list" href="#" data-page="'
                                + (pagination.beginPage - 1)
                                + '">Prev</a></li>';
                        }
                        for (var num = pagination.beginPage; num <= pagination.endPage; num++) {
                            paginationHTML += '<li class="'
                                + (pagination.paging.page === num ? 'page-item active mx-1'
                                    : 'page-item mx-1')
                                + '"><a class="page-list" href="#" data-page="' + num + '">'
                                + num + '</a></li>';
                        }
                        if (pagination.next) {
                            paginationHTML += '<li class="page-item"><a class="page-list" href="#" data-page="'
                                + (pagination.endPage + 1)
                                + '">Next</a></li>';
                        }
                        $('#ad-list-container').html(
                            adListHTML);
                        $('#pagination--a').html(
                            paginationHTML);
                    },
                    error  : function (error) {
                        console.error('오류 발생:', error);
                    }
                });
            }

            $('#pagination').on('click', 'a', function (e) {
                e.preventDefault();
                console.log($(this));
                const value = $(this).data('page');
                console.log(value);
                document.pageForm.page.value = value;
                document.pageForm.submit();
            });
        }
    );

    function selectItem(selectedItem) {
        let dropdownButton = document.querySelector('.dropdown-btn');
        dropdownButton.textContent = selectedItem;
        let classification = document.querySelector('#classification');
        classification.value = selectedItem;
        let classification2 = document.querySelector('#classification2');
        classification2.value = selectedItem;
        let classification3 = document.querySelector('#classification3');
        classification3.value = selectedItem;
    }

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>