<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div style="font-family: 'NanumSquareRound';">
    <div class="card-body text-black" style="margin: 25px auto; max-width: 500px;">
        <div class="d-flex align-items-center mb-3 pb-1">
            <i class="fa-solid fa-question-pen fa-2xl"></i> <span
                class="h1 fw-bold mb-0">&nbsp;회원정보 조회</span>
            <div style="margin-left: 40px;
            height: 150px;
            width: 150px;
            border: 1px solid #00000038;
            border-radius: 75px;
            overflow: hidden; /* 이미지 넘치는 부분 숨기기 */
            position: relative;">

            <c:choose>
                <c:when test="${empty questionDetail.questionImage}">
                    <img src="/images/default_profile.png" alt="" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
                </c:when>
                <c:otherwise>
                    <img src="${questionDetail.questionImage}" alt="" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
                </c:otherwise>
            </c:choose>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="email">이메일</label>
            <div style="display: flex;">
                <input type="email" id="email" value="${questionDetail.email}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="name">이름</label>
            <div style="display: flex;">
                <input type="text" id="name" value="${questionDetail.name}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="nickname">아이디</label>
            <div style="display: flex;">
                <input type="text" id="nickname" value="${questionDetail.nickname}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>


        <div class="form-outline mb-0">
            <label class="form-label my-0" for="phone">전화번호</label>
            <div style="display: flex;">
                <input type="tel" id="phone" value="${questionDetail.phone}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="account">계좌번호</label>
            <div style="display: flex;">
                <input type="text" id="account" value="${questionDetail.account}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="account-name">은행이름</label>
            <div style="display: flex;">
                <input type="text" id="account-name" value="${questionDetail.accountName}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="point">포인트</label>
            <div style="display: flex;">
                <input type="text" id="point" value="${questionDetail.point}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="editor-createdAt">판매자 전환일</label>
            <div style="display: flex;">
                <input type="text" id="editor-createdAt" value="${questionDetail.editorCreatedAt}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-outline mb-0">
            <label class="form-label my-0" for="created-at">가입일</label>
            <div style="display: flex;">
                <input type="text" id="created-at" value="${questionDetail.createdAt}"
                       class="form-control form-control" readonly="readonly"/>
            </div>
        </div>

        <%--        <div class="form-outline mb-0">--%>
        <%--            <label class="form-label my-0" for="birthDate">생년월일</label>--%>
        <%--            <c:choose>--%>
        <%--                <c:when test="${questionDetail.birthDate != '3000-01-01'}">--%>
        <%--                    <input type="text" id="birthDate" name="birthDate"--%>
        <%--                           value="${questionDetail.birthDate}" class="form-control form-control"--%>
        <%--                           maxlength="10" readonly />--%>
        <%--                </c:when>--%>
        <%--                <c:otherwise>--%>
        <%--                    <input type="text" id="birthDate" name="birthDate"--%>
        <%--                           placeholder="카카오 회원입니다"--%>
        <%--                           class="form-control form-control" maxlength="10" readonly />--%>
        <%--                </c:otherwise>--%>
        <%--            </c:choose>--%>
        <%--        </div>--%>

        <input type="hidden" id="questionId" value="${questionDetail.questionId}">
        <div class="form-outline mb-0 mt-2">
            <label style="font-weight: bold" class="form-label my-0" for="roleId">회원등급 :
                <c:choose><c:when test="${questionDetail.level == 0}"> 일반 유저 </c:when><c:otherwise> 관리자 </c:otherwise>
                </c:choose></label>
            <select name="level" id="roleId">
                <c:choose>
                    <c:when test="${questionDetail.level == 0}">
                        <option value="2" selected>관리자</option>
                    </c:when>
                    <c:otherwise>
                        <option value="1" selected>일반유저</option>
                    </c:otherwise>
                </c:choose>
            </select>
            <button class="btn btn-dark btn-block" type="button" id="changeRole">변경하기</button>
        </div>

        <div class="form-outline mb-0 mt-2">
            <label style="font-weight: bold" class="form-label my-0" for="ableId">회원등급 :
                <c:choose><c:when test="${questionDetail.enabledCheck == 0}"> 비탈퇴 회원 </c:when><c:otherwise> 탈퇴 회원 </c:otherwise>
                </c:choose></label>
            <select name="able" id="ableId">
                <c:choose>
                    <c:when test="${questionDetail.enabledCheck == 0}">
                        <option value="1" selected>탈퇴 처리</option>
                    </c:when>
                    <c:otherwise>
                        <option value="0" selected>비탈퇴 처리</option>
                    </c:otherwise>
                </c:choose>
            </select>
            <button class="btn btn-dark btn-block" type="button" id="changeAble">변경하기</button>
        </div>


        <div class="pt-1 mb-4">

            <%--                <button class="btn btn-dark btn-lg btn-block"--%>
            <%--                        style="font-size: 0.8rem;" type="submit">정보수정--%>
            <%--                </button>--%>

            <button class="btn btn-dark btn-block" type="button" onClick="location.href='/admin/question?page=${page}'">목록보기
            </button>

        </div>
    </div>
</div>

<script>

    $('#changeRole').on('click', () => {

        let idval = $('#questionId').val();
        let roleval = $('#roleId').val();

        console.log(idval);
        console.log(roleval);

        $.ajax({
            type   : "POST",
            url    : "/admin/question/modify-level",
            data   : {
                "questionId": idval,
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

        let idval = $('#questionId').val();
        let ableval = $('#ableId').val();

        console.log(idval);
        console.log(ableval);

        $.ajax({
            type   : "POST",
            url    : "/admin/question/modify-able",
            data   : {
                "questionId": idval,
                "enabledCheck" : ableval
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