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



</style>
<section class="block">
    <div class="container">
        <div class="row" style="position: relative">
            <div class="col-sm-10">
                <div class="banner">
                    <div>
                        <img class="img-responsive" src="http://artmug.kr/image/up_img/detail/goods_6239/16646695010_Re.jpg" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="http://artmug.kr/image/up_img/detail/goods_6239/16552736910_Re.jpg" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="http://artmug.kr/image/up_img/detail/goods_6239/16630494830_Re.jpg" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="http://artmug.kr/image/up_img/detail/goods_6239/16756016890_Re.jpg" alt="">
                    </div>
                    <div>
                        <img class="img-responsive" src="http://artmug.kr/image/up_img/detail/goods_6239/16765095360_Re.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-sm-2 advertise">
                <img class="img-responsive" src="https://cdn.imweb.me/thumbnail/20200709/64c03a3d5bf6a.png" alt="">
            </div>
            <div class="col-sm-12 mt-5 h-advertise" >
                <img class="img-responsive" src="/images/ad_hori.jpg" alt="">
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
                                <img class="w-full" src="${review.profileImage}" alt="" />
                                <div class="gallery-detail">
                                    <a href="images/preview.png" title=""><i class="fa fa-search"></i></a>
                                    <h3>${review.nickname}</h3>
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
                                        제목</span> <span style="color:#ff2929"> ${board.title}[${board.count}] </span></a></td>
                            <td>${board.nickname}</td>
                            <td>${board.createdAt}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-6 mt-5">
                <div class="heading1">
                    <h2>인기 버튜버 순위</h2>
                </div>
                <table class="w-full t-center">
                    <colgroup>
                        <col width="10%">
                        <col width="40%">
                        <col width="25%">
                    </colgroup>
                    <thead>
                    <tr class="board-list-th">
                        <th class="t-center">순위</th>
                        <th>채널명</th>
                        <th class="t-center">닉네임</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${boardList}" var="board">
                        <tr class="board-list-tr">
                            <td>${board.communityId}</td>
                            <td class="t-left">
                                <a href="/board/read/${board.communityId}"
                                   style="text-decoration: none; color: black"><span>
                                        제목</span> <span style="color:#ff2929"> ${board.title}[${board.count}] </span></a></td>
                            <td>${board.nickname}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-6 mt-5">
                <div class="heading1">
                    <h2>자유 게시판</h2>
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
                                        제목</span> <span style="color:#ff2929"> ${board.title}[${board.count}] </span></a></td>
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
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
