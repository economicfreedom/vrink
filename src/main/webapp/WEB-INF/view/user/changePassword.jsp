<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container" align="center">
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="col-md-6">
	        <div class="registration-sec">
	            <h3>비밀번호 변경</h3>
	            <div class="common-sign-up">
					<div class="field">
	                    <input type="password" placeholder="현재 비밀번호" class="my-password-check" value=""/>
						<input type="hidden" class="encoded-password-check-flag" value="1"/>
	                </div>
	                <div class="field">
	                    <input type="password" placeholder="새로운 비밀번호" class="new-password"/>
	                </div>
	                <div class="field">
	                    <input type="password" placeholder="비밀번호 확인" class="new-password-check"/>
	                    <input type="hidden" class="new-password-check-flag" value="1"/>
	                </div>
	                <div class="field">
						<div class="flat-btn-div">
				            <input type="button" value="변경" id="change-password-btn" class="flat-btn"/>
						</div>
	                </div>
	            </div>
	    </div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	$('.my-password-check').change(function () {
		$('.encoded-password-check-flag').val('1');
		checkPassword();
	});

	$('.new-password').change(function () {
		$('.new-password-check-flag').val('1');
		if (!passwordValidation($('.new-password').val().trim())) {
			$('.new-password').val('');
		}

	});

	$('.new-password-check').change(function () {
		if ($('.new-password').val().trim() === $('.new-password-check').val().trim()) {
			$('.new-password-check-flag').val('0');
		}
	});

	$('#change-password-btn').on('click', function () {
		if ($('.encoded-password-check-flag').val() === '1') {
			alert('이전 비밀번호가 틀립니다.');
			$('.my-password-check').val('');
			return;
		}
		if ($('.new-password-check-flag').val() === '1') {
			alert('새로운 비밀번호가 서로 일치하지않습니다.');
			return;
		}
		changePassword(`${USER.userId}`);
	});

	async function checkPassword() {
		let result = await fetch('/user/find/password/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				encodedPassword : `${USER.password}`,
				insertPassword : $('.my-password-check').val().trim()
			})
		});
		let resultCode = await result.json();
		console.log('resultCode: ' + resultCode);
		if(resultCode === 1) {
			$('.encoded-password-check-flag').val('0');
		} else {
			$('.encoded-password-check-flag').val('1');
		}
	}

	async function changePassword(userId) {
		let result = await fetch('/user/update/password/' + userId, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				password : $('.new-password').val().trim(),
			})
		});
		let resultCode = await result.json();
		console.log(resultCode);
		if(resultCode === 1) {
			alert('비밀번호를 수정했습니다. 다시 로그인 해주세요.');
			location.reload();
		} else {
			alert('잠시후 다시 시도해주세요');
		}
	}
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
