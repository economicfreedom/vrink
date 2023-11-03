<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<style>
    .table {
        border-collapse: collapse;
        margin-left: 25px;
        margin-top: 20px;
    }

    .tab--question li {
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

    td:last-child {
        text-align: right;
        padding-right: 10px !important;
    }

    td {
        vertical-align: middle;
        min-width: 100px;
        font-size: 15px;
    }

    td a {
        color: black;
        text-decoration: none !important;
    }

    h4 {
        font-size: 20px;
        margin-top: 5px;
    }

    .classification {
        display: inline-block;
        font-weight: bold;
        padding: 8px 0;
    }

    .classification2 {
        display: inline-block;
    }

    .write-btn {
        text-align: right;
    }

    .title--question {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--question {
        margin-top: 8px;
        margin-left: 24px;
        padding: 0;
        margin-bottom: 0;
        overflow: hidden;
    }

    .tab--question :hover {
        cursor: pointer;
    }

    .tab--question li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--question li:last-child {
        border-right: none;
    }

    .tab--question li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--question > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--question > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
        border-radius: 9px;
    }

    .tab--question::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--question li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
        border-radius: 10px;
    }

    .tab--question li.active a {
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

<%--		<c:if test="${question.roleTypeId == 2}">--%>
<%--			<a href="/customerservice/question/write" class="write-btn">글쓰기</a>--%>
<%--		</c:if>--%>

<div class="card m-4">
    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 문의 목록</h3></div>
    <ul class="tab--question cl1">
        <c:choose>
            <c:when test="${uClassification == '전체' or empty uClassification}">
                <li class="active" data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="question"><a href="#">문의</a></li>
                <li data-classification="report"><a href="#">신고</a></li>
                <li data-classification="etc"><a href="#">기타</a></li>

            </c:when>
            <c:when test="${uClassification == 'question'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li class="active" data-classification="question"><a href="#">문의</a></li>
                <li data-classification="report"><a href="#">신고</a></li>
                <li data-classification="etc"><a href="#">기타</a></li>
            </c:when>
            <c:when test="${uClassification == 'report'}">
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="question"><a href="#">문의</a></li>
                <li class="active" data-classification="report"><a href="#">신고</a></li>
                <li data-classification="etc"><a href="#">기타</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification="전체"><a href="#">전체</a></li>
                <li data-classification="question"><a href="#">문의</a></li>
                <li data-classification="report"><a href="#">신고</a></li>
                <li class="active" data-classification="etc"><a href="#">기타</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
    <ul class="tab--question cl2">
        <c:choose>
            <c:when test="${uClassification2 == '전체' or empty uClassification2}">
                <li class="active" data-classification2="전체"><a href="#">전체</a></li>
                <li data-classification2="0"><a href="#">답변 대기</a></li>
                <li data-classification2="1"><a href="#">답변 완료</a></li>

            </c:when>
            <c:when test="${uClassification2 == '0'}">
                <li data-classification2="전체"><a href="#">전체</a></li>
                <li class="active" data-classification2="0"><a href="#">답변 대기</a></li>
                <li data-classification2="1"><a href="#">답변 완료</a></li>
            </c:when>
            <c:otherwise>
                <li data-classification2="전체"><a href="#">전체</a></li>
                <li data-classification2="0"><a href="#">답변 대기</a></li>
                <li class="active" data-classification2="1"><a href="#">답변 완료</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <form style="width: 96%;" name="pageForm">
        <div class="mt-2 mx-4">
            <select name="searchType"
                    id="searchType"
                    class="datatable-selector"
                    style="padding-left: 1.125rem; padding-right: 2.125rem;">
                <c:choose>
                    <c:when test="${uSearchType == '이메일'}">
                        <option value="전체">전체</option>
                        <option value="이메일" selected>이메일</option>
                        <option value="이름">이름</option>
                        <option value="아이디">아이디</option>
                        <option value="전화번호">전화번호</option>
                    </c:when>
                    <c:when test="${uSearchType == '이름'}">
                        <option value="전체">전체</option>
                        <option value="이메일">이메일</option>
                        <option value="이름" selected>이름</option>
                        <option value="아이디">아이디</option>
                        <option value="전화번호">전화번호</option>
                    </c:when>
                    <c:when test="${uSearchType == '아이디'}">
                        <option value="전체">전체</option>
                        <option value="이메일">이메일</option>
                        <option value="이름">이름</option>
                        <option value="아이디" selected>아이디</option>
                        <option value="전화번호">전화번호</option>
                    </c:when>
                    <c:when test="${uSearchType == '전화번호'}">
                        <option value="전체">전체</option>
                        <option value="이메일">이메일</option>
                        <option value="이름">이름</option>
                        <option value="아이디">아이디</option>
                        <option value="전화번호" selected>전화번호</option>
                    </c:when>
                    <c:otherwise>
                        <option value="전체" selected>전체</option>
                        <option value="이메일">이메일</option>
                        <option value="이름">이름</option>
                        <option value="아이디">아이디</option>
                        <option value="전화번호">전화번호</option>
                    </c:otherwise>
                </c:choose>

            </select> <input type="text" id="keyword" name="keyword" class="datatable-input" placeholder="검색어를 입력해주세요"
                             value="${uKeyword}">
            <button class="btn btn-secondary btn-block" type="button"
                    id="searchButton">검색
            </button>
            <button class="btn btn-secondary btn-block" type="button"
                    id="resetButton"
                    onClick="location.href='/admin/question?reset=1'">검색초기화
            </button>
        </div>

        <table class="datatable-table table">
            <tbody id="question-list-container">
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
                <input type="hidden" id="page" name="page"
                       value="${pagination.paging.page}"> <input type="hidden"
                                                                 name="recordSize"
                                                                 value="${pagination.paging.recordSize}">

            </div>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {

            setupPaginationEventHandlers();

            loadquestions(`${uClassification}`, `${uClassification2}`,
                `${pagination.paging.page}`, `${uSearchType}`,
                `${uKeyword}`);

            let classifi = `${uClassification}`;
            let classifi2 = `${uClassification2}`;

            $('#searchButton').on(
                'click',
                function () {
                    loadquestions(classifi, classifi2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            $('.cl2 li').click(
                function () {
                    classifi2 = $(this).data(
                        'classification2');
                    $('.cl2 li').removeClass('active');
                    $(this).addClass('active');

                    loadquestions(classifi, classifi2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            $('.cl1 li').click(
                function () {
                    classifi = $(this).data(
                        'classification');
                    $('.cl1 li').removeClass('active');
                    $(this).addClass('active');

                    loadquestions(classifi, classifi2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            function setupPaginationEventHandlers() {
                $(document).on(
                    'click',
                    '.pagination li a',
                    function (e) {
                        e.preventDefault();
                        const value = $(this).data('page');
                        // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                        loadquestions($('.tab--question li.active').data('classification'), $('.cl2 li.active').data('classification2'), value, $('#searchType').val(), $('#keyword').val());
                    });
            }

            function loadquestions(classification, classification2, page, searchType, keyword) {
                $
                    .ajax({
                        type   : 'GET',
                        url    : '/admin/question/classification',
                        data   : {
                            classification : classification,
                            classification2: classification2,
                            page           : page,
                            searchType     : searchType,
                            keyword        : keyword
                        }, // 페이지 번호와 카테고리 정보를 전달합니다.
                        success: function (data) {
                            var questionList = data.questionList;

                            console.log(questionList);

                            var pagination = data.pagination;
                            var questionListHTML = '<tr class="t-head">'
                                + '<td><h4>답변상태</h4></td>'
                                + '<td><h4>타입</h4></td>'
                                + '<td><h4>아이디</h4></td>'
                                + '<td><h4>이메일</h4></td>'
                                + '<td><h4>제목</h4></td>'
                                + '<td><h4>내용</h4></td>'
                                + '<td><h4>문의날짜</h4></td>'
                                + '</tr>';
                            for (var i = 0; i < questionList.length; i++) {
                                var question = questionList[i];
                                if (question.status === 0) question.status = '답변 대기';
                                else question.status = '<text style="color: red">답변 완료</text>';
                                if (question.type === 'question') question.type = '문의';
                                else if (question.type === 'report') question.type = '<text style="color: blue">신고</text>';
                                else question.type = '<text style="color: green">기타</text>';
                                let regData = question.createdAt.substring(0, 16);
                                questionListHTML += '<tr>'
                                    + '<td><p class="classification">'
                                    + question.status
                                    + '</p></td>'
                                    + '<td><p class="classification2"><a href="/admin/question/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + question.questionId
                                    + '">'
                                    + question.type
                                    + '</a></p></td>'
                                    + '<td><a href="/admin/question/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + question.questionId
                                    + '">'
                                    + question.nickname
                                    + '</a></td>'
                                    + '<td><a href="/admin/question/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + question.questionId
                                    + '">'
                                    + question.email
                                    + '</a></td>'
                                    + '<td><a href="/admin/question/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + question.questionId
                                    + '">'
                                    + question.title
                                    + '</a></td>'
                                    + '</a></td>'
                                    + '<td><a href="/admin/question/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + question.questionId
                                    + '">'
                                    + question.content
                                    + '</a></td>'
                                    + '<td><p>'
                                    + regData
                                    + '</p></td>' + '</tr>';
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
                            $('#question-list-container').html(
                                questionListHTML);
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

            $('input[type="text"]').keydown(function (key) {
                if (key.keyCode === 13) {
                    key.preventDefault();
                }
            });

            $("#keyword").on("keyup", function (key) {
                if (key.keyCode === 13) {
                    loadquestions(classifi, classifi2, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                }
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
    }

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>

