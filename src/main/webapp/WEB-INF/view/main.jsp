<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<style>
    .slide-arrow{position:absolute;top: 50%;transform: translateY(-50%);padding: 0 4px;font-size: 24px;color: #000;background: rgba(255,255,255,0.8);border:none;outline:0;z-index:1;cursor:pointer}
    .prev-arrow{left: 0;}
    .next-arrow{right:0}

    .board-list-th {
        border-top: 1px solid #f2f2f2;
        border-bottom: 1px solid #f2f2f2;
        height: 45px;
    }

    .board-list-tr {
        border-bottom: 1px solid #f2f2f2;
        height: 45px;
        color: #5f5f5f
    }

    .youtb-list-th {
        height: 45px;
        background: #fafafa;
    }

    .youtb-list-tr {
        border-bottom: 1px solid #f2f2f2;
        height: 30px;
        color: #5f5f5f;
    }

    .youtb-list-tr img{
        padding: 5px;
        border-radius: 100%;
        cursor: pointer;
    }

    .youtb-list-tr a{
        color: #5f5f5f;
    }

    .h-advertise {
        display: none;
    }
    .h-advertise img{

    }
    @media (max-width: 767px) {
        .advertise {
            display: none;
        }

        .h-advertise {
            display: block;
        }


    }

    .more-link {
        position: absolute;right: 20px;top: 45px;
    }

    .more-link > a {
        color: #5f5f5f;
    }

    .weekly {
        display: none;
    }

    .monthly {
        display: none;
    }

    .radio-custom {
        position: absolute;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        background: #fafafa;
        left: 15px;
        top: 47px;
    }
    .radio-custom label {
        margin-bottom: 0px;
    }

    .radio-custom #daily + label{
        border-top-left-radius: 4px;
    }

    .radio-custom #monthly + label {
        border-top-right-radius: 4px;
    }
    /* 숨겨진 라디오 버튼 스타일링 */
    input[type="radio"] {
        display: none;
    }

    input[type="radio"] + label {
        font-size: 13px;
        padding: 4px;
        cursor: pointer;
    }

    input[type="radio"]:checked + label {
        background-color: #ff2929;
        color: white;
    }
</style>
<section class="block">
    <div class="container">
        <div class="row" style="position: relative">
            <div class="col-sm-10">
                <div class="banner col-sm-12">
                    <div>
                        <img class="img-responsive" src="/images/resource/banner/banner1.webp" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="/images/resource/banner/banner2.webp" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="/images/resource/banner/banner3.webp" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="/images/resource/banner/banner4.webp" alt="">
                    </div>
                </div>
            </div>
            <div class="col-sm-2 advertise">
                <img class="img-responsive" src="/images/resource/banner/sidebanner.webp" alt="">
            </div>
            <div class="col-sm-10 mt-5 h-advertise" >
                <img class="img-responsive" src="/images/resource/banner/sidebannerlong.webp" alt="">
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-12 mt-5">
                <div class="heading4">
                    <h2>인기 작가들</h2>
                </div>

                <div class="gallery-sec">
                    <div class="row">
                        <c:forEach items="${reviewList}" var="review">
                        <div class="col-sm-3">
                            <div class="gallery-box curve">
                                <img class="w-full" src="${review.thumbnail}" alt="" />
                                <div class="gallery-detail">
                                    <a href="/editor/editor-detail/${review.editorId}" title=""><i class="fa fa-search"></i></a>
                                    <h3>${review.nickname}작가</h3>
                                    <h3 style="color: yellow">${review.star}</h3>
                                </div>
                            </div><!-- Gallery Box -->
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-12 mt-5">
                <div class="heading1">
                    <h2>공지사항</h2>
                    <span class="more-link"><a href="/notice/notice-list">더보기</a></span>
                </div>
                <table class="w-full t-center">
                    <colgroup>
                        <col width="10%">
                        <col width="70%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                    <tr class="board-list-th">
                        <th class="t-center">번호</th>
                        <th>제목</th>
                        <th class="t-center">날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${noticeList}" var="notice">
                        <tr class="board-list-tr">
                            <td>${notice.noticeId}</td>
                            <td class="t-left">
                                <a href="/notice/${notice.noticeId}"
                                   style="text-decoration: none; color: black"><span>
                                        </span> <span> ${notice.title}</span></a></td>
                            <td>${notice.createdAt}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-12">
                <div class="heading1">
                    <h2>버튜버 인기 순위</h2>
                    <span class="radio-custom">
                        <input type="radio" id="daily" name="period" checked>
                        <label for="daily">일간</label>
                        <input type="radio" id="weekly" name="period">
                        <label for="weekly">주간</label>
                        <input type="radio" id="monthly" name="period">
                        <label for="monthly">월간</label>
                    </span>
                </div>
                <table class="w-full t-center daily">
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="50%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <tr class="youtb-list-th">
                        <th class="t-center">일간 순위</th>
                        <th class="t-center"></th>
                        <th>채널명</th>
                        <th class="t-center">구독자수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dailyList}" var="daily" varStatus="step">
                        <tr class="youtb-list-tr">
                            <td>${step.count}</td>
                            <td>
                                <div><a href="${daily.link}" target="_blank"><img src="${daily.thumbnail}" width="50%"></a></div></td>
                            <td class="t-left"><a href="${daily.link}" target="_blank">${daily.channel}</a></td>
                            <td>${daily.subscribe}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <table class="w-full t-center weekly">
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="50%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <tr class="youtb-list-th">
                        <th class="t-center">주간 순위</th>
                        <th class="t-center"></th>
                        <th>채널명</th>
                        <th class="t-center">구독자수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${weeklyList}" var="weekly" varStatus="step">
                        <tr class="youtb-list-tr">
                            <td>${step.count}</td>
                            <td>
                                <div><a href="${weekly.link}" target="_blank"><img src="${weekly.thumbnail}" width="50%"></a></div></td>
                            <td class="t-left"><a href="${weekly.link}" target="_blank">${weekly.channel}</a></td>
                            <td>${weekly.subscribe}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <table class="w-full t-center monthly">
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="50%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <tr class="youtb-list-th">
                        <th class="t-center">월간 순위</th>
                        <th class="t-center"></th>
                        <th>채널명</th>
                        <th class="t-center">구독자수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${monthlyList}" var="monthly" varStatus="step">
                        <tr class="youtb-list-tr">
                            <td>${step.count}</td>
                            <td>
                                <div><a href="${monthly.link}" target="_blank"><img src="${monthly.thumbnail}" width="50%"></a></div></td>
                            <td class="t-left"><a href="${monthly.link}" target="_blank">${monthly.channel}</a></td>
                            <td>${monthly.subscribe}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-6 mt-5">
                <div class="heading1">
                    <h2>의뢰 게시판</h2>
                    <span class="more-link"><a href="/suggest/list">더보기</a></span>
                </div>
                <table class="w-full t-center">
                    <colgroup>
                        <col width="10%">
                        <col width="40%">
                        <col width="25%">
                        <col width="25%">
                    </colgroup>
                    <thead>
                    <tr class="board-list-th">
                        <th class="t-center">번호</th>
                        <th>제목</th>
                        <th class="t-center">닉네임</th>
                        <th class="t-center">날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${suggestList}" var="suggest">
                        <tr class="board-list-tr">
                            <td>${suggest.suggestId}</td>
                            <td class="t-left">
                                <a href="/suggest/get/${suggest.suggestId}"
                                   style="text-decoration: none; color: black"><span>
                                        </span> <span> ${suggest.title}</span></a></td>
                            <td>${suggest.nickname}</td>
                            <td>${suggest.createdAt}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-6 mt-5">
                <div class="heading1">
                    <h2>자유 게시판</h2>
                    <span class="more-link"><a href="/board/board-list">더보기</a></span>
                </div>
                <table class="w-full t-center">
                    <colgroup>
                        <col width="10%">
                        <col width="40%">
                        <col width="25%">
                        <col width="25%">
                    </colgroup>
                    <thead>
                    <tr class="board-list-th">
                        <th class="t-center">번호</th>
                        <th>제목</th>
                        <th class="t-center">닉네임</th>
                        <th class="t-center">날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${boardList}" var="board">
                        <tr class="board-list-tr">
                            <td>${board.communityId}</td>
                            <td class="t-left">
                                <a href="/board/read/${board.communityId}"
                                   style="text-decoration: none; color: black"><span>
                                </span> <span> ${board.title}</span><span style="color: #ff2929">[${board.count}] </span></a></td>
                            <td>${board.nickname}</td>
                            <td>${board.createdAt}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script>
    $('.banner').slick({
        centerMode: true,
        slidesToShow: 1,
        autoplay:true,
        infinite : true,
        arrows : true,
        prevArrow: '<button class="slide-arrow prev-arrow"><</button>',
        nextArrow: '<button class="slide-arrow next-arrow">></button>'
    })

    $("input[name='period']").change(function(){
        $('.daily').hide();
        $('.weekly').hide();
        $('.monthly').hide();

        $('.'+$(this).attr("id")).show();
    })
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
