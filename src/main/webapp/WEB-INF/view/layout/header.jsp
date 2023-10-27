<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VRINK</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"/><!-- Bootstrap -->
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css"/><!-- Icons -->
    <link rel="stylesheet" href="/css/owl.carousel.css" type="text/css"/><!-- Owl Carousal -->

    <link rel="stylesheet" href="/css/style.css" type="text/css"/><!-- Style -->
    <link rel="stylesheet" href="/css/responsive.css" type="text/css"/><!-- Responsive -->
    <link rel="stylesheet" href="/css/colors/colors.css" type="text/css"/><!-- color -->

</head>

<div class="theme-layout">

    <div class="account-popup-sec">
        <div class="account-popup-area">
            <div class="account-popup">
                <div class="row">
                    <div class="col-md-6">
                        <div class="account-user">
                            <div class="logo">
                                <a href="#" title="">
                                    <i class="fa fa-get-pocket"></i>
                                    <span>VRINK</span>
                                    <strong>승철이</strong>
                                </a>
                            </div><!-- LOGO -->
                            <p>WELCOME TO 승철 WOULD</p>
                            <form>
                                <h4>로그인</h4>
                                <div class="field">
                                    <input type="text" placeholder="Username"/>
                                </div>
                                <div class="field">
                                    <input type="password" placeholder="Password"/>
                                </div>
                                <div class="field">
                                    <input type="submit" value="로그인" class="flat-btn"/>
                                </div>
                            </form>
                            <i>또는</i>
                            <span>LOGIN WITH</span>
                            <ul class="social-btns">
                                <li><a href="#" title=""><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title=""><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#" title=""><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="registration-sec">
                            <h3>VRINK</h3>
                            <p>WELCOME TO 승철 WOULD.</p>
                            <form>
                                <div class="field">
	                                <div class="email-check-div">
	                                    <input type="text" placeholder="이메일" class="email-input"/>
	                                    <input type="button" value="중복확인" class="email-check-btn" id="email-btn"/>
	                                    <input type="hidden" class="email-check-result"/>
	                                </div>
                                </div>
                                <div class="field" id="auth-email-div">
                                
                                </div>
                                <div class="field">
                                    <input type="password" placeholder="비밀번호" class="password-input"/>
                                </div>
                                <div class="field">
                                    <input type="password" placeholder="비밀번호 확인" class="password-check-input"/>
                                    <input type="hidden" class="password-check-flag" value="1"/>
                                </div>
                                <div class="field">
                                    <input type="text" placeholder="이름" class="name-input"/>
                                    <input type="hidden" class="name-check-flag" value="1"/>
                                </div>
                                <div class="field">
                                    <input type="text" placeholder="닉네임" class="nickname-input"/>
                                    <input type="hidden" class="nickname-check-flag" value="1"/>
                                </div>
                                <div class="field">
                                    <input type="text" placeholder="휴대폰번호" class="phone-input"/>
                                    <input type="hidden" class="phone-check-flag" value="1"/>
                                </div>
                                
                                <input type="button" value="회원가입" id="sign-up-btn" class="flat-btn"/>
                            </form>
                        </div><!-- Registration sec -->
                    </div>
                </div>
                <span class="close-popup"><i class="fa fa-close"></i></span>
            </div>
        </div>
    </div><!-- Account Popup Sec -->
    <header class="simple-header for-sticky">

        <div class="menu">
            <div class="container">
                <div class="logo">
                    <a href="#" title="">
                        <i class="fa fa-get-pocket"></i>
                        <span>VRINK</span>
                        <strong>승철이</strong>
                    </a>
                </div><!-- LOGO -->
                <div class="popup-client">
                    <span><i class="fa fa-user"></i> /  Signup</span>
                </div>
                <span class="menu-toggle"><i class="fa fa-bars"></i></span>
                <nav style="float: none; margin: 0 auto;">
                    <ul >

                        <li class="menu-item-has-children mega">
                            <a href="#" title="">PAGES</a>
                            <ul>
                                <li><a href="about.html" title="">About Us</a></li>
                                <li><a href="branch.html" title="">Branch 3 Col</a></li>
                                <li><a href="branch2.html" title="">Branch 2 Col</a></li>
                                <li><a href="branch3.html" title="">Branch Sidebar</a></li>
                                <li><a href="branch4.html" title="">Branch Wide</a></li>
                                <li><a href="comming-soon.html" title="">Coming Soon Dark</a></li>
                                <li><a href="comming-soon2.html" title="">Coming Soon Light</a></li>
                                <li><a href="gallery.html" title="">Gallery Fancy 1</a></li>
                                <li><a href="gallery2.html" title="">Gallery Fancy 2</a></li>
                                <li><a href="gallery3.html" title="">Gallery Fancy 3</a></li>
                                <li><a href="gallery4.html" title="">Simple Gallery 1</a></li>
                                <li><a href="gallery5.html" title="">Simple Gallery 2</a></li>
                                <li><a href="gallery6.html" title="">Simple Gallery 3</a></li>
                                <li><a href="contact.html" title="">Contact Us</a></li>
                                <li><a href="error.html" title="">404 Error v1</a></li>
                                <li><a href="error2.html" title="">404 Error v2</a></li>
                                <li><a href="faq.html" title="">FAQ</a></li>
                                <li><a href="price-table.html" title="">Price Table</a></li>
                                <li><a href="search.html" title="">Search Result</a></li>
                                <li><a href="team.html" title="">Team 3 Col</a></li>
                                <li><a href="team2.html" title="">Team Sidebar </a></li>
                                <li><a href="team3.html" title="">Team 2 Col</a></li>
                                <li><a href="header-dark.html" title="">Header Dark</a></li>
                                <li><a href="header-light.html" title="">Header Light</a></li>
                                <li><a href="footer-light.html" title="">Footer Light</a></li>
                                <li><a href="footer-dark.html" title="">Footer Dark</a></li>
                                <li>
                                    <a href="http://themeforest.net/item/VRINK-the-multipurpose-responsive-html5-template/14915795?ref=themenum"
                                       title="">Buy VRINK Now</a></li>
                            </ul>
                        </li>

                        <li class="menu-item-has-children">
                            <a href="#" title="">BLOG</a>
                            <ul>
                                <li><a href="blog.html" title="">Blog</a></li>
                                <li><a href="blog-sidebar.html" title="">Blog Sidebar</a></li>
                                <li><a href="blog-wide.html" title="">Blog Wide</a></li>
                                <li><a href="single-post.html" title="">Single Post</a></li>
                                <li><a href="single-post2.html" title="">Single Post 2</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#" title="">PORTFOLIO</a>
                            <ul>
                                <li><a href="portfolio.html" title="">Portfolio</a></li>
                                <li><a href="portfolio2.html" title="">Portfolio 2</a></li>
                                <li><a href="portfolio3.html" title="">Portfolio 3</a></li>
                                <li><a href="portfolio4.html" title="">Portfolio 4</a></li>
                                <li><a href="portfolio-single.html" title="">Portfolio Single</a></li>
                                <li><a href="portfolio-single2.html" title="">Portfolio Single 2</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#" title="">EVENTS</a>
                            <ul>
                                <li><a href="event.html" title="">Event</a></li>
                                <li><a href="event2.html" title="">Event 2</a></li>
                                <li><a href="event3.html" title="">Event 3</a></li>
                                <li><a href="event4.html" title="">Event 4</a></li>
                                <li><a href="event-single.html" title="">Event Single</a></li>
                                <li><a href="event-single2.html" title="">Event Single 2</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html" title="">CONTACT</a></li>
                    </ul>
                </nav>

            </div>
        </div>
    </header>
    <div class="top-bar">
            <div class="container">

                <ul class="contact-item">
                    <li><i class="fa fa-envelope-o"></i>yourcompnay@email.com</li>
                    <li><i class="fa fa-mobile"></i>+7 998 71 150 / +7 998 30 20</li>
                </ul>

                <div class="choose-language">
                    <a href="#" title="">FR</a>
                    <a href="#" title="">PO</a>
                    <a href="#" title="">DE</a>
                    <a href="#" title="">EN</a>
                </div>
            </div>
        </div><!-- Top bar -->
</div>
<script type="text/javascript">
	let authEmailNumber = null; // 함수 밖의 변수


	$('.email-check-btn').on('click',function() {
		let email = $('.email-input').val();
		emailCheck(email);
	});
	
    async function emailCheck(email) {
        try {
            let result = await fetch("http://localhost/user/check-email/" + email);
            let todo = await result.json();
            
            if(todo === 0) {
            	alert('메일로 인증번호가 발송되었습니다.');
            	authEmailNumber = sendEmail(email);
            	console.log(authEmailNumber);
            	$('.email-input').attr('readonly', true);
            	$('.email-check-btn').attr('disabled', true);
            	$('.email-check-btn').css('background-color', "grey");
            	$('#auth-email-div').append('<input type="text" placeholder="인증번호" class="auth-email-input"/>');
            	$('#auth-email-div').append('<input type="button" value="인증확인" class="auth-email-check-btn" id="email-btn"/>');
            	checkNum();
            } else {
            	alert('이미 존재하는 아이디입니다.');
            	$('.email-check-result').val('1');
            }
        } catch (error) {
            console.log(error);
        }
    }

    async function sendEmail(email) {
        try {
            const response = await fetch('http://localhost/mail/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    mail: email
                })
            });

            const data = await response.json();
            authEmailNumber = data; // 외부 변수에 값을 할당

        } catch (error) {
            console.error('Error:', error);
        }

        console.log("External Data:", authEmailNumber);
    }
    
    function checkNum() {
    	$('.auth-email-check-btn').on('click',function() {
    		console.log('check');
    		if(authEmailNumber != $('.auth-email-input').val()) {
    			alert('인증번호가 다릅니다.');
    			return;
    		}
    		alert('인증이 완료되었습니다.');
    		$('.auth-email-input').attr('readonly', true);
        	$('.auth-email-check-btn').attr('disabled', true);
        	$('.auth-email-check-btn').css('background-color', "grey");
        	$('.email-check-result').val('0');
    	});
	
    }
	
    $('.password-input').change(function() {
    	console.log($('.password-input').val());
    	$('.password-check-flag').val('1');
    });
    $('.password-check-input').change(function() {
    	console.log($('.password-check-input').val());
    	if($('.password-input').val() != $('.password-check-input').val()) {
    		alert('비밀번호가 서로 다릅니다.');
	    	$('.password-check-flag').val('1');
    		return;
    	}
    	$('.password-check-flag').val('0');
    });
    
    $('#sign-up-btn').on('click', function() {
    	if($('.email-input').val().trim() == ''|| $('.password-input').val().trim() == '' || $('.name-input').val().trim() == ''
    			|| $('.nickname-input').val().trim() == '' || $('.phone-input').val().trim() == '') {
    		alert('모든 값을 입력해주세요.');
    		return;
    	}
    	if($('.email-check-result').val() != '0') {
    		alert('이메일 중복체크를 진행해주세요.');
    		return;
    	}
    	if($('.password-check-flag').val() != '0') {
    		alert('비밀번호가 서로 다릅니다.');
    		return;
    	}
    		
    	fetch('http://localhost/user/sign-up', {
    		  method: 'POST',
    		  headers: {
    		    'Content-Type': 'application/json'
    		  },
    		  body: JSON.stringify({
    		    email: $('.email-input').val(),
    		    password: $('.password-input').val(),
    		    name: $('.name-input').val(),
    		    nickname: $('.nickname-input').val(),
    		    phone: $('.phone-input').val()
    		  })
    		})
    		.then(response =>{ 
    		if(response.ok){
    			alert("회원가입이 완료되었습니다.");
    			location.reload();
    		}else{
    			alert("회원가입 실패");
    			location.reload();
    		}
    		})
    		.then(data => 
    		console.log(data)
    		
    		)
    		.catch(error => console.error('Error:', error));
    });
    
</script>
<body>
<section style="min-height: calc(100vh - 204px);">