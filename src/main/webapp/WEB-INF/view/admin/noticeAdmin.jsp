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

    .t-head {
        background-color: #ececec;
    }

    .table td {
        padding: 1px !important;
        vertical-align: baseline !important;
        padding-left: 8px !important;
    }
    .classification {
        display: inline-block;
        font-weight: bold;
        padding: 8px 10px;
        padding-left: 0 !important;
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
        width: 40%;
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

    .write-btn {
        text-align: right;
    }

    .title--notice {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--notice li {
        margin-right: 8px !important;
        width: 112px !important;
    }

    .tab--notice {
        margin-top: 15px;
        margin-left: 24px;
        padding: 0;
        overflow: hidden;
    }

    .tab--notice :hover {
        cursor: pointer;
    }

    .tab--notice li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--notice li:last-child {
        border-right: none;
    }

    .tab--notice li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--notice > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--notice > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
        border-radius: 9px;
    }

    .tab--notice::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--notice li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
        border-radius: 10px;
    }

    .tab--notice li.active a {
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
<div class="card m-4">

    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 공지사항 관리</h3></div>

    <ul class="tab--notice">
        <c:choose>
            <c:when test="${uClassification == '전체' or empty uClassification}">
                <li class="active" data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="community"><a href="#">자유게시판</a></li>
                <li data-classification="suggest"><a href="#">의뢰게시판</a></li>
            </c:when>
            <c:when test="${uClassification == 'community'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li class="active" data-classification="community"><a href="#">자유게시판</a></li>
                <li data-classification="suggest"><a href="#">의뢰게시판</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="community"><a href="#">자유게시판</a></li>
                <li class="active" data-classification="suggest"><a href="#">의뢰게시판</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <form style="width: 96%;" action="#" name="pageForm">
        <div class="mx-4 mb-2">
            <select name="searchType"
                    id="searchType"
                    class="datatable-selector"
                    style="padding-left: 1.125rem; padding-right: 2.125rem;">
                <c:choose>
                    <c:when test="${uSearchType == '제목'}">
                        <option value="전체">전체</option>
                        <option value="제목" selected>제목</option>
                        <option value="내용">내용</option>
                    </c:when>
                    <c:when test="${uSearchType == '내용'}">
                        <option value="전체">전체</option>
                        <option value="제목">제목</option>
                        <option value="내용" selected>내용</option>
                    </c:when>
                    <c:otherwise>
                        <option value="전체" selected>전체</option>
                        <option value="제목">제목</option>
                        <option value="내용">내용</option>
                    </c:otherwise>
                </c:choose>

            </select> <input type="text" id="keyword" name="keyword" class="datatable-input" placeholder="검색어를 입력해주세요"
                             value="${uKeyword}">
            <button class="btn btn-secondary btn-block btn-admin" type="button"
                    id="searchButton">검색
            </button>
            <button class="btn btn-secondary btn-block btn-admin" type="button"
                    id="resetButton"
                    onClick="location.href='/admin/notice?reset=1'">검색초기화
            </button>

            <button class="btn btn-secondary btn-block btn-admin"
                    type="button"
                    style="position: relative; top: -1px; margin-right: -50px; float: right;"
                    id="writeButton"
                    onClick="location.href='/admin/notice-write'">공지 등록
            </button>

        </div>

        <table class="datatable-table table">
            <tbody id="notice-list-container">
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

            loadnotices(`${uClassification}`, `${pagination.paging.page}`, `${uSearchType}`,
                `${uKeyword}`);

            let classification2 = `${uClassification}`;

            $('#searchButton').on(
                'click',
                function () {
                    loadnotices(classification2, undefined, $(
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
                    loadnotices(classification2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                }
            });

            $('.tab--notice li').click(
                function () {
                    classification2 = $(this).data(
                        'classification');

                    $('.tab--notice li').removeClass('active');
                    $(this).addClass('active');

                    loadnotices(classification2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            function setupPaginationEventHandlers() {
                $(document).on('click', '.pagination li a',
                    function (e) {
                        e.preventDefault();
                        const value = $(this).data('page');
                        // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                        loadnotices($('.tab--notice li.active').data('classification'), value, $('#searchType').val(), $('#keyword').val());
                    });
            }


            function loadnotices(classification, page, searchType, keyword) {
                $.ajax({
                    type   : 'GET',
                    url    : '/admin/notice/classification',
                    data   : {
                        classification: classification,
                        page      : page,
                        searchType: searchType,
                        keyword   : keyword
                    }, // 페이지 번호와 카테고리 정보를 전달합니다.
                    success: function (data) {

                        console.log(data);

                        var noticeList = data.noticeList;
                        var pagination = data.pagination;
                        var noticeListHTML = '<tr class="t-head">'
                            + '<td><h4>글번호</h4></td>'
                            + '<td><h4>타입</h4></td>'
                            + '<td><h4>제목</h4></td>'
                            + '<td><h4>내용</h4></td>'
                            + '<td><h4>작성일자</h4></td>'
                            + '</tr>';
                        for (var i = 0; i < noticeList.length; i++) {
                            var notice = noticeList[i];

                            if(notice.type === 'community') notice.type = '<text style="color: blue">자유게시판 <i class="fa-solid fa-clipboard-list"></i></text>';
                            else notice.type = '<text style="color: red">의뢰게시판 <i class="fa-solid fa-clipboard-question"></i></text>';

                            let regData = notice.createdAt.substring(0, 16);

                            noticeListHTML += '<tr>'
                                + '<td>'
                                + '<a href="/admin/notice-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + notice.noticeId
                                + '">'
                                + notice.noticeId
                                + '</a></td>'
                                + '<td><p class="classification" style="min-width: 70px;">'
                                + '<a href="/admin/notice-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + notice.noticeId
                                + '">'
                                + notice.type
                                + '</a></td>'
                                + '<td><div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;width: 200px; max-height: 20px">'
                                + '<a href="/admin/notice-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + notice.noticeId
                                + '">'
                                + notice.title
                                + '</a></div></td>'
                                + '<td><div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 675px; max-height: 20px; display: inline-block;">'
                                + '<a href="/admin/notice-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + notice.noticeId
                                + '">'
                                + notice.content
                                + '</a></div></td>'
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
                        $('#notice-list-container').html(
                            noticeListHTML);
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
    }

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>