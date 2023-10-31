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

    .write-btn {
        text-align: right;
    }

    .title--freeboard {
        position: relative;
        color: #535353;
        font-size: 35px;
        line-height: 35px;
        padding: 5px 0 20px 22px;
        margin: 30px;
        border-bottom: 1px solid #535353;
    }

    .tab--freeboard {
        margin-left: 30px;
        padding: 0 0 1px 1px;
        margin-bottom: 30px;
        overflow: hidden;
    }

    .tab--freeboard :hover {
        cursor: pointer;
    }

    .tab--freeboard li {
        float: left;
        display: table;
        width: calc(20% - 2px);
        position: relative;
        box-sizing: border-box;
        margin-right: 0px;
    }

    .tab--freeboard li:last-child {
        border-right: none;
    }

    .tab--freeboard li a {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        font-size: 16px;
        color: #8b8b8b;
        line-height: 20px;
        padding: 5px 8px;
    }

    .tab--freeboard > li.on::before {
        z-index: 10;
        border: 1px solid #222;
    }

    .tab--freeboard > li::before {
        position: absolute;
        top: 0;
        left: -1px;
        width: calc(100% - 1px);
        height: calc(100% - 1px);
        border: 1px solid #e5e5e5;
        content: "";
    }

    .tab--freeboard::after {
        content: "";
        display: table;
        clear: both;
    }

    *, ::after, ::before {
        box-sizing: content-box;
    }

    .tab--freeboard li.active {
        border: 2px solid #222;
        border-top: 1px solid #222;
    }

    .tab--freeboard li.active a {
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

<h1 class="title--freeboard">자유게시판 관리</h1>

<form style="width: 90%;" action="#" name="pageForm">
    <div class="mt-2 mx-4">
        <select name="searchType" id="searchType">
            <c:choose>
                <c:when test="${uSearchType == '아이디'}">
                    <option value="전체">전체</option>
                    <option value="아이디" selected>아이디</option>
                    <option value="제목">제목</option>
                    <option value="내용">내용</option>
                </c:when>
                <c:when test="${uSearchType == '제목'}">
                    <option value="전체">전체</option>
                    <option value="아이디">아이디</option>
                    <option value="제목" selected>제목</option>
                    <option value="내용">내용</option>
                </c:when>
                <c:when test="${uSearchType == '내용'}">
                    <option value="전체">전체</option>
                    <option value="아이디">아이디</option>
                    <option value="제목">제목</option>
                    <option value="내용" selected>내용</option>
                </c:when>
                <c:otherwise>
                    <option value="전체" selected>전체</option>
                    <option value="아이디">아이디</option>
                    <option value="제목">제목</option>
                    <option value="내용">내용</option>
                </c:otherwise>
            </c:choose>

        </select> <input type="text" id="keyword" name="keyword"
                         value="${uKeyword}">
        <button class="btn btn-dark btn-block" type="button"
                id="searchButton">검색
        </button>
        <button class="btn btn-dark btn-block" type="button"
                id="resetButton"
                onClick="location.href='/admin/freeboard?reset=1'">검색초기화
        </button>
    </div>

    <table class="table">
        <tbody id="freeboard-list-container">
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
            <input type="hidden" id="page" name="page" value="${pagination.paging.page}"> <input type="hidden"
                                                                                                 name="recordSize"
                                                                                                 value="${pagination.paging.recordSize}">

        </div>
    </div>
</form>


<script>

    $(document).ready(function () {

            setupPaginationEventHandlers();

            loadfreeboards(`${pagination.paging.page}`, `${uSearchType}`,
                `${uKeyword}`);

            $('#searchButton').on(
                'click',
                function () {
                    loadfreeboards(undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            $('input[type="text"]').keydown(function(key) {
                if (key.keyCode === 13) {
                    key.preventDefault();
                };
            });

            $("#keyword").on("keyup",function(key){
                if(key.keyCode==13) {
                    loadfreeboards(undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                }
            });

            $('.tab--freeboard li').click(
                function () {
                    $('.tab--freeboard li').removeClass('active');
                    $(this).addClass('active');

                    loadfreeboards(undefined, $(
                        '#searchType').val(), $('#keyword')
                        .val());
                });

            function setupPaginationEventHandlers() {
                $(document).on('click', '.pagination li a',
                    function (e) {
                        e.preventDefault();
                        const value = $(this).data('page');
                        // 페이지네이션 버튼 클릭 시 서버로 해당 페이지 번호와 카테고리를 전달합니다.
                        loadfreeboards(value, $('#searchType').val(), $('#keyword').val());
                    });
            }



            function loadfreeboards(page, searchType, keyword) {
                $.ajax({
                    type   : 'GET',
                    url    : '/admin/freeboard/classification',
                    data   : {
                        page          : page,
                        searchType    : searchType,
                        keyword       : keyword
                    }, // 페이지 번호와 카테고리 정보를 전달합니다.
                    success: function (data) {

                        console.log(data);

                        var freeboardList = data.freeboardList;
                        var pagination = data.pagination;
                        var freeboardListHTML = '<tr>'
                            + '<td><h4>글번호</h4></td>'
                            + '<td><h4>아이디</h4></td>'
                            + '<td><h4>제목</h4></td>'
                            + '<td><h4>내용</h4></td>'
                            + '<td><h4>작성일자</h4></td>'
                            + '</tr>';
                        for (var i = 0; i < freeboardList.length; i++) {
                            var freeboard = freeboardList[i];

                            let regData = freeboard.createdAt.substring(0,16);

                            freeboardListHTML += '<tr>'
                                + '<td>'
                                + '<a href="/admin/freeboard-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + freeboard.communityId
                                + '">'
                                + freeboard.communityId
                                + '</a></td>'
                                + '<td>'
                                + '<a href="/admin/freeboard-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + freeboard.communityId
                                + '">'
                                + freeboard.nickname
                                + '</a></td>'
                                + '<td><div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;width: 200px; max-height: 20px">'
                                + '<a href="/admin/freeboard-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + freeboard.communityId
                                + '">'
                                + freeboard.title
                                + '</a></div></td>'
                                + '<td><div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;width: 800px; max-height: 20px">'
                                + '<a href="/admin/freeboard-detail?page='
                                + pagination.paging.page
                                + '&id='
                                + freeboard.communityId
                                + '">'
                                + freeboard.content
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
                        $('#freeboard-list-container').html(
                            freeboardListHTML);
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

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>