<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/editor_header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<div class="container">
	<div class="row p-block">
		<div class="col-sm-8 col-center">
			<div class="heading4 mb-5">
				<h2>작가 소개</h2>
				<span>소개를 작성해보세요</span>
			</div>
			<div class="contact-form">
				<div class="editor-div">
					<div class="row">
						<div class="col-md-12" style="display: flex; flex-direction:column; align-items:center; margin-top:1rem; gap:2rem">
							<div class="circle-profile-area"><img class="circle-profile" id="profile-area" alt="" src="/images/resource/no_face.png"></div>
							<input class="thumbnail-input-file" type="file" id="profile">
						</div>
						<div class="col-md-12">
							<i class="fa fa-at"></i>
							<textarea name="introduce" id="introduce" class="input-style" placeholder="소개 내용을 입력해주세요.(50자 이내)"></textarea>
						</div>
						<div class="col-md-12">
							썸네일 파일<input name="thumbnail" type="file" id="thumbnail" class="input-style thumbnail-input-file">
						</div>
						<div class="col-md-12">
							<span>vrm파일</span><input name="vrm" type="file" id="vrm" class="input-style vrm-input-file">
						</div>
						<div class="col-md-12">
							<i class="fa fa-pencil"></i>
							<textarea name="editordata" id="editordata" class="input-style summernote"></textarea>
						</div>
						<div class="col-md-12">
							<input type=button class="flat-btn" id="submit" value="작성">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

var profileURL="";
var thumbnailURL="";
$('#profile').change(function(){
	let profileInput = $('#profile')[0];
	if(!profileInput.files[0].type.match("image.*")){
	     alert("이미지를 등록해야 합니다.");
	     $('#profile').val("");
	     return;
	}
	
	let reader = new FileReader();
	reader.readAsDataURL(profileInput.files[0]);
    reader.onload = function (e) {
        let img = $('#profile-area');
        $(img).attr('src', e.target.result);
    }
})

$('#submit').on('click',function() {
	
	let profileInput = $('#profile')[0];
	let introduceInput = $('#introduce').val();
	let thumbnailInput = $('#thumbnail')[0];
	let vrmInput = $('#vrm')[0];
	let editordata = $('.summernote').val();
	
	if(profileInput.files.length === 0) {
		alert('프로필 이미지를 등록해주세요.');
		return
	}
	
	if(introduce.length === 0) {
		alert('소개 내용을 1자 이상 입력해주세요.');
		$('#introduce').focus();
		return 
	}
	
	if(introduceInput.length > 50) {
		alert('소개 내용은 50자를 넘을 수 없습니다.');
		$('#introduce').focus();
		return
	}
	
	if(thumbnailInput.files.length === 0) {
		alert('썸네일 이미지를 등록해주세요.');
		return
	}
	
	if(editordata.length === 0) {
		alert('글 내용을 입력해주세요.');
		$('.note-editable').focus();
		return
	}
	
	if(vrmInput.files.length === 0) {
		var formData = new FormData();
		formData.append("uploadFiles",profileInput.files[0]);
		formData.append("w",100);
		formData.append("h",100);
		formData.append("type","user");

		fetch('/upload-img', {
			  method: 'POST',
			  body: formData,
			})
			.then(response => response.json())
			.then(data => console.log(data.originalURL))
			.catch(error => console.error('Error:', error));
		
		formData.append("uploadFiles",thumbnailInput.files[0]);
		formData.append("w",100);
		formData.append("h",100);
		formData.append("type","user");

		fetch('/upload-img', {
			  method: 'POST',
			  body: formData,
			})
			.then(response => response.json())
			.then(data => console.log(data.originalURL))
			.catch(error => console.error('Error:', error));
	} 
	
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
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		placeholder: "글 내용을 작성해주세요.",
		height: 300,
		lang: "ko-KR"
});


</script>
<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>