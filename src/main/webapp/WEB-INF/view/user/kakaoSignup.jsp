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
						<div class="check-div">
							<input type="text" placeholder="닉네임" class="kakao-nickname-input"/>
							<input type="button" value="중복확인" id="nickname-check-btn" class="check-btn" />
							<input type="hidden" class="kakao-nickname-check-flag" value="1"/>
						</div>
	                </div>
	                <div class="field">
	                    <input type="text" placeholder="휴대폰번호" class="kakao-phone-input"/>
	                    <input type="hidden" class="kakao-phone-check-flag" value="1"/>
	                </div>
	                <div class="field">
						<div class="flat-btn-div">
			            	<input type="button" value="회원가입" id="kakao-sign-up-btn" class="flat-btn"/>
						</div>
	                </div>
	            </div>
	    </div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('.kakao-password-input').change(function () {
			let password = $('.kakao-password-input').val().trim();
			console.log(password);
			$('.kakao-password-check-flag').val('1');
			if (passwordValidation(password)) {
				$('.kakao-password-check-flag').val('0');
			}
		});

		$('.kakao-password-check-input').change(function () {
			if ($('.kakao-password-input').val() != $('.kakao-password-check-input').val()) {
				alert('비밀번호가 서로 다릅니다.');
				$('.kakao-password-check-flag').val('1');
				return;
			}
			$('.kakao-password-check-flag').val('0');
		});

		$('.check-btn').on('click', function () {
			let nickname = $('.kakao-nickname-input').val().trim();
			console.log(nickname);
			nicknameCheck(nickname);
		});

		$('.kakao-phone-input').change(function () {
			let phone = $('.kakao-phone-input').val().trim();
			$('.kakao-phone-check-flag').val('0');

			if (phoneValidation(phone)) {
				$('.kakao-phone-check-flag').val('1');
			}
		});

		async function nicknameCheck(nickname) {
			let result = await fetch('/user/check-nickname/' + nickname);
			let resultCode = await result.json();
			if (resultCode !== 0) {
				alert('이미 사용 중인 닉네임입니다.');
				$('.nickname-input').val('');
				$('.nickname-check-flag').val('1');
				return;
			}
			alert('사용 가능한 닉네임입니다.');
			$('.nickname-check-flag').val('0');
		}

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

			fetch('/user/sign-up', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({
					email: `${email}`,
					password: $('.kakao-password-input').val().trim(),
					name: $('.kakao-name-input').val().trim(),
					nickname: $('.kakao-nickname-input').val().trim(),
					phone: $('.kakao-phone-input').val().trim()
				})
			})
					.then(response => {
						if (response.ok) {
							alert("회원가입이 완료되었습니다.");
							location.href="/";
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
	});


</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
