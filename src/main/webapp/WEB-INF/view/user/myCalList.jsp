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
        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            const value = $(this).data('page-num');

            document["page-form"]["page-num"].value = value;
            document["page-form"].type.value = $("select[name='type']").val();
            document["page-form"].type.value = $("select[name='state']").val();
            document["page-form"].submit();
        }); // end of #pagination
        $('#state').on('change', function () {
            let type = $(this).val();
            console.log(document["page-form"].type.value = $("select[name='state']").val());
            $('paginationFlag').val(1);
            location.href = "/editor/my-cal-list/" + ${EDITOR_ID} + "?type=" + type;
        });
    })
</script>
<div class="container mt-5">
    <div class="row mt-5 mb-5">
        <div class="col-sm-9 col-center">
            <div class="d-flex mb-3" style="justify-content: space-between;">
                <div>
                    <div class="heading1">
                        <h2 style="color: grey">정산 내역</h2>
                    </div>
                </div>
            </div>
            <input type="hidden" id="paginationFlag" value="0" />
            <table class="w-full t-center">
                <colgroup>
                    <col width="2%">
                    <col width="19%">
                    <col width="25%">
                    <col width="19%">
                    <col width="25%">
                    <col width="10%">
                </colgroup>
                <thead>
                <tr class="board-list-th">
                    <th class="t-center"></th>
                    <th class="t-center">정산 요청 금액</th>
                    <th class="t-center">요청 일자</th>
                    <th class="t-center">정산 금액</th>
                    <th class="t-center">완료 일자</th>
                    <th class="t-center" style="margin-right: 5px">
                        <select style="height:26px" name="state" id="state">
                            <option value="all"  ${pageDTO.cri.type == 'all' ? 'selected' : ''}>모두</option>
                            <option value="inProgress"  ${pageDTO.cri.type == 'inProgress' ? 'selected' : ''}>정산요청</option>
                            <option value="complete" ${pageDTO.cri.type == 'complete' ? 'selected' : ''}>정산완료</option>
                        </select>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${calList}" var="cal">
                    <tr class="board-list-tr">
                        <td></td>
                        <td>${cal.calPrice}원</td>
                        <td>${cal.createdAt}</td>
                        <c:if test="${0 eq cal.calStatus}">
                            <td>-</td>
                        </c:if>
                        <c:if test="${1 eq cal.calStatus}">
                            <td>${cal.realCalPrice}원</td>
                        </c:if>
                        <td>${cal.completeDate}</td>
                        <c:if test="${0 eq cal.calStatus}">
                            <td><input type="button" value="정산 요청" class="status-btn" style="background-color: grey; padding: 5px 16px"/></td>
                        </c:if>
                        <c:if test="${1 eq cal.calStatus}">
                            <td><input type="button" value="정산 완료" class="status-btn" style="background-color: #ff2929; padding: 5px 16px;"/></td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <form action="/editor/my-cal-list/${EDITOR_ID}"  name="page-form">
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
        <input type="hidden" name="type" value="${pageDTO.cri.type}">
    </form>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
