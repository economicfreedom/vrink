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

    .tab--adminCalculator li {
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

    /*td:nth-child(4) {*/
    /*    width: 10%;*/
    /*}*/

    /*td:nth-child(5) {*/
    /*    width: 15%;*/
    /*}*/

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
        padding: 8px 10px;
        padding-left: 0 !important;
    }

    .write-btn {
        text-align: right;
    }

    .title--adminCalculator {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--adminCalculator {
        margin-top: 15px;
        margin-left: 24px;
        padding: 0;
        overflow: hidden;
    }

    .tab--adminCalculator :hover {
        cursor: pointer;
    }

    .tab--adminCalculator li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--adminCalculator li:last-child {
        border-right: none;
    }

    .tab--adminCalculator li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--adminCalculator > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--adminCalculator > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
        border-radius: 9px;
    }

    .tab--adminCalculator::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--adminCalculator li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
        border-radius: 10px;
    }

    .tab--adminCalculator li.active a {
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

<%--		<c:if test="${adminCalculator.roleTypeId == 2}">--%>
<%--			<a href="/customerservice/adminCalculator/write" class="write-btn">글쓰기</a>--%>
<%--		</c:if>--%>

<%--<c:forEach items="${adminCalculatorList}" var="dto">--%>
<%--    <h1>${dto.nickname}</h1>--%>
<%--</c:forEach>--%>
<div class="card m-4">
    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 정산 목록</h3></div>

    <ul class="tab--adminCalculator">
        <c:choose>
            <c:when test="${uClassification == '전체' or empty uClassification}">
                <li class="active" data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="0"><a href="#">정산 신청중</a></li>
                <li data-classification="1"><a href="#">정산 완료</a></li>
            </c:when>
            <c:when test="${uClassification == '0'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li class="active" data-classification="0"><a href="#">정산 신청중</a></li>
                <li data-classification="1"><a href="#">정산 완료</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="0"><a href="#">정산 신청중</a></li>
                <li class="active" data-classification="1"><a href="#">정산 완료</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <form style="width: 95%;" action="#" name="pageForm">
        <div class="mx-4 mb-2">
            <select name="searchType"
                    id="searchType"
                    class="datatable-selector"
                    style="padding-left: 1.125rem; padding-right: 2.125rem;">
                <c:choose>
                    <c:when test="${uSearchType == '아이디'}">
                        <option value="전체">전체</option>
                        <option value="아이디" selected>아이디</option>
                        <option value="정산 요청액">정산 요청액</option>
                        <option value="실제 정산액">실제 정산액</option>
                        <option value="수수료">수수료</option>
                    </c:when>
                    <c:when test="${uSearchType == '정산 요청액'}">
                        <option value="전체">전체</option>
                        <option value="아이디">아이디</option>
                        <option value="정산 요청액" selected>정산 요청액</option>
                        <option value="실제 정산액">실제 정산액</option>
                        <option value="수수료">수수료</option>
                    </c:when>
                    <c:when test="${uSearchType == '실제 정산액'}">
                        <option value="전체">전체</option>
                        <option value="아이디">아이디</option>
                        <option value="정산 요청액">정산 요청액</option>
                        <option value="실제 정산액" selected>실제 정산액</option>
                        <option value="수수료">수수료</option>
                    </c:when>
                    <c:when test="${uSearchType == '수수료'}">
                        <option value="전체">전체</option>
                        <option value="아이디">아이디</option>
                        <option value="정산 요청액">정산 요청액</option>
                        <option value="실제 정산액">실제 정산액</option>
                        <option value="수수료" selected>수수료</option>
                    </c:when>
                    <c:otherwise>
                        <option value="전체" selected>전체</option>
                        <option value="아이디">아이디</option>
                        <option value="정산 요청액">정산 요청액</option>
                        <option value="실제 정산액">실제 정산액</option>
                        <option value="수수료" selected>수수료</option>
                    </c:otherwise>
                </c:choose>

            </select> <input type="text" id="keyword" name="keyword" class="datatable-input"
                             placeholder="검색어를 입력해주세요" value="${uKeyword}">
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="searchButton">검색
            </button>
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="resetButton"
                    onClick="location.href='/admin/calculator-admin?reset=1'">검색초기화
            </button>
        </div>
        <table class="datatable-table table">
            <tbody id="adminCalculator-list-container">
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

    $(document).ready(function () {

        setupPaginationEventHandlers();

        loadAdminCalculators(`${uClassification}`,
            `${pagination.paging.page}`, `${uSearchType}`,
            `${uKeyword}`);

        let classification2 = `${uClassification}`;

        $('#searchButton').on(
            'click',
            function () {
                loadAdminCalculators(classification2, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

        $('input[type="text"]').keydown(function (key) {
            if (key.keyCode === 13) {
                key.preventDefault();
            }
        });

        $("#keyword").on("keyup", function (key) {
            if (key.keyCode === 13) {
                loadAdminCalculators(classification2, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            }
        });

        $('.tab--adminCalculator li').click(
            function () {
                classification2 = $(this).data(
                    'classification');
                $('.tab--adminCalculator li').removeClass('active');
                $(this).addClass('active');

                loadAdminCalculators(classification2, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

        function setupPaginationEventHandlers() {
            $(document).on('click', '.pagination li a',
                function (e) {
                    e.preventDefault();
                    const value = $(this).data('page');
                    // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                    loadAdminCalculators($('.tab--adminCalculator li.active').data('classification'), value, $('#searchType').val(), $('#keyword').val());
                });
        }


        function loadAdminCalculators(classification, page, searchType, keyword) {
            $.ajax({
                type   : 'GET',
                url    : '/admin/calculator-admin/classification',
                data   : {
                    classification: classification,
                    page          : page,
                    searchType    : searchType,
                    keyword       : keyword
                }, // 페이지 번호와 카테고리 정보를 전달합니다.
                success: function (data) {

                    var adminCalculatorList = data.adminCalculatorList;
                    var pagination = data.pagination;
                    var adminCalculatorListHTML = '<tr class="t-head">'
                        + '<td><h4>정산상황</h4></td>'
                        + '<td><h4>아이디</h4></td>'
                        + '<td><h4>정산 요청액 합계</h4></td>'
                        + '<td><h4>수수료 합계</h4></td>'
                        + '<td><h4>실제 정산액 합계</h4></td>'
                        + '<td><h4>정산 요청일</h4></td>'
                        + '<td><h4>정산일</h4></td>'
                        + '</tr>';
                    for (var i = 0; i < adminCalculatorList.length; i++) {
                        var adminCalculator = adminCalculatorList[i];

                        if (adminCalculator.calStatus === 0) {
                            adminCalculator.calStatus = '<text style="color: green">정산 신청중 <i class="fa-solid fa-hand-holding-dollar"></i></text>';
                        } else {
                            adminCalculator.calStatus = '<text style="color: grey">정산 완료 <i class="fa-solid fa-circle-check"></i></text>';
                        }

                        let regData = adminCalculator.createdAt.substring(0, 20);
                        let comDate;

                        if(adminCalculator.completeDate === null) {
                            comDate = '정산 신청중'
                        } else {
                            comDate = adminCalculator.completeDate.substring(0, 20);
                        }

                        if(adminCalculator.totalRealPrice === null) adminCalculator.totalRealPrice = '정산 신청중';
                        else adminCalculator.totalRealPrice = (adminCalculator.totalRealPrice).toLocaleString('ko-KR') + "원";

                        adminCalculator.totalPrice = (adminCalculator.totalPrice).toLocaleString('ko-KR') + "원";
                        adminCalculator.totalCharge = (adminCalculator.totalCharge).toLocaleString('ko-KR') + "원";

                        if (adminCalculator.completeDate !== null) adminCalculator.totalRealPrice = '<text style="color: grey">' + adminCalculator.totalRealPrice + ' <i class="fa-solid fa-circle-check"></i></text>'
                        else adminCalculator.totalRealPrice = '<text style="color: green">' + adminCalculator.totalRealPrice + ' <i class="fa-solid fa-hand-holding-dollar"></i></text>'

                        adminCalculatorListHTML += '<tr>'
                            + '<td style="width: 145px;"><p class="classification" style="min-width: 70px;">'
                            + adminCalculator.calStatus
                            + '</p></td>'
                            + '<td><a href="/admin/user/detail-nickname?nickname='
                            + adminCalculator.nickname
                            + '"><text style="color: red"><i class="fa-solid fa-palette"></i></i> '
                            + adminCalculator.nickname
                            + '</text></a></td>'
                            + '<td><a href="/admin/calculator-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminCalculator.editorId
                            + '&nickname='
                            + adminCalculator.nickname
                            + '">'
                            + adminCalculator.totalPrice
                            + '</a></td>'
                            + '<td><a href="/admin/calculator-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminCalculator.editorId
                            + '&nickname='
                            + adminCalculator.nickname
                            + '">'
                            + adminCalculator.totalCharge
                            + '</a></td>'
                            + '<td><a href="/admin/calculator-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminCalculator.editorId
                            + '&nickname='
                            + adminCalculator.nickname
                            + '">'
                            + adminCalculator.totalRealPrice
                            + '</a></td>'
                            + '<td>'
                            + regData
                            + '</td>'
                            + '<td>'
                            + comDate
                            + '</td>'
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
                    $('#adminCalculator-list-container').html(
                        adminCalculatorListHTML);
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

    });

    function selectItem(selectedItem) {
        let dropdownButton = document.querySelector('.dropdown-btn');
        dropdownButton.textContent = selectedItem;
        let classification = document.querySelector('#classification');
        classification.value = selectedItem;
    }

    function show_spinner() {
        document.getElementsByClassName('layer-popup')[0].style.display = 'block';
    }

    function hide_spinner() {
        document.getElementsByClassName('layer-popup')[0].style.display = 'none';
    }

</script>

<div class="layer-popup" style="display: none;">
    <div class="spinner"></div>
</div>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>