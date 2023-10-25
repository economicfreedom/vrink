
	<footer>
		<section class="block">
			<div data-velocity="-.2" style="background: url(http://placehold.it/1500x1100) repeat scroll 50% 422.28px transparent;" class="parallax scrolly-invisible no-parallax blackish"></div><!-- PARALLAX BACKGROUND IMAGE -->	
			<div class="container">
				<div class="row">
					<div class="col-md-3 column">
						<div class="about_widget widget">
							<div class="logo">
								<a href="#" title="">
									<i class="fa fa-get-pocket"></i>
									<span>MUSHI</span>
									<strong>Innovation is here</strong>
								</a>
							</div><!-- LOGO -->
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum.</p>
							<ul class="social-btns">
								<li><a href="#" title=""><i class="fa fa-facebook"></i></a></li>
								<li><a href="#" title=""><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#" title=""><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#" title=""><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#" title=""><i class="fa fa-twitter"></i></a></li>
								<li><a href="#" title=""><i class="fa fa-tumblr"></i></a></li>
							</ul>
							<span><i class="fa fa-envelope"></i>examplecompany@gmail.com</span>
							<span><i class="fa fa-phone"></i>0900 (23456366)</span>
							<span><i class="fa fa-location-arrow"></i>4465 Washington Avenue De Pere, WI 54115</span>
						</div>
					</div>
					<div class="col-md-3 column">
						<div class="flickr_widget widget">
							<div class="heading1">
								<h2><span>FliCKR</span> Stream</h2>
							</div><!-- heading -->
							<div class="flickr_images">
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<a href="#" title=""><img src="http://placehold.it/91x91" alt="" /></a>
								<span>Follow <a href="#" title="">@mushithemes</a></span>
							</div>
						</div><!-- Flickr Widget -->
					</div>
					<div class="col-md-3 column">
						<div class="links_widget widget">
							<div class="heading1">
								<h2><span>Useful</span> links</h2>
							</div><!-- heading -->
							<ul>
								<li><a href="#" title=""><i class="fa fa-angle-right"></i> Home</a></li>
								<li><a href="#" title=""><i class="fa fa-angle-right"></i> About us</a></li>
								<li><a href="#" title=""><i class="fa fa-angle-right"></i> Services</a></li>
								<li><a href="#" title=""><i class="fa fa-angle-right"></i> Contact</a></li>
								<li><a href="#" title=""><i class="fa fa-angle-right"></i> Portfolio</a></li>
								<li><a href="#" title=""><i class="fa fa-angle-right"></i> Faq's</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 column">
						<div class="subscribe_widget widget">
							<div class="heading1">
								<h2><span>Subscribe</span> Us</h2>
							</div><!-- heading -->
							<p>Positioning the closest positioned for abs positioning</p>
							<form>
								<label><i class="fa fa-envelope"></i><input type="text" placeholder="YOUR NAME" /></label>
								<label><i class="fa fa-pencil"></i><input type="text" placeholder="TYPE YOUR EMAIL" /></label>
								<button type="submit" class="flat-btn">SUBSCRIBE</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
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

</div>

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