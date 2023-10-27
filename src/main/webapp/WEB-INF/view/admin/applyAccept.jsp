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
        margin-left: 30px;
        padding: 0 0 1px 1px;
        margin-bottom: 30px;
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

<h1 class="title--adminApply">판매자 신청 목록</h1>
<ul class=tab--adminApply>
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

<form style="width: 90%;" action="#" name="pageForm">
    <div class="mt-2 mx-4">
        <select name="searchType" id="searchType">
            <c:choose>
                <c:when test="${uSearchType == '은행이름'}">
                    <option value="전체">전체</option>
                    <option value="은행이름" selected>은행이름</option>
                    <option value="계좌번호">계좌번호</option>
                    <option value="닉네임">닉네임</option>
                </c:when>
                <c:when test="${uSearchType == '계좌번호'}">
                    <option value="전체">전체</option>
                    <option value="은행이름">은행이름</option>
                    <option value="계좌번호" selected>계좌번호</option>
                    <option value="닉네임">닉네임</option>
                </c:when>
                <c:when test="${uSearchType == '닉네임'}">
                    <option value="전체">전체</option>
                    <option value="은행이름">은행이름</option>
                    <option value="계좌번호">계좌번호</option>
                    <option value="닉네임" selected>닉네임</option>
                </c:when>
                <c:otherwise>
                    <option value="전체" selected>전체</option>
                    <option value="은행이름">은행이름</option>
                    <option value="계좌번호">계좌번호</option>
                    <option value="닉네임">닉네임</option>
                </c:otherwise>
            </c:choose>

        </select> <input type="text" id="keyword" name="keyword"
                         value="${uKeyword}">
        <button class="btn btn-dark btn-block" type="button"
                id="searchButton">검색
        </button>
        <button class="btn btn-dark btn-block" type="button"
                id="resetButton"
                onClick="location.href='/admin/applyAccept?reset=1'">검색초기화
        </button>
    </div>

    <table class="table">
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

    function changeApply(applyId, accepted ,number) {

        $.ajax({
            type : "POST",
            url : "/admin/changeApply",
            data : {
                "applyId" : applyId,
                "accepted" : accepted,
                "number" : number
            },
            success : function(data){
                if (data === 200) {
                    window.location.href = "/admin/applyAccept";
                } else if(data === 400) {
                    alert('사기 계좌로 조회되었습니다. 승인이 불가합니다.');
                } else {
                    alert('에러 읍니다.');
                }
            }
            ,error: function(){
                alert('서버 에러입니다.');
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

            $('input[type="text"]').keydown(function(key) {
                if (key.keyCode === 13) {
                    key.preventDefault();
                };
            });

            $("#keyword").on("keyup",function(key){
                if(key.keyCode==13) {
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
                    url    : '/admin/classification',
                    data   : {
                        classification: classification,
                        page          : page,
                        searchType    : searchType,
                        keyword       : keyword
                    }, // 페이지 번호와 카테고리 정보를 전달합니다.
                    success: function (data) {

                        var adminApplyList = data.adminApplyList;
                        var pagination = data.pagination;
                        var adminApplyListHTML = '<tr>'
                            + '<td><h4>신청상태</h4></td>'
                            + '<td><h4>사기이력</h4></td>'
                            + '<td><h4>은행이름</h4></td>'
                            + '<td><h4>계좌번호</h4></td>'
                            + '<td><h4>유저이름</h4></td>'
                            + '<td><h4>신청날짜</h4></td>'
                            + '</tr>';
                        for (var i = 0; i < adminApplyList.length; i++) {
                            var adminApply = adminApplyList[i];
                            let acct = 0;

                            if (adminApply.accepted === 0) {
                                adminApply.accepted = '승인 대기';
                                acct = 0;
                            }
                            else {
                                adminApply.accepted = '승인됨';
                                acct = 1;
                            }
                            let regData = adminApply.createdAt.substring(0,10);
                            let cheating;

                            if(adminApply.cheater === '이력 없음') cheating = '<td>' + adminApply.cheater + '</td>'
                            else cheating = '<th style="color: red">' + adminApply.cheater + '</th>'
                            adminApplyListHTML += '<tr>'
                                + '<td><p class="classification" style="min-width: 100px">'
                                + adminApply.accepted
                                + '</p> <button class="btn btn-dark btn-block" type="button" onclick="changeApply(' + adminApply.applyId + ',' + acct + ',' + adminApply.number + ')">변경</button></td>'
                                + cheating
                                + '<td>'
                                + adminApply.name
                                + '</td>'
                                + '<td>'
                                + adminApply.number
                                + '</td>'
                                + '<td>'
                                + adminApply.nickname
                                + '</td>'
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

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>