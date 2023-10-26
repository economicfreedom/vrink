<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<style>
    .star {
        position: relative;
        color: #ddd;
        font-size: 35px;
        word-break: normal;
        word-wrap: normal;
    }

    .star input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
        display: initial;
        top: 5px;
    }

    .star span {
        width: 0;
        position: absolute;
        left: 0;
        color: #b67f5f;
        overflow: hidden;
        pointer-events: none;
        text-shadow: -1px 0 #b67f5f, 0 1px #b67f5f, 1px 0 #b67f5f, 0 -1px #b67f5f;
    }
</style>

<div class="container">
	<div class="row mt-5 mb-5">
		<div class="col-sm-4">
				<h3>박카스작가 일러스트</h3>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-sm-9">
			<div class="mb-3">
				<img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101.jpg?ver=1678017207">
			</div>
			<div class="mb-3">
				<img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101B.jpg?ver=1678017207">
			</div>
			<div class="mb-3">
				<img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101C.jpg?ver=1678017207">
			</div>
		</div>
		<div class="col-sm-3">
			<div class="t-center" style="border: 1px solid #343434;">
				<div class="p-2 d-flex j-around" style="gap: 10rem;">
					<div style="font-size:25px">
						&#128680;
					</div>
					<div style="font-size:25px">
						&#128151;
					</div>
				</div>
				<div style="margin: 0 auto; width: 100px; height: 100px">
					<img class="circle-profile" alt="" src="https://artmug.kr/image/goods_img1/1/17101B.jpg?ver=1678017207">
				</div>
				<h4>박카스 작가</h4>
				<h5>작가 소개입니다</h5>
				<h5>잘부탁드립니다</h5>
				<div style="background-color: #343434; height: 50px; color: white; line-height: 50px; font-weight: bold; cursor: pointer ">작가에게 문의하기</div>
			</div>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-sm-12 tcenter">
			<h1>내용내용내용내용</h1>
		</div>
		<div class="col-sm-12 mb-5">
			<img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101B.jpg?ver=1678017207">
		</div>
		<div class="col-sm-12 mb-5">
			<img width="full" alt="" src="http://artmug.kr/image/up_img/detail/1/goods_17101/16270480690_Re.jpg">
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-sm-2">
	        <div style="display: inline-block; vertical-align: middle;">
	            <span class="star">
	                ★★★★★
	                <span id="placeScore" style="width : 60%;">★★★★★</span>
	                <input type="range" name="placeScore" id="starVal" oninput="drawStar(this)" value="6" step="1" min="0" max="10">
	            </span>
	        </div>
			<script>
			    function drawStar(target) {
			        document.querySelector('#placeScore').style.width = (target.value * 10) + '%';
			    }
			</script>
		</div>
		<div class="col-sm-2" style="height: 48px; line-height: 58px"><strong>별점을 선택해주세요</strong></div>
		<div class="col-sm-11">
			<textarea rows="3" cols="" style="width: 100%; resize: none;" placeholder="리뷰를 입력해주세요."></textarea>
		</div>
		<div class="col-sm-1">
			<div style="background-color: #343434; text-align: center; height: 65px; color: white; line-height: 65px">작성</div>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-sm-12">
			<div>
				<table class="w-full">
					<colgroup>
						<col width="5%"> 
						<col width="15%">
						<col width="50%"> 
						<col width="15%">
						<col width="15%"> 				
					</colgroup>
					<thead>
						<tr>
							<th class="list-th">번호</th>
							<th class="list-th">별점</th>
							<th class="list-th tleft">내용</th>
							<th class="list-th">작성자</th>
							<th class="list-th">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr class="list-tr">
							<td>3</td>
							<td>★★★★★</td>
							<td class="t-left">작가님도 너무 친절하시구 그림도 빠르게 주셔서 너무 좋았습니다:) 예쁜 그림 받아서 너무 기분 좋아요~~!또 올게요 작가님~~~</td>
							<td>**비밀</td>
							<td>23-10-25</td>
						</tr>
						<tr class="list-tr">
							<td>2</td>
							<td>★★★★★</td>
							<td class="t-left">작가님도 너무 친절하시구 그림도 빠르게 주셔서 너무 좋았습니다:) 예쁜 그림 받아서 너무 기분 좋아요~~!또 올게요 작가님~~~</td>
							<td>**비밀</td>
							<td>23-10-25</td>
						</tr>
						<tr class="list-tr">
							<td>1</td>
							<td>★★★★★</td>
							<td class="t-left">작가님도 너무 친절하시구 그림도 빠르게 주셔서 너무 좋았습니다:) 예쁜 그림 받아서 너무 기분 좋아요~~!또 올게요 작가님~~~</td>
							<td>**비밀</td>
							<td>23-10-25</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>