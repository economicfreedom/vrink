<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<div class="container">
	<div class="row p-block">
		<div class="col-sm-8 col-center">
			<div class="heading4">
				<h2>작가 소개</h2>
				<span>소개를 작성해보세요</span>
			</div>
			<div class="contact-form">
				<form method="post" action="contact.php" name="writerform" id="writerform" autocomplete="off">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-user"></i>
							<input name="name" type="text" id="name" class="input-style" placeholder="Name">
						</div>
						<div class="col-md-12">
							<i class="fa fa-at"></i>
							<textarea name="introduce" id="introduce" class="input-style" placeholder="소개를 입력하세요. 50자 이내"></textarea>
						</div>
						<div class="col-md-12">
							<i class="fa fa-pencil"></i>
							<textarea name="editordata" id="editordata" class="input-style summernote"></textarea>
						</div>
						<div class="col-md-12">
							<input type="submit" class="flat-btn" id="submit" value="작성">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
$('.summernote').summernote({
	  toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		placeholder: "내용을 작성하세요",
		height: 300,
		lang: "ko-KR"
});
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>