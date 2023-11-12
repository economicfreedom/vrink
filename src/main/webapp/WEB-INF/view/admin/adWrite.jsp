<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div id="main-card"
     style="font-family: 'NanumSquareRound'; display: inline-flex; position: relative; left: 30px;"
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
                    class="h1 fw-bold mb-0">&nbsp;배너 등록</span>
            </div>
        </div>

        <div style="padding: 8px;">

            <div class="d-flex">
                <div class="form-check me-3">
                    <input class="form-check-input" type="checkbox" value="" id="is-notice">
                    <label class="form-check-label" for="is-notice">
                        공지사항
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="is-side">
                    <label class="form-check-label" for="is-side">
                        사이드 배너
                    </label>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="ad-com-name">회사이름</label>
                <div style="display: flex;">
                    <input type="text" id="ad-com-name" placeholder="회사 이름을 입력해주세요"
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
                    <label class="form-label my-0" for="ad-period">기간</label>
                    <div style="display: flex;">
                        <input type="number" id="ad-period" placeholder="기간을 입력해주세요"
                               class="form-control form-control input-l me-1"/>
                    </div>
                </div>
            </div>

            <div class="pt-1 mt-1">

                <div id="ma-ad-box" class="profile-box">
                    <label style="margin-left: 200px;" for="main_banner">메인 배너</label>
                    <input type="file" id="main_banner">
                </div>

                <div id="si-ad-box" class="profile-box" style="display: none;">
                    <label style="margin-left: 20px;" for="h_banner">가로 배너</label>
                    <input style="width: 30%" type="file" id="h_banner">
                    <label style="margin-left: 100px;" for="v_banner">세로 배너</label>
                    <input style="width: 30%" type="file" id="v_banner">
                </div>

                <button class="btn btn-secondary btn-block btn-admin mt-2"
                        type="button"
                        onClick="location.href='/admin/ad-admin'">
                    목록보기
                </button>

                <button class="btn btn-secondary btn-block btn-admin mt-2"
                        type="button"
                        onClick="upload()">
                    등록하기
                </button>

            </div>
        </div>
        <div class="si-ad" style="border: 1px solid #b9b9b9; border-radius: 3px; display: none;">
            <img id="h_img" src="/images/ad_hori.png" style="object-fit: fill;">
        </div>
    </div>

    <div class="si-ad" style="margin: 130px 0; max-width: 170px; display: none;">
        <img id="v_img"
             src="/images/ad_verti.png"
             style="object-fit: fill; border: 1px solid #b9b9b9; border-radius: 3px;">
    </div>

    <div class="ma-ad" style="border: 1px solid #b9b9b9; border-radius: 3px; margin: 130px 0">
        <img id="ma-img" src="/images/ad_main.png" style="object-fit: fill;">
    </div>
</div>

<script>

    $('#main_banner').change(function () {
        let profileInput = $('#main_banner')[0];
        if (!profileInput.files[0].type.match("image.*")) {
            Swal.fire({
                icon: "error",
                title: "이미지 파일만 등록해주세요",
            });
            $('#main_banner').val("");
            return;
        }

        let reader = new FileReader();
        reader.readAsDataURL(profileInput.files[0]);
        reader.onload = function (e) {
            let img = $('#ma-img');
            $(img).attr('src', e.target.result);
        }
    });

    $('#v_banner').change(function () {
        let profileInput = $('#v_banner')[0];
        if (!profileInput.files[0].type.match("image.*")) {
            Swal.fire({
                icon: "error",
                title: "이미지 파일만 등록해주세요",
            });
            $('#v_banner').val("");
            return;
        }

        let reader = new FileReader();
        reader.readAsDataURL(profileInput.files[0]);
        reader.onload = function (e) {
            let img = $('#v_img');
            $(img).attr('src', e.target.result);
        }
    });

    $('#h_banner').change(function () {
        let profileInput = $('#h_banner')[0];
        if (!profileInput.files[0].type.match("image.*")) {
            Swal.fire({
                icon: "error",
                title: "이미지 파일만 등록해주세요",
            });
            $('#h_banner').val("");
            return;
        }

        let reader = new FileReader();
        reader.readAsDataURL(profileInput.files[0]);
        reader.onload = function (e) {
            let img = $('#h_img');
            $(img).attr('src', e.target.result);
        }
    });

    let animationSpeed = 300; // 애니메이션 속도 (밀리초)

    let category = 0;
    let isNotice = 0;

    async function upload() {
        let mainBannerInput = $('#main_banner')[0];
        let vBannerInput = $('#v_banner')[0];
        let hBannerInput = $('#h_banner')[0];
        let adComNameInput = $('#ad-com-name').val();
        let priceInput = $('#price').val();
        let adPeriodInput = $('#ad-period').val();

        if(category === 0 && mainBannerInput.files.length === 0) {
            Swal.fire({
                icon: "error",
                title: "메인 배너 이미지를 등록해주세요",
            });
            return;
        } else if(category !== 0 && (vBannerInput.files.length === 0 && hBannerInput.files.length === 0)) {
            Swal.fire({
                icon: "error",
                title: "최소 하나의 사이드 배너 이미지를 등록해 주세요",
            });
            return;
        }

        if(adComNameInput.length === 0) {
            Swal.fire({
                icon: "error",
                title: "회사 이름을 입력해주세요.",
            });
            $('#ad-com-name').focus();
            return
        }

        if(priceInput.length === 0) {
            Swal.fire({
                icon: "error",
                title: "가격을 입력해주세요.",
            });
            $('#price').focus();
            return
        }

        if(adPeriodInput.length === 0) {
            Swal.fire({
                icon: "error",
                title: "기간을 입력해주세요.",
            });
            $('#ad-period').focus();
            return
        }

        // 이미지 업로드 함수
        async function uploadImage(fileInput, url, type) {
            if (fileInput.files.length === 0) {
                return null; // 파일이 선택되지 않았을 경우 null 반환
            }

            let formData = new FormData();
            formData.append("uploadFiles", fileInput.files[0]);
            formData.append("w", 100);
            formData.append("h", 100);
            formData.append("type", type);

            try {
                let response = await fetch(url, {
                    method: 'POST',
                    body: formData,
                });
                let data = await response.json();
                return data.originalURL;
            } catch (error) {
                console.error('Error:', error);
                return null;
            }
        }
            let mainBannerURL;
            let vBannerURL;
            let hBannerURL;

        if(category === 0) {
            mainBannerURL = await uploadImage(mainBannerInput, "/upload-img", "ad");
        } else {
            vBannerURL = await uploadImage(vBannerInput, "/upload-img", "ad");
            hBannerURL = await uploadImage(hBannerInput, "/upload-img", "ad");
        }

        let formData = new FormData();
        formData.append("adComName", adComNameInput);
        formData.append("mainImage", mainBannerURL);
        formData.append("hhhhImage", hBannerURL);
        formData.append("vvvvImage", vBannerURL);
        formData.append("price", priceInput);
        formData.append("adPeriod", adPeriodInput);
        formData.append("category", category);
        formData.append("isNotice", isNotice);

        // POST 요청 보내기
        try {
            let response = await fetch('/admin/ad-admin/write', {
                method: 'POST',
                body: formData,
            });
            // 응답 처리
            if (response.ok) {
                location.href="/admin/ad-admin";
            } else {
                console.error('Failed to submit data');
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }

    $(document).ready(function () {
        // toggleAdImages();

        $("#is-notice").change(function () {
            if($("#is-notice").is(":checked")) {
                isNotice = 1;
                $("#price").val(0);
                $("#price").prop("readonly", true);
                $("#price").css("background", "#d7d7d7");
                $("#ad-com-name").val('Vrink');
                $("#ad-com-name").prop("readonly", true);
                $("#ad-com-name").css("background", "#d7d7d7");
            } else {
                isNotice = 0;
                $("#price").val('');
                $("#price").prop("readonly", false);
                $("#price").css("background", "white");
                $("#ad-com-name").val('');
                $("#ad-com-name").prop("readonly", false);
                $("#ad-com-name").css("background", "white");
            }
        });

        // Listen for changes in the "is-side" checkbox
        $("#is-side").change(function () {
            toggleAdImages();
        });

        function moveMainCard(direction) {
            if (direction === "right") {
                $("#main-card").animate({left: '350px'}, animationSpeed);
            } else if (direction === "left") {
                $("#main-card").animate({left: '30px'}, animationSpeed); // 원래 위치로 이동
            }
        }

        function toggleAdImages() {
            // Check the state of the "is-side" checkbox
            var isSideChecked = $("#is-side").is(":checked");
            // Define the animation speed in milliseconds (you can adjust this)
            if (isSideChecked) {
                // "is-side" is checked, so show "si-ad" and hide "ma-ad" with animation
                category = 1;
                $(".si-ad").show(animationSpeed);
                $("#si-ad-box").show(animationSpeed);
                $(".ma-ad").hide(animationSpeed);
                $("#ma-ad-box").hide(animationSpeed);
                moveMainCard("right");
            } else {
                category = 0;
                // "is-side" is not checked, so show "ma-ad" and hide "si-ad" with animation
                $(".ma-ad").show(animationSpeed);
                $("#ma-ad-box").show(animationSpeed);
                $(".si-ad").hide(animationSpeed);
                $("#si-ad-box").hide(animationSpeed);
                moveMainCard("left");
            }
        }
    });

</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>
