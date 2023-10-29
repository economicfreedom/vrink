<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script>
    var debounceTimer;
    var pageNum = 1;
    var hasNext = true;
    $(window).scroll(function () {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(checkScrollEnd, 1000);  // 1초 동안 딜레이
    });

    function checkScrollEnd() {
        var scrollHeight = $(document).height();
        var scrollPosition = $(window).height() + $(window).scrollTop();

        if ((scrollHeight - scrollPosition) / scrollHeight < 0.10 && hasNext) {
            console.log("스크롤이 페이지의 90% 이상 도달했습니다!");
            fetchListMore();


        }
    }

    function fetchListMore() {
        pageNum++;
        const url = `/editor/list-more?page-num=` + pageNum;
        var html = '';
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                hasNext = data.hasNext
                console.log(data);
                data.pageDTOs.forEach(dto => {

                    html += '      <div class="col-md-4">'
                    html += '<div class="mini-portfolio">'
                    html += '<img alt="" src="' + dto.image + '" style="height: 445px;width: 370px">'

                    html += '<div class= "portfolio-info">'
                    html += '<span>' + dto.nickname + '</span>'
                    html += '<h3>' + dto.introduce + '</h3>'
                    html += '<span style="color: black">리뷰 점수 : ' + dto.count.toFixed(1) + '</span>'
                    html += '<ul>'

                    html += '<li><a title="" href="/editor/editor-detail/' + dto.editorId + '"><i'
                    html += ' class="fa fa-search"></i></a></li>'
                    html += '<li><a title="" href="/editor/editor-detail/' + dto.editorId + '"><img'
                    html += ' src="' + dto.profileImage + '"'
                    html += ' style="border-radius: 100%;width: 100%; height: 100%"></a></li>'
                    html += '</ul>'
                    html += '</div>'
                    html += '</div>'
                    html += '</div>'
                })
                // 필요한 처리를 여기에 추가하세요.
                $("#list").append(html)

            })
            .catch(error => {
                console.error('Error:', error);
            });

    }

</script>
<div class="inner-head overlap">
    <div data-velocity="-.2"
         style="background: url(http://placehold.it/1500x1100) repeat scroll 50% 422.28px transparent;"
         class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
    <div class="container">
        <div class="inner-content">
            <span><i class="fa fa-bolt"></i></span>
            <h2>EDITORS</h2>
            <ul>
                <li><a href="/" title="">HOME</a></li>
                <li>VRINK의 작가들</li>
            </ul>
        </div>
    </div>
</div>
<!-- inner Head -->

<section class="block">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="portfolio-mini-sec">
                    <div class="row" id="list">
                        <c:forEach items="${list}" var="dto">
                            <div class="col-md-4">
                                <div class="mini-portfolio">
                                    <c:if test="${dto.image == null}">
                                        <img alt="" src="http://placehold.it/270x345">
                                    </c:if>
                                    <c:if test="${dto.image != null}">
                                        <img alt="" src="${dto.image}" style="height: 445px;width: 370px">
                                    </c:if>
                                    <div class="portfolio-info">
                                        <span>${dto.nickname}</span>
                                        <h3>${dto.introduce} </h3>
                                        <span style="color: black">리뷰 점수 : ${dto.count} </span>
                                        <ul>
                                                <%--                                            <i class="fa fa-link"></i>--%>
                                            <li><a title="" href="/editor/editor-detail/${dto.editorId}"><i
                                                    class="fa fa-search"></i></a></li>
                                            <li><a title="" href="/editor/editor-detail/${dto.editorId}"><img
                                                    src="${dto.profileImage}"
                                                    style="border-radius: 100%;width: 100%; height: 100%"></a></li>
                                        </ul>
                                    </div>
                                </div><!-- Portfolio Box -->
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>