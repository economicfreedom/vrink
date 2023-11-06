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



<h3 class="mt-4">사용자 정보</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">User Information</li>
</ol>
<div class="row">

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <i class="fas fa-chart-area me-1"></i>
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
                    <canvas id="all-user-month"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                Buyer Celler Count
            </div>
            <div class="card-body">
                <div style="width: 300px; height: 300px; margin: 0 auto">
                    <canvas id="buyer-seller"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<h3 class="mt-4">게시판 정보</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Community Information</li>
</ol>
<div class="row">

    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                FreeBoard Count
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="free-board"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                SuggestBoard Count
            </div>
            <div class="card-body">
                <div style="width: 600px; height: 300px; margin: 0 auto">
                    <canvas id="suggest-board"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<h3 class="mt-4">사이트 수익</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Revenue & Visitor Total Count</li>
</ol>
<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
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
                <i class="fas fa-chart-bar me-1"></i>
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
    const allUserSeven = document.getElementById('all-user-seven');
    let allUserWeek = null;
    let allUserMonth = null;
    const freeBoard = document.getElementById('free-board');
    const suggestBoard = document.getElementById('suggest-board');

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
        allUserMonth.style.display = 'none'; // month 숨기기
    }

    function cUserMonth() {

        if(allUserMonth) {
            allUserSeven.style.display = 'none'; // seven 보여주기
            allUserMonth.style.display = 'block'; // month 숨기기
        } else {
            allUserSeven.style.display = 'none'; // seven 보여주기
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

    new Chart(buyerSeller, {
        type: 'doughnut',
        data: {
            labels: [
                '구매자 : 50명',
                '판매자 : 150명'
            ],
            datasets: [{
                label: ' 사용자 수',
                data: [100, 50],
                backgroundColor: [
                    'rgb(54, 162, 235)',
                    'rgb(255, 99, 132)'
                ],
                hoverOffset: 4
            }]
        },
        // options: {
        //     scales: {
        //         y: {
        //             beginAtZero: true
        //         }
        //     }
        // }
    });

    new Chart(freeBoard, {
        type: 'bar',
        data: {
            labels: [
                <c:forEach items="${communitySevenDate}" var="date">
                   '${date.date}',
                </c:forEach>
            ],
            datasets: [{
                label: ' 일별 게시글 수',
                data: [
                    <c:forEach items="${communitySevenDate}" var="date">
                        '${date.count}',
                    </c:forEach>
                ],
                backgroundColor: [
                    <c:forEach var="i" begin="1" end="${communitySevenDate.size()}" step="7">
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
                    <c:forEach var="i" begin="1" end="${communitySevenDate.size()}" step="7">
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





</script>

<script>
    $(document).ready(function () {
    });
</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>