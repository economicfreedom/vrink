<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container" align="center">
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="col-md-6">
	        <div class="registration-sec">
	            <h3>정산신청</h3>
				<p>${newUser.nickname} 작가님 환영합니다!!</p>
	            	<div class="common-sign-up">
						<div class="field">
							<div class="check-div">
								<input type="text" value="보유 포인트   ${newUser.point }원" readonly="readonly"/>
								<input type="button" value="정산 내역" class="check-btn" id="get-cal-list-btn" onclick="location.href='/editor/my-cal-list/${EDITOR_ID}'" />
							</div>
						</div>
						<div class="field">
							<div class="check-div">
								<input type="text" class="point-input" placeholder="신청 금액" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
								<input type="button" value="정산 신청" class="check-btn" id="calculate-point-btn"/>
							</div>
						</div>
					</div>
	            </div>
	    	</div>
    	</div>
    </div>
</div>
<script type="text/javascript">

	$('#calculate-point-btn').on('click', function () {
		let pointInput = $('.point-input').val();

		if($('.point-input').val().trim() === null || $('.point-input').val().trim() === 0) {

			alert('정산 금액을 입력해주세요');
			$('.point-input').val('');
			return;
		}
		if (Number(`${newUser.point}`) < Number(pointInput)) {
			alert('보유 포인트 보다 많은 포인트를 정산 신청할 수 없습니다.');
			$('.point-input').val('');
			return;
		}
		calculatePoint();
	});

	async function calculatePoint() {
		await fetch('/editor/calculate/point', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				userId: `${USER.userId}`,
				point: $('.point-input').val().trim()
			})
		}).then(response => {
			if(response.ok) {
				alert('정산 신청이 완료되었습니다.');
				location.reload();
			} else {
				alert('잠시 후 다시 시도해주세요.');
				location.reload();
			}
		})



	}

</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
