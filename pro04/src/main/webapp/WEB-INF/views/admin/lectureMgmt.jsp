<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 강의관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 CSS 적용 -->
    <link rel="stylesheet" href="${path}/resources/css/admin-style.css" />
    <link rel="stylesheet" href="${path}/resources/vendors/simplebar/dist/simplebar.css" />

    <c:if test="${not empty msg}">
        <script>
            alert('커리큘럼이 성공적으로 추가되었습니다.');
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
                        <h2> Lecture </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/admin"> Admin </a>
                            <a href="${path}/admin/lectureMgmt"> Lecture </a>
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
                    <li class="sidebar-item active">
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
                        <a class="sidebar-link" href="${path}/admin/eventMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-gifts"></i>
                            </span>
                            <span class="hide-menu"> 이벤트 관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/winner" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-star"></i>
                            </span>
                            <span class="hide-menu"> 당첨자 추첨 </span>
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
            <div class="d-flex justify-content-end">
                <!-- 검색어 입력 부분 -->
                <form action="${path}/admin/lectureMgmt" method="get" class="w-50 mb-5">
                    <div class="row">
                        <div class="col mt-2">
                            <select id="type" name="type" class="form-select">
                                <option value="T"> 강의명 </option>
                                <option value="C"> 강의소개 </option>
                                <option value="W"> 강사 </option>
                            </select>
                        </div>
                        <div class="col-xl-8 col-lg-12 col-md-12 mt-2">
                            <div class="input-group">
                                <div class="input-group-prepend">

                                </div>
                                <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" autocomplete="off" aria-label="검색어를 입력해주세요" aria-describedby="button-addon2" value="${page.keyword}">
                                <div class="input-group-append">
                                    <button class="btn btn-dark" type="submit" id="button-addon2"> 검색 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="text-center">
                <div class="list-group list-group-horizontal mb-5">
                    <c:if test="${empty curSubject}">
                        <a href="${path}/admin/lectureMgmt" class="list-group-item list-group-item-action active" aria-current="true">
                            전체
                        </a>
                    </c:if>
                    <c:if test="${not empty curSubject}">
                        <a href="${path}/admin/lectureMgmt" class="list-group-item list-group-item-action"> 전체 </a>
                    </c:if>
                    <c:forEach var="subject" items="${subjects}">
                        <c:if test="${subject.scode eq curSubject}">
                            <a href="${path}/admin/lectureMgmt?scode=${subject.scode}" class="list-group-item list-group-item-action active" aria-current="true">
                                    ${subject.sname}
                            </a>
                        </c:if>
                        <c:if test="${subject.scode ne curSubject}">
                            <a href="${path}/admin/lectureMgmt?scode=${subject.scode}" class="list-group-item list-group-item-action"> ${subject.sname} </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <th width="100"> 과목명 </th>
                    <th> 강좌명 </th>
                    <th width="100"> 강사명 </th>
                    <th width="130"> 시작일 </th>
                    <th width="130"> 종료일 </th>
                    <th width="100"> 타입 </th>
                    <th width="190"> 비고 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="lecture" items="${lectureList}">
                    <tr onclick="javascript: location.href='${path}/lecture/detail?lcode=${lecture.lcode}'" style="cursor: pointer">
                        <td class="align-middle"> ${lecture.sname} </td>
                        <td class="text-left align-middle"> ${lecture.lname} </td>
                        <td class="align-middle"> ${lecture.tname} </td>
                        <td class="align-middle"> ${lecture.sdate} </td>
                        <td class="align-middle"> ${lecture.edate} </td>
                        <td class="align-middle">
                            <c:if test="${lecture.state eq 'on'}"> 온라인 </c:if>
                            <c:if test="${lecture.state eq 'off'}"> 오프라인 </c:if>
                        </td>
                        <td class="align-middle pr-0 pl-0">
                            <a href="${path}/admin/lectureEdit?lcode=${lecture.lcode}" class="btn btn-outline-dark"> 수정 </a>
                            <a href="${path}/admin/curriculumInsert?lcode=${lecture.lcode}" class="btn btn-dark"> 커리큘럼 등록 </a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty lectureList}">
                    <tr class="text-center">
                        <td colspan="7"> 등록된 강의가 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <!-- pagination -->
            <nav aria-label="Page navigation example" class="mt-25 mb-30">
                <ul class="pagination justify-content-center">
                    <c:if test="${curPage > 5}">
                        <li class="page-item">
                            <a class="page-link" href="${path}/admin/lectureMgmt?page=${page.blockStartNum - 1}" aria-label="Previous">
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
                            <a class="page-link" href="${path}/admin/lectureMgmt?page=${page.blockLastNum + 1}" aria-label="Next">
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
<script src="${path}/resources/js/dashboard.js"></script>
</body>
</html>