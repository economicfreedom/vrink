<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<div class="card m-4">

    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 문의 상세</h3></div>

    <div class="row" style="margin: 10px;">
        <div class="title">
            <div>
                <span>작성자 : <a href="/admin/user/detail-nickname?nickname=${questionDetail.nickname}">${questionDetail.nickname}</a></span> <span>작성일 : ${questionDetail.createdAt}</span></div>
            <div class="my-3">
                <h2>
                    <c:choose>
                        <c:when test="${questionDetail.status == 0}">
                            제목 : [답변 대기] ${questionDetail.title}
                        </c:when>
                        <c:otherwise>
                            제목 : [답변 완료] ${questionDetail.title}
                        </c:otherwise>
                    </c:choose>
                </h2>
            </div>
            <hr>

        </div>
        <div class="content">
                <span>
                    ${questionDetail.content}
                </span>
        </div>
        <c:if test="${answer != null}">
            <hr style="background-color: black;height: 2px">
        </c:if>

    </div>
    <h4>
        <c:choose>
        <c:when test="${answer == null}">

        <div class="row p-block" style="margin: 21px;">
            <hr>
            <div class="col-sm-8 col-center">
                <div class="contact-form">
                    <div class="editor-div">
                        <div class="title">
                            <i class="fa fa-pencil"></i> <span>답변 작성</span>
                        </div>
                        <div class="row">

                            <div class="col-md-12 mt-3">
                                    <textarea name="summernote" id="summernote"
                                              class="input-style summernote"></textarea>
                            </div>
                            <div class="col-md-12">
                                <input type=button class="btn btn-secondary btn-block mt-3" id="submit" value="작성">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:when>
        <c:otherwise>

        <div class="row" style="margin: 18px;">
            <div class="title">
                답변 내용
                <small>${answer.createdAt}</small>
            </div>

            <hr>
            <div class="content">
          <span>
                  ${answer.content}
          </span>
            </div>

        </div>
        </c:otherwise>
        </c:choose>

</div>
<c:if test="${answer == null}">
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
                let content = $("#summernote").val();
                if (content.length <= 0) {
                    Swal.fire({
                        icon: "error",
                        title: "내용을 입력해주세요",
                    });
                    $("#summernote").focus();
                    return;
                }
                let json = JSON.stringify({
                    userId    : 0, // 관리자 아이디 적기
                    content   : content,
                    questionId: ${questionDetail.questionId}
                });

                fetch('/qna/save-answer', {
                    method : 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body   : json
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
        });
    </script>
</c:if>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>