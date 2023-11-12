<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div style="font-family: 'NanumSquareRound';">
    <div class="card-body text-black" style="margin: 25px auto;
    max-width: 530px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div class="d-flex align-items-center mb-3 pb-1" style="
        background-color: #212529;
        color: white;
        border-top-right-radius: 6px;
        border-top-left-radius: 6px;">
            <div class="d-flex align-items-center" style="padding: 10px 10px 10px 25px;">
                <i class="fa-solid fa-user-pen fa-2xl"></i> <span
                    class="h1 fw-bold mb-0">&nbsp;회원정보 조회</span>
                <div style="margin-left: 40px;
            height: 150px;
            width: 150px;
            border: 1px solid #00000038;
            border-radius: 75px;
            overflow: hidden; /* 이미지 넘치는 부분 숨기기 */
            position: relative;">

                    <c:choose>
                        <c:when test="${empty userDetail.userImage}">
                            <img src="/images/default_profile.png"
                                 alt=""
                                 style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
                        </c:when>
                        <c:otherwise>
                            <img src="${userDetail.userImage}"
                                 alt=""
                                 style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="email">이메일</label>
                <div style="display: flex;">
                    <input type="email" id="email" value="${userDetail.email}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="name">이름</label>
                <div style="display: flex;">
                    <input type="text" id="name" value="${userDetail.name}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="nickname">아이디</label>
                <div style="display: flex;">
                    <input type="text" id="nickname" value="${userDetail.nickname}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>


            <div class="form-outline mb-0">
                <label class="form-label my-0" for="phone">전화번호</label>
                <div style="display: flex;">
                    <input type="tel" id="phone" value="${userDetail.phone}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="account">계좌번호</label>
                <div style="display: flex;">
                    <input type="text" id="account" value="${userDetail.account}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="account-name">은행이름</label>
                <div style="display: flex;">
                    <input type="text" id="account-name" value="${userDetail.accountName}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="point">포인트</label>
                <div style="display: flex;">
                    <input type="text" id="point" value="${userDetail.point}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0" style="display: flex; justify-content: center;">
                <div class="user-inline">
                    <label class="form-label my-0" for="editor-createdAt">판매자 전환일</label>
                    <div style="display: flex;">
                        <input type="text" id="editor-createdAt" value="${userDetail.editorCreatedAt != null ? userDetail.editorCreatedAt : '구매자'}"
                               class="form-control form-control input-l me-1" readonly="readonly"/>
                    </div>
                </div>
                <div class="user-inline">
                    <label class="form-label my-0" for="created-at">가입일</label>
                    <div style="display: flex;">
                        <input type="text" id="created-at" value="${userDetail.createdAt}"
                               class="form-control form-control input-l ms-1" readonly="readonly"/>
                    </div>
                </div>
            </div>


            <%--        <div class="form-outline mb-0">--%>
            <%--            <label class="form-label my-0" for="birthDate">생년월일</label>--%>
            <%--            <c:choose>--%>
            <%--                <c:when test="${userDetail.birthDate != '3000-01-01'}">--%>
            <%--                    <input type="text" id="birthDate" name="birthDate"--%>
            <%--                           value="${userDetail.birthDate}" class="form-control form-control"--%>
            <%--                           maxlength="10" readonly />--%>
            <%--                </c:when>--%>
            <%--                <c:otherwise>--%>
            <%--                    <input type="text" id="birthDate" name="birthDate"--%>
            <%--                           placeholder="카카오 회원입니다"--%>
            <%--                           class="form-control form-control" maxlength="10" readonly />--%>
            <%--                </c:otherwise>--%>
            <%--            </c:choose>--%>
            <%--        </div>--%>

            <input type="hidden" id="userId" value="${userDetail.userId}">
            <div class="form-outline mb-0 mt-2">
                <label style="font-weight: bold" class="form-label my-0" for="roleId">회원등급 :
                    <c:choose><c:when test="${userDetail.level == 0}"> 일반 유저 </c:when><c:otherwise> 관리자 </c:otherwise>
                    </c:choose></label>
                <select name="level" id="roleId" class="datatable-selector" style="padding-left: 1.125rem; padding-right: 2.125rem;">
                    <c:choose>
                        <c:when test="${userDetail.level == 0}">
                            <option value="2" selected>관리자</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1" selected>일반유저</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <button class="btn btn-secondary btn-block btn-admin" type="button" id="changeRole">변경하기</button>
            </div>

            <div class="form-outline mb-0 mt-2">
                <label style="font-weight: bold" class="form-label my-0" for="ableId">회원등급 :
                    <c:choose><c:when test="${userDetail.enabledCheck == 0}"> 비탈퇴 회원 </c:when><c:otherwise> 탈퇴 회원 </c:otherwise>
                    </c:choose></label>
                <select name="able" id="ableId" class="datatable-selector" style="padding-left: 1.125rem; padding-right: 2.125rem;">
                    <c:choose>
                        <c:when test="${userDetail.enabledCheck == 0}">
                            <option value="1" selected>탈퇴 처리</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0" selected>비탈퇴 처리</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <button class="btn btn-secondary btn-block btn-admin" type="button" id="changeAble">변경하기</button>
            </div>


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
                Swal.fire({
                    icon: "error",
                    title: "에러입니다",
                });
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
                Swal.fire({
                    icon: "error",
                    title: "에러입니다",
                });
            }
        });
    });

    $(document).ready(function () {

    });

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>