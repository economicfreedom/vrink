<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>HallOfArt - UserAdmin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="/css/admin_styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>

<div id="layoutSidenav_content">
	<main>
			<div class="container-fluid px-4">

<div style="font-family: 'NanumSquareRound';">
    <div class="card-body text-black" style="margin: 100px auto; max-width: 500px;">
            <div class="d-flex align-items-center mb-3 pb-1">
                <i class="fa-solid fa-user-pen fa-2xl"></i> <span
                    class="h1 fw-bold mb-0">&nbsp;회원정보 조회</span>
            </div>
            <div class="form-outline mb-0">
                <label class="form-label my-0" for="username" id="idconfirmTxt">아이디</label>
                <div style="display: flex;">
                    <input type="text" id="username" value="${userDetail.username}"
                           class="form-control form-control" readonly="readonly"/>
                </div>
            </div>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="email">이메일</label>
                <div style="display: flex;">
                    <input type="email" id="email" value="${userDetail.email}"
                           class="form-control form-control" readonly="readonly"/>
                </div>
            </div>

            <c:choose>
                <c:when test="${userDetail.tel != '99999999999'}">

                    <div class="form-outline mb-0">
                        <label class="form-label my-0" for="tel">전화번호</label>
                        <div style="display: flex;">
                            <input type="tel" id="tel" value="${userDetail.tel}"
                                   class="form-control form-control" readonly="readonly"/>
                        </div>
                    </div>

                </c:when>

                <c:otherwise>

                    <div class="form-outline mb-0">
                        <label class="form-label my-0" for="tel">전화번호</label>
                        <div style="display: flex;">
                            <input type="tel" id="tel" value="카카오 회원입니다."
                                   class="form-control form-control" readonly="readonly"/>
                        </div>
                    </div>

                </c:otherwise>
            </c:choose>

            <div class="form-outline mb-0">
                <label class="form-label my-0" for="birthDate">생년월일</label>
                <c:choose>
                    <c:when test="${userDetail.birthDate != '3000-01-01'}">
                        <input type="text" id="birthDate" name="birthDate"
                               value="${userDetail.birthDate}" class="form-control form-control"
                               maxlength="10" readonly />
                    </c:when>
                    <c:otherwise>
                        <input type="text" id="birthDate" name="birthDate"
                               placeholder="카카오 회원입니다"
                               class="form-control form-control" maxlength="10" readonly />
                    </c:otherwise>
                </c:choose>
            </div>

                <input type="hidden" id="userId" value="${userDetail.id}">
                <div class="form-outline mb-0 mt-2">
                    <label style="font-weight: bold" class="form-label my-0" for="roleId">회원등급 : <c:choose><c:when test="${userDetail.roleTypeId == 1}"> 일반 유저 </c:when><c:otherwise> 관리자 </c:otherwise> </c:choose></label>
                    <select name="roleTypeId" id="roleId">
                        <c:choose>
                            <c:when test="${userDetail.roleTypeId == 1}">
                                <option value="2" selected>관리자</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1" selected>일반유저</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                        <button class="btn btn-dark btn-block" type="button" id="changeRole">변경하기</button>
                </div>


            <div class="pt-1 mb-4">

<%--                <button class="btn btn-dark btn-lg btn-block"--%>
<%--                        style="font-size: 0.8rem;" type="submit">정보수정--%>
<%--                </button>--%>

                <button class="btn btn-dark btn-block" type="button" onClick="location.href='/admin/user?page=${page}'">목록보기
                </button>

            </div>
    </div>
</div>

</div>
</main>
</div>

<script>

    $('#changeRole').on('click', () => {

        let idval = $('#userId').val();
        let roleval = $('#roleId').val();

        console.log(idval);
        console.log(roleval);

        $.ajax({
            type : "POST",
            url : "/admin/user/modify",
            data : {
                "id" : idval,
                "roleTypeId" : roleval
            },
            success : function(data){
                if (data === 200) {
                    location.reload();
                }
            }
            ,error: function(){
                alert('서버 에러입니다.');
            }
        });
    });

</script>


</div>
</main>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $(document).ready(function () {

    });
</script>
</body>
</html>
