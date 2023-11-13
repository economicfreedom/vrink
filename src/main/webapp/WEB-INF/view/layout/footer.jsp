<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
</section>

<footer>
    <div class="bottom-line">
        <div class="container">
				<span>COMPANY INFO
                    <br>
대표자 : 최규하
                    <br>
사업자등록번호 : 00-000-000-00
                    <br>
통신판매업신고 : 2023-부산-422호
                    <br>
주소 : 부산광역시 부산진구 중앙대로 749 4층 422호
 </span>
            <ul>

            </ul>
        </div>
    </div>
</footer>

<!-- Script -->
<script type="text/javascript" src="/js/modernizr.js"></script>
<!-- Modernizer -->
<script type="text/javascript" src="/js/jquery-2.1.1.js"></script>
<!-- Jquery -->
<script type="text/javascript" src="/js/script.js"></script>
<!-- Script -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="/js/owl.carousel.min.js"></script>
<!-- Owl Carousal -->
<script type="text/javascript" src="/js/html5lightbox.js"></script>
<!-- HTML -->
<script type="text/javascript" src="/js/scrolltopcontrol.js"></script>
<!-- ScrolltoTop -->
<script type="text/javascript" src="/js/scrolly.js"></script>
<!-- Parallax -->
<script type="text/javascript" src="/js/jquery.poptrox.min.js"></script>
<!-- Popup -->
<script type="text/javascript">
    $(document).ready(function () {
        "use strict";

        $(function () {
            $('#toggle-widget .content').hide();
            $('#toggle-widget h2:first').addClass('active').next().slideDown('slow');
            $('#toggle-widget h2').on("click", function () {
                if ($(this).next().is(':hidden')) {
                    $('#toggle-widget h2').removeClass('active').next().slideUp('slow');
                    $(this).toggleClass('active').next().slideDown('slow');
                }
            });
        });

        $(".carousel-client").owlCarousel({
            autoplay: true,
            autoplayTimeout: 3000,
            smartSpeed: 2000,
            loop: false,
            dots: false,
            nav: true,
            margin: 30,
            items: 5,
            singleItem: true
        });


        $(function () {
            var foo = $('.mini-gallery');
            foo.poptrox({
                usePopupCaption: true
            });
        });

    });
</script>

</body>
</html>
