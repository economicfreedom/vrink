<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<style>
    table {
        /* 	width: 100%; */
        border-collapse: collapse;
        margin-left: 30px;
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
    }

    td {
        vertical-align: middle;
    }

    td a {
        color: black;
        text-decoration: none !important;
        margin-left: 15px;
    }

    h4 {
        padding-left: 8px;
    }

    .classification {
        display: inline-block;
        font-weight: bold;
        padding: 8px 10px;
    }

    .write-btn {
        text-align: right;
    }

    .title--user {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--user {
        margin-left: 30px;
        padding: 0 0 1px 1px;
        margin-bottom: 30px;
        overflow: hidden;
    }

    .tab--user :hover {
        cursor: pointer;
    }

    .tab--user li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--user li:last-child {
        border-right: none;
    }

    .tab--user li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--user>li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--user>li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
    }

    .tab--user::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--user li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
    }

    .tab--user li.active a {
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

<%--		<c:if test="${user.roleTypeId == 2}">--%>
<%--			<a href="/customerservice/user/write" class="write-btn">글쓰기</a>--%>
<%--		</c:if>--%>


<h1 class="title--user">유저 목록</h1>
<ul class="tab--user">
    <c:choose>
        <c:when test="${uClassification == '전체' or empty uClassification}">
            <li class="active" data-classification="전체"><a href="#">전체</a></li>
            <li data-classification="standard"><a href="#">구매자</a></li>
            <li data-classification="editor"><a href="#">판매자</a></li>

        </c:when>
        <c:when test="${uClassification == 'standard'}">
            <li data-classification="전체"><a href="#">전체</a></li>
            <li class="active" data-classification="standard"><a href="#">구매자</a></li>
            <li data-classification="editor"><a href="#">판매자</a></li>
        </c:when>
        <c:otherwise>
            <li data-classification="전체"><a href="#">전체</a></li>
            <li data-classification="standard"><a href="#">구매자</a></li>
            <li class="active" data-classification="editor"><a href="#">판매자</a></li>
        </c:otherwise>
    </c:choose>
</ul>
<ul class="tab--user cl2">
    <c:choose>
        <c:when test="${uClassification2 == '전체' or empty uClassification2}">
            <li class="active" data-classification2="전체"><a href="#">전체</a></li>
            <li data-classification2="0"><a href="#">비탈퇴 유저</a></li>
            <li data-classification2="1"><a href="#">탈퇴 유저</a></li>

        </c:when>
        <c:when test="${uClassification2 == '0'}">
            <li data-classification2="전체"><a href="#">전체</a></li>
            <li class="active" data-classification2="0"><a href="#">비탈퇴 유저</a></li>
            <li data-classification2="1"><a href="#">탈퇴 유저</a></li>
        </c:when>
        <c:otherwise>
            <li data-classification2="전체"><a href="#">전체</a></li>
            <li data-classification2="0"><a href="#">비탈퇴 유저</a></li>
            <li class="active" data-classification2="1"><a href="#">탈퇴 유저</a></li>
        </c:otherwise>
    </c:choose>
</ul>
<ul class="tab--user cl3">
    <c:choose>
        <c:when test="${uClassification3 == '전체' or empty uClassification3}">
            <li class="active" data-classification3="전체"><a href="#">전체</a></li>
            <li data-classification3="0"><a href="#">일반 유저</a></li>
            <li data-classification3="1"><a href="#">관리자</a></li>

        </c:when>
        <c:when test="${uClassification3 == '0'}">
            <li data-classification3="전체"><a href="#">전체</a></li>
            <li class="active" data-classification3="0"><a href="#">일반 유저</a></li>
            <li data-classification3="1"><a href="#">관리자</a></li>
        </c:when>
        <c:otherwise>
            <li data-classification3="전체"><a href="#">전체</a></li>
            <li data-classification3="0"><a href="#">일반 유저</a></li>
            <li class="active" data-classification3="1"><a href="#">관리자</a></li>
        </c:otherwise>
    </c:choose>
</ul>

<form style="width: 90%;" action="<c:url value='/admin/user'/>" name="pageForm">
    <div class="mt-2 mx-4">
        <select name="searchType" id="searchType">
            <c:choose>
                <c:when test="${uSearchType == '아이디'}">
                    <option value="전체">전체</option>
                    <option value="아이디" selected>아이디</option>
                    <option value="이메일">이메일</option>
                    <option value="전화번호">전화번호</option>
                    <option value="생년월일">생년월일</option>
                    <option value="가입일">가입일</option>
                </c:when>
                <c:when test="${uSearchType == '이메일'}">
                    <option value="전체">전체</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일" selected>이메일</option>
                    <option value="전화번호">전화번호</option>
                    <option value="생년월일">생년월일</option>
                    <option value="가입일">가입일</option>
                </c:when>
                <c:when test="${uSearchType == '전화번호'}">
                    <option value="전체">전체</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일">이메일</option>
                    <option value="전화번호" selected>전화번호</option>
                    <option value="생년월일">생년월일</option>
                    <option value="가입일">가입일</option>
                </c:when>
                <c:when test="${uSearchType == '생년월일'}">
                    <option value="전체">전체</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일">이메일</option>
                    <option value="전화번호">전화번호</option>
                    <option value="생년월일" selected>생년월일</option>
                    <option value="가입일">가입일</option>
                </c:when>
                <c:when test="${uSearchType == '가입일'}">
                    <option value="전체">전체</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일">이메일</option>
                    <option value="전화번호">전화번호</option>
                    <option value="생년월일">생년월일</option>
                    <option value="가입일" selected>가입일</option>
                </c:when>
                <c:otherwise>
                    <option value="전체" selected>전체</option>
                    <option value="아이디">아이디</option>
                    <option value="이메일">이메일</option>
                    <option value="전화번호">전화번호</option>
                    <option value="생년월일">생년월일</option>
                    <option value="가입일">가입일</option>
                </c:otherwise>
            </c:choose>

        </select> <input type="text" id="keyword" name="keyword"
                         value="${uKeyword}">
        <button class="btn btn-dark btn-block" type="button"
                id="searchButton">검색</button>
        <button class="btn btn-dark btn-block" type="button"
                id="resetButton"
                onClick="location.href='/admin/user?reset=1'">검색초기화</button>
    </div>

    <table class="table">
        <tbody id="user-list-container">
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
                            class="${pagination.paging.page == num ? 'age-item active' : ''} page-item"><a
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
                                                             name="recordSize" value="${pagination.paging.recordSize}">

        </div>
    </div>
</form>

<script>
    $(document).ready(function () {

            setupPaginationEventHandlers();

            loadusers(`${uClassification}`, `${uClassification2}`, `${uClassification3}`,
                `${pagination.paging.page}`, `${uSearchType}`,
                `${uKeyword}`);

            let classifi = `${uClassification}`;
            let classifi2 = `${uClassification2}`;
            let classifi3 = `${uClassification3}`;

            $('#searchButton').on(
                'click',
                function () {
                    loadusers(classifi, classifi2, classifi3, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            $('.cl2 li').click(
                function () {
                    classifi2 = $(this).data(
                        'classification2');
                    $('.tab--user li').removeClass('active');
                    $(this).addClass('active');

                    loadusers(classifi, classifi2, classifi3, undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            $('.cl3 li').click(
            function () {
                classifi3 = $(this).data(
                    'classification3');
                $('.tab--user li').removeClass('active');
                $(this).addClass('active');

                loadusers(classifi, classifi2, classifi3, undefined, $(
                    '#searchType').val(), $('#keyword')
                    .val());
            });

            $('.tab--user li').click(
            function () {
                classifi = $(this).data(
                    'classification');
                $('.tab--user li').removeClass('active');
                $(this).addClass('active');

                loadusers(classifi, classifi2, classifi3, undefined, $(
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
                        loadusers($('.tab--user li.active').data('classification'), $('.cl2 li.active').data('classification2'), $('.cl3 li.active').data('classification3'), value, $('#searchType').val(), $('#keyword').val());
                    });
            }

            function loadusers(classification, classification2, classification3, page, searchType, keyword) {
                $
                    .ajax({
                        type   : 'GET',
                        url    : '/admin/user/classification',
                        data   : {
                            classification: classification,
                            classification2: classification2,
                            classification3: classification3,
                            page          : page,
                            searchType    : searchType,
                            keyword       : keyword
                        }, // 페이지 번호와 카테고리 정보를 전달합니다.
                        success: function (data) {
                            var userList = data.userList;
                            var pagination = data.pagination;
                            var userListHTML = '<tr>'
                                + '<td><h4>이메일</h4></td>'
                                + '<td><h4>이름</h4></td>'
                                + '<td><h4>아이디</h4></td>'
                                + '<td><h4>전화번호</h4></td>'
                                + '<td><h4>계좌번호</h4></td>'
                                + '<td><h4>은행이름</h4></td>'
                                + '<td><h4>포인트</h4></td>'
                                + '<td><h4>이미지</h4></td>'
                                + '<td><h4>타입</h4></td>'
                                + '<td><h4>탈퇴여부</h4></td>'
                                + '<td><h4>권한</h4></td>'
                                + '</tr>';
                            for (var i = 0; i < userList.length; i++) {
                                var user = userList[i];
                                if (user.role_type_id === 1)
                                    user.role_type_id = '일반 유저';
                                else
                                    user.role_type_id = '관리자'
                                var birthDate = formatDate(user.birth_date); // 날짜 포맷 변환
                                if (birthDate === '3000. 1. 1.')
                                    birthDate = '카카오 회원';
                                if (user.tel === '99999999999')
                                    user.tel = '카카오 회원';
                                var regDate = formatDate(user.reg_date); // 날짜 포맷 변환
                                userListHTML += '<tr>'
                                    + '<td><p class="classification">'
                                    + user.role_type_id
                                    + '</p></td>'
                                    + '<td><a href="/admin/user/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + user.id
                                    + '">'
                                    + user.username
                                    + '</a></td>'
                                    + '<td><a href="/admin/user/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + user.id
                                    + '">'
                                    + user.email
                                    + '</a></td>'
                                    + '<td><a href="/admin/user/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + user.id
                                    + '">'
                                    + user.tel
                                    + '</a></td>'
                                    + '<td><a href="/admin/user/detail?page='
                                    + pagination.paging.page
                                    + '&id='
                                    + user.id
                                    + '">'
                                    + birthDate
                                    + '</a></td>'
                                    + '<td><p>'
                                    + regDate
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
                                    + (pagination.paging.page == num ? 'page-item active'
                                        : 'page-item')
                                    + '"><a class="page-list" href="#" data-page="' + num + '">'
                                    + num + '</a></li>';
                            }
                            if (pagination.next) {
                                paginationHTML += '<li class="page-item"><a class="page-list" href="#" data-page="'
                                    + (pagination.endPage + 1)
                                    + '">Next</a></li>';
                            }
                            $('#user-list-container').html(
                                userListHTML);
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

    function formatDate(timestamp) {
        const date = new Date(timestamp);
        return date.toLocaleDateString();
    }

    function selectItem(selectedItem) {
        let dropdownButton = document.querySelector('.dropdown-btn');
        dropdownButton.textContent = selectedItem;
        let classification = document.querySelector('#classification');
        classification.value = selectedItem;
    }

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>

