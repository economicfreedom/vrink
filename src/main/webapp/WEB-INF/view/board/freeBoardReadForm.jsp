<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>


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
                    userId: `${USER.userId}`,
                    communityId: `${dto.communityId}`,
                    content: content,
                    nickname: `${USER.nickname}`,
                    title: $("#title").val()

                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("로그인후 작성 가능합니다.")
                    } else {
                        location.reload()
                    }
                })
        });


        $("#search").click(function () {
            let type = $("#type").val();
            let keyword = $("#keyword").val();

            let url = "/board/board-list?type=" + type + "&keyword=" + keyword;

            location.href = url;

        });
        $("#keyword").keypress(function (event) {
            if (event.which == 13) {  // 13은 엔터 키의 키 코드입니다.
                let type = $("#type").val();
                let keyword = $("#keyword").val();

                let url = "/board/board-list?type=" + type + "&keyword=" + keyword;
                location.href = url;
            }
        });

    })

    function update(id) {

        location.href = "/board/update-form/" + id;
    }

    function deleteBoard(id) {

        fetch('/board/del/' + id, {
            method: 'DELETE',

        })

            .then(response => {
                if (!response.ok) {
                    alert("");
                } else {
                    location.href = "/board/board-list";
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
        let replyArea = $("#reply-content-" + id);
        replyArea.attr("readonly", false).css("border", "1px solid black");
        $("#cancel-" + id).css("display", "inline-block");
        $("#done-" + id).css("display", "inline-block");
        $("#update-" + id).css("display", "none");
        $("#reply-del-" + id).css("display", "none");

    }

    function updateCancel(id, content) {

        let replyArea = $("#reply-content-" + id);
        replyArea.val(content);
        replyArea.attr("readonly", true).css("border", "none");
        $("#cancel-" + id).css("display", "none");
        $("#done-" + id).css("display", "none");
        $("#update-" + id).css("display", "inline-block");
        $("#reply-del-" + id).css("display", "inline-block");
    }

    function updateDone(id) {
        let replyArea = $("#reply-content-" + id);
        let content = replyArea.val();

        if (content.length === 0) {
            alert("댓글을 입력해주세요.")
            replyArea.focus();
            return;
        }
        fetch('/free-reply/update', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                userId: `${USER.userId}`,
                communityId: ${dto.communityId},
                replyId: id,
                content: content,
                nickname: `${USER.nickname}`


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

                    html += '<ul class="list-group custom-list-group" style="margin-top:5px" id="reply-' + reply.replyId + '">';
                    html += '<li class="list-group-item custom-list-item">';
                    html += '<div class="comment-header">';
                    html += '<strong class="comment-nickname">' + reply.nickname + '</strong>';
                    html += '<span class="comment-date">' + reply.createdAt + '</span>';
                    html += '</div>';

                    html += '<textarea class="form-control custom-textarea" id="reply-content-' + reply.replyId + '"';
                    html += ' rows="2"';
                    html += ' readonly ';
                    html += '>' + reply.content + '</textarea>';
                    html += '<div class="comment-buttons">';
                    if (reply.userId == `${USER.userId}`) {

                        html += '<button class="btn btn-xs btn-default" onclick="updateReply(' + reply.replyId + ')"';
                        html += ' id="update-' + reply.replyId + '">수정';
                        html += '</button>';

                        html += '<button class="btn btn-xs btn-primary" style="display: none; "';
                        html += 'onclick="updateDone(' + reply.replyId + ')"';
                        html += ' id="done-' + reply.replyId + '">완료';

                        html += '</button>';
                        html += '<button class="btn btn-xs btn-default" style="display: none;"';
                        html += ' onclick="updateCancel(' + reply.replyId + ', \'';
                        html += reply.content.replace(/'/g, "\\'") + '\' )"';
                        html += ' id="cancel-' + reply.replyId + '">취소';
                        html += '</button>';

                        html += '<button class="btn btn-xs btn-danger"';
                        html += ' onclick="deleteReply(' + reply.replyId + ')"';
                        html += ' id="reply-del-' + reply.replyId + '"';
                        html += '>삭제';
                        html += '</button>';
                    }

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

<div class="container mt-5">

    <div class="row ">
        <div class="title">
            <div style="background-color:grey; border:grey solid 1px; border-radius: 2px;">
                <a href="/board/board-list" style="color: grey; text-decoration: none; text-decoration-color: grey; ">
                    <h2
                            style="color: white; margin-left: 6px">자유 게시판</h2></a>
            </div>
            <div style="float: right; margin-top: 2px">
                <select style="height:26px" name="type" id="type">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="tc">게시글+내용</option>
                    <option value="nickname">닉네임</option>
                </select>
                <input type="text" size="15" id="keyword">
                <img src="/image/54481.png" width="15px" height="15px" style="cursor: pointer"
                     id="search">

            </div>


            <hr style="margin-top: 30px ;border: black solid 2px;">


            <h3 id="title">${dto.title}</h3>
            <span> ${dto.nickname}</span>
            <br>
            <small>${dto.createdAt}</small>

            <%--            <c:if test="${dto.userId ==3}">--%>
            <c:if test="${USER.userId == dto.userId}">
                <button type="button" style="float: right;margin-left: 10px " class="btn btn-default"
                        onclick="update(${dto.communityId})">
                    수정
                </button>

                <button type="button" style="float: right;margin-left: 20px " class="btn btn-danger"
                        onclick="deleteBoard(${dto.communityId})">삭제
                </button>
            </c:if>
            <%--            </c:if>--%>

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
                    <!-- 댓글 입력 부분 -->
                    <div class="mb-20">
                        <div class="form-group">
                            <textarea class="form-control" rows="3" placeholder="댓글을 작성해주세요"
                                      id="reply-content"></textarea>
                            <button type="submit" class="btn btn-default btn-black pull-right"
                                    style=" background-color: black; color: whitesmoke"
                                    id="reply-add">
                                등록
                            </button>
                        </div>
                    </div>

                    <!-- 댓글 리스트 부분 -->
                    <div id="reply-container">
                        <c:forEach var="reply" items="${list}">
                            <ul class="list-group custom-list-group" style="margin-top:5px" id="reply-${reply.replyId}">
                                <li class="list-group-item custom-list-item" style="margin-top: 30px;">
                                    <div class="comment-header">
                                        <strong class="comment-nickname">${reply.nickname}</strong>
                                        <span class="comment-date">${reply.createdAt}</span>
                                    </div>
                                    <textarea class="form-control custom-textarea"
                                              rows="2"
                                              id="reply-content-${reply.replyId}"
                                              readonly
                                    >${reply.content}</textarea>
                                    <div class="comment-buttons">
                                        <c:if test="${reply.userId == USER.userId}">
                                            <button class="btn btn-xs btn-default"
                                                    onclick="updateReply(${reply.replyId})"
                                                    id="update-${reply.replyId}">수정
                                            </button>
                                            <button class="btn btn-xs btn-primary" style="display: none"
                                                    onclick="updateDone(${reply.replyId})"
                                                    id="done-${reply.replyId}">완료


                                            </button>
                                            <button class="btn btn-xs btn-default" style="display: none"
                                                    onclick="updateCancel( ${reply.replyId}, '${reply.content}' )"
                                                    id="cancel-${reply.replyId}"
                                            >취소
                                            </button>
                                            <button class="btn btn-xs btn-danger"
                                                    onclick="deleteReply(${reply.replyId})"
                                                    id="reply-del-${reply.replyId}"

                                            >삭제
                                            </button>
                                        </c:if>
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
        resize: none;
        border: none;
        background-color: transparent;
        box-shadow: none;
        width: 100%;
        overflow: hidden;
        margin: 10px 0;
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
        margin-top: 10px;
    }

    .comment-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
</style>


<%@ include file="/WEB-INF/view/layout/footer.jsp" %>

