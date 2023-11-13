<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<div class="card m-4">

    <div class="card-header"><h3><i class="fa-solid fa-file-signature"></i> 공지사항 수정</h3></div>

    <div class="row p-block" style="margin: 21px;">
        <div class="col-sm-8 col-center">
            <div class="contact-form">
                <div class="editor-div">
                    <select style="width: 25%;" class="form-select mb-3" id="type">
                        <option <c:if test="${noticeDetail.type == 'community'}">selected</c:if> value="community">자유게시판</option>
                        <option <c:if test="${noticeDetail.type == 'suggest'}">selected</c:if> value="suggest">의뢰게시판</option>
                    </select>
                    <div>
                        <h4><i class="fa-solid fa-heading"></i> <span>제목</span></h4>
                        <input style="border: none; padding: 3px; font-size: 1.5rem; width: 150%;"
                               type="text"
                               class="form-control"
                               id="title"
                               value="${noticeDetail.title}"
                               placeholder="제목을 입력해주세요">
                    </div>

                    <hr class="mt-2" style="width: 150%">
                    <div>
                        <h4><i class="fa fa-pencil"></i> <span>내용</span></h4>
                    </div>
                    <div class="row">

                        <div class="col-md-12 mt-3">
                                    <textarea name="summernote" id="summernote"
                                              class="input-style summernote">${noticeDetail.content}</textarea>
                        </div>
                        <div class="col-md-12">
                            <input type=button class="btn btn-secondary btn-block mt-3" id="submit" value="작성">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>

    $('#summernote').summernote({
        placeholder: '글 내용을 작성해주세요.',
        height     : 300,
        width      : `151%`,
        toolbar    : [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });

    $(document).ready(function () {
        $("#submit").click(function () {

            let title = $("#title").val();
            let content = $("#summernote").val();
            let type = $("#type").val();

            console.log(title);
            console.log(content);
            console.log(type);

            if (title.length <= 0) {
                Swal.fire({
                    icon : "error",
                    title: "제목을 입력해 주세요",
                });
                $("#title").focus();
                return;
            }
            if (content.length <= 0) {
                Swal.fire({
                    icon : "error",
                    title: "내용을 입력해 주세요",
                });
                $("#summernote").focus();
                return;
            }
            let json = JSON.stringify({
                title  : title,
                content: content,
                type   : type,
                noticeId : ${noticeDetail.noticeId}
            });

            fetch('/admin/notice-update', {
                method : 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body   : json
            })
                .then(response => {
                    if (!response.ok) {
                        Swal.fire({
                            icon : "error",
                            title: "에러입니다",
                        });
                    } else {
                        location.href = "/admin/notice-detail?page=1&id=${noticeDetail.noticeId}";
                    }
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));
        })
    });
</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>