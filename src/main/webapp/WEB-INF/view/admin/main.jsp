<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<h3 class="mt-4"><i class="fa-solid fa-users"></i> 사용자 정보</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">User Information</li>
</ol>
<div class="row">

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    User Count
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cUserSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cUserWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cUserMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="all-user-seven"></canvas>
                    <canvas id="all-user-week"></canvas>
                    <canvas id="all-user-month"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    Buyer/Seller Count
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cEditorSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cEditorWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cEditorMonth()">월별</button>
                </div>
            </div>
            <div class="card-body" style=" display: flex; justify-content: center; align-items: center;">
                <div style="width: 250px; height: 300px; margin-top: -20px;">
                    <span style="left: 140px;
                        top: 26px;
                        position: relative;
                        font-size: 13px;
                        color: #666666;"
                    >: ${standardNum}명</span>
                    <span style="left: 83px;
                        top: 48px;
                        position: relative;
                        font-size: 13px;
                        color: #666666;"
                    >: ${editorNum}명</span>
                    <span style="left: 26px;
                        top: 70px;
                        position: relative;
                        font-size: 13px;
                        color: #666666;"
                    >: ${enabledNum}명</span>
                    <canvas id="buyer-seller"></canvas>
                </div>
                <div style="width: 500px; height: 300px; position: relative; top: 15px;">
                    <canvas id="editor-seven"></canvas>
                    <canvas id="editor-week" style="display: none;"></canvas>
                    <canvas id="editor-month" style="display: none;"></canvas>
                </div>
            </div>
        </div>
    </div>

</div>

<h3 class="mt-4"><i class="fa-solid fa-sack-dollar"></i> 사이트 수익</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Revenue Total</li>
</ol>

<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    Banner Count
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cBannerSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cBannerWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cBannerMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="banner-seven"></canvas>
                    <canvas id="banner-week"></canvas>
                    <canvas id="banner-month"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    Banner Revenue
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cBannerPriceSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cBannerPriceWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cBannerPriceMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="banner-price-seven"></canvas>
                    <canvas id="banner-price-week"></canvas>
                    <canvas id="banner-price-month"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    Calculator Count
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cCalculatorSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cCalculatorWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cCalculatorMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="calculator-seven"></canvas>
                    <canvas id="calculator-week"></canvas>
                    <canvas id="calculator-month"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    Calculator Revenue
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cCalculatorPriceSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cCalculatorPriceWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cCalculatorPriceMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="calculator-price-seven"></canvas>
                    <canvas id="calculator-price-week"></canvas>
                    <canvas id="calculator-price-month"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>


<h3 class="mt-4"><i class="fa-solid fa-clipboard-list"></i> 게시판 정보</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Community Information</li>
</ol>
<div class="row">

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    FreeBoard Count
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cFreeBoardSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cFreeBoardWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cFreeBoardMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="all-freeBoard-seven"></canvas>
                    <canvas id="all-freeBoard-week"></canvas>
                    <canvas id="all-freeBoard-month"></canvas>
                </div>
            </div>
        </div>
    </div>


    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fa-solid fa-chart-column"></i>
                    SuggestBoard Count
                </div>
                <div class="btn-group" role="group" aria-label="카테고리 선택">
                    <button type="button" class="btn btn-secondary" onclick="cSuggestSeven()">일별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cSuggestWeek()">주별</button>
                    <span class="btn-divider" style=""></span>
                    <button type="button" class="btn btn-secondary" onclick="cSuggestMonth()">월별</button>
                </div>
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="all-suggest-seven"></canvas>
                    <canvas id="all-suggest-week"></canvas>
                    <canvas id="all-suggest-month"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const buyerSeller = document.getElementById('buyer-seller');
    const freeBoard = document.getElementById('free-board');
    const suggestBoard = document.getElementById('suggest-board');

    // ------------------------------------- 가입자 차트 일/주/월 --------------------------------------

    const allUserSeven = document.getElementById('all-user-seven');
    let allUserWeek = null;
    let allUserMonth = null;

    new Chart(allUserSeven, {
        type   : 'bar',
        data   : {
            labels  : [
                <c:forEach items="${userSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label          : ' 일별 가입자 수',
                data           : [
                    <c:forEach items="${userSevenDate}" var="date">
                    '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${userSevenDate.size()}" step="7">
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)',
                    </c:forEach>
                ],
                borderColor    : [
                    <c:forEach var="i" begin="1" end="${userSevenDate.size()}" step="7">
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)',
                    </c:forEach>
                ],
                borderWidth    : 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cUserSeven() {
        allUserSeven.style.display = 'block'; // seven 보여주기
        if (allUserWeek) {
            allUserWeek.style.display = 'none'; // week 숨기기
        }
        if (allUserMonth) {
            allUserMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cUserWeek() {

        if (allUserWeek) {
            allUserSeven.style.display = 'none';
            allUserWeek.style.display = 'block';
            if (allUserMonth) {
                allUserMonth.style.display = 'none';
            }
        } else {
            allUserSeven.style.display = 'none';
            if (allUserMonth) {
                allUserMonth.style.display = 'none';
            }
            allUserWeek = document.getElementById('all-user-week');
            new Chart(allUserWeek, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${userWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 주별 가입자 수',
                        data           : [
                            <c:forEach items="${userWeekDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${userWeekDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${userWeekDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cUserMonth() {

        if (allUserMonth) {
            allUserSeven.style.display = 'none'; // seven 보여주기
            if (allUserWeek) {
                allUserWeek.style.display = 'none'; // seven 보여주기
            }
            allUserMonth.style.display = 'block'; // month 숨기기
        } else {
            allUserSeven.style.display = 'none'; // seven 보여주기
            if (allUserWeek) {
                allUserWeek.style.display = 'none'; // seven 보여주기
            }
            allUserMonth = document.getElementById('all-user-month');
            new Chart(allUserMonth, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${userMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 월별 가입자 수',
                        data           : [
                            <c:forEach items="${userMonthDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${userMonthDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${userMonthDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 가입자 차트 일/주/월 --------------------------------------


    // ------------------------------------- 자게 차트 일/주/월 --------------------------------------

    const allFreeBoardSeven = document.getElementById('all-freeBoard-seven');
    let allFreeBoardWeek = null;
    let allFreeBoardMonth = null;

    new Chart(allFreeBoardSeven, {
        type   : 'bar',
        data   : {
            labels  : [
                <c:forEach items="${freeBoardSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label          : ' 일별 자유게시판 게시글 수',
                data           : [
                    <c:forEach items="${freeBoardSevenDate}" var="date">
                    '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${freeBoardSevenDate.size()}" step="7">
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)',
                    </c:forEach>
                ],
                borderColor    : [
                    <c:forEach var="i" begin="1" end="${freeBoardSevenDate.size()}" step="7">
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)',
                    </c:forEach>
                ],
                borderWidth    : 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cFreeBoardSeven() {
        allFreeBoardSeven.style.display = 'block'; // seven 보여주기
        if (allFreeBoardWeek) {
            allFreeBoardWeek.style.display = 'none'; // week 숨기기
        }
        if (allFreeBoardMonth) {
            allFreeBoardMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cFreeBoardWeek() {

        if (allFreeBoardWeek) {
            allFreeBoardSeven.style.display = 'none';
            allFreeBoardWeek.style.display = 'block';
            if (allFreeBoardMonth) {
                allFreeBoardMonth.style.display = 'none';
            }
        } else {
            allFreeBoardSeven.style.display = 'none';
            if (allFreeBoardMonth) {
                allFreeBoardMonth.style.display = 'none';
            }
            allFreeBoardWeek = document.getElementById('all-freeBoard-week');
            new Chart(allFreeBoardWeek, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${freeBoardWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 주별 자유게시판 게시글 수',
                        data           : [
                            <c:forEach items="${freeBoardWeekDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${freeBoardWeekDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${freeBoardWeekDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cFreeBoardMonth() {

        if (allFreeBoardMonth) {
            allFreeBoardSeven.style.display = 'none'; // seven 보여주기
            if (allFreeBoardWeek) {
                allFreeBoardWeek.style.display = 'none'; // seven 보여주기
            }
            allFreeBoardMonth.style.display = 'block'; // month 숨기기
        } else {
            allFreeBoardSeven.style.display = 'none'; // seven 보여주기
            if (allFreeBoardWeek) {
                allFreeBoardWeek.style.display = 'none'; // seven 보여주기
            }
            allFreeBoardMonth = document.getElementById('all-freeBoard-month');
            new Chart(allFreeBoardMonth, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${freeBoardMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 월별 자유게시판 게시글 수',
                        data           : [
                            <c:forEach items="${freeBoardMonthDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${freeBoardMonthDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${freeBoardMonthDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 자게 차트 일/주/월 --------------------------------------

    // ------------------------------------- 의뢰게시판 차트 일/주/월 --------------------------------------

    const allSuggestSeven = document.getElementById('all-suggest-seven');
    let allSuggestWeek = null;
    let allSuggestMonth = null;

    new Chart(allSuggestSeven, {
        type   : 'bar',
        data   : {
            labels  : [
                <c:forEach items="${suggestSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label          : ' 일별 의뢰게시판 게시글 수',
                data           : [
                    <c:forEach items="${suggestSevenDate}" var="date">
                    '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${suggestSevenDate.size()}" step="7">
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)',
                    </c:forEach>
                ],
                borderColor    : [
                    <c:forEach var="i" begin="1" end="${suggestSevenDate.size()}" step="7">
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)',
                    </c:forEach>
                ],
                borderWidth    : 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cSuggestSeven() {
        allSuggestSeven.style.display = 'block'; // seven 보여주기
        if (allSuggestWeek) {
            allSuggestWeek.style.display = 'none'; // week 숨기기
        }
        if (allSuggestMonth) {
            allSuggestMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cSuggestWeek() {

        if (allSuggestWeek) {
            allSuggestSeven.style.display = 'none';
            allSuggestWeek.style.display = 'block';
            if (allSuggestMonth) {
                allSuggestMonth.style.display = 'none';
            }
        } else {
            allSuggestSeven.style.display = 'none';
            if (allSuggestMonth) {
                allSuggestMonth.style.display = 'none';
            }
            allSuggestWeek = document.getElementById('all-suggest-week');
            new Chart(allSuggestWeek, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${suggestWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 주별 의뢰게시판 게시글 수',
                        data           : [
                            <c:forEach items="${suggestWeekDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${suggestWeekDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${suggestWeekDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cSuggestMonth() {

        if (allSuggestMonth) {
            allSuggestSeven.style.display = 'none'; // seven 보여주기
            if (allSuggestWeek) {
                allSuggestWeek.style.display = 'none'; // seven 보여주기
            }
            allSuggestMonth.style.display = 'block'; // month 숨기기
        } else {
            allSuggestSeven.style.display = 'none'; // seven 보여주기
            if (allSuggestWeek) {
                allSuggestWeek.style.display = 'none'; // seven 보여주기
            }
            allSuggestMonth = document.getElementById('all-suggest-month');
            new Chart(allSuggestMonth, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${suggestMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 월별 의뢰게시판 게시글 수',
                        data           : [
                            <c:forEach items="${suggestMonthDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${suggestMonthDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${suggestMonthDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 의뢰게시판 차트 일/주/월 --------------------------------------


    // ------------------------------------- 구/판매 차트 일/주/월 --------------------------------------

    const editorSeven = document.getElementById('editor-seven');
    let editorWeek = null;
    let editorMonth = null;

    new Chart(editorSeven, {
        type   : 'bar',
        data   : {
            labels  : [
                <c:forEach items="${editorSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label          : ' 일별 판매자 전환 수',
                data           : [
                    <c:forEach items="${editorSevenDate}" var="date">
                    '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${editorSevenDate.size()}" step="7">
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)',
                    </c:forEach>
                ],
                borderColor    : [
                    <c:forEach var="i" begin="1" end="${editorSevenDate.size()}" step="7">
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)',
                    </c:forEach>
                ],
                borderWidth    : 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cEditorSeven() {
        editorSeven.style.display = 'block'; // seven 보여주기
        if (editorWeek) {
            editorWeek.style.display = 'none'; // week 숨기기
        }
        if (editorMonth) {
            editorMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cEditorWeek() {

        if (editorWeek) {
            editorSeven.style.display = 'none';
            editorWeek.style.display = 'block';
            if (editorMonth) {
                editorMonth.style.display = 'none';
            }
        } else {
            editorSeven.style.display = 'none';
            if (editorMonth) {
                editorMonth.style.display = 'none';
            }
            editorWeek = document.getElementById('editor-week');
            editorWeek.style.display = 'block';
            new Chart(editorWeek, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${editorWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 주별 판매자 전환 수',
                        data           : [
                            <c:forEach items="${editorWeekDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${editorWeekDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${editorWeekDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cEditorMonth() {

        if (editorMonth) {
            editorSeven.style.display = 'none'; // seven 보여주기
            if (editorWeek) {
                editorWeek.style.display = 'none'; // seven 보여주기
            }
            editorMonth.style.display = 'block'; // month 숨기기
        } else {
            editorSeven.style.display = 'none'; // seven 보여주기
            if (editorWeek) {
                editorWeek.style.display = 'none'; // seven 보여주기
            }
            editorMonth = document.getElementById('editor-month');
            editorMonth.style.display = 'block'; // month 숨기기
            new Chart(editorMonth, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${editorMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 월별 판매자 전환 수',
                        data           : [
                            <c:forEach items="${editorMonthDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${editorMonthDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${editorMonthDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 구/판매 차트 일/주/월 --------------------------------------

    // ------------------------------------- 배너 게시 차트 일/주/월 --------------------------------------

    const bannerSeven = document.getElementById('banner-seven');
    let bannerWeek = null;
    let bannerMonth = null;

    new Chart(bannerSeven, {
        type   : 'bar',
        data   : {
            labels  : [
                <c:forEach items="${bannerSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label          : ' 일별 배너 의뢰 수',
                data           : [
                    <c:forEach items="${bannerSevenDate}" var="date">
                    '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${bannerSevenDate.size()}" step="7">
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)',
                    </c:forEach>
                ],
                borderColor    : [
                    <c:forEach var="i" begin="1" end="${bannerSevenDate.size()}" step="7">
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)',
                    </c:forEach>
                ],
                borderWidth    : 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cBannerSeven() {
        bannerSeven.style.display = 'block'; // seven 보여주기
        if (bannerWeek) {
            bannerWeek.style.display = 'none'; // week 숨기기
        }
        if (bannerMonth) {
            bannerMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cBannerWeek() {

        if (bannerWeek) {
            bannerSeven.style.display = 'none';
            bannerWeek.style.display = 'block';
            if (bannerMonth) {
                bannerMonth.style.display = 'none';
            }
        } else {
            bannerSeven.style.display = 'none';
            if (bannerMonth) {
                bannerMonth.style.display = 'none';
            }
            bannerWeek = document.getElementById('banner-week');
            new Chart(bannerWeek, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${bannerWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 주별 배너 의뢰 수',
                        data           : [
                            <c:forEach items="${bannerWeekDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${bannerWeekDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${bannerWeekDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cBannerMonth() {

        if (bannerMonth) {
            bannerSeven.style.display = 'none'; // seven 보여주기
            if (bannerWeek) {
                bannerWeek.style.display = 'none'; // seven 보여주기
            }
            bannerMonth.style.display = 'block'; // month 숨기기
        } else {
            bannerSeven.style.display = 'none'; // seven 보여주기
            if (bannerWeek) {
                bannerWeek.style.display = 'none'; // seven 보여주기
            }
            bannerMonth = document.getElementById('banner-month');
            new Chart(bannerMonth, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${bannerMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 월별 배너 의뢰 수',
                        data           : [
                            <c:forEach items="${bannerMonthDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${bannerMonthDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${bannerMonthDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 배너 게시 차트 일/주/월 --------------------------------------

    // ------------------------------------- 배너 수입 차트 일/주/월 --------------------------------------

    const bannerPriceSeven = document.getElementById('banner-price-seven');
    let bannerPriceWeek = null;
    let bannerPriceMonth = null;

    new Chart(bannerPriceSeven, {
        type   : 'line',
        data   : {
            labels  : [
                <c:forEach items="${bannerPriceSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [
                {
                    label      : ' 일별 배너광고 수입 합계',
                    data       : [
                        <c:forEach items="${bannerPriceSevenDate}" var="date">
                        '${date.count}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(243,84,112)',
                    ],
                    borderWidth: 3
                }, {
                    label      : ' 일별 배너광고 수입 평균',
                    data       : [
                        <c:forEach items="${bannerPriceSevenDate}" var="date" varStatus="status">
                           <c:set var="denominator" value="${bannerSevenDate[status.index].count}" />
                           <c:set var="result" value="${denominator ne 0 ? Math.floor(date.count / denominator) : (date.count eq 0 ? 0 : 1)}" />
                        '${result}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(58,85,239)',
                    ],
                    borderWidth: 3
                }, {
                    label      : ' 일별 배너광고 수입 최고액',
                    data       : [
                        <c:forEach items="${bannerMaxSevenDate}" var="date">
                        '${date.count}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(216,42,255)',
                    ],
                    borderWidth: 3
                }, {
                    label      : ' 일별 배너광고 수입 표준편차',
                    data       : [
                        <c:forEach items="${bannerStdSevenDate}" var="date">
                        '${date.count}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(23,201,36)',
                    ],
                    borderWidth: 3
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cBannerPriceSeven() {
        bannerPriceSeven.style.display = 'block'; // seven 보여주기
        if (bannerPriceWeek) {
            bannerPriceWeek.style.display = 'none'; // week 숨기기
        }
        if (bannerPriceMonth) {
            bannerPriceMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cBannerPriceWeek() {

        if (bannerPriceWeek) {
            bannerPriceSeven.style.display = 'none';
            bannerPriceWeek.style.display = 'block';
            if (bannerPriceMonth) {
                bannerPriceMonth.style.display = 'none';
            }
        } else {
            bannerPriceSeven.style.display = 'none';
            if (bannerPriceMonth) {
                bannerPriceMonth.style.display = 'none';
            }
            bannerPriceWeek = document.getElementById('banner-price-week');
            new Chart(bannerPriceWeek, {
                type   : 'line',
                data   : {
                    labels  : [
                        <c:forEach items="${bannerPriceWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [
                        {
                            label      : ' 주별 배너광고 수입 합계',
                            data       : [
                                <c:forEach items="${bannerPriceWeekDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(243,84,112)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 주별 배너광고 수입 평균',
                            data       : [
                                <c:forEach items="${bannerPriceWeekDate}" var="date" varStatus="status">
                                <c:set var="denominator" value="${bannerWeekDate[status.index].count}" />
                                <c:set var="result" value="${denominator ne 0 ? Math.floor(date.count / denominator) : (date.count eq 0 ? 0 : 1)}" />
                                '${result}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(58,85,239)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 주별 배너광고 수입 최고액',
                            data       : [
                                <c:forEach items="${bannerMaxWeekDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(216,42,255)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 주별 배너광고 수입 표준편차',
                            data       : [
                                <c:forEach items="${bannerStdWeekDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(23,201,36)',
                            ],
                            borderWidth: 3
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cBannerPriceMonth() {

        if (bannerPriceMonth) {
            bannerPriceSeven.style.display = 'none'; // seven 보여주기
            if (bannerPriceWeek) {
                bannerPriceWeek.style.display = 'none'; // seven 보여주기
            }
            bannerPriceMonth.style.display = 'block'; // month 숨기기
        } else {
            bannerPriceSeven.style.display = 'none'; // seven 보여주기
            if (bannerPriceWeek) {
                bannerPriceWeek.style.display = 'none'; // seven 보여주기
            }
            bannerPriceMonth = document.getElementById('banner-price-month');
            new Chart(bannerPriceMonth, {
                type   : 'line',
                data   : {
                    labels  : [
                        <c:forEach items="${bannerPriceMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [
                        {
                            label      : ' 월별 배너광고 수입 합계',
                            data       : [
                                <c:forEach items="${bannerPriceMonthDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(243,84,112)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 월별 배너광고 수입 평균',
                            data       : [
                                <c:forEach items="${bannerPriceMonthDate}" var="date" varStatus="status">
                                <c:set var="denominator" value="${bannerMonthDate[status.index].count}" />
                                <c:set var="result" value="${denominator ne 0 ? Math.floor(date.count / denominator) : (date.count eq 0 ? 0 : 1)}" />
                                '${result}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(58,85,239)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 월별 배너광고 수입 최고액',
                            data       : [
                                <c:forEach items="${bannerMaxMonthDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(216,42,255)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 월별 배너광고 수입 표준편차',
                            data       : [
                                <c:forEach items="${bannerStdMonthDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(23,201,36)',
                            ],
                            borderWidth: 3
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 배너 수입 차트 일/주/월 --------------------------------------


    // ------------------------------------- 정산 게시 차트 일/주/월 --------------------------------------

    const calculatorSeven = document.getElementById('calculator-seven');
    let calculatorWeek = null;
    let calculatorMonth = null;

    new Chart(calculatorSeven, {
        type   : 'bar',
        data   : {
            labels  : [
                <c:forEach items="${calculatorSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label          : ' 일별 정산 요청 수',
                data           : [
                    <c:forEach items="${calculatorSevenDate}" var="date">
                    '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${calculatorSevenDate.size()}" step="7">
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)',
                    </c:forEach>
                ],
                borderColor    : [
                    <c:forEach var="i" begin="1" end="${calculatorSevenDate.size()}" step="7">
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)',
                    </c:forEach>
                ],
                borderWidth    : 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cCalculatorSeven() {
        calculatorSeven.style.display = 'block'; // seven 보여주기
        if (calculatorWeek) {
            calculatorWeek.style.display = 'none'; // week 숨기기
        }
        if (calculatorMonth) {
            calculatorMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cCalculatorWeek() {

        if (calculatorWeek) {
            calculatorSeven.style.display = 'none';
            calculatorWeek.style.display = 'block';
            if (calculatorMonth) {
                calculatorMonth.style.display = 'none';
            }
        } else {
            calculatorSeven.style.display = 'none';
            if (calculatorMonth) {
                calculatorMonth.style.display = 'none';
            }
            calculatorWeek = document.getElementById('calculator-week');
            new Chart(calculatorWeek, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${calculatorWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 주별 정산 요청 수',
                        data           : [
                            <c:forEach items="${calculatorWeekDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${calculatorWeekDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${calculatorWeekDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cCalculatorMonth() {

        if (calculatorMonth) {
            calculatorSeven.style.display = 'none'; // seven 보여주기
            if (calculatorWeek) {
                calculatorWeek.style.display = 'none'; // seven 보여주기
            }
            calculatorMonth.style.display = 'block'; // month 숨기기
        } else {
            calculatorSeven.style.display = 'none'; // seven 보여주기
            if (calculatorWeek) {
                calculatorWeek.style.display = 'none'; // seven 보여주기
            }
            calculatorMonth = document.getElementById('calculator-month');
            new Chart(calculatorMonth, {
                type   : 'bar',
                data   : {
                    labels  : [
                        <c:forEach items="${calculatorMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label          : ' 월별 정산 요청 수',
                        data           : [
                            <c:forEach items="${calculatorMonthDate}" var="date">
                            '${date.count}',
                            </c:forEach>
                        ],
                        backgroundColor: [
                            <c:forEach var="i" begin="1" end="${calculatorMonthDate.size()}" step="7">
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)',
                            </c:forEach>
                        ],
                        borderColor    : [
                            <c:forEach var="i" begin="1" end="${calculatorMonthDate.size()}" step="7">
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            </c:forEach>
                        ],
                        borderWidth    : 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 정산 게시 차트 일/주/월 --------------------------------------

    // ------------------------------------- 정산 수입 차트 일/주/월 --------------------------------------

    const calculatorPriceSeven = document.getElementById('calculator-price-seven');
    let calculatorPriceWeek = null;
    let calculatorPriceMonth = null;

    new Chart(calculatorPriceSeven, {
        type   : 'line',
        data   : {
            labels  : [
                <c:forEach items="${calculatorPriceSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [
                {
                    label      : ' 일별 정산 수입 합계',
                    data       : [
                        <c:forEach items="${calculatorPriceSevenDate}" var="date">
                        '${date.count}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(243,84,112)',
                    ],
                    borderWidth: 3
                }, {
                    label      : ' 일별 정산 수입 평균',
                    data       : [
                        <c:forEach items="${calculatorPriceSevenDate}" var="date" varStatus="status">
                        <c:set var="denominator" value="${calculatorSevenDate[status.index].count}" />
                        <c:set var="result" value="${denominator ne 0 ? Math.floor(date.count / denominator) : (date.count eq 0 ? 0 : 1)}" />
                        '${result}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(58,85,239)',
                    ],
                    borderWidth: 3
                }, {
                    label      : ' 일별 정산 수입 최고액',
                    data       : [
                        <c:forEach items="${calculatorMaxSevenDate}" var="date">
                        '${date.count}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(216,42,255)',
                    ],
                    borderWidth: 3
                }, {
                    label      : ' 일별 정산 수입 표준편차',
                    data       : [
                        <c:forEach items="${calculatorStdSevenDate}" var="date">
                        '${date.count}',
                        </c:forEach>
                    ],
                    borderColor: [
                        'rgb(23,201,36)',
                    ],
                    borderWidth: 3
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    function cCalculatorPriceSeven() {
        calculatorPriceSeven.style.display = 'block'; // seven 보여주기
        if (calculatorPriceWeek) {
            calculatorPriceWeek.style.display = 'none'; // week 숨기기
        }
        if (calculatorPriceMonth) {
            calculatorPriceMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cCalculatorPriceWeek() {

        if (calculatorPriceWeek) {
            calculatorPriceSeven.style.display = 'none';
            calculatorPriceWeek.style.display = 'block';
            if (calculatorPriceMonth) {
                calculatorPriceMonth.style.display = 'none';
            }
        } else {
            calculatorPriceSeven.style.display = 'none';
            if (calculatorPriceMonth) {
                calculatorPriceMonth.style.display = 'none';
            }
            calculatorPriceWeek = document.getElementById('calculator-price-week');
            new Chart(calculatorPriceWeek, {
                type   : 'line',
                data   : {
                    labels  : [
                        <c:forEach items="${calculatorPriceWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [
                        {
                            label      : ' 주별 정산 수입 합계',
                            data       : [
                                <c:forEach items="${calculatorPriceWeekDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(243,84,112)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 주별 정산 수입 평균',
                            data       : [
                                <c:forEach items="${calculatorPriceWeekDate}" var="date" varStatus="status">
                                <c:set var="denominator" value="${calculatorWeekDate[status.index].count}" />
                                <c:set var="result" value="${denominator ne 0 ? Math.floor(date.count / denominator) : (date.count eq 0 ? 0 : 1)}" />
                                '${result}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(58,85,239)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 주별 정산 수입 최고액',
                            data       : [
                                <c:forEach items="${calculatorMaxWeekDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(216,42,255)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 주별 정산 수입 표준편차',
                            data       : [
                                <c:forEach items="${calculatorStdWeekDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(23,201,36)',
                            ],
                            borderWidth: 3
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    function cCalculatorPriceMonth() {

        if (calculatorPriceMonth) {
            calculatorPriceSeven.style.display = 'none'; // seven 보여주기
            if (calculatorPriceWeek) {
                calculatorPriceWeek.style.display = 'none'; // seven 보여주기
            }
            calculatorPriceMonth.style.display = 'block'; // month 숨기기
        } else {
            calculatorPriceSeven.style.display = 'none'; // seven 보여주기
            if (calculatorPriceWeek) {
                calculatorPriceWeek.style.display = 'none'; // seven 보여주기
            }
            calculatorPriceMonth = document.getElementById('calculator-price-month');
            new Chart(calculatorPriceMonth, {
                type   : 'line',
                data   : {
                    labels  : [
                        <c:forEach items="${calculatorPriceMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [
                        {
                            label      : ' 월별 정산 수입 합계',
                            data       : [
                                <c:forEach items="${calculatorPriceMonthDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(243,84,112)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 월별 정산 수입 평균',
                            data       : [
                                <c:forEach items="${calculatorPriceMonthDate}" var="date" varStatus="status">
                                <c:set var="denominator" value="${calculatorMonthDate[status.index].count}" />
                                <c:set var="result" value="${denominator ne 0 ? Math.floor(date.count / denominator) : (date.count eq 0 ? 0 : 1)}" />
                                '${result}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(58,85,239)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 월별 정산 수입 최고액',
                            data       : [
                                <c:forEach items="${calculatorMaxMonthDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(216,42,255)',
                            ],
                            borderWidth: 3
                        }, {
                            label      : ' 월별 정산 수입 표준편차',
                            data       : [
                                <c:forEach items="${calculatorStdMonthDate}" var="date">
                                '${date.count}',
                                </c:forEach>
                            ],
                            borderColor: [
                                'rgb(23,201,36)',
                            ],
                            borderWidth: 3
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    }

    // ------------------------------------- 정산 수입 차트 일/주/월 --------------------------------------


    new Chart(buyerSeller, {
        type   : 'doughnut',
        data   : {
            labels  : [
                '구매자                 ',
                '판매자                 ',
                '탈퇴자                 '
            ],
            datasets: [{
                label          : ' 사용자 수',
                data           : [${standardNum}, ${editorNum}, ${enabledNum}],
                backgroundColor: [
                    'rgb(54, 162, 235, 0.8)',
                    'rgb(255, 99, 132, 0.8)',
                    'rgb(0, 128, 0, 0.8)',
                ],
                borderColor    : [
                    'rgb(54, 162, 235)',
                    'rgb(255, 99, 132)',
                    'rgb(0, 128, 0)',
                ],
                borderWidth    : 1
            }]
        },
        options: {
            plugins: {
                legend: {
                    position: 'top', // 레전드 위치 설정 (top, left, bottom, right 중 선택)
                }
            }
        }
    });

</script>

<script>
    $(document).ready(function () {
    });
</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>