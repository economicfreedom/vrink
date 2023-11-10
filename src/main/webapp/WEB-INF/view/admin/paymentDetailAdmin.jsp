<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div style="font-family: 'NanumSquareRound';">
    <div class="card-body text-black" style="margin: 25px auto;
    max-width: 530px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div class="d-flex align-items-center mb-0 pb-1" style="
        background-color: #212529;
        color: white;
        border-top-right-radius: 6px;
        border-top-left-radius: 6px;">
            <div class="d-flex align-items-center" style="margin : 0 auto; padding: 3px;">
                <i class="fa-solid fa-sack-dollar fa-2xl"></i> <span
                    class="h1 fw-bold mb-0">&nbsp;결제 상세 정보</span>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="form-outline mb-0" style="display: flex; justify-content: center;">
                <div class="user-inline me-2">
                    <label class="form-label my-0" for="customer-nickname"><text style="color: blue"><i class="fa-solid fa-cart-shopping"></i> 구매자</text></label>
                    <div style="display: flex;">
                        <input type="text" id="customer-nickname" value="${adminPayment.customerNickname}"
                               class="form-control form-control input-l" readonly="readonly"/>
                    </div>
                </div>
                <div class="user-inline ml-2">
                    <label class="form-label my-0" for="editor-nickname"><text style="color: red"><i class="fa-solid fa-coins"></i> 판매자</text></label>
                    <div style="display: flex;">
                        <input type="text" id="editor-nickname" value="${adminPayment.editorNickname}"
                               class="form-control form-control input-l" readonly="readonly"/>
                    </div>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="name">내용</label>
                <div style="display: flex;">
                    <input type="text" id="name" value="${adminPayment.name}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="total-price">총 가격</label>
                <div style="display: flex;">
                    <input type="text" id="total-price" value="${adminPayment.totalPrice}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="request">요구사항</label>
                <div style="display: flex;">
                    <input type="text" id="request" value="${adminPayment.request}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="created-at">최초 결제일</label>
                <div style="display: flex;">
                    <input type="text" id="created-at" value="${adminPayment.createdAt}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <c:forEach items="${adminPaymentStateList}" var="adminPaymentState">
                ${adminPaymentState.state}
                ${adminPaymentState.created_at}
            </c:forEach>

            <c:forEach items="${adminPaymentDetailList}" var="adminPaymentDetail">
                ${adminPaymentDetail.options}
                ${adminPaymentDetail.price}
                ${adminPaymentDetail.quantity}
            </c:forEach>

<%--            <div class="form-outline mb-0" style="display: flex; justify-content: center;">--%>
<%--                <div class="user-inline">--%>
<%--                    <label class="form-label my-0" for="editor-createdAt">판매자 전환일</label>--%>
<%--                    <div style="display: flex;">--%>
<%--                        <input type="text" id="editor-createdAt" value="${userDetail.editorCreatedAt != null ? userDetail.editorCreatedAt : '구매자'}"--%>
<%--                               class="form-control form-control input-l me-1" readonly="readonly"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="user-inline">--%>
<%--                    <label class="form-label my-0" for="created-at">가입일</label>--%>
<%--                    <div style="display: flex;">--%>
<%--                        <input type="text" id="created-at" value="${userDetail.createdAt}"--%>
<%--                               class="form-control form-control input-l ms-1" readonly="readonly"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

            <input type="hidden" id="payment-id" value="${adminPayment.paymentId}">
<%--            <div class="form-outline mb-0 mt-2">--%>
<%--                <label style="font-weight: bold" class="form-label my-0" for="roleId">회원등급 :--%>
<%--                    <c:choose><c:when test="${userDetail.level == 0}"> 일반 유저 </c:when><c:otherwise> 관리자 </c:otherwise>--%>
<%--                    </c:choose></label>--%>
<%--                <select name="level" id="roleId" class="datatable-selector" style="padding-left: 1.125rem; padding-right: 2.125rem;">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${userDetail.level == 0}">--%>
<%--                            <option value="2" selected>관리자</option>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <option value="1" selected>일반유저</option>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </select>--%>
<%--                <button class="btn btn-secondary btn-block btn-admin" type="button" id="changeRole">변경하기</button>--%>
<%--            </div>--%>

<%--            <div class="form-outline mb-0 mt-2">--%>
<%--                <label style="font-weight: bold" class="form-label my-0" for="ableId">회원등급 :--%>
<%--                    <c:choose><c:when test="${userDetail.enabledCheck == 0}"> 비탈퇴 회원 </c:when><c:otherwise> 탈퇴 회원 </c:otherwise>--%>
<%--                    </c:choose></label>--%>
<%--                <select name="able" id="ableId" class="datatable-selector" style="padding-left: 1.125rem; padding-right: 2.125rem;">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${userDetail.enabledCheck == 0}">--%>
<%--                            <option value="1" selected>탈퇴 처리</option>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <option value="0" selected>비탈퇴 처리</option>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </select>--%>
<%--                <button class="btn btn-secondary btn-block btn-admin" type="button" id="changeAble">변경하기</button>--%>
<%--            </div>--%>


            <div class="pt-1">

                <%--                <button class="btn btn-dark btn-lg btn-block"--%>
                <%--                        style="font-size: 0.8rem;" type="submit">정보수정--%>
                <%--                </button>--%>

                <button class="btn btn-secondary btn-block btn-admin" type="button" onClick="location.href='/admin/user?page=${page}'">
                    목록보기
                </button>

            </div>

        </div>
    </div>

</div>
<script>

    $('#changeRole').on('click', () => {

        let idval = $('#userId').val();
        let roleval = $('#roleId').val();

        console.log(idval);
        console.log(roleval);

        $.ajax({
            type   : "POST",
            url    : "/admin/user/modify-level",
            data   : {
                "userId": idval,
                "level" : roleval
            },
            success: function (data) {
                if (data === 200) {
                    location.reload();
                }
            }
            , error: function () {
                alert('서버 에러입니다.');
            }
        });
    });

    $('#changeAble').on('click', () => {

        let idval = $('#userId').val();
        let ableval = $('#ableId').val();

        console.log(idval);
        console.log(ableval);

        $.ajax({
            type   : "POST",
            url    : "/admin/user/modify-able",
            data   : {
                "userId"      : idval,
                "enabledCheck": ableval
            },
            success: function (data) {
                if (data === 200) {
                    location.reload();
                }
            }
            , error: function () {
                alert('서버 에러입니다.');
            }
        });
    });

    $(document).ready(function () {

    });

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>