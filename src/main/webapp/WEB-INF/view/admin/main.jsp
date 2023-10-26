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
    <li class="breadcrumb-item active">User & Maker Total Count</li>
</ol>
<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                User Count
            </div>
            <div class="card-body">
                사용자 수 : ${count.totalUser}
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-bar me-1"></i>
                Maker Count
            </div>
            <div class="card-body">
                판매자 수 : ${count.totalShow1}
            </div>
        </div>
    </div>
</div>

<div> 원 그래프 박을 공간</div>

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
    $(document).ready(function () {
    });
</script>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>