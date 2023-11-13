<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div style="font-family: 'NanumSquareRound';">
    <div class="card-body text-black" style="margin: 25px auto;
    max-width: 1550px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div class="d-flex align-items-center mb-0 pb-1" style="
        background-color: #212529;
        color: white;
        border-top-right-radius: 6px;
        border-top-left-radius: 6px;">
            <div class="d-flex align-items-center" style="margin : 0 auto; padding: 3px;">
                <i class="fa-solid fa-sack-dollar fa-2xl"></i> <span
                    class="h1 fw-bold mb-0">&nbsp;정산 상세 정보</span>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="form-outline mb-1" style="display: flex; justify-content: center;">
                <div class="user-inline me-3">
                    <label class="form-label my-0" for="editor-nickname">
                        <h4><text style="color: red"><i class="fa-solid fa-palette"></i> 작가</text></h4>
                    </label>
                    <div style="display: flex;">
                        <input style="    color: var(--bs-link-color);
                               text-decoration: underline;
                               cursor: pointer;
                               "
                               type="text"
                               id="editor-nickname"
                               onclick="location.href = '/admin/user/detail-nickname?nickname=${calculatorDetailOkList[0].nickname == null ? calculatorDetailNoList[0].nickname : calculatorDetailOkList[0].nickname}'"
                               value="${calculatorDetailOkList[0].nickname == null ? calculatorDetailNoList[0].nickname : calculatorDetailOkList[0].nickname}"
                               class="form-control form-control input-l"
                               readonly="readonly"/>
                    </div>
                </div>
                <div class="user-inline me-3">
                    <label class="form-label my-0" for="editor-account">
                        <h4><text style="color: blue"><i class="fa-solid fa-money-check-dollar"></i> 계좌</text></h4>
                    </label>
                    <div style="display: flex;">
                        <input type="text"
                               id="editor-account"
                               value="${userDto.accountName == null ? '신한은행' : userDto.accountName} | ${userDto.account == null ? '110254593043' : userDto.account}"
                               class="form-control form-control input-l"
                               readonly="readonly"/>
                    </div>
                </div>
            </div>

            <div class="form-label my-2"><h4>정산 상세 목록</h4></div>
            <div id="detail-board"
                 class="form-outline mb-1"
                 style="border: 1px solid lightgray; border-radius: 5px; overflow: auto; max-height: 500px; display: flex; justify-content: center;">
                <div class="mx-2" style="width: 50%;">
                    <div class="d-flex justify-content-center mt-1">
                        <text style="color: green; font-size: large">정산 신청중 <i class="fa-solid fa-hand-holding-dollar"></i></text>
                    </div>
                    <ul class="list-group list-group-horizontal my-1" style="font-weight: 600;">
                        <li class="list-group-item cd-first">번호</li>
                        <li class="list-group-item flex-fill cd-list-1">정산 신청액</li>
                        <li class="list-group-item flex-fill cd-list-1">수수료</li>
                        <li class="list-group-item flex-fill cd-list-1">실제 정산액</li>
                        <li class="list-group-item flex-fill cd-list-1">정산 신청일</li>
                    </ul>
                    <c:if test="${not empty calculatorDetailOkList}">
                        <ul class="list-group list-group-horizontal my-1">
                            <li class="list-group-item cd-first" style="color: green">합계</li>
                            <li class="list-group-item flex-fill cd-list-1" style="color: green"><fmt:formatNumber value="${calculatorDetailOkList[0].totalPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list-1" style="color: green"><fmt:formatNumber value="${calculatorDetailOkList[0].totalCharge}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list-1" style="color: green"><fmt:formatNumber value="${calculatorDetailOkList[0].totalRealPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list-1">${calculatorDetailOkList[0].createdAt}</li>
                        </ul>
                    </c:if>
                    <c:forEach items="${calculatorDetailOkList}" var="calculatorDetail" varStatus="status">
                        <ul class="list-group list-group-horizontal my-1">
                            <li class="list-group-item cd-first">${calculatorDetailOkList.size()+1 - status.count}</li>
                            <li class="list-group-item flex-fill cd-list-1"><fmt:formatNumber value="${calculatorDetail.calPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list-1"><fmt:formatNumber value="${calculatorDetail.calPrice * 0.05}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list-1"><fmt:formatNumber value="${calculatorDetail.calPrice * 0.95}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list-1">${calculatorDetail.createdAt}</li>
                        </ul>
                    </c:forEach>
                </div>
                <span class="d-divider" style="border-left: 2px solid #959595;"></span>
                <div class="mx-2" style="width: 50%;">
                    <div class="d-flex justify-content-center mt-1">
                        <text style="color: grey; font-size: large">정산 완료 <i class="fa-solid fa-circle-check"></i></text>
                    </div>
                    <ul class="list-group list-group-horizontal my-1" style="font-weight: 600;">
                        <li class="list-group-item cd-first">번호</li>
                        <li class="list-group-item flex-fill cd-list">정산 신청액</li>
                        <li class="list-group-item flex-fill cd-list">수수료</li>
                        <li class="list-group-item flex-fill cd-list">실제 정산액</li>
                        <li class="list-group-item flex-fill cd-list">정산 신청일</li>
                        <li class="list-group-item flex-fill cd-list">정산 완료일</li>
                    </ul>
                    <c:if test="${not empty calculatorDetailNoList}">
                        <ul class="list-group list-group-horizontal my-1">
                            <li class="list-group-item cd-first" style="color: #959595">합계</li>
                            <li class="list-group-item flex-fill cd-list" style="color: #959595"><fmt:formatNumber value="${calculatorDetailNoList[0].totalPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list" style="color: #959595"><fmt:formatNumber value="${calculatorDetailNoList[0].totalCharge}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list" style="color: #959595"><fmt:formatNumber value="${calculatorDetailNoList[0].totalRealPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list" style="color: #959595">${calculatorDetailNoList[0].createdAt}</li>
                            <li class="list-group-item flex-fill cd-list" style="color: #959595">${calculatorDetailNoList[0].completeDate}</li>
                        </ul>
                    </c:if>
                    <c:forEach items="${calculatorDetailNoList}" var="calculatorDetail" varStatus="status">
                        <ul class="list-group list-group-horizontal my-1">
                            <li class="list-group-item cd-first">${calculatorDetailNoList.size()+1 - status.count}</li>
                            <li class="list-group-item flex-fill cd-list"><fmt:formatNumber value="${calculatorDetail.calPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list"><fmt:formatNumber value="${calculatorDetail.charge}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list"><fmt:formatNumber value="${calculatorDetail.realCalPrice}" pattern="#,###"/>원</li>
                            <li class="list-group-item flex-fill cd-list">${calculatorDetail.createdAt}</li>
                            <li class="list-group-item flex-fill cd-list">${calculatorDetail.completeDate}</li>
                        </ul>
                    </c:forEach>
                </div>
            </div>

            <input type="hidden"
                   id="calculator-id"
                   value="${calculatorDetailOkList[0].calId == null ? calculatorDetailNoList[0].calId : calculatorDetailOkList[0].calId}">

            <div class="pt-1 mt-3">

                <%--                <button class="btn btn-dark btn-lg btn-block"--%>
                <%--                        style="font-size: 0.8rem;" type="submit">정보수정--%>
                <%--                </button>--%>

                <button class="btn btn-secondary btn-block btn-admin"
                        type="button"
                        onClick="location.href='/admin/calculator-admin?page=${page}'">
                    목록보기
                </button>

                <button class="btn btn-primary btn-block btn-admin"
                        type="button"
                        onClick="calculateComplete(${calculatorDetailOkList[0].editorId == null ? calculatorDetailNoList[0].editorId : calculatorDetailOkList[0].editorId})">
                    정산하기
                </button>
            </div>
        </div>
    </div>

</div>
<script>

    function calculateComplete(editorId) {
        Swal.fire({
            title             : "정말 정산처리 하시겠습니까??",
            text              : "되돌릴 수 없습니다!",
            icon              : "success",
            showCancelButton  : true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor : "#d33",
            confirmButtonText : "정산처리"
        }).then((result) => {
            if (result.isConfirmed) {
                fetch('/admin/calculator-update/' + editorId, {
                    method: 'PUT',
                })
                    .then(response => {
                        if (!response.ok) {
                            Swal.fire({
                                icon: "error",
                                title: "에러입니다",
                            });
                        } else {
                            location.reload();
                        }
                    })
                    .then(data => console.log(data))
                    .catch(error => console.error('Error:', error));
            }
        });
    }

    document.addEventListener("DOMContentLoaded", function () {
        adjustDividerHeight();
    });

    function adjustDividerHeight() {
        var detailBoard = document.getElementById("detail-board");
        var divider = document.querySelector(".d-divider");
        if (detailBoard && divider) {
            divider.style.height = detailBoard.scrollHeight + "px";
        }
    }

    window.addEventListener("resize", adjustDividerHeight);

    $(document).ready(function () {

    });

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>