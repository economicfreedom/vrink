<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container" align="center">
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="col-md-6">
	        <div class="registration-sec">
	            <h3>MY PAGE</h3>
				<p>${newUser.nickname}님 환영합니다!!</p>
	            <div class="common-sign-up">
	                <div class="field">
	                    <input type="text" value="${newUser.email }" readonly="readonly" />
	                </div>
	                <div class="field">
	                    <input type="text" value="${newUser.name }" readonly="readonly"/>
	                </div>
	                <div class="field">
						<div class="email-check-div">
							<input type="text" class="my-nickname-input" value="${newUser.nickname }"/>
							<input type="button" value="닉네임 변경" class="change-my-nickname-btn" id="email-btn"/>
							<input type="hidden" class="my-nickname-check-flag" value="1"/>
						</div>
	                </div>
	                <div class="field">
	                    <input type="text" value="${newUser.phone}" readonly="readonly"/>
	                </div>
	            </div>
	    </div>
    	</div>
    </div>
</div>
<script type="text/javascript">

	$('.change-my-nickname-btn').on('click', function () {
		changeNickname(`${USER.userid}`);
	});

	async function changeNickname(userId) {
		let result = await fetch('http://localhost/user/update/nickname/' + userId, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				nickname : $('.my-nickname-input').val().trim()
			})
		});
		let resultCode = await result.json();
		if(resultCode === 1) {
			alert('닉네임을 수정했습니다');
			location.reload();
		} else {
			alert('잠시 후 다시 시도해주세요.');
			location.reload();
		}

	}

</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
