<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script>
    function href(){
        location.href="/qna/write"
    }
        $(document).ready(function () {
        $("#search").click(function () {

            let type = $("#type").val();
            let keyword = $("#keyword").val();
            alert(type)
            alert(keyword)
            location.href = "/board/board-list?keyword=" + keyword + "&type=" + type;

        });
        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            const value = $(this).data('page-num');
            console.log(value);

            document["page-form"]["page-num"].value = value;
            // document["page-form"].type.value = $("select[name='type']").val();
            // document["page-form"].keyword.value = $("#keyword").val();
            // document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
            document["page-form"].submit();
        }); // end of #pagination
    })
</script>
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
<div class="container">
    <div class="row mt-5 mb-5">
        <div class="col-sm-9 col-center">
            <div class="d-flex mb-3" style="justify-content: space-between;">
                <div class="d-flex mb-3 justify-content-between align-items-center">
                    <h2 class="mb-0">문의</h2>

                </div>
                <div>
                    <button class="flat-btn" style="font-size: 12px;" onclick="href()">문의 하기</button>
                </div>
            </div>
            <table class="w-full t-center">
                <colgroup>
                    <col width="10%">
                    <col width="10%">
                    <col width="25%">
                    <col width="25%">
                </colgroup>
                <thead>
                <tr class="board-list-th">
                    <th class="t-center">문의 유형</th>
                    <th class="t-center">답변 상태</th>
                    <th>제목</th>
                    <th class="t-center">날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="board">
                    <tr class="board-list-tr">


                        <td>
                            <c:choose>
                                <c:when test="${board.type eq 'question'}"> 문의 </c:when>
                                <c:when test="${board.type eq 'report'}"> 신고 </c:when>
                                <c:otherwise> 기타 </c:otherwise>
                            </c:choose>
                        </td>


                        <c:choose>
                            <c:when test="${board.status == 0}">
                                <td style="color: grey"> [답변 대기]</td>
                            </c:when>
                            <c:otherwise>
                                <td style="color: red"> [답변 완료]</td>
                            </c:otherwise>
                        </c:choose>
                        <td class="t-left"><a
                                href="/qna/read-q/${board.questionId}"
                                style="text-decoration: none; color: black">
                                ${board.title}

                        </a></td>


                        <td>${board.createdAt}</td>
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
    <form action="/qna/list/${USER.userId}" name="page-form">
        <ul class="pagination" id="pagination" style="margin: 20px 0;">

            <c:if test="${pageDTO.prev}">
                <li class="disabled"><a href="#"
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
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>