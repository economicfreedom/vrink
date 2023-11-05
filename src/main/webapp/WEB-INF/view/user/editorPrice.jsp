<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="container">
	<div class="row p-block">
		<div class="col-sm-8 col-center">
			<div class="heading4 mb-5">
				<h2>작품 가격 설정</h2>
				<span>소개를 작성해보세요</span>
			</div>
			<form class="price-form" action="/editor/editor-price" method="post">
				<div class="editor-div">
					<div class="row">
						<div class="price-area">
							<c:choose>
								<c:when test="${empty editorPriceDTO}">
									<div class="col-md-5">
										<i class="fa fa-at"></i>
										<input class="input-style option" name="options" type="text" placeholder="옵션이름">
									</div>
									<div class="col-md-5">
										<i class="fa fa-at"></i>
										<input class="input-style price" name="price" type="text" placeholder="가격">
									</div>
									<div class="col-md-1">
										<input type="button" value="+" class="flat-btn add-button" style="height: 67px;">
									</div>
									<div class="col-md-1">
										<input type="button" value="-" class="flat-btn remove-button" style="height: 67px;">
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${editorPriceDTO}" var="editorPrice">
										<div class="price-item col-sm-12 mb-3">
											<div class="col-md-5">
												<i class="fa fa-at"></i>
												<input class="input-style option" name="options" type="text" placeholder="옵션이름" value="${editorPrice.options}">
											</div>
											<div class="col-md-5">
												<i class="fa fa-at"></i>
												<input class="input-style price" name="price" type="text" placeholder="가격" value="${editorPrice.price}">
											</div>
											<div class="col-md-1">
												<input type="button" value="+" class="flat-btn add-button" style="height: 67px;">
											</div>
											<div class="col-md-1">
												<input type="button" value="-" class="flat-btn remove-button" style="height: 67px;">
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div><button class="flat-btn mt-5">작성</button></div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('.price-area').on('click','.add-button',function(){
		var lastChild = $('.price-item:last-child').clone();
		lastChild.find('.input-style').val('');
		$(this).closest('.price-item').after(lastChild);
	})

	$('.price-area').on('click','.remove-button',function(){
		if($('.price-item').length !== 1) {
			$(this).closest('.price-item').remove();
		}
	})
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>