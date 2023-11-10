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
    $(document).ready(function () {
        $("#search").click(function () {
            let type = $("#type").val();
            let keyword = $("#keyword").val();
            $('#paginationFlag').val('0');
            location.href = "/suggest/list?keyword=" + keyword + "&type=" + type;
        });
        $("#keyword").keypress(function (event) {
            console.log($('#paginationFlag').val());
            if (event.which == 13) {  // 13은 엔터 키의 키 코드입니다.
                let type = $("#type").val();
                let keyword = $("#keyword").val();
                $('#paginationFlag').val('0');
                location.href = "/suggest/list?type=" + type + "&keyword=" + keyword;
            }
        });
        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            const value = $(this).data('page-num');

            document["page-form"]["page-num"].value = value;
            document["page-form"].type.value = $("select[name='type']").val();
            document["page-form"].keyword.value = $("#keyword").val();
            document["page-form"].submit();
        }); // end of #pagination
    })
</script>
<div class="container mt-5">
    <div class="row mt-5 mb-5">
        <div class="col-sm-9 col-center">
            <div class="d-flex mb-3" style="justify-content: space-between;">
                <div>
                    <c:if test="${pageDTO.cri.keyword != ''}">
                        <h2 style="color: grey">${pageDTO.cri.keyword}</h2>
                    </c:if>

                    <c:if test="${pageDTO.cri.keyword == ''}">
                        <div class="heading1">
                            <h2 style="color: grey">관심 작가</h2>
                        </div>
                    </c:if>
                </div>
                <div>
                    <select style="height:26px" name="type" id="type">
                        <option value="nickname" ${pageDTO.cri.type == 'nickname' ? 'selected' : ''}>닉네임</option>
                    </select>
                    <input type="text" size="15" id="keyword"
                           value="${pageDTO.cri.keyword != '' ? pageDTO.cri.keyword :''}">
                    <img src="/image/54481.png" width="15px" height="15px" style="cursor: pointer"
                         id="search">

                </div>
            </div>
            <input type="hidden" id="paginationFlag" value="0" />
            <table class="w-full t-center daily">
                <colgroup>
                    <col width="10%">
                    <col width="10%">
                    <col width="50%">
                    <col width="30%">
                </colgroup>
                <thead>
                <tr class="youtb-list-th">
                    <th class="t-center">일간 순위</th>
                    <th class="t-center"></th>
                    <th>채널명</th>
                    <th class="t-center">구독자수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${dailyList}" var="daily" varStatus="step">
                    <tr class="youtb-list-tr">
                        <td>${step.count}</td>
                        <td>
                            <div><a href="${daily.link}"><img src="${daily.thumbnail}" width="50%"></a></div></td>
                        <td class="t-left"><a href="${daily.link}" target="_blank">${daily.channel}</a></td>
                        <td>${daily.subscribe}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <form action="/suggest/list" name="page-form">
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
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
