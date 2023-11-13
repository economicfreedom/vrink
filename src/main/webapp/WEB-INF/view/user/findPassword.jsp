<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container" align="center">
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="col-md-6">
	        <div class="registration-sec">
	            <h3>비밀번호 찾기</h3>
	            <div class="common-sign-up">
					<div class="field">
	                    <input type="text" placeholder="아이디" id="email-input"/>
	                </div>
	                <div class="field">
	                    <input type="text" placeholder="이름" id="name-input"/>
	                </div>
	                <div class="field">
						<div class="flat-btn-div">
				            <input type="button" value="비밀번호 찾기" id="search-password-btn" class="flat-btn"/>
						</div>
	                </div>
	            </div>
	    </div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	let userId;
	let newPassword;

	$('#email-input').change(function() {
		if (!emailValidation($('#email-input').val().trim())) {
			$('#email-input').val('');
		}
	});

	$('#search-password-btn').on('click', function () {
		if ($('#email-input').val().trim() === '' || $('#name-input').val().trim() === '' ) {
			alert('모든 값을 입력해주세요.')
			return;
		}
		searchPassword();
	});

	async function searchPassword() {
		await fetch('/user/send/password-to-email', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				email : $('#email-input').val().trim(),
				name : $('#name-input').val().trim()
			})
		}).then(response =>
			response.json()
		).then(data => {
			if (data === 0) {
				alert('존재하지않는 회원입니다.');
				return;
			}
			userId = data;
			sendNewPassword($('#email-input').val().trim());
		});
	}

	async function sendNewPassword(email) {
		fetch('/mail/password', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				mail : email
			})
		}).then(response =>
				response.text()
		).then(data => {
			alert('입력하신 이메일 주소로 임시 비밀번호를 발송했습니다.');
			location.reload();
			console.log(data);
			// newPassword = { password: data };
			// console.log(newPassword);
			// changePassword(userId);
		});
	}

	async function changePassword(userId) {
		console.log(userId);
		let result = await fetch('/user/update/password/' + userId, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				password: newPassword
			})
		});
		let resultCode = await result.json();
		console.log(resultCode);
		if (resultCode === 1) {
			alert('입력하신 이메일 주소로 임시 비밀번호를 발송했습니다.');
			location.reload();
		} else {
			alert('잠시후 다시 시도해주세요.');
		}
	}
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
