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
            </div>
            <div class="contact-form">
                <div class="editor-div">
                    <div class="row">
                        <div class="col-md-12">
                            <i class="fa fa-user"></i>
                            <input name="title" type="text" id="title" value="${dto.title}" class="input-style"
                                   placeholder="제목">
                        </div>

                        <div class="col-md-12">
                            <i class="fa fa-pencil"></i>

                            <textarea name="editordata" id="editordata" class="input-style summernote">${dto.content}
                            </textarea>
                        </div>
                        <div class="col-md-12">
                            <div class="flat-btn-div">
                                <input type=button class="flat-btn" id="submit" onclick="update(${dto.communityId})"
                                        value="수정">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
      $(document).ready(function () {
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

        })
        $("#submit").click(function () {
            let content = $("#editordata").val();
            let title = $("#title").val();


            fetch('/board/update', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    communityId: ${dto.communityId},
                    userId: ${dto.userId},
                    title: title,
                    content:content,
                    nickname: `${dto.nickname}`


                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("")
                    } else {
                        location.href="/board/read/"+${dto.communityId}
                    }
                })

        })

    });

</script>
<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>
