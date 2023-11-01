<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vrink - 관리자 페이지</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="/css/admin_styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $(".modal-content").load("modal");

            const sidebarToggle = $('#sidebarToggle');
            if (sidebarToggle.length) {
                sidebarToggle.on('click', function (event) {
                    event.preventDefault();
                    $('body').toggleClass('sb-sidenav-toggled');
                    localStorage.setItem('sb|sidebar-toggle', $('body').hasClass('sb-sidenav-toggled'));
                });
            }
        });
    </script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="main">Vrink</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
        <i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <!--  <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" /> -->
            <!--  <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle"
               id="navbarDropdown"
               href="#"
               role="button"
               data-bs-toggle="dropdown"
               aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Settings</a></li>
                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                <li>
                    <hr class="dropdown-divider"/>
                </li>
                <li><a class="dropdown-item" href="/user/sign-out">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Main Page</div>
                    <a class="nav-link" href="http://localhost">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Vrink
                    </a>
                    <div class="sb-sidenav-menu-heading">Admin Menu</div>
                    <a class="nav-link collapsed"
                       href="#"
                       data-bs-toggle="collapse"
                       data-bs-target="#collapseLayouts"
                       aria-expanded="false"
                       aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        회원 관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="user?reset=1">회원 목록</a>
<%--                            <a class="nav-link" data-bs-toggle="modal" href="#myModal">판매자 신청 목록</a>--%>
                            <a class="nav-link" href="apply-accept?reset=1">판매자 신청 목록</a>
                            <a class="nav-link" href="rentalList">신고 내역 목록</a>
                            <a class="nav-link" href="bookList">결제 목록</a>
                        </nav>
                    </div>
                    <!-- 게시판  -->
                    <a class="nav-link collapsed"
                       href="#"
                       data-bs-toggle="collapse"
                       data-bs-target="#collapseCustomer"
                       aria-expanded="false"
                       aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-person-harassing"></i></div>
                        게시판 관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse"
                         id="collapseCustomer"
                         aria-labelledby="headingOne"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="freeboard?reset=1">자유게시판 관리</a>
                            <a class="nav-link" href="http://localhost/admin/inquiry/main">의뢰게시판 관리</a>
                        </nav>
                    </div> <!-- end of 게시판  -->

                    <a class="nav-link collapsed" href="http://localhost/admin/user?reset=1">
                        <div class="sb-nav-link-icon"><i class="fa-solid fa-user-pen"></i></div>
                        고객센터
                    </a>

                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                <c:choose>
                    <c:when test="${empty user}">
                        Vrink
                    </c:when>
                    <c:otherwise>
                        ${user.username}
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </div>
    <!-- Modal -->
    <%--    <div class="modal fade" id="myModal" role="dialog">--%>
    <%--        <div class="modal-dialog">--%>
    <%--            <div class="modal-content">--%>
    <%--                modal--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">