<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
                    reportUserId: 1,
                    userId: 1,
                    boardId: 1,
                    editorId: null
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
                    editorId:1,
                    userId:1,
                    content:content,
                    count:star

                })
            })
                .then(response => {
                    if (!response.ok) {
                        location.reload();
                    } else {
                        alert("")
                    }
                })
                .then(data => console.log(data))
                .catch(error => console.error('Error:', error));

        })

    })
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

<div class="container">
    <div class="row mt-5 mb-5">
        <div class="col-sm-4">
            <h3>박카스작가 일러스트</h3>
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-sm-9">
            <div class="mb-3">
                <img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101.jpg?ver=1678017207">
            </div>
            <div class="mb-3">
                <img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101B.jpg?ver=1678017207">
            </div>
            <div class="mb-3">
                <img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101C.jpg?ver=1678017207">
            </div>
        </div>
        <div class="col-sm-3">
            <div class="t-center" style="border: 1px solid #343434;">
                <div class="p-2 d-flex j-around" style="gap: 10rem;">


                    <div style="font-size:25px; cursor: pointer" id="report">
                        &#128680;
                    </div>

                    <div style="font-size:25px; cursor: pointer" id="like">
                        &#128151;
                    </div>


                </div>
                <div style="margin: 0 auto; width: 100px; height: 100px">
                    <img class="circle-profile" alt=""
                         src="https://artmug.kr/image/goods_img1/1/17101B.jpg?ver=1678017207">
                </div>
                <h4>박카스 작가</h4>
                <h5>작가 소개입니다</h5>
                <h5>잘부탁드립니다</h5>
                <div style="background-color: #343434; height: 50px; color: white; line-height: 50px; font-weight: bold; cursor: pointer ">
                    작가에게 문의하기
                </div>
            </div>
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-sm-12 tcenter">
            <h1>내용내용내용내용</h1>
        </div>
        <div class="col-sm-12 mb-5">
            <img class="w-full" alt="" src="https://artmug.kr/image/goods_img1/1/17101B.jpg?ver=1678017207">
        </div>
        <div class="col-sm-12 mb-5">
            <img width="full" alt="" src="http://artmug.kr/image/up_img/detail/1/goods_17101/16270480690_Re.jpg">
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-sm-2">
            <div style="display: inline-block; vertical-align: middle;">
	            <span class="star">
	                ★★★★★
	                <span id="placeScore" style="width : 60%;">★★★★★</span>
	                <input type="range" name="placeScore" id="star-val" oninput="drawStar(this)" value="6" step="2"
                           min="0" max="10">
	            </span>
            </div>
            <script>
                function drawStar(target) {
                    document.querySelector('#placeScore').style.width = (target.value * 10) + '%';
                }
            </script>
        </div>
        <div class="col-sm-2" style="height: 48px; line-height: 58px"><strong>별점을 선택해주세요</strong></div>
        <div class="col-sm-11">
            <textarea rows="3" cols="" style="width: 100%; resize: none;" placeholder="리뷰를 입력해주세요."
                      id="review-content"></textarea>
        </div>
        <div class="col-sm-1">
            <div style="background-color: #343434; text-align: center; height: 65px; color: white; line-height: 65px;cursor: pointer"
                 id="review-submit">
                작성
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
                        <td class="t-left"><textarea rows="3" cols="" style="
                        width: 100%; resize: none; border: none; outline:none; cursor: default" readonly
                                                     placeholder="리뷰를 입력해주세요.">${review.content}</textarea></td>
                        <td>
                            <div style="display: flex;flex-direction: column ;gap: 1rem; padding: 0 30%; margin-bottom: 4px; margin-top: 4px">
                                <button type="button" class="btn btn-default">수정</button>
                                <button type="button" class="btn btn-danger">삭제</button>
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
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
