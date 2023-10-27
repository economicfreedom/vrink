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
                <h2>자유 게시판</h2>
                <span>규정에 어긋난 게시글을 작성시 예고 없이 삭제될 수 있습니다.</span>
            </div>
            <div class="contact-form">
                <div class="editor-div">
                    <div class="row">
                        <div class="col-md-12">
                            <i class="fa fa-user"></i>
                            <input name="title" type="text" id="title" class="input-style" placeholder="제목">
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
    $('.summernote').summernote({
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        placeholder: "글 내용을 작성해주세요.",
        height: 300,
        lang: "ko-KR",
        callbacks: {
            //onImageUpload = 이미지 업로드시 작동하는 콜백함수
            onImageUpload: function (files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    sendFile(files[i],
                        this);
                }
            }
        }//end callbacks
    });

    $(document).ready(function () {

        $("#submit").click(function () {

            let title = $("#title").val();
            let content = $("#editordata").val();



            fetch('/board/write', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    userId: 1,
                    title: title,
                    content: content

                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("")
                    } else {
                        location.reload();
                    }
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));
        })


    })

</script>