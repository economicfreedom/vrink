<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<section class="block remove-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="error-sec">
                    <div class="row">
                        <div class="col-md-6 column">
                            <div class="error-not-found">
                                <span>서버에 문제가 생겼나봐요</span>
                                <h3>500<strong>ERROR !</strong></h3>
                                <h5>다른 페이지 둘러보기 <br/>아래를 클릭하면 이동합니다.</h5>
                                <ul>
                                    <li><a href="#" title="">HOME</a></li>
                                    <li><a href="#" title="">ABOUT</a></li>
                                    <li><a href="#" title="">PORTFOLIO</a></li>
                                    <li><a href="#" title="">EVENTS</a></li>
                                    <li><a href="#" title="">BLOG</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6 column">
                            <img src="http://placehold.it/570x542" alt=""/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
