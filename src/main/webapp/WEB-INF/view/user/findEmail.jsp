<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container" align="center">
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="col-md-6">
	        <div class="registration-sec">
	            <h3>아이디 찾기</h3>
	            <div class="common-sign-up">
					<div class="field">
	                    <input type="text" placeholder="닉네임" id="nickname-input"/>
	                </div>
	                <div class="field">
	                    <input type="text" placeholder="휴대폰 번호" id="phone-input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
	                </div>
	                <div class="field">
						<div class="flat-btn-div">
				            <input type="button" value="아이디 찾기" id="search-email" class="flat-btn"/>
						</div>
	                </div>
	            </div>
	    </div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#phone-input').change(function() {
			if (!phoneValidation($('#phone-input').val().trim())) {
				$('#phone-input').val('');
			}
		});

		$('#search-email').on('click', function () {
			// val > value -
			// text
			if ($('#nickname-input').val().trim() === '' || $('#phone-input').val().trim() === '') {
				alert('모든 값을 입력해주세요.');
				return;
			}
			searchEmail();
		});
	});


	async function searchEmail() {
		let result = await fetch('/user/find/email', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				nickname : $('#nickname-input').val().trim(),
				phone : $('#phone-input').val().trim()
			})
		});
		let email = await result.text();
		console.log(email);

		if(email !== '') {
			alert('조회하신 아이디는 ' + email + " 입니다.");
		} else {
			alert('일치하는 회원정보가 없습니다.');
		}
	}

</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
