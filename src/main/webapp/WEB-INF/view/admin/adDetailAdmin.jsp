<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div id="main-card"
     style="font-family: 'NanumSquareRound'; display: inline-flex; position: relative; left: ${adDetail.category == 0 ? 30 : 350}px;"
     class="justify-content-center">
    <div class="card-body text-black" style="margin: 130px 0;
    min-width: 710px;
    max-width: 710px;
    border: 1px solid #b9b9b9;
    border-radius: 8px;">
        <div class="d-flex align-items-center pb-1" style="
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

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="category">위치</label>
                <div style="display: flex;">
                    <input type="text" id="category" style="color: ${adDetail.category == 0 ? "purple" : "#ff5722"};" value="${adDetail.category == 0 ? "메인" : "사이드"}"
                           class="form-control form-control input-l" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="isNotice">종류</label>
                <div style="display: flex;">
                    <input type="text" id="isNotice" style="color: ${adDetail.isNotice == 1 ? "red" : "green"};" value="${adDetail.isNotice == 1 ? "공지사항" : "외부광고"}"
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
                            <c:when test="${adDetail.status == 1}">
                                <input type="text" id="status" value="게시중" style="color: blue" class="form-control form-control input-l ms-4" readonly="readonly"/>
                            </c:when>
                            <c:otherwise>
                                <input type="text" id="status" value="비게시" style="color: red" class="form-control form-control input-l ms-4" readonly="readonly"/>
                            </c:otherwise>
                        </c:choose>
                        <button class="btn btn-secondary btn-block btn-admin ms-1" style="width: 60px;" type="button" onclick="changeApply()">변경</button>
                    </div>
                </div>
            </div>

            <input type="hidden" id="adId" value="${adDetail.adId}">

            <div class="pt-1 mt-1">

                <button class="btn btn-secondary btn-block btn-admin mt-2"
                        type="button"
                        onClick="location.href='/admin/ad-admin'">
                    목록보기
                </button>

            </div>
        </div>
        <script>
            console.log("${adDetail}");
        </script>
            <c:if test="${adDetail.hhhhImage != 'undefined'}">
              <div class="si-ad" style="border: 1px solid #b9b9b9; border-radius: 3px;">
                <img id="h_img" src="${adDetail.hhhhImage}" style="object-fit: fill;
                            border: 1px solid #b9b9b9;
                            border-radius: 3px;
                            width: 707px;
                            height: 320px;">
              </div>
            </c:if>
    </div>

    <c:if test="${adDetail.vvvvImage != 'undefined'}">
        <div class="si-ad" style="margin: 130px 0; max-width: 170px;">
            <img id="v_img"
                 src="${adDetail.vvvvImage}"
                 style="    object-fit: fill;
                            border: 1px solid #b9b9b9;
                            border-radius: 3px;
                            width: 170px;
                            height: 512px;">
        </div>
    </c:if>

    <c:if test="${adDetail.mainImage != 'undefined'}">
        <div class="ma-ad" style="border: 1px solid #b9b9b9; border-radius: 3px; margin: 130px 0">
            <img id="ma-img" src="${adDetail.mainImage}" style="object-fit: fill; height: 510px; width: 870px;">
        </div>
    </c:if>
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