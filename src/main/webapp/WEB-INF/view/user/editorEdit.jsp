<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/editor_header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<style>
/**
style.css에 합칠예정
**/
.profile-box label {
  display: inline-block;
  padding: .5em .75em;
  color: white;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: black;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.profile-box input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: white;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: black;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

.customLook {
	--tag-bg: #0052bf;
	--tag-hover: #ce0078;
	--tag-text-color: #fff;
	--tags-border-color: silver;
	--tag-text-color--edit: #111;
	--tag-remove-bg: var(--tag-hover);
	--tag-pad: 0.6em 1em;
	--tag-inset-shadow-size: 1.4em;
	--tag-remove-btn-bg--hover: black;
	display: inline-block;
	min-width: 0;

}
.customLook .tagify__tag {
	margin-top: 0;
}
.customLook .tagify__tag > div {
	border-radius: 25px;
}

.customLook .tagify__tag__removeBtn {
	opacity: 0;
	transform: translateX(-6px) scale(0.5);
	margin-left: -3ch;
	transition: 0.12s;
}
.customLook .tagify__tag:hover .tagify__tag__removeBtn {
	transform: none;
	opacity: 1;
	margin-left: -1ch;
}
.customLook + button {
	color: #0052bf;
	font: bold 1.4em/1.65 Arial;
	border: 0;
	background: none;
	box-shadow: 0 0 0 2px inset currentColor;
	border-radius: 50%;
	width: 1.65em;
	height: 1.65em;
	cursor: pointer;
	outline: none;
	transition: 0.1s ease-out;
	margin: 0 0 0 5px;
	vertical-align: top;
}
.customLook + button:hover {
	box-shadow: 0 0 0 5px inset currentColor;
}

.tagify__tag>div>* {
	white-space: nowrap;
}
</style>

<div class="container">
	<div class="row p-block">
		<div class="col-sm-8 col-center">
			<div class="heading4 mb-5">
				<h2>작가 소개 수정</h2>
				<span>소개를 작성해보세요</span>
			</div>
			<div class="contact-form">
			<input id="profileURL" type="hidden" value="${editorEdit.profileImage}">
			<input id="thumbnailURL" type="hidden" value="${editorEdit.thumbnail}">
			<input id="vrmURL" type="hidden" value="${editorEdit.vrm}">
				<div class="editor-div">
					<div class="row">
						<div class="col-sm-12" style="display: flex; flex-direction:column; align-items:center; margin-top:1rem; gap:2rem">
							<div class="circle-profile-area"><img class="circle-profile" id="profile-area" alt="" src="${editorEdit.profileImage}"></div>
							<div class="profile-box">
								<label for="profile">프로필 사진 변경</label>
								<input type="file" id="profile">
							</div>
						</div>
						<div class="col-sm-12">
							<i class="fa fa-at"></i>
							<textarea name="introduce" id="introduce" class="input-style" placeholder="소개 내용을 입력해주세요.(50자 이내)">${editorEdit.introduce}</textarea>
						</div>
						<div class="col-sm-12 d-flex j-around">
							<div class="col-sm-6 t-center filebox">
								<input class="upload-name" id="thumbnail-filename" value="270x520으로 올려주세요." disabled="disabled" style="width: 200px;">
								<label for="thumbnail">썸네일 업로드</label><input name="thumbnail" type="file" id="thumbnail" class="input-style">
							</div>
							<div class="col-sm-6 t-center filebox">
								<input class="upload-name" id="vrm-filename" value="파일선택" disabled="disabled" style="width: 200px;">
								<label for="vrm">vrm 업로드</label><input name="vrm" type="file" id="vrm" class="input-style">
							</div>
						</div>
						<div class="col-sm-12">
							<input name="basic" class="customLook" placeholder="해시태그" value="${tag}">
						</div>
						<div class="col-sm-12">
							<i class="fa fa-pencil"></i>
							<textarea name="editordata" id="editordata" class="input-style summernote"></textarea>
						</div>
						<div class="col-sm-12">
							<input type=button class="flat-btn" id="submit" value="작성">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// The DOM element you wish to replace with Tagify
	var input = document.querySelector('input[name=basic]');

	// initialize Tagify on the above input node reference
	var tagify = new Tagify(input, {
		maxTags : 10
	});

// 태그가 추가되면 이벤트 발생
tagify.on('add', function() {
	console.log(tagify.value); // 입력된 태그 정보 객체
})

$('#profile').change(function(){
	let profileInput = $('#profile')[0];
	if(!profileInput.files[0].type.match("image.*")){
	     alert("이미지 파일만 등록해주세요.");
	     $('#profile').val("");
	     return;
	}
	
	let reader = new FileReader();
	reader.readAsDataURL(profileInput.files[0]);
    reader.onload = function (e) {
        let img = $('#profile-area');
        $(img).attr('src', e.target.result);
    }
});

$('#thumbnail').change(function(){
	let thumbnailfile = $('#thumbnail');
	if(!thumbnailfile[0].files[0].type.match("image.*")){
	     alert("이미지 파일만 등록해주세요.");
	     $('#thumbnail').val("");
		return;
	}

	// 이미지 파일인 경우
	var img = new Image();
	img.src = URL.createObjectURL(thumbnailfile[0].files[0]);

	// 이미지가 로드될 때
	img.onload = function() {
		// 너비와 높이 가져오기
		var width = img.width;
		var height = img.height;

		if (width !== 270 || height !== 520) {
			$('#thumbnail').val("");
			$('#thumbnail-filename').val("270x520으로 올려주세요.");
			alert('이미지의 크기는 270px x 520px 이어야 합니다.');
			return
		}
	};
	$('#thumbnail-filename').val(thumbnailfile.val());
});

$('#vrm').change(function(){
	let vrmfile = $('#vrm');
	let ext = vrmfile.val().split('.').pop().toLowerCase();
	if(ext !== 'vrm') {
		alert('vrm 파일만 등록해주세요.');
		$('#vrm').val("");
		return;
	}
	$('#vrm-filename').val(vrmfile.val());
});

$('#submit').on('click',async function() {
	
	let profileInput = $('#profile')[0];
	let introduceInput = $('#introduce').val();
	let thumbnailInput = $('#thumbnail')[0];
	let vrmInput = $('#vrm')[0];
	let editordata = $('.summernote').val();
	
	// 기존 프로필, 썸네일, vrm url
	let profileURL = $('#profileURL').val();
	let thumbnailURL = $('#thumbnailURL').val();
	let vrmURL = $('#vrmURL').val();
	let delImage = [];

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
	
	if(editordata.length === 0) {
		alert('글 내용을 입력해주세요.');
		$('.note-editable').focus();
		return
	}
	
    // 이미지 업로드 함수
    async function uploadImage(fileInput, url, type) {
        if (fileInput.files.length === 0) {
            return null; // 파일이 선택되지 않았을 경우 null 반환
        }

        let formData = new FormData();
        formData.append("uploadFiles", fileInput.files[0]);
        formData.append("w", 100);
        formData.append("h", 100);
        formData.append("type", type);

        try {
            let response = await fetch(url, {
                method: 'POST',
                body: formData,
            });
            let data = await response.json();
            return data.originalURL;
        } catch (error) {
            console.error('Error:', error);
            return null;
        }
    }
	if(profileInput.files.length !== 0) {
		delImage.push(profileURL);
    	profileURL = await uploadImage(profileInput,"/upload-img","user");
	}
	
	if(thumbnailInput.files.length !== 0) {
		delImage.push(thumbnailURL);
    	thumbnailURL = await uploadImage(thumbnailInput,"/upload-img","user");
	}
	
	if(vrmInput.files.length !== 0) {
		delImage.push(vrmURL);
		vrmURL = await uploadImage(vrmInput,"/upload-vrm","vrm");
	}
	
	let formData = new FormData();
	formData.append("editorId", "${editorEdit.editorId}");
    formData.append("profileImage", profileURL);
    formData.append("introduce", introduceInput);
    formData.append("thumbnail", thumbnailURL);
    formData.append("content", editordata);
    formData.append("vrm", vrmURL);
	if(delImage.length != 0) {
		console.log(delImage.length)
		for(i = 0; i < delImage.length; i++)
		formData.append("delImage", delImage[i]);
	}
	if(tagify.value.length != 0) {
		for(i = 0; i < tagify.value.length; i++) {
			formData.append("tags", tagify.value[i].value)
		}
	}


    // POST 요청 보내기
    try {
        let response = await fetch('/editor/editor-edit', {
            method: 'POST',
            body: formData,
        });
        // 응답 처리
        if (response.ok) {
            location.href="/editor/editor-detail/${editorEdit.editorId}";
        } else {
            console.error('Failed to submit data');
        }
    } catch (error) {
        console.error('Error:', error);
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

$('.summernote').summernote('code','${editorEdit.content}');
</script>
<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>