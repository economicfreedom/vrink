<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/editor_header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<div class="container">
    <div class="row">
        <div class="title">

            <h1><c:choose>
                <c:when test="${dto.status == 0}">
                    [답변 대기] ${dto.title}
                </c:when>
                <c:otherwise>
                    [답변 완료] ${dto.title}
                </c:otherwise>
            </c:choose>

            </h1>

            <br>
            <small>${dto.createdAt}</small>

            <hr>


        </div>
        <div class="content">
            <span>
                ${dto.content}
            </span>
        </div>
        <c:if test="${question != null}">
            <hr style="background-color: black;height: 2px">
        </c:if>

    </div>
    <h1>
        <c:choose>
        <c:when test="${question == null}">
        <hr>

        <div class="container">

            <div class="row p-block">
                <div class="col-sm-8 col-center">
                    <div class="contact-form">
                        <div class="editor-div">
                            <div class="title ">
                                <span>답변 작성</span>
                            </div>
                            <div class="row">

                                <div class="col-md-12">
                                    <i class="fa fa-pencil"></i>
                                    <textarea name="editordata" id="editordata"
                                              class="input-style summernote"></textarea>
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
        </c:when>
        <c:otherwise>

        <div class="row">
            <div class="title">
                답변 내용
                <small>${question.createdAt}</small>
            </div>

            <hr>
            <div class="content">
          <span>
                  ${question.content}
          </span>
            </div>

        </div>
        </c:otherwise>
        </c:choose>


</div>
<c:if test="${question == null}">
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
                let content = $("#editordata").val();
                if (content.length <= 0) {
                    alert("내용을 입력해주세요.")
                    $("#editordata").focus();
                    return;
                }
                let json = JSON.stringify({
                    userId: 1, // 관리자 아이디 적기
                    content: content,
                    qnaId: ${dto.qnaId}
                });

                fetch('/qna/save-question', {
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


        });
    </script>
</c:if>

<%@ include file="/WEB-INF/view/layout/editor_footer.jsp" %>