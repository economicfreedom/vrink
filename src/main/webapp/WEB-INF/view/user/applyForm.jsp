<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>
    .terms-container {
        border: 1px solid #000;
        padding: 20px;
        margin: 20px;
        height: 500px;
        overflow-y: auto;

    }
</style>
<script>

    $(document).ready(function () {
        let container = document.querySelector('.terms-container');


        $('.terms-container').on('scroll', function () {
            let $this = $(this);
            let scrollPosition = $this.scrollTop() + $this.innerHeight();
            let nearBottom = $this[0].scrollHeight - scrollPosition;
            let offset = 10; // 1px의 오차를 허용합니다.

            if (nearBottom < offset) {
                $("#apply").prop("disabled", false);
            }
        });


        $("#submit").click(function () {

            let val = $("#apply").is(":checked")


            if (!val) {

                alert("이용 약관에 동의해주세요")

                return;

            }


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
            <div class="terms-container">
                <h1>이용약관</h1>
                <p>본 이용약관(이하 ‘약관’)은 회사와 이용 고객(이하 ‘회원’)간에 회사가 제공하는 사기 이력 조회 서비스(이하 ‘서비스’)를 이용함에 있어 회원의 권리, 의무 및 책임사항을
                    규정함을 목적으로 합니다.</p>

                <h2>제1조 (목적)</h2>
                <p>본 약관은 회원이 회사의 서비스를 이용함에 있어 필요한 제반 사항을 규정합니다.</p>

                <h2>제2조 (정의)</h2>
                <p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
                <ul style="list-style: none;
">
                    <li>‘회사’라 함은 사기 이력 조회 서비스를 제공하는 주체를 의미합니다.</li>
                    <li>‘회원’이라 함은 회사의 서비스를 이용하는 고객을 의미합니다.</li>
                    <li>‘서비스’라 함은 회사가 제공하는 계좌번호, 이름, 전화번호를 통한 사기 이력 조회 서비스를 의미합니다.</li>
                </ul>

                <h2>제3조 (약관의 명시와 설명 및 개정)</h2>
                <!-- 약관의 명시와 설명 및 개정에 관한 내용 작성 -->

                <h2>제4조 (서비스의 제공 및 변경)</h2>
                <p>회사는 다음과 같은 서비스를 제공합니다.</p>
                <ul style="list-style: none;
">
                    <li>계좌번호, 이름, 전화번호를 통한 사기 이력 조회 서비스</li>
                </ul>

                <h2>제5조 (서비스 이용 요금)</h2>
                <p>서비스 이용에 따른 요금 및 결제방법 등에 관한 사항을 명시합니다.</p>

                <h2>제6조 (개인정보의 보호 및 사용)</h2>
                <p>회사는 관련 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다.</p>
                <p>회원의 개인정보는 오직 사기 이력 조회를 위해 사용되며, 해당 목적 외의 용도로는 사용되지 않습니다.</p>

                <h2>제7조 (약관의 해석)</h2>
                <p>이 약관에 명시되지 않은 사항과 이 약관의 해석에 관하여는 관계법령 또는 상관례에 따릅니다.</p>

                <h2>제8조 (관할법원)</h2>
                <p>서비스 이용과 관련하여 회사와 회원 사이에 분쟁이 발생한 경우, 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.</p>

                <p>공고일자: 2023년 11월 1일</p>
                <p>시행일자: 2023년 11월 1일</p>
            </div>
            <br>
            <span>
                <input type="checkbox" id="apply" value="동의함" disabled>
                <label for="apply" class="required">이용 약관 동의</label>
            </span>
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
                <button class="flat-btn" id="submit">신청하기</button>
            </div>
        </div>

    </div>


</div>


<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
