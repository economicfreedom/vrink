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
                    class="h1 fw-bold mb-0">&nbsp;배너 등록</span>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="adComName">회사이름</label>
                <div style="display: flex;">
                    <input type="text" id="adComName" placeholder="회사 이름을 입력해주세요"
                           class="form-control form-control input-l"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="price">가격</label>
                <div style="display: flex;">
                    <input type="number" id="price" placeholder="가격을 입력해주세요"
                           class="form-control form-control input-l"/>
                </div>
            </div>

            <div class="form-outline mb-0" style="display: flex; justify-content: center;">
                <div class="user-inline">
                    <label class="form-label my-0" for="adPeriod">기간</label>
                    <div style="display: flex;">
                        <input type="number" id="adPeriod" placeholder="기간을 입력해주세요"
                               class="form-control form-control input-l me-1"/>
                        <button class="btn btn-secondary btn-block btn-admin ms-1 me-2" style="width: 60px;" type="button" onclick="changePeriod()">변경</button>
                    </div>
                </div>
            </div>

            <div class="pt-1">

                <button class="btn btn-secondary btn-block btn-admin"
                        type="button"
                        onClick="location.href='/admin/ad-admin'">
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
                    <img src="/images/default_banner.png"
                         alt=""
                         style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
        </div>
    </div>

</div>

<script>


    $(document).ready(function () {

    });

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>