<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div style="font-family: 'NanumSquareRound';" class="d-flex justify-content-center">
    <div class="card-body text-black" style="margin: 200px 0;
    max-width: 530px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div class="d-flex align-items-center mb-3 pb-1" style="
        background-color: #212529;
        color: white;
        border-top-right-radius: 6px;
        border-top-left-radius: 6px;">
            <div class="d-flex align-items-center" style="padding: 10px 10px 10px 25px;">
                <i class="fa-brands fa-adversal fa-2xl"></i> <span
                    class="h1 fw-bold mb-0">&nbsp;배너정보 조회</span>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="adComName">회사이름</label>
                <div style="display: flex;">
                    <input type="text" id="adComName" value="${adDetail.adComName}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="price">가격</label>
                <div style="display: flex;">
                    <input type="text" id="price" value="${adDetail.price}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="createdAt">의뢰일</label>
                <div style="display: flex;">
                    <input type="text" id="createdAt" value="${adDetail.createdAt}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>


            <div class="form-outline mb-0" style="display: flex; justify-content: center;">
                <div class="user-inline">
                    <label class="form-label my-0" for="adPeriod">기간</label>
                    <div style="display: flex;">
                        <input type="text" id="adPeriod" value="${adDetail.adPeriod}"
                               class="form-control form-control input-l me-1"/>
                        <button class="btn btn-secondary btn-block btn-admin ms-1 me-2" style="width: 60px;" type="button" onclick="changePeriod()">변경</button>
                    </div>
                </div>
                <div class="user-inline">
                    <label class="form-label my-0 ms-4" for="status">상태</label>
                    <div style="display: flex;">
                        <c:choose>
                            <c:when test="${adDetail.status == 0}">
                                <input type="text" id="status" value="게시중" style="color: cadetblue" class="form-control form-control input-l ms-4" readonly="readonly"/>
                            </c:when>
                            <c:otherwise>
                                <input type="text" id="status" value="비게시" style="color: #173f41" class="form-control form-control input-l ms-4" readonly="readonly"/>
                            </c:otherwise>
                        </c:choose>
                        <button class="btn btn-secondary btn-block btn-admin ms-1" style="width: 60px;" type="button" onclick="changeApply()">변경</button>
                    </div>
                </div>
            </div>

            <input type="hidden" id="adId" value="${adDetail.adId}">

            <div class="pt-1">

                <%--                <button class="btn btn-dark btn-lg btn-block"--%>
                <%--                        style="font-size: 0.8rem;" type="submit">정보수정--%>
                <%--                </button>--%>

                <button class="btn btn-secondary btn-block btn-admin"
                        type="button"
                        onClick="location.href='/admin/ad-admin?page=${page}'">
                    목록보기
                </button>
            </div>
        </div>
    </div>

    <div class="card-body text-black" style="margin: 200px 0;
    max-width: 530px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div style="
            width: 100%;
            height: 100%;
            border: 1px solid #00000038;
            position: relative;">
                    <img src="${adDetail.image}"
                         alt=""
                         style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
        </div>
    </div>

</div>

<script>

    function changeApply() {

        $.ajax({
            type   : "POST",
            url    : "/admin/change-ad",
            data   : {
                "adId" : ${adDetail.adId},
                "status": ${adDetail.status}
            },
            success: function (data) {
                if (data === 200) {
                    location.reload();
                } else {
                    alert('에러 읍니다.');
                }
            }
            , error: function () {
                alert('서버 에러입니다.');
            }
        });
    }

    function changePeriod() {

        $.ajax({
            type   : "POST",
            url    : "/admin/change-ad-period",
            data   : {
                "adId" : ${adDetail.adId},
                "adPeriod" : $('#adPeriod').val()
            },
            success: function (data) {
                if (data === 200) {
                    location.reload();
                } else {
                    alert('에러 읍니다.');
                }
            }
            , error: function () {
                alert('서버 에러입니다.');
            }
        });

    }


    $('#changeRole').on('click', () => {

        let idval = $('#adId').val();
        let roleval = $('#roleId').val();

        console.log(idval);
        console.log(roleval);

        $.ajax({
            type   : "POST",
            url    : "/admin/ad/modify-level",
            data   : {
                "adId" : idval,
                "level": roleval
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

        let idval = $('#adId').val();
        let ableval = $('#ableId').val();

        console.log(idval);
        console.log(ableval);

        $.ajax({
            type   : "POST",
            url    : "/admin/ad/modify-able",
            data   : {
                "adId"        : idval,
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