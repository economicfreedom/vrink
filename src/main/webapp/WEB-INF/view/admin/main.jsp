<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>



<%--	                        		파랑 카드 --%>
<%--	                            <div class="col-xl-3 col-md-6"> --%>
<%--	                                <div class="card bg-primary text-white mb-4"> --%>
<%--	                                    <div class="card-body">Primary Card</div> --%>
<%--	                                    <div class="card-footer d-flex align-items-center justify-content-between"> --%>
<%--	                                        <a class="small text-white stretched-link" href="#">View Details</a> --%>
<%--	                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div> --%>
<%--	                                    </div> --%>
<%--	                                </div> --%>
<%--	                            </div> --%>

<%--									노랑 카드 --%>
<%--	                            <div class="col-xl-3 col-md-6"> --%>
<%--	                                <div class="card bg-warning text-white mb-4"> --%>
<%--	                                    <div class="card-body">Warning Card</div> --%>
<%--	                                    <div class="card-footer d-flex align-items-center justify-content-between"> --%>
<%--	                                        <a class="small text-white stretched-link" href="#">View Details</a> --%>
<%--	                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div> --%>
<%--	                                    </div> --%>
<%--	                                </div> --%>
<%--	                            </div> --%>

<%--									초록 카드 --%>
<%--	                            <div class="col-xl-3 col-md-6"> --%>
<%--	                                <div class="card bg-success text-white mb-4"> --%>
<%--	                                    <div class="card-body">Success Card</div> --%>
<%--	                                    <div class="card-footer d-flex align-items-center justify-content-between"> --%>
<%--	                                        <a class="small text-white stretched-link" href="#">View Details</a> --%>
<%--	                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div> --%>
<%--	                                    </div> --%>
<%--	                                </div> --%>
<%--	                            </div> --%>

<%--									빨강 카드 --%>
<%--	                            <div class="col-xl-3 col-md-6"> --%>
<%--	                                <div class="card bg-danger text-white mb-4"> --%>
<%--	                                    <div class="card-body">Danger Card</div> --%>
<%--	                                    <div class="card-footer d-flex align-items-center justify-content-between"> --%>
<%--	                                        <a class="small text-white stretched-link" href="#">View Details</a> --%>
<%--	                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div> --%>
<%--	                                    </div> --%>
<%--	                                </div> --%>
<%--	                            </div> --%>



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
                    <span style="left: 98.5px;
                        top: 48px;
                        position: relative;
                        font-size: 13px;
                        color: #666666;"
                    >: ${editorNum}명</span>
                    <span style="left: 64.5px;
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

<h3 class="mt-4"><i class="fa-solid fa-sack-dollar"></i> 사이트 수익</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Revenue & Visitor Total Count</li>
</ol>
<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fa-solid fa-chart-column"></i>
                Revenue Amount
            </div>
            <div class="card-body">
                총 수익 : ${count.totalUser}
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fa-solid fa-chart-column"></i>
                Visitor Count
            </div>
            <div class="card-body">
                방문자 수 : ${count.totalShow1}
            </div>
        </div>
    </div>
</div>


<%--			<h3 class="mt-4">공연/전시 정보</h3>--%>
<%--			<ol class="breadcrumb mb-4">--%>
<%--				<li class="breadcrumb-item active">Recent Show</li>--%>
<%--			</ol>--%>
<%--			<div class="card mb-4">--%>
<%--				<div class="card-header">--%>
<%--					<i class="fas fa-table me-1"></i>--%>
<%--					Recent Show--%>
<%--				</div>--%>
<%--				<div class="card-body">--%>
<%--					<table id="showList" style="margin: auto; text-align: center;">--%>
<%--						<tr style="height: 70px; padding-top: 30px;">--%>
<%--							<td style="width:10%">no.</td>--%>
<%--							<td style="width:10%">유형</td>--%>
<%--							<td style="width:45%">제목</td>--%>
<%--							<td style="width:35%">날짜</td>--%>
<%--						</tr>--%>
<%--						<c:forEach var="li" items="${list}" varStatus="status">--%>
<%--							<c:if test="${status.count <= 5}">--%>
<%--								<tr>--%>
<%--									<td>${li.id}</td>--%>
<%--									<td>--%>
<%--										<c:choose>--%>
<%--											<c:when test="${li.showTypeId1 eq 1}">--%>
<%--												공연--%>
<%--											</c:when>--%>
<%--											<c:when test="${li.showTypeId1 eq 2}">--%>
<%--												전시--%>
<%--											</c:when>--%>
<%--											<c:otherwise>--%>
<%--												해당 없음 ( ${li.showTypeId1} )--%>
<%--											</c:otherwise>--%>
<%--										</c:choose>--%>
<%--									</td>--%>
<%--									<td class="titleTd">${li.title}</td>--%>
<%--									<td>${li.startDate} ~ ${li.endDate}</td>--%>
<%--								</tr>--%>
<%--							</c:if>--%>
<%--							<c:if test="${status.count == 5}">--%>
<%--								<tr>--%>
<%--									<td style="width:10%">...</td>--%>
<%--									<td style="width:10%">...</td>--%>
<%--									<td style="width:45%">...</td>--%>
<%--									<td style="width:35%">...</td>--%>
<%--								</tr>--%>
<%--							</c:if>--%>
<%--						</c:forEach>--%>
<%--					</table>--%>
<%--				</div>--%>
<%--			</div>--%>

<script>
    const buyerSeller = document.getElementById('buyer-seller');
    const freeBoard = document.getElementById('free-board');
    const suggestBoard = document.getElementById('suggest-board');

    // ------------------------------------- 가입자 차트 일/주/월 --------------------------------------

    const allUserSeven = document.getElementById('all-user-seven');
    let allUserWeek = null;
    let allUserMonth = null;

    new Chart(allUserSeven, {
        type: 'bar',
        data: {
            labels: [
                <c:forEach items="${userSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label: ' 일별 가입자 수',
                data: [
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
                borderColor: [
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
                borderWidth: 1
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
        if(allUserWeek) {
            allUserWeek.style.display = 'none'; // week 숨기기
        }
        if(allUserMonth) {
            allUserMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cUserWeek() {

        if(allUserWeek) {
            allUserSeven.style.display = 'none';
            allUserWeek.style.display = 'block';
            if(allUserMonth){
                allUserMonth.style.display = 'none';
            }
        } else {
            allUserSeven.style.display = 'none';
            if(allUserMonth) {
                allUserMonth.style.display = 'none';
            }
            allUserWeek = document.getElementById('all-user-week');
            new Chart(allUserWeek, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${userWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 주별 가입자 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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

        if(allUserMonth) {
            allUserSeven.style.display = 'none'; // seven 보여주기
            if(allUserWeek) {
                allUserWeek.style.display = 'none'; // seven 보여주기
            }
            allUserMonth.style.display = 'block'; // month 숨기기
        } else {
            allUserSeven.style.display = 'none'; // seven 보여주기
            if(allUserWeek) {
                allUserWeek.style.display = 'none'; // seven 보여주기
            }
            allUserMonth = document.getElementById('all-user-month');
            new Chart(allUserMonth, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${userMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 월별 가입자 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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
        type: 'bar',
        data: {
            labels: [
                <c:forEach items="${freeBoardSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label: ' 일별 자유게시판 게시글 수',
                data: [
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
                borderColor: [
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
                borderWidth: 1
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
        if(allFreeBoardWeek) {
            allFreeBoardWeek.style.display = 'none'; // week 숨기기
        }
        if(allFreeBoardMonth) {
            allFreeBoardMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cFreeBoardWeek() {

        if(allFreeBoardWeek) {
            allFreeBoardSeven.style.display = 'none';
            allFreeBoardWeek.style.display = 'block';
            if(allFreeBoardMonth){
                allFreeBoardMonth.style.display = 'none';
            }
        } else {
            allFreeBoardSeven.style.display = 'none';
            if(allFreeBoardMonth) {
                allFreeBoardMonth.style.display = 'none';
            }
            allFreeBoardWeek = document.getElementById('all-freeBoard-week');
            new Chart(allFreeBoardWeek, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${freeBoardWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 주별 자유게시판 게시글 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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

        if(allFreeBoardMonth) {
            allFreeBoardSeven.style.display = 'none'; // seven 보여주기
            if(allFreeBoardWeek) {
                allFreeBoardWeek.style.display = 'none'; // seven 보여주기
            }
            allFreeBoardMonth.style.display = 'block'; // month 숨기기
        } else {
            allFreeBoardSeven.style.display = 'none'; // seven 보여주기
            if(allFreeBoardWeek) {
                allFreeBoardWeek.style.display = 'none'; // seven 보여주기
            }
            allFreeBoardMonth = document.getElementById('all-freeBoard-month');
            new Chart(allFreeBoardMonth, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${freeBoardMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 월별 자유게시판 게시글 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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
        type: 'bar',
        data: {
            labels: [
                <c:forEach items="${suggestSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label: ' 일별 의뢰게시판 게시글 수',
                data: [
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
                borderColor: [
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
                borderWidth: 1
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
        if(allSuggestWeek) {
            allSuggestWeek.style.display = 'none'; // week 숨기기
        }
        if(allSuggestMonth) {
            allSuggestMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cSuggestWeek() {

        if(allSuggestWeek) {
            allSuggestSeven.style.display = 'none';
            allSuggestWeek.style.display = 'block';
            if(allSuggestMonth){
                allSuggestMonth.style.display = 'none';
            }
        } else {
            allSuggestSeven.style.display = 'none';
            if(allSuggestMonth) {
                allSuggestMonth.style.display = 'none';
            }
            allSuggestWeek = document.getElementById('all-suggest-week');
            new Chart(allSuggestWeek, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${suggestWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 주별 의뢰게시판 게시글 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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

        if(allSuggestMonth) {
            allSuggestSeven.style.display = 'none'; // seven 보여주기
            if(allSuggestWeek) {
                allSuggestWeek.style.display = 'none'; // seven 보여주기
            }
            allSuggestMonth.style.display = 'block'; // month 숨기기
        } else {
            allSuggestSeven.style.display = 'none'; // seven 보여주기
            if(allSuggestWeek) {
                allSuggestWeek.style.display = 'none'; // seven 보여주기
            }
            allSuggestMonth = document.getElementById('all-suggest-month');
            new Chart(allSuggestMonth, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${suggestMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 월별 의뢰게시판 게시글 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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
        type: 'bar',
        data: {
            labels: [
                <c:forEach items="${editorSevenDate}" var="date">
                '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label: ' 일별 판매자 전환 수',
                data: [
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
                borderColor: [
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
                borderWidth: 1
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
        if(editorWeek) {
            editorWeek.style.display = 'none'; // week 숨기기
        }
        if(editorMonth) {
            editorMonth.style.display = 'none'; // month 숨기기
        }
    }

    function cEditorWeek() {

        if(editorWeek) {
            editorSeven.style.display = 'none';
            editorWeek.style.display = 'block';
            if(editorMonth){
                editorMonth.style.display = 'none';
            }
        } else {
            editorSeven.style.display = 'none';
            if(editorMonth) {
                editorMonth.style.display = 'none';
            }
            editorWeek = document.getElementById('editor-week');
            editorWeek.style.display = 'block';
            new Chart(editorWeek, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${editorWeekDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 주별 판매자 전환 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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

        if(editorMonth) {
            editorSeven.style.display = 'none'; // seven 보여주기
            if(editorWeek) {
                editorWeek.style.display = 'none'; // seven 보여주기
            }
            editorMonth.style.display = 'block'; // month 숨기기
        } else {
            editorSeven.style.display = 'none'; // seven 보여주기
            if(editorWeek) {
                editorWeek.style.display = 'none'; // seven 보여주기
            }
            editorMonth = document.getElementById('editor-month');
            editorMonth.style.display = 'block'; // month 숨기기
            new Chart(editorMonth, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${editorMonthDate}" var="date">
                        '${date.date}',
                        </c:forEach>
                    ],
                    datasets: [{
                        label: ' 월별 판매자 전환 수',
                        data: [
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
                        borderColor: [
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
                        borderWidth: 1
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


    new Chart(buyerSeller, {
        type: 'doughnut',
        data: {
            labels: [
                '구매자                 ',
                '판매자                 ',
                '탈퇴자                 '
            ],
            datasets: [{
                label: ' 사용자 수',
                data: [${standardNum}, ${editorNum}, ${enabledNum}],
                backgroundColor: [
                    'rgb(54, 162, 235, 0.8)',
                    'rgb(255, 99, 132, 0.8)',
                    'rgb(0, 128, 0, 0.8)',
                ],
                borderColor: [
                    'rgb(54, 162, 235)',
                    'rgb(255, 99, 132)',
                    'rgb(0, 128, 0)',
                ],
                borderWidth: 1
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