<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>


<script>
    let pageNum = 1;
    $(document).ready(function () {


        $("#reply-add").click(function () {
            let reply = $("#reply-content");
            let content = reply.val();

            if (content.length === 0) {
                alert("댓글을 입력해주세요.")
                reply.focus();
                return;
            }
            fetch('/free-reply/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    communityId: ${dto.communityId},
                    content: content

                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("")
                    } else {
                        location.reload()
                    }
                })
        });


    })

    function update(id) {

        location.href = "/board/update-form/" + id;
    }

    function deleteBoard(id) {

        fetch('/admin/del/' + id, {
            method: 'DELETE',

        })

            .then(response => {
                if (!response.ok) {
                    alert("");
                } else {
                    location.href = "/admin/freeboard";
                }
            })
            .then(data => console.log(data))
            .catch(error => console.error('Error:', error));

    }

    function deleteReply(id) {

        fetch('/free-reply/del/' + id, {
            method: 'DELETE',

        })

            .then(response => {
                if (!response.ok) {
                } else {
                    alert("댓글이 삭제 되었습니다.");
                    $("#reply-" + id).remove();
                }
            })
            .then(data => console.log(data))
            .catch(error => console.error('Error:', error));

    }

    function updateReply(id) {
        let replyArea = $("#reply-" + id);
        replyArea.attr("readonly", false).css("border", "1px solid black");
        $("#cancel-" + id).css("display", "inline-block");
        $("#done-" + id).css("display", "inline-block");
        $("#update-" + id).css("display", "none");
        $("#reply-del-" + id).css("display", "none");

    }

    function updateCancel(id, content) {
        let replyArea = $("#reply-" + id);
        replyArea.val(content);
        replyArea.attr("readonly", true).css("border", "none");
        $("#cancel-" + id).css("display", "none");
        $("#done-" + id).css("display", "none");
        $("#update-" + id).css("display", "inline-block");
        $("#reply-del-" + id).css("display", "inline-block");
    }

    function updateDone(id) {
        let reply = $("#reply-" + id);
        let content = reply.val();

        if (content.length === 0) {
            alert("댓글을 입력해주세요.")
            reply.focus();
            return;
        }
        fetch('/free-reply/update', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                replyId: id,
                content: content

            })
        })
            .then(response => {
                if (!response.ok) {
                    alert("")
                } else {
                    location.reload()
                }
            })

    }

    function more() {
        pageNum++;
        const url = `/free-reply/more-reply?commu-id=${dto.communityId}&page-num=` + pageNum + `&total=${total}`;
        let html = '';

// fetch를 사용한 요청
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {

                // 응답 데이터 처리
                console.log(data); // 전체 응답 데이터 출력
                if (!data.hasNext) {
                    $("#more").css("display", "none")
                }
                // 예시: FreeBoardReplyDTO 리스트 출력
                data.pageDTOs.forEach(reply => {

                    html += '<ul class="list-group custom-list-group" style="margin-top:5%"> id="reply-' + reply.replyId +'">';
                    html += '<li class="list-group-item custom-list-item" style="border: 1px solid #00000075; padding: 5px;">';
                    html += '<div class="comment-header">';
                    html += '<strong class="comment-nickname">' + reply.nickname + '</strong>';
                    html += '<span class="comment-date">' + reply.createdAt + '</span>';
                    html += '</div>';

                    html += '<textarea class="form-control custom-textarea"';
                    html += ' rows="2"';
                    html += ' readonly ';
                    html += 'id="reply-' + reply.replyId + '">' + reply.content + '</textarea>';
                    html += '<div class="comment-buttons">';

                    html += '<button class="btn btn-dark btn-block"';
                    html += ' onclick="deleteReply(' + reply.replyId + ')"';
                    html += ' id="reply-del-' + reply.replyId + '"';
                    html += '>삭제';
                    html += '</button>';

                    html += '</div>';
                    html += '</li>';
                    html += '</ul>';


                });
                // 다른 필요한 처리를 여기에 추가하세요.
                $("#reply-container").append(html);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }


</script>

<div class="container" style="margin: 50px auto;border: 1px solid black;">
    <div class="row">
        <div class="title">

            <h1>${dto.title}</h1>
            <span> ${dto.nickname}</span>
            <br>
            <small>${dto.createdAt}</small>

            <button type="button" style="float: right;margin-left: 20px " class="btn btn-dark btn-block"
                    onclick="deleteBoard(${dto.communityId})">삭제
            </button>

            <hr>


        </div>
        <div class="content">
            <span>
                ${dto.content}
            </span>
        </div>
        <%--        <hr style="background-color: black;height: 2px">--%>
        <hr>
    </div>

    <div class="row">
        <div class="col">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">댓글</h3>
                </div>
                <div class="panel-body">
                    <!-- 댓글 리스트 부분 -->
                    <div id="reply-container">
                        <c:forEach var="reply" items="${list}">
                            <ul class="list-group custom-list-group" style="margin-top:5%" id="reply-${reply.replyId}">
                                <li class="list-group-item custom-list-item" style="border: 1px solid #00000075; padding: 5px;">
                                    <div class="comment-header">
                                        <strong class="comment-nickname">${reply.nickname}</strong>
                                        <span class="comment-date">${reply.createdAt}</span>
                                    </div>
                                    <textarea class="form-control custom-textarea"
                                              rows="2"
                                              readonly
                                              id="reply-${reply.replyId}">${reply.content}</textarea>
                                    <div class="comment-buttons">
                                        <button class="btn btn-dark btn-block"
                                                onclick="deleteReply(${reply.replyId})"
                                                id="reply-del-${reply.replyId}"

                                        >삭제
                                        </button>
                                    </div>
                                </li>
                            </ul>

                        </c:forEach>
                    </div>
                    <c:if test="${next}">

                        <span style="cursor: pointer" id="more"
                              onclick="more()">더보기</span>
                    </c:if>
                </div>
            </div>
        </div>
    </div>


</div>

<style>
    .custom-list-group {
        border: none;
    }

    .custom-list-item {
        border: none;
        background-color: transparent;
        padding: 10px 0;
    }

    .custom-textarea {
        min-height: 0 !important;
        height: 25px;
        padding: 0;
        resize: none;
        border: none;
        background-color: transparent;
        box-shadow: none;
        width: 100%;
        overflow: hidden;
    }

    .comment-nickname {
        display: inline;
        margin-right: 5px;
    }

    .comment-date {
        display: inline;
        font-size: 0.9em;
        color: #777;
        margin-left: 5px;
    }

    .comment-buttons {
        margin-top: 0;
    }

    .comment-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
</style>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>