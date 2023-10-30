<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>

<script>
    $(document).ready(function () {

        $("#report").click(function () {

            fetch('/report/report-board', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    reportUserId: ${editorDetail.userId},
                    userId: 1,
                    boardId: null,
                    editorId: ${editorDetail.editorId}
                })
            })
                .then(response => {
                    if (!response.ok) {
                        alert("이미 요청된 신고입니다.")
                    } else {
                        alert("정상적으로 신고 되었습니다.")
                    }
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));

        })

        $("#review-submit").click(function () {

            let content = $("#review-content").val();

            let star = $("#star-val").val();

            console.log(star);


            fetch('/review/save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    editorId: ${editorDetail.editorId},
                    userId: 1,
                    content: content,
                    count: star

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

    function deleteReview(reviewId) {


        fetch('/review/del/' + reviewId, {
            method: 'DELETE',

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


    }

</script>
<style>
    .star {
        position: relative;
        color: #ddd;
        font-size: 35px;
        word-break: normal;
        word-wrap: normal;
    }

    .star input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
        display: initial;
        top: 5px;
    }

    .star span {
        width: 0;
        position: absolute;
        left: 0;
        color: #b67f5f;
        overflow: hidden;
        pointer-events: none;
        text-shadow: -1px 0 #b67f5f, 0 1px #b67f5f, 1px 0 #b67f5f, 0 -1px #b67f5f;
    }
</style>
<section class="block">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 mb-5">
                <div class="heading3">
                    <h3>작가 소개</h3>
                </div>
                <h3>${editorDetail.nickname}작가 포트폴리오</h3>

            </div>
        </div>
        <div class="row mb-5">
            <div class="col-sm-9">

                <div class="mb-3">
                    <img class="w-full" alt="" src="${editorDetail.image}">
                </div>
            </div>
            <div class="col-sm-3">
                <div class="t-center" style="border: 1px solid #343434;">
                    <div class="p-2 d-flex j-around" style="gap: 10rem;">


                        <div style="font-size: 25px; cursor: pointer" id="report">
                            &#128680;
                        </div>

                        <div style="font-size: 25px; cursor: pointer" id="like">
                            &#128151;
                        </div>


                    </div>
                    <div class="circle-profile-area">
                        <img class="circle-profile" alt=""
                             src="${editorDetail.profileImage}">
                    </div>
                    <h4>${editorDetail.nickname}작가</h4>
                    <h5>${editorDetail.introduce}</h5>
                    <h5>잘부탁드립니다</h5>
                    <span><a
                            href="/editor/vrm?editor-id=${editorDetail.editorId}">작가의 VRM
				보러가기</a></span>
                    <div>
                        <div id="edit"
                             style="background-color: #fff; height: 50px; color: black; line-height: 50px; border-top: 1px solid black; font-weight: bold; cursor: pointer">
                            <a href="/editor/editor-edit/${editorDetail.editorId}">수정하기</a></div>
                        <div
                                style="background-color: #343434; height: 50px; color: white; line-height: 50px; font-weight: bold; cursor: pointer">
                            작가에게 의뢰하기
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-sm-1">
                    <img width="100" height="100" src="/image/bot.png">
                </div>
                <div class="col-sm-11 t-center mt-5" style="float: left">${editorDetail.content}
                    <c:choose>
                        <c:when test="${morph != null}">
                        <div style="border: 1px solid black"><h5>${morph}</h5></div>
                        </c:when>
                        <c:otherwise>
                            <div style="border: 1px solid black"><h5>아직 리뷰가 없어요..</h5></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-sm-2">
                    <div style="display: inline-block; vertical-align: middle;">
					<span class="star"> ★★★★★ <span id="place-score"
                                                    style="width: 60%;">★★★★★</span> <input type="range"
                                                                                            name="place-score"
                                                                                            id="star-val"
                                                                                            oninput="drawStar(this)"
                                                                                            value="6"
                                                                                            step="2" min="0" max="10">
					</span>
                    </div>
                    <script>
                        function drawStar(target) {
                            document.querySelector('#place-score').style.width = (target.value * 10) + '%';
                        }
                    </script>
                </div>
                <div class="col-sm-2" style="height: 48px; line-height: 58px">
                    <strong>별점을 선택해주세요</strong>
                </div>
                <div class="col-sm-11">
				<textarea rows="3" cols="" style="width: 100%; resize: none;"
                          placeholder="리뷰를 입력해주세요." id="review-content"></textarea>
                </div>
                <div class="col-sm-1">
                    <div
                            style="background-color: #343434; text-align: center; height: 65px; color: white; line-height: 65px; cursor: pointer"
                            id="review-submit">작성
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-sm-12">
                    <div>
                        <table class="w-full">
                            <colgroup>

                                <col width="15%">
                                <col width="50%">
                                <col width="15%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="list-th">별점</th>
                                <th class="list-th tleft">내용</th>
                                <th class="list-th"></th>
                                <th class="list-th">작성자</th>
                                <th class="list-th">작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${reviewList}" var="review">
                                <tr class="list-tr">

                                    <td style="color: gold">${review.star}</td>
                                    <td class="t-left"><textarea rows="3" cols=""
                                                                 style="width: 100%; resize: none; border: none; outline: none; cursor: default"
                                                                 readonly
                                                                 placeholder="리뷰를 입력해주세요.">${review.content}</textarea>
                                    </td>
                                    <td>
                                        <div
                                                style="display: flex; flex-direction: column; gap: 1rem; padding: 0 30%; margin-bottom: 4px; margin-top: 4px">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="deleteReview(${review.reviewId})" id="review-del">삭제
                                            </button>
                                        </div>
                                    </td>
                                    <td>${review.nickname}</td>
                                    <td>${review.createdAt}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>