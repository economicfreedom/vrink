<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

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

                    html += '      <div class="col-sm-3">'
                    html += '<div class="mini-portfolio">'
                    html += '<img class="w-full" alt="" src="' + dto.thumbnail + '">'

                    html += '<div class= "portfolio-info">'
                    html += '<span>' + dto.nickname + '</span>'
                    html += '<h3>' + dto.introduce + '</h3>'
                    html += '<span style="color: black">리뷰 점수 : ' + dto.count.toFixed(1) + '</span>'
                    html += '<span>' + dto.star + '</span>'
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
<style>
    .customLook-list {
        --tag-bg: grey;
        --tag-hover: #ce0078;
        --tag-text-color: #fff;
        --tags-border-color: silver;
        --tag-text-color--edit: #111;
        --tag-remove-bg: var(--tag-hover);
        --tag-pad: 0.6em 1em;
        --tag-inset-shadow-size: 2.0em;
        --tag-remove-btn-bg--hover: black;
        display: inline-block;
        min-width: 0;
        border:none;

    }
    .customLook-list .tagify__tag {
        margin-top: 0;
    }
    .customLook-list .tagify__tag > div {
        border-radius: 25px;
    }

    .customLook-list .tagify__tag__removeBtn {
        opacity: 0;
        transform: translateX(-6px) scale(0.5);
        margin-left: -3ch;
        transition: 0.12s;
    }

    .customLook-list + button {
        color: #0052bf;
        font: bold 1.4em/1.65 Arial;
        border: 0;
        background: none;
        box-shadow: 0 0 0 2px inset currentColor;
        border-radius: 50%;
        width: 1.65em;
        height: 1.65em;
        cursor: pointer;
        outline: none;
        transition: 0.1s ease-out;
        margin: 0 0 0 5px;
        vertical-align: top;
    }
    .customLook-list + button:hover {
        box-shadow: 0 0 0 5px inset currentColor;
    }

    .tagify__tag>div>* {
        white-space: nowrap;
    }
</style>
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
                <div class="row mb-5 text-right">
                    <div class="col-sm-12">
                        <input type="text" name="basic" class="customLook-list" value="${tag}">
                        <input type="text" id="search-box" placeholder="검색어를 입력하세요.">
                    </div>
                </div>
                <div class="portfolio-mini-sec">
                    <div class="row" id="list">
                        <c:forEach items="${list}" var="dto">
                            <div class="col-sm-3">
                                <div class="mini-portfolio">
                                    <img class="w-full" alt="" src="${dto.thumbnail}" >
                                    <div class="portfolio-info">
                                        <span>${dto.nickname}</span>
                                        <h3>${dto.introduce} </h3>
                                        <span style="color: black">리뷰 점수 : ${dto.count}</span>
                                        <span>${dto.star}</span>
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
<script>
    var input = document.querySelector('input[name=basic]');


    var tagify = new Tagify(input,{
        userInput : false,
        hooks: {
            beforeRemoveTag: function () {
                return new Promise((resolve, reject) => {
                    reject();
                })
            }
        }
    });

    $('.tagify__tag-text').parent().on('click',function(){
        console.log($(this).text())
        $('#search-box').val($(this).text())
    })
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>