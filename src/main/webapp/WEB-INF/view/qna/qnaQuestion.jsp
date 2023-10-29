<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/editor_header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            const value = $(this).data('page-num');
            console.log(value);

            document["page-form"]["page-num"].value = value;
            document["page-form"].type.value = $("select[name='type']").val();
            document["page-form"].keyword.value = $("#keyword").val();
            // document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
            document["page-form"].submit();
        }); // end of #pagination
    })
</script>
<div class="container">
    <div class="row p-block">
        <div class="col-sm-8 col-center">
            <div class="heading4">
                <h2>문의 사항</h2>
                <span>규정에 어긋난 게시글을 작성시 예고 없이 삭제될 수 있습니다.</span>
                <br>
                <span>문의 내용은 삭제하거나 수정 하실 수 없습니다.</span>

            </div>
            <div class="contact-form">
                <div class="editor-div">
                    <div class="row">
                        <div class="col-md-12">
                            <select style="height:26px" name="type" id="type">

                                <option value="asnwer">문의</option>
                                <option value="report">신고</option>
                                <option value="etc">기타</option>

                            </select>
                        </div>
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

    $(document).ready(function () {
        $("#submit").click(function () {

            let content = $("#editordata").val();
            let title = $("#title").val();
            let type = $("#type").val();

            let json = JSON.stringify({
                userId: 1,
                content: content,
                title: title,
                type: type
            });

            fetch('/qna/save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: json
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

</script>

<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>