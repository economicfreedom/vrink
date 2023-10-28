<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="inner-head overlap">
    <div data-velocity="-.2"
         style="background: url(http://placehold.it/1500x1100) repeat scroll 50% 422.28px transparent;"
         class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
    <div class="container">
        <div class="inner-content">
            <span><i class="fa fa-bolt"></i></span>
            <h2>PORTFOLIO 3 COLUMN</h2>
            <ul>
                <li><a href="/" title="">HOME</a></li>
                <li><a href="#" title="">VRINK의 작가들</a></li>
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
                    <div class="row">
                        <div class="col-md-4">
                            <div class="mini-portfolio">
                                <img alt="" src="http://placehold.it/270x345">
                                <div class="portfolio-info">
                                    <span>Design</span>
                                    <h3>MUSHI is fully Hand Crafted Design</h3>
                                    <span style="color: black">리뷰 점수 : </span>
                                    <ul>
                                        <li><a title="" href="#"><i class="fa fa-search"></i></a></li>
                                        <li><a title="" href="#"><i class="fa fa-link"></i></a></li>
                                    </ul>
                                </div>
                            </div><!-- Portfolio Box -->
                        </div>
                        <c:forEach items="${list}" var="dto">
                            <div class="col-md-4">
                                <div class="mini-portfolio">
                                    <c:if test="${dto.image == null}">
                                        <img alt="" src="http://placehold.it/270x345">
                                    </c:if>
                                    <c:if test="${dto.image != null}">
                                        <img alt="" src="${dto.image}">
                                    </c:if>
                                    <div class="portfolio-info">
                                        <span>${dto.}</span>
                                        <h3>We are the best Web Designer </h3>
                                        <ul>
                                            <li><a title="" href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a title="" href="#"><i class="fa fa-link"></i></a></li>
                                        </ul>
                                    </div>
                                </div><!-- Portfolio Box -->
                            </div>
                        </c:forEach>
                        <div class="col-md-4">
                            <div class="mini-portfolio">
                                <img alt="" src="http://placehold.it/270x345">
                                <div class="portfolio-info">
                                    <span>Design</span>
                                    <h3>You can Check our Portfolio</h3>
                                    <ul>
                                        <li><a title="" href="#"><i class="fa fa-search"></i></a></li>
                                        <li><a title="" href="#"><i class="fa fa-link"></i></a></li>
                                    </ul>
                                </div>
                            </div><!-- Portfolio Box -->
                        </div>
                        <div class="col-md-4">
                            <div class="mini-portfolio">
                                <img alt="" src="http://placehold.it/270x345">
                                <div class="portfolio-info">
                                    <span>Design</span>
                                    <h3>Best PSD Template ever on Web</h3>
                                    <ul>
                                        <li><a title="" href="#"><i class="fa fa-search"></i></a></li>
                                        <li><a title="" href="#"><i class="fa fa-link"></i></a></li>
                                    </ul>
                                </div>
                            </div><!-- Portfolio Box -->
                        </div>
                        <div class="col-md-4">
                            <div class="mini-portfolio">
                                <img alt="" src="http://placehold.it/270x345">
                                <div class="portfolio-info">
                                    <span>Design</span>
                                    <h3>We are Creative for Creative</h3>
                                    <ul>
                                        <li><a title="" href="#"><i class="fa fa-search"></i></a></li>
                                        <li><a title="" href="#"><i class="fa fa-link"></i></a></li>
                                    </ul>
                                </div>
                            </div><!-- Portfolio Box -->
                        </div>
                        <div class="col-md-4">
                            <div class="mini-portfolio">
                                <img alt="" src="http://placehold.it/270x345">
                                <div class="portfolio-info">
                                    <span>Design</span>
                                    <h3>Best way to make Multi purpose</h3>
                                    <ul>
                                        <li><a title="" href="#"><i class="fa fa-search"></i></a></li>
                                        <li><a title="" href="#"><i class="fa fa-link"></i></a></li>
                                    </ul>
                                </div>
                            </div><!-- Portfolio Box -->
                        </div>
                    </div>
                </div>
                <ul class="pagination">
                    <li class="disabled"><a title="" href="#"><span>NEXT</span></a></li>
                    <li><a title="" href="#">1</a></li>
                    <li class="active"><a title="" href="#">2</a></li>
                    <li><a title="" href="#">3</a></li>
                    <li><a title="" href="#"><span>PREV</span></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>