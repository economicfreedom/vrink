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
                                <a href="/" title="">
                                    <i class="fa fa-get-pocket"></i>
                                    <span>VRINK</span>
                                    <strong>승철이</strong>
                                </a>
                            </div><!-- LOGO -->
                            <p>WELCOME TO 승철 WOULD</p>
                            <div>
                                <h4>로그인</h4>
                                <div class="field">
                                    <input type="text" class="sign-in-email" placeholder="Username"/>
                                </div>
                                <div class="field">
                                    <input type="password" class="sign-in-password" placeholder="Password"/>
                                </div>
                                <div class="field">
                                    <div class="flat-btn-div">
                                        <input type="button" id="sign-in-btn" value="로그인" class="flat-btn"/>
                                    </div>
                                </div>
                            </div>
                            <i>또는</i>
                            <span>LOGIN WITH</span>
                            <div class="kakao-login-div">
	                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=3054fe89635c5de07719fe9908728827&redirect_uri=http://localhost/kakao/sign-in&response_type=code">
	                            	<img alt="카카오 로그인" src="/images/kakao_login_small.png">
	                            </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="registration-sec">
                            <h3>VRINK</h3>
                            <p>WELCOME TO 승철 WOULD.</p>
                            <div class="common-sign-up">
                                <div class="field">
                                    <div class="check-div">
                                        <input type="text" placeholder="이메일" class="email-input" />
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
                                <div class="field">
                                    <div class="flat-btn-div">
		                                <input type="button" value="회원가입"class="flat-btn" id="sign-up-btn" />
                                    </div>
                                </div>
                            </div>
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
                    <a href="/" title="">
                        <i class="fa fa-get-pocket"></i>
                        <span>VRINK</span>
                        <strong>승철이</strong>
                    </a>
                </div><!-- LOGO -->
                <c:if test="${not empty USER}">
                    <div class="dropdown-alarm popup-alarm list-group" id="dropdown-alarm">
                        <span style="padding: 13px;"><i class="fa fa-bell"></i> </span>
                        <div class="dropdown-alarm-content" style="overflow: auto; max-height: 200px">
                            <!-- 여기에 알림 목록을 표시하는 코드를 넣으세요. -->
                            <c:if test="${empty messageList}">
                                <h4>알림이 없습니다.</h4>
                            </c:if>
                            <c:forEach items="${messageList}" var="message" varStatus="varstat">
                                <a href="#" class="list-group-item" onclick="checkAlarm(${message.messageId}, '${message.url}')"><span style="float:left; font-weight: bold; margin-right: 5px">${varstat.count}.</span> ${message.content} <span style="float: right">${message.createdAt}</span></a>
                            </c:forEach>
                        </div>
                        <!-- 알림 개수를 표시할 배지 -->
                        <c:if test="${not empty messageList}">
                            <div class="notification-badge" id="notification-badge">${messageList.size()}</div>
                        </c:if>
                    </div>
                </c:if>

                <div>
                    <div class="popup-client">
                        <span class="log-in-btn"><i class="fa fa-user"></i> /  로그인</span>
                    </div>
                    <div class="logout-div">
                        <span class="log-out-btn" style="display: none">로그아웃</span>
                    </div>
                    <c:if test="${USER.level == 1}">
                        <div class="go-admin-div" style="margin-right: -60px;">
                            <a href="${pageContext.request.contextPath}/admin/main" style="text-decoration: none; color: white;"><span class="go-admin-btn">관리자 홈</span></a>
                        </div>
                    </c:if>
                </div>
                <span class="menu-toggle"><i class="fa fa-bars"></i></span>
                <nav style="float: none; margin: 0 auto; background-color: #ff2929">
                    <ul style="margin-left: 15px">
                        <li class="menu-item-has-children">
                            <a class="menu-title" href="/editor/list" title="">작가</a>
                            <ul>
                                <c:if test="${not empty EDITOR_ID}">
                                    <li><a href="/editor/editor-detail/${EDITOR_ID}" title="">내 소개</a></li>
                                </c:if>
                                <li><a href="/editor/list" title="">둘러보기</a></li>
                                <c:if test="${not empty USER && empty EDITOR_ID}">
                                    <li><a href="/editor/apply-form" title="">작가 신청하기</a></li>
                                </c:if>
                                <c:if test="${not empty EDITOR_ID}">
                                    <li><a href="/editor/editor-price?editor-id=${EDITOR_ID}" title="">가격 설정하기</a></li>
                                </c:if>
                            </ul>
                        </li>

                        <li class="menu-item-has-children">
                            <a class="menu-title" href="" title="">의뢰 하기</a>
                            <ul>
                                <li><a href="/suggest/list" title="">보러가기</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a class="menu-title" href="#" title="">자유게시판</a>
                            <ul>
                                <li><a href="/board/board-list" title="">보러가기</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a class="menu-title" href="#" title="">공지사항</a>
                            <ul>
                                <li><a href="/notice/notice-list" title="">보러가기</a></li>
                            </ul>
                        </li>
                        <li id="my-info-list" class="menu-item-has-children">
                            <a class="menu-title" href="contact.html" title="">MY PAGE</a>
                            <ul>
                                <li><a href="/user/my-page" title="">내 정보</a></li>
                                <li><a href="/user/change-password" title="">비밀번호 변경</a></li>
                                <li><a href="/qna/list" title="">내 문의 내용</a></li>
                                <li id="only-editor"><a href="/editor/calculate/point" title="">정산</a></li>
                                <li><a href="/follow/follow-list/${USER.userId}" title="">관심 작가</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>
    </header>
    <!-- Top bar -->
</div>
<script type="text/javascript">
    let authEmailNumber = null; // 함수 밖의 변수
    
    $('.sign-in-user-flag').val() == '' ? $('#my-info-list').css("display", "none") : $('#my-info-list').css("display", "block");
    if($('.sign-in-user-flag').val() !== '') {
    	$('.log-in-btn').css("display", "none");
    } 
    if($('.sign-in-user-flag').val() !== '') {
    	$('.log-out-btn').css("display", "block");
    } 

    $('.email-check-btn').on('click', function () {
        let email = $('.email-input').val();
        emailCheck(email);
    });

    async function emailCheck(email) {
        try {
            let result = await fetch("http://localhost/user/check-email/" + email);
            let todo = await result.json();

            if (todo === 0) {
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
        $('.auth-email-check-btn').on('click', function () {
            console.log('check');
            if (authEmailNumber != $('.auth-email-input').val()) {
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

    $('.password-input').change(function () {
        console.log($('.password-input').val());
        $('.password-check-flag').val('1');
    });
    $('.password-check-input').change(function () {
        console.log($('.password-check-input').val());
        if ($('.password-input').val() != $('.password-check-input').val()) {
            alert('비밀번호가 서로 다릅니다.');
            $('.password-check-flag').val('1');
            return;
        }
        $('.password-check-flag').val('0');
    });

    $('#sign-up-btn').on('click', function () {
        if ($('.email-input').val().trim() == '' || $('.password-input').val().trim() == '' || $('.name-input').val().trim() == ''
            || $('.nickname-input').val().trim() == '' || $('.phone-input').val().trim() == '') {
            alert('모든 값을 입력해주세요.');
            return;
        }
        if ($('.email-check-result').val() != '0') {
            alert('이메일 중복체크를 진행해주세요.');
            return;
        }
        if ($('.password-check-flag').val() != '0') {
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
            .then(response => {
                if (response.ok) {
                    alert("회원가입이 완료되었습니다.");
                    location.reload();
                } else {
                    alert("회원가입 실패");
                    location.reload();
                }
            })
            .then(data =>
                console.log(data)
            )
            .catch(error => console.error('Error:', error));
    });
    
    $('#sign-in-btn').on('click', function() {
    	if($('.sign-in-email').val().trim() == '' || $('.sign-in-password').val().trim() == '') {
    		alert('아이디 또는 비밀번호를 입력해주세요');
    		return;
    	}
    	
    	fetch('http://localhost/user/sign-in', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email: $('.sign-in-email').val(),
                password: $('.sign-in-password').val()
            })
        })
            .then(response => {
                if (response.ok) {
                    location.reload();
                } else {
                    alert("로그인 실패");
                    return;
                }
            })
            .then(data =>
                console.log(data)
            )
            .catch(error => console.error('Error:', error));
    });

    function checkAlarm(messageId, URL) {
        fetch('http://localhost/message/check-message', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'messageId': messageId
            }
        })
            .then(response => {
                if (response.ok) {
                    location.replace(URL);
                }
            })
            .catch(error => console.error('Error:', error));
    }

    $(document).ready(function () {
        var dropdown = document.getElementById("dropdown-alarm");
        dropdown.addEventListener("click", function() {
            dropdown.classList.toggle("active");
            if (dropdown.classList.contains("active")) {
                // 알림 팝업이 열릴 때, 알림 개수를 초기화
                // $("#notification-badge").css("display", "none");
            }
        });

        var body = document.getElementById("main-body");
        body.addEventListener("click", function() {
            if (dropdown.classList.contains("active")) {
                dropdown.classList.toggle("active");
            }
        });
    })

</script>
<body>
<section id="main-body" style="min-height: calc(100vh - 204px);">