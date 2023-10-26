<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script>
    $(document).ready(function () {

        $("#submit").click(function () {

            let accountName = $("#account-name").val();
            let accountNumber = $("#account-number").val().replaceAll("-", "");

            let koreanReg = /^[가-힣]+$/;
            let numberReg = /^[0-9]+$/;


            if (!koreanReg.test(accountName)) {
                alert('한글만 입력입력해주세요.')
                return;
            }
            // if (!numberReg.test(accountNumber)) {
            //     alert('숫자만 입력해주세요')
            //     return;
            // }


            $.ajax({
                url: "/editor/apply-request",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    accountName: accountName,
                    accountNumber: accountNumber
                }),
                success: function (res) {

                    alert("작가 신청이 완료되었습니다.")
                    location.href = "/";

                },
                error: function (res) {
                    console.log(res);
                    alert("알러트")
                }

            })

        })

    })
</script>
<div class="container" align="center">
    <div class="contact-page-sec">
        <div class="row">
            <h1 style="margin-top: 100px;">작가 신청 하기</h1>
            <textarea readonly>주의 사항</textarea>
        </div>

        <div class="row">
            <h4 style=" align-content: start;">은행명</h4>
            <input class="form-control form-control-sm" type="text"
                   placeholder="은행명을 입력해주세요."
                   aria-label=".form-control-sm example"
                   style="margin-bottom: 15px; margin-top: 15px; width: 25.3%"
                   id="account-name">
            <div class="col-md-12">
                <h4 style=" align-content: flex-start;">계좌번호</h4>
                <input class="form-control form-control-sm" type="text"
                       placeholder="계좌번호를 입력해주세요"
                       aria-label=".form-control-sm example"
                       style="margin-bottom: 15px; margin-top: 15px; width: 26%"
                       id="account-number">
            </div>
            <div style="display: inline-block;">
                <button  class="flat-btn" id="submit">신청하기</button>
            </div>
        </div>

    </div>


</div>


<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
