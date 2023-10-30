<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container" align="center">
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="col-md-6">
	        <div class="registration-sec">
	            <h3>VRINK</h3>
	            <p>카카오 간편 로그인</p>
	            <div class="common-sign-up">
	                <div class="field">
	                    <input type="text" placeholder="이메일" class="kakao-email-input" value="${email }" readonly="readonly" />
	                </div>
	                <div class="field">
	                    <input type="password" placeholder="비밀번호" class="kakao-password-input"/>
	                </div>
	                <div class="field">
	                    <input type="password" placeholder="비밀번호 확인" class="kakao-password-check-input"/>
	                    <input type="hidden" class="kakao-password-check-flag" value="1"/>
	                </div>
	                <div class="field">
	                    <input type="text" placeholder="이름" class="kakao-name-input"/>
	                    <input type="hidden" class="kakao-name-check-flag" value="1"/>
	                </div>
	                <div class="field">
	                    <input type="text" placeholder="닉네임" class="kakao-nickname-input" value="${nickname }" readonly="readonly"/>
	                    <input type="hidden" class="kakao-nickname-check-flag" value="1"/>
	                </div>
	                <div class="field">
	                    <input type="text" placeholder="휴대폰번호" class="kakao-phone-input"/>
	                    <input type="hidden" class="kakao-phone-check-flag" value="1"/>
	                </div>
	                <div class="field">
			            <input type="button" value="회원가입" id="kakao-sign-up-btn" class="flat-btn"/>
	                </div>
	            </div>
	    </div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	

	$('.kakao-password-input').change(function () {
	    console.log($('.kakao-password-input').val());
	    $('.kakao-password-check-flag').val('1');
	});
	
	$('.kakao-password-check-input').change(function () {
	    console.log($('.kakao-password-check-input').val());
	    if ($('.kakao-password-input').val() != $('.kakao-password-check-input').val()) {
	        alert('비밀번호가 서로 다릅니다.');
	        $('.kakao-password-check-flag').val('1');
	        return;
	    }
	    $('.kakao-password-check-flag').val('0');
	});
	
	$('#kakao-sign-up-btn').on('click', function () {
        if ($('.kakao-email-input').val().trim() == '' || $('.kakao-password-input').val().trim() == '' || $('.kakao-name-input').val().trim() == ''
            || $('.kakao-nickname-input').val().trim() == '' || $('.kakao-phone-input').val().trim() == '') {
            alert('모든 값을 입력해주세요.');
            return;
        }
        if ($('.kakao-password-check-flag').val() != '0') {
            alert('비밀번호가 서로 다릅니다.');
            return;
        }

        fetch('http://localhost/user/sign-up', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email: $('.kakao-email-input').val(),
                password: $('.kakao-password-input').val(),
                name: $('.kakao-name-input').val(),
                nickname: $('.kakao-nickname-input').val(),
                phone: $('.kakao-phone-input').val()
            })
        })
            .then(response => {
                if (response.ok) {
                    alert("회원가입이 완료되었습니다.");
                    location.href="http://localhost/user/sign-in";
                } else {
                    alert("회원가입 실패");
                    location.reload();
                }
            })
            .then(data =>
                console.log(data)
            )
            .catch(error => console.error('Error:', error));
    });
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>