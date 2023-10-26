<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/editor_header.jsp" %>
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
				<form method="post" action="/editor/editor-write" name="writerform" id="writerform" autocomplete="off" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-user"></i>
							<input name="name" type="text" id="name" class="input-style" placeholder="Name">
						</div>
						<div class="col-md-12">
							<i class="fa fa-at"></i>
							<textarea name="introduce" id="introduce" class="input-style" placeholder="소개 내용을 입력해주세요.(50자 이내)"></textarea>
						</div>
						<div class="col-md-12">
							<input name="thumbnail" type="file" id="thumbnail" class="input-style" placeholder="썸네일을 등록해주세요.">
						</div>
						<div class="col-md-12">
							<i class="fa fa-pencil"></i>
							<textarea name="editordata" id="editordata" class="input-style summernote"></textarea>
						</div>
						<div class="col-md-12">
							<input type=button class="flat-btn" id="submit" value="작성">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>



$('#submit').on('click',function() {
	let introduce = $('#introduce');
	let editordata = $('.summernote');
	if(introduce.val().length == 0) {
		alert('소개 내용을 1자 이상 입력해주세요.');
		introduce.focus();
		return 
	}
	
	if(introduce.val().length > 50) {
		alert('소개 내용은 50자를 넘을 수 없습니다.');
		introduce.focus();
		return
	}
	
	if(editordata.val().length == 0) {
		alert('글 내용을 입력해주세요.');
		$('.note-editable').focus();
		return
	}
	
	$('form').submit();
});

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
		placeholder: "글 내용을 작성해주세요.",
		height: 300,
		lang: "ko-KR",
		callbacks : { 
            //onImageUpload = 이미지 업로드시 작동하는 콜백함수
            onImageUpload : function(files, editor, welEditable) {
        // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
                    sendFile(files[i],
                    this);
                    }
            }
        }//end callbacks
});

function sendFile(file, editor) {
    var data = new FormData();
    data.append("uploadFiles", file);
    data.append("w", 100);
    data.append("h", 100);
	data.append("type","user")
    
    $.ajax({
        url : "/upload-img",
        data : data,
        type : "POST",
        dataType : 'JSON',
        cache: false,
        contentType: false,
        // enctype: 'multipart/form-data',
        processData: false,
        success : function(data) {
        	
            //항상 업로드된 파일의 url이 있어야 한다.
			console.log(data.originalURL)
        	$(editor).summernote('insertImage', data.originalURL);
        }
    });
} 
</script>
<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>