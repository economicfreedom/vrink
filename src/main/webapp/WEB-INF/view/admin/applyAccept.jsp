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

    .tab--adminApply li {
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

    td:nth-child(3) {
        width: 20%;
    }

    td:nth-child(4) {
        width: 15%;
    }

    td:last-child {
        text-align: right;
        padding-right: 10px !important;
    }

    td {
        vertical-align: middle;
    }

    h4 {
        margin-top: 5px;
        font-size: 20px;
    }

    .classification {
        display: inline-block;
        font-weight: bold;
        padding: 8px 10px;
        padding-left: 8px !important;
    }

    .write-btn {
        text-align: right;
    }

    .title--adminApply {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--adminApply {
        margin-top: 15px;
        margin-left: 24px;
        padding: 0;
        overflow: hidden;
    }

    .tab--adminApply :hover {
        cursor: pointer;
    }

    .tab--adminApply li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--adminApply li:last-child {
        border-right: none;
    }

    .tab--adminApply li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--adminApply > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--adminApply > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
        border-radius: 9px;
    }

    .tab--adminApply::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--adminApply li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
        border-radius: 10px;
    }

    .tab--adminApply li.active a {
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

<%--		<c:if test="${adminApply.roleTypeId == 2}">--%>
<%--			<a href="/customerservice/adminApply/write" class="write-btn">글쓰기</a>--%>
<%--		</c:if>--%>

<%--<c:forEach items="${adminApplyList}" var="dto">--%>
<%--    <h1>${dto.nickname}</h1>--%>
<%--</c:forEach>--%>
<div class="card m-4">
    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 판매자 신청 목록</h3></div>

        <ul class="tab--adminApply">
            <c:choose>
                <c:when test="${uClassification == '전체' or empty uClassification}">
                    <li class="active" data-classification="전체"><a href="#">전체</a></li>
                    <li data-classification="0"><a href="#">승인 대기</a></li>
                    <li data-classification="1"><a href="#">승인됨</a></li>

                </c:when>
                <c:when test="${uClassification == '0'}">
                    <li data-classification="전체"><a href="#">전체</a></li>
                    <li class="active" data-classification="0"><a href="#">승인 대기
                    </a></li>
                    <li data-classification="1"><a href="#">승인됨</a></li>
                </c:when>
                <c:otherwise>
                    <li data-classification="전체"><a href="#">전체</a></li>
                    <li data-classification="0"><a href="#">승인 대기</a></li>
                    <li class="active" data-classification="1"><a href="#">승인됨</a></li>
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
                    <c:when test="${uSearchType == '사기이력'}">
                        <option value="전체">전체</option>
                        <option value="사기이력" selected>사기이력</option>
                        <option value="은행이름">은행이름</option>
                        <option value="계좌번호">계좌번호</option>
                        <option value="닉네임">닉네임</option>
                    </c:when>
                    <c:when test="${uSearchType == '은행이름'}">
                        <option value="전체">전체</option>
                        <option value="사기이력">사기이력</option>
                        <option value="은행이름" selected>은행이름</option>
                        <option value="계좌번호">계좌번호</option>
                        <option value="닉네임">닉네임</option>
                    </c:when>
                    <c:when test="${uSearchType == '계좌번호'}">
                        <option value="전체">전체</option>
                        <option value="사기이력">사기이력</option>
                        <option value="은행이름">은행이름</option>
                        <option value="계좌번호" selected>계좌번호</option>
                        <option value="닉네임">닉네임</option>
                    </c:when>
                    <c:when test="${uSearchType == '닉네임'}">
                        <option value="전체">전체</option>
                        <option value="사기이력">사기이력</option>
                        <option value="은행이름">은행이름</option>
                        <option value="계좌번호">계좌번호</option>
                        <option value="닉네임" selected>닉네임</option>
                    </c:when>
                    <c:otherwise>
                        <option value="전체" selected>전체</option>
                        <option value="사기이력">사기이력</option>
                        <option value="은행이름">은행이름</option>
                        <option value="계좌번호">계좌번호</option>
                        <option value="닉네임">닉네임</option>
                    </c:otherwise>
                </c:choose>

            </select> <input type="text" id="keyword" name="keyword" class="datatable-input"
                             placeholder="검색어를 입력해주세요" value="${uKeyword}">
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="searchButton">검색
            </button>
            <button class="btn btn-secondary btn-block btn-admin" type="button" style="position: relative; top: -1px;"
                    id="resetButton"
                    onClick="location.href='/admin/apply-accept?reset=1'">검색초기화
            </button>
        </div>
            <table class="datatable-table table">
                <tbody id="adminApply-list-container">
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

    function changeApply(applyId, accepted, number, userId) {
        show_spinner();

        $.ajax({
            type   : "POST",
            url    : "/admin/change-apply",
            data   : {
                "applyId" : applyId,
                "accepted": accepted,
                "number"  : number,
                "userId" : userId
            },
            success: function (data) {
                if (data === 200) {
                    hide_spinner();
                    window.location.href = "/admin/apply-accept";
                } else if (data === 400) {
                    hide_spinner();
                    Swal.fire({
                        icon: "error",
                        title: "사기 계좌로 조회되었습니다. 승인이 불가합니다.",
                    });
                } else {
                    hide_spinner();
                    Swal.fire({
                        icon: "error",
                        title: "에러 읍니다.",
                    });
                }
            }
            , error: function () {
                hide_spinner();
                Swal.fire({
                    icon: "error",
                    title: "서버 에러 읍니다.",
                });
            }
        });

    }

    $(document).ready(function () {

            setupPaginationEventHandlers();

            loadadminApplys(`${uClassification}`,
                `${pagination.paging.page}`, `${uSearchType}`,
                `${uKeyword}`);

            let classification2 = `${uClassification}`;

            $('#searchButton').on(
                'click',
                function () {
                    console.log(classification2);
                    loadadminApplys(classification2, undefined, $(
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
                    console.log(classification2);
                    loadadminApplys(classification2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                }
            });

            $('.tab--adminApply li').click(
                function () {
                    classification2 = $(this).data(
                        'classification');
                    console.log(classification2);
                    $('.tab--adminApply li').removeClass('active');
                    $(this).addClass('active');

                    loadadminApplys(classification2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            function setupPaginationEventHandlers() {
                $(document).on('click', '.pagination li a',
                    function (e) {
                        e.preventDefault();
                        const value = $(this).data('page');
                        // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                        loadadminApplys($('.tab--adminApply li.active').data('classification'), value, $('#searchType').val(), $('#keyword').val());
                    });
            }


            function loadadminApplys(classification, page, searchType, keyword) {
                $.ajax({
                    type   : 'GET',
                    url    : '/admin/apply-accept/classification',
                    data   : {
                        classification: classification,
                        page          : page,
                        searchType    : searchType,
                        keyword       : keyword
                    }, // 페이지 번호와 카테고리 정보를 전달합니다.
                    success: function (data) {

                        var adminApplyList = data.adminApplyList;
                        var pagination = data.pagination;
                        var adminApplyListHTML = '<tr class="t-head">'
                            + '<td><h4>신청상태</h4></td>'
                            + '<td><h4>사기이력</h4></td>'
                            + '<td><h4>은행이름</h4></td>'
                            + '<td><h4>계좌번호</h4></td>'
                            + '<td><h4>아이디</h4></td>'
                            + '<td><h4>신청날짜</h4></td>'
                            + '</tr>';
                        for (var i = 0; i < adminApplyList.length; i++) {
                            var adminApply = adminApplyList[i];
                            let acct = 0;
                            let button;

                            if (adminApply.accepted === 0) {
                                adminApply.accepted = '<text style="color: cadetblue">승인 대기</text>';
                                acct = 0;
                                button = '</p> <button class="btn btn-secondary btn-block btn-admin" type="button" onclick="changeApply(' + adminApply.applyId + ',' + acct + ',' + adminApply.number + ',' + adminApply.userId + ')">승인</button></td>'
                            } else {
                                adminApply.accepted = '<text style="color: #173f41">승인됨 <i class="fa-solid fa-circle-check"></i></text>';
                                acct = 1;
                                button = '</td>';
                            }
                            let regData = adminApply.createdAt.substring(0, 10);
                            let cheating;

                            if (adminApply.cheater === '이력 없음') cheating = '<td>' + adminApply.cheater + '</td>'
                            else cheating = '<th><a target="_blank" style="text-decoration: none; color: red;" href="https://web.joongna.com/fraud/result?inputValue=' + adminApply.number + '&type=account_number">' + adminApply.cheater + '</a></th>'
                            adminApplyListHTML += '<tr>'
                                + '<td style="width: 145px;"><p class="classification" style="min-width: 70px;">'
                                + adminApply.accepted
                                + button
                                + cheating
                                + '<td>'
                                + adminApply.name
                                + '</td>'
                                + '<td>'
                                + adminApply.number
                                + '</td>'
                                + '<td>'
                                + '<a href="/admin/user/detail-nickname?nickname='
                                + adminApply.nickname
                                + '">'
                                + adminApply.nickname
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
                                + (pagination.paging.page == num ? 'page-item active mx-1'
                                    : 'page-item mx-1')
                                + '"><a class="page-list" href="#" data-page="' + num + '">'
                                + num + '</a></li>';
                        }
                        if (pagination.next) {
                            paginationHTML += '<li class="page-item"><a class="page-list" href="#" data-page="'
                                + (pagination.endPage + 1)
                                + '">Next</a></li>';
                        }
                        $('#adminApply-list-container').html(
                            adminApplyListHTML);
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
    }

</script>

<%--로딩 스피너--%>

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
<script>
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

<%--로딩 스피너--%>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>