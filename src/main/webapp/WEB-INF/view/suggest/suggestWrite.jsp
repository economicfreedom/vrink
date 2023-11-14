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
                <h2>의뢰 게시판</h2>
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
        lang: "ko-KR"

    });

    $(document).ready(function () {

        $("#submit").click(function () {

            let title = $("#title").val();
            let content = $("#editordata").val();

            console.log(content);

            if (content.length <= 0){
                alert("내용을 입력해주세요.")
                return ;
            }

            if (title.length <= 0|| title.trim()===""){
                alert("제목을 입력해주세요.")
                return;
            }
            postSuggest();
        })

        async function postSuggest() {
            let title = $("#title").val();
            let content = $("#editordata").val();
            let result = await fetch('/suggest/post', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    userId: `${USER.userId}`,
                    title: title,
                    content: content
                })
            })

            let resultCode = await result.json();
            console.log(resultCode);
            if (resultCode !== 1) {
                alert('잠시 후 시도해주십시오.');
            } else {
                alert('게시물 작성이 완료되었습니다.');
                location.href = "/suggest/list";
            }
        }


    })

</script>
<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>