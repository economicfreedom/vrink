<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>
    .board-list-th {
        border-top: 1px solid #f2f2f2;
        border-bottom: 1px solid #f2f2f2;
        height: 45px;
    }

    .board-list-tr {
        border-bottom: 1px solid #f2f2f2;
        height: 45px;
        color: #5f5f5f
    }
</style>
<script>
    function href() {
        location.href = "/board/write-form"
    }

    $(document).ready(function () {
        $("#search").click(function () {

            let type = $("#type").val();
            let keyword = $("#keyword").val();
            alert(type)
            alert(keyword)
            location.href = "/notice/notice-list?keyword=" + keyword + "&type=" + type;

        });
        $("#keyword").keypress(function (event) {
            if (event.which == 13) {  // 13은 엔터 키의 키 코드입니다.
                let type = $("#type").val();
                let keyword = $("#keyword").val();


                location.href = "/notice/notice-list?type=" + type + "&keyword=" + keyword;
            }
        });
        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            const value = $(this).data('page-num');
            console.log(value);

            document["page-form"]["page-num"].value = value;
            document["page-form"].type.value = $("select[name='type']").val();
            document["page-form"].keyword.value = $("#keyword").val();
            // document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
            document["page-form"].submit();
        }); // end of #pagination
    })
</script>

<div class="container mt-5">
    <div class="row mt-5 mb-5">
        <div class="col-sm-9 col-center">
            <div class="d-flex mb-3" style="justify-content: space-between; ">
                <div>
                    <c:if test="${pageDTO.cri.keyword != ''}">
                        <h2 style="color: grey">${pageDTO.cri.keyword}(${total})</h2>
                    </c:if>

                    <c:if test="${pageDTO.cri.keyword == ''}">
                        <div class="heading1">
                            <h2 style="color: grey">공지사항</h2>
                        </div>
                    </c:if>
                </div>
                <div>
                    <select style="height:26px" name="type" id="type">
                        <option value="title"  ${pageDTO.cri.type == 'title' ? 'selected' : ''}>제목</option>
                        <option value="content"  ${pageDTO.cri.type == 'content' ? 'selected' : ''}>내용</option>
                    </select>
                    <input type="text" size="15" id="keyword"
                           value="${pageDTO.cri.keyword != '' ? pageDTO.cri.keyword :''}">
                    <img src="/image/54481.png" width="15px" height="15px" style="cursor: pointer"
                         id="search">

                </div>
            </div>
            <table class="w-full t-center" style="font-weight: bold">
                <colgroup>
                    <col width="10%">
                    <col width="40%">
                    <col width="25%">
                    <col width="25%">
                </colgroup>
                <thead >
                <tr class="board-list-th">
                    <th class="t-center">번호</th>
                    <th>제목</th>
                    <th class="t-center"></th>
                    <th class="t-center">날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${noticeList}" var="notice">
                    <tr class="board-list-tr">
                        <td>${notice.noticeId}</td>
                        <td class="t-left">
                            <a href="/notice/${notice.noticeId}"
                               style="text-decoration: none; color: black"><span>
                                    ${notice.title}</span></a></td>

                        <td></td>
                        <td>${notice.createdAt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--    <ul class="pagination" style="margin: 20px 0;">--%>
    <%--        <li class="disabled"><a href="#" title=""><span>NEXT</span></a></li>--%>
    <%--        <li><a href="#" title="">1</a></li>--%>
    <%--        <li class="active"><a href="#" title="">2</a></li>--%>
    <%--        <li><a href="#" title="">3</a></li>--%>
    <%--        <li><a href="#" title=""><span>PREV</span></a></li>--%>
    <%--    </ul>--%>
    <c:if test="${USER != null}">
    </c:if>
    <form action="/notice/notice-list" name="page-form">
        <ul class="pagination" id="pagination" style="margin: 20px 0;">

            <c:if test="${pageDTO.prev}">
                <li class="disabled"><a href="#" style="cursor: pointer"
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
    </form>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
