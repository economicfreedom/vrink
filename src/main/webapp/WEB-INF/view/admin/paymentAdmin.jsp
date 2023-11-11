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

    .tab--adminPayment li {
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

    td:nth-child(4) {
        width: 10%;
    }

    td:nth-child(5) {
        width: 15%;
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
        padding: 8px 10px;
        padding-left: 0 !important;
    }

    .write-btn {
        text-align: right;
    }

    .title--adminPayment {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--adminPayment {
        margin-top: 15px;
        margin-left: 24px;
        padding: 0;
        overflow: hidden;
    }

    .tab--adminPayment :hover {
        cursor: pointer;
    }

    .tab--adminPayment li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--adminPayment li:last-child {
        border-right: none;
    }

    .tab--adminPayment li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--adminPayment > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--adminPayment > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
        border-radius: 9px;
    }

    .tab--adminPayment::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--adminPayment li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
        border-radius: 10px;
    }

    .tab--adminPayment li.active a {
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

<%--		<c:if test="${adminPayment.roleTypeId == 2}">--%>
<%--			<a href="/customerservice/adminPayment/write" class="write-btn">글쓰기</a>--%>
<%--		</c:if>--%>

<%--<c:forEach items="${adminPaymentList}" var="dto">--%>
<%--    <h1>${dto.nickname}</h1>--%>
<%--</c:forEach>--%>
<div class="card m-4">
    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 결제 목록</h3></div>

    <ul class="tab--adminPayment">
        <c:choose>
            <c:when test="${uClassification == '전체' or empty uClassification}">
                <li class="active" data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="payment_done"><a href="#">결제 완료</a></li>
                <li data-classification="hand_over"><a href="#">인계 완료</a></li>
                <li data-classification="trade_done"><a href="#">거래 완료</a></li>
                <li data-classification="c_cancel"><a href="#">구매자 취소</a></li>
                <li data-classification="admin_cancel"><a href="#">관리자 취소</a></li>
            </c:when>
            <c:when test="${uClassification == 'payment_done'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li class="active" data-classification="payment_done"><a href="#">결제 완료</a></li>
                <li data-classification="hand_over"><a href="#">인계 완료</a></li>
                <li data-classification="trade_done"><a href="#">거래 완료</a></li>
                <li data-classification="c_cancel"><a href="#">구매자 취소</a></li>
                <li data-classification="admin_cancel"><a href="#">관리자 취소</a></li>
            </c:when>
            <c:when test="${uClassification == 'hand_over'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="payment_done"><a href="#">결제 완료</a></li>
                <li class="active" data-classification="hand_over"><a href="#">인계 완료</a></li>
                <li data-classification="trade_done"><a href="#">거래 완료</a></li>
                <li data-classification="c_cancel"><a href="#">구매자 취소</a></li>
                <li data-classification="admin_cancel"><a href="#">관리자 취소</a></li>
            </c:when>
            <c:when test="${uClassification == 'trade_done'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="payment_done"><a href="#">결제 완료</a></li>
                <li data-classification="hand_over"><a href="#">인계 완료</a></li>
                <li class="active" data-classification="trade_done"><a href="#">거래 완료</a></li>
                <li data-classification="c_cancel"><a href="#">구매자 취소</a></li>
                <li data-classification="admin_cancel"><a href="#">관리자 취소</a></li>
            </c:when>
            <c:when test="${uClassification == 'c_cancel'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="payment_done"><a href="#">결제 완료</a></li>
                <li data-classification="hand_over"><a href="#">인계 완료</a></li>
                <li data-classification="trade_done"><a href="#">거래 완료</a></li>
                <li class="active" data-classification="c_cancel"><a href="#">구매자 취소</a></li>
                <li data-classification="admin_cancel"><a href="#">관리자 취소</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="payment_done"><a href="#">결제 완료</a></li>
                <li data-classification="hand_over"><a href="#">인계 완료</a></li>
                <li data-classification="trade_done"><a href="#">거래 완료</a></li>
                <li data-classification="c_cancel"><a href="#">구매자 취소</a></li>
                <li class="active" data-classification="admin_cancel"><a href="#">관리자 취소</a></li>
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
                    <c:when test="${uSearchType == '내용'}">
                        <option value="전체">전체</option>
                        <option value="내용" selected>내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:when>
                    <c:when test="${uSearchType == '구매자'}">
                        <option value="전체">전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자" selected>구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:when>
                    <c:when test="${uSearchType == '판매자'}">
                        <option value="전체">전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자" selected>판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:when>
                    <c:when test="${uSearchType == 'imp_uid'}">
                        <option value="전체">전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid" selected>imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:when>
                    <c:when test="${uSearchType == 'merchant_uid'}">
                        <option value="전체">전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid" selected>merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:when>
                    <c:when test="${uSearchType == '가격'}">
                        <option value="전체">전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격" selected>가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:when>
                    <c:when test="${uSearchType == '요구사항'}">
                        <option value="전체">전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항" selected>요구사항</option>
                    </c:when>
                    <c:otherwise>
                        <option value="전체" selected>전체</option>
                        <option value="내용">내용</option>
                        <option value="구매자">구매자</option>
                        <option value="판매자">판매자</option>
                        <option value="imp_uid">imp_uid</option>
                        <option value="merchant_uid">merchant_uid</option>
                        <option value="가격">가격</option>
                        <option value="요구사항">요구사항</option>
                    </c:otherwise>
                </c:choose>

            </select> <input type="text" id="keyword" name="keyword" class="datatable-input"
                             placeholder="검색어를 입력해주세요" value="${uKeyword}">
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="searchButton">검색
            </button>
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="resetButton"
                    onClick="location.href='/admin/payment-admin?reset=1'">검색초기화
            </button>
        </div>
        <table class="datatable-table table">
            <tbody id="adminPayment-list-container">
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

    function changeApply(paymentId, accepted, number, userId) {

        $.ajax({
            type   : "POST",
            url    : "/admin/change-payment",
            data   : {
                "paymentId": paymentId,
                "accepted" : accepted,
                "number"   : number,
                "userId"   : userId
            },
            success: function (data) {
                if (data === 200) {
                    window.location.href = "/admin/payment-accept";
                } else if (data === 400) {
                    alert('사기 계좌로 조회되었습니다. 승인이 불가합니다.');
                } else {
                    alert('에러 읍니다.');
                }
            }
            , error: function () {
                alert('서버 에러입니다.');
            }
        });

    }

    $(document).ready(function () {

        setupPaginationEventHandlers();

        loadAdminPayments(`${uClassification}`,
            `${pagination.paging.page}`, `${uSearchType}`,
            `${uKeyword}`);

        let classification2 = `${uClassification}`;

        $('#searchButton').on(
            'click',
            function () {
                loadAdminPayments(classification2, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

        $('input[type="text"]').keydown(function (key) {
            if (key.keyCode === 13) {
                key.preventDefault();
            }
        });

        $("#keyword").on("keyup", function (key) {
            if (key.keyCode == 13) {
                loadAdminPayments(classification2, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            }
        });

        $('.tab--adminPayment li').click(
            function () {
                classification2 = $(this).data(
                    'classification');
                $('.tab--adminPayment li').removeClass('active');
                $(this).addClass('active');

                loadAdminPayments(classification2, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

        function setupPaginationEventHandlers() {
            $(document).on('click', '.pagination li a',
                function (e) {
                    e.preventDefault();
                    const value = $(this).data('page');
                    // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                    loadAdminPayments($('.tab--adminPayment li.active').data('classification'), value, $('#searchType').val(), $('#keyword').val());
                });
        }


        function loadAdminPayments(classification, page, searchType, keyword) {
            $.ajax({
                type   : 'GET',
                url    : '/admin/payment-admin/classification',
                data   : {
                    classification: classification,
                    page          : page,
                    searchType    : searchType,
                    keyword       : keyword
                }, // 페이지 번호와 카테고리 정보를 전달합니다.
                success: function (data) {

                    var adminPaymentList = data.adminPaymentList;
                    var pagination = data.pagination;
                    var adminPaymentListHTML = '<tr class="t-head">'
                        + '<td><h4>진행상황</h4></td>'
                        + '<td><h4>구매자</h4></td>'
                        + '<td><h4>판매자</h4></td>'
                        + '<td><h4>내용</h4></td>'
                        + '<td><h4>요구사항</h4></td>'
                        + '<td><h4>총 가격</h4></td>'
                        + '<td><h4>imp_uid</h4></td>'
                        + '<td><h4>merchant_uid</h4></td>'
                        + '<td><h4>결제날짜</h4></td>'
                        + '</tr>';
                    for (var i = 0; i < adminPaymentList.length; i++) {
                        var adminPayment = adminPaymentList[i];
                        let button;

                        if (adminPayment.state === 'payment_done') {
                            adminPayment.state = '<text style="color: blue">결제 완료 <i class="fa-regular fa-credit-card"></i></text>';
                            button = '</p> <button class="btn btn-secondary btn-block btn-admin" type="button" onclick="cancel(' + adminPayment.editorId + ',' + adminPayment.paymentId + ',' + adminPayment.totalPrice + ')">취소</button></td>'
                        } else if (adminPayment.state === 'hand_over') {
                            adminPayment.state = '<text style="color: red">인계 완료 <i class="fa-solid fa-right-left"></i></text>';
                            button = '</td>';
                        } else if (adminPayment.state === 'trade_done') {
                            adminPayment.state = '<text style="color: cadetblue">거래 완료 <i class="fa-solid fa-circle-check"></i></text>';
                            button = '</td>';
                        } else if (adminPayment.state === 'c_cancel') {
                            adminPayment.state = '<text style="color: lightskyblue">구매자 취소 <i class="fa-solid fa-ban"></i></text>';
                            button = '</td>';
                        } else {
                            adminPayment.state = '<text style="color: #7c7a5b">관리자 취소 <i class="fa-solid fa-screwdriver-wrench"></i></text>';
                            button = '</td>';
                        }
                        let regData = adminPayment.createdAt.substring(0, 20);

                        adminPayment.totalPrice = (adminPayment.totalPrice).toLocaleString('ko-KR') + "원";
                        if (adminPayment.request === null) adminPayment.request = "없음";
                        else if (adminPayment.request === "") adminPayment.request = "없음";

                        adminPaymentListHTML += '<tr>'
                            + '<td style="width: 145px;"><p class="classification" style="min-width: 70px;">'
                            + adminPayment.state
                            + button
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '"><text style="color: blue"><i class="fa-solid fa-cart-shopping"></i> '
                            + adminPayment.customerNickname
                            + '</text></a></td>'
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '"><text style="color: red"><i class="fa-solid fa-coins"></i> '
                            + adminPayment.editorNickname
                            + '</text></a></td>'
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '">'
                            + adminPayment.name
                            + '</a></td>'
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '">'
                            + adminPayment.request
                            + '</a></td>'
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '">'
                            + adminPayment.totalPrice
                            + '</a></td>'
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '">'
                            + adminPayment.impUid
                            + '</a></td>'
                            + '<td><a href="/admin/payment-admin/detail?page='
                            + pagination.paging.page
                            + '&id='
                            + adminPayment.paymentId
                            + '">'
                            + adminPayment.merchantUid
                            + '</a></td>'
                            + '<td>'
                            + regData
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
                    $('#adminPayment-list-container').html(
                        adminPaymentListHTML);
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


    function cancel(editorId, paymentId, totalPrice) {
        Swal.fire({
            title             : "정말 취소처리 하시겠습니까?",
            text              : "되돌릴 수 없습니다!",
            icon              : "warning",
            showCancelButton  : true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor : "#d33",
            confirmButtonText : "취소"
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
                                window.location.href = "/admin/payment-admin";
                            })
                    })
            })
    }

</script>

<div class="layer-popup" style="display: none;">
    <div class="spinner"></div>
</div>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>