<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 이벤트 관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 CSS 적용 -->
    <link rel="stylesheet" href="${path}/resources/css/admin-style.css"/>
    <link rel="stylesheet" href="${path}/resources/vendors/simplebar/dist/simplebar.css"/>

    <c:if test="${not empty msg}">
        <script>
            alert('${msg}');
        </script>
    </c:if>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<section class="banner_area">
    <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="banner_content text-center">
                        <h2> Event </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/admin/dashboard"> Admin </a>
                            <a href="${path}/admin/eventMgmt"> Event </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <aside class="left-sidebar p-4">
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-end">
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="fa-solid fa-x"></i>
                </div>
            </div>
            <nav class="sidebar-nav" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
                        <span class="hide-menu">Home</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/dashboard" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-chart-line"></i>
                            </span>
                            <span class="hide-menu"> Dashboard </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> Management </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/userMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-user"></i>
                            </span>
                            <span class="hide-menu"> 회원관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/qnaMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-circle-question"></i>
                            </span>
                            <span class="hide-menu"> 고객지원관리 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> 강의관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/lectureMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-photo-film"></i>
                            </span>
                            <span class="hide-menu"> 강의목록 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/closeLectureMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-circle-xmark"></i>
                            </span>
                            <span class="hide-menu"> 폐강관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/lectureInsert" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-file-video"></i>
                            </span>
                            <span class="hide-menu"> 강의등록 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> 강사관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/teacherMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-table-list"></i>
                            </span>
                            <span class="hide-menu"> 강사목록 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/teacherInsert" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-chalkboard-user"></i>
                            </span>
                            <span class="hide-menu"> 강사정보 등록 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> 이벤트 관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link active" href="${path}/admin/eventMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-gifts"></i>
                            </span>
                            <span class="hide-menu"> 이벤트 관리 </span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <div class="body-wrapper" style="min-height: 1000px;">
        <header class="app-header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item d-block d-xl-none">
                        <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                            <i class="fa-solid fa-bars"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="container-fluid">
            <table class="table project-table table-centered table-nowrap" id="event-table">
                <thead>
                <tr>
                    <th class="text-center" style="border-bottom: 1px solid;" width="5%">#</th>
                    <th class="text-center" style="border-bottom: 1px solid;">제목</th>
                    <th class="text-center" style="border-bottom: 1px solid;" width="10%">이벤트상태</th>
                    <th class="text-center" style="border-bottom: 1px solid;" width="10%">작성일</th>
                    <th class="text-center" style="border-bottom: 1px solid;" width="10%">당첨</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${eventList }" var="event" varStatus="status">
                    <tr class="table-hover">
                        <th class="text-center" style="vertical-align: middle;">${event.eno }</th>
                        <th style="vertical-align: middle;"><a href="${path}/event/detail?eno=${event.eno}&page=${curPage}" style="color: #000000; text-decoration: none;">${event.title }</a></th>
                        <c:if test='${event.status eq "1"}'>
                            <th class="text-center" style="vertical-align: middle;"><span class="ba badge-pill badge-success p-2">진행 중</span></th>
                        </c:if>
                        <c:if test='${event.status eq "0"}'>
                            <th class="text-center" style="vertical-align: middle;"><span class="ba badge-pill badge-danger p-2">종료</span></th>
                        </c:if>
                        <th class="text-center" style="vertical-align: middle;">
                            <fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </th>
                        <th class="text-center" style="vertical-align: middle;">
                            <div class="btn-group" style="align-items: center">
                                <a class="btn btn-dark" href="${path}/admin/applyList?eno=${event.eno}">참여자 확인</a>
                            </div>
                        </th>
                    </tr>
                </c:forEach>
                <c:if test="${empty eventList}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 작성된 이벤트가 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <!-- pagination -->
            <nav aria-label="Page navigation example" class="mt-25 mb-30">
                <ul class="pagination justify-content-center">
                    <c:if test="${curPage > 5}">
                        <li class="page-item">
                            <a class="page-link" href="${path}/admin/lectureMgmt?page=${page.blockStartNum - 1}"
                               aria-label="Previous">
                                <span aria-hidden="true"><<</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li class="page-item active" aria-current="page">
                                    <a class="page-link" href="${path}/admin/lectureMgmt?page=${i}">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="${path}/admin/lectureMgmt?page=${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                        <li class="page-item">
                            <a class="page-link" href="${path}/admin/lectureMgmt?page=${page.blockLastNum + 1}"
                               aria-label="Next">
                                <span aria-hidden="true">>></span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>
<script src="${path}/resources/js/sidebarmenu.js"></script>
<script src="${path}/resources/js/app.min.js"></script>
</body>
</html>
