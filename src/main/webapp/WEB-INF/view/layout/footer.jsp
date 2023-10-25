
</section>

	<footer>
		<div class="bottom-line">
			<div class="container">
				<span>Copyright All Right Reserved 2015 <a href="#" title="">Numberstheme</a></span>
				<ul>
					<li><a title="" href="#">HOME</a></li>
					<li><a title="" href="#">ABOUT</a></li>
					<li><a title="" href="#">PORTFOLIO</a></li>
					<li><a title="" href="#">EVENTS</a></li>
					<li><a title="" href="#">BLOG</a></li>
					<li><a title="" href="#">CONTACT</a></li>
				</ul>
			</div>
		</div>
	</footer>

<!-- Script -->
<script type="text/javascript" src="/js/modernizr.js"></script><!-- Modernizer -->
<script type="text/javascript" src="/js/jquery-2.1.1.js"></script><!-- Jquery -->
<script type="text/javascript" src="/js/script.js"></script><!-- Script -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script><!-- Bootstrap -->
<script type="text/javascript" src="/js/owl.carousel.min.js"></script><!-- Owl Carousal -->
<script type="text/javascript" src="/js/html5lightbox.js"></script><!-- HTML -->
<script type="text/javascript" src="/js/scrolltopcontrol.js"></script><!-- ScrolltoTop -->
<script type="text/javascript" src="/js/scrolly.js"></script><!-- Parallax -->
<script type="text/javascript" src="/js/jquery.poptrox.min.js"></script><!-- Popup -->

<script type="text/javascript">
	$(document).ready(function() {
		"use strict";
		
	$(function() {
		$('#toggle-widget .content').hide();
		$('#toggle-widget h2:first').addClass('active').next().slideDown('slow');
		$('#toggle-widget h2').on("click", function(){
		if($(this).next().is(':hidden')) {
		$('#toggle-widget h2').removeClass('active').next().slideUp('slow');
		$(this).toggleClass('active').next().slideDown('slow');
		}
		});
	});

	$(".carousel-client").owlCarousel({
		autoplay:true,
		autoplayTimeout:3000,
		smartSpeed:2000,
		loop:false,
		dots:false,
		nav:true,
		margin:30,
		items:5,
		singleItem:true
	});


	$(function() {
		var foo = $('.mini-gallery');
		foo.poptrox({
		usePopupCaption: true
		});
	});

	});
</script>

</body>
</html>