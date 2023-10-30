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

    <!-- ckEditor 적용 -->
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>

    <!-- 관리자 페이지 CSS 적용 -->
    <link rel="stylesheet" href="${path}/resources/css/admin-style.css" />
    <link rel="stylesheet" href="${path}/resources/vendors/simplebar/dist/simplebar.css" />
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
                        <h2> Teacher </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/admin/dashboard"> Admin </a>
                            <a href="${path}/admin/lectureMgmt"> Lecture </a>
                            <a href="${path}/admin/curriculumInsert"> Curriculum </a>
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
                            <span class="hide-menu"> 강사정보등록 </span>
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
            <div class="container shadow mb-30 p-5">
                <h1> ${lecture.lname} 커리큘럼 등록하기 <i class="fa-solid fa-pencil"></i> </h1>
                <form action="${path}/admin/curriculumInsert" method="post" enctype="multipart/form-data">
                    <div class="form-group mt-3 text-right">
                        <button type="button" class="btn btn-primary" id="addInput"> 입력창 추가 </button>
                        <button type="button" class="btn btn-danger" id="removeInput"> 입력창 삭제 </button>
                        <input type="hidden" name="lcode" id="lcode" value="${lecture.lcode}">
                    </div>
                    <div id="curriculum-wrap">
                        <!-- 오프라인 강의인 경우 -->
                        <c:if test="${lecture.state eq 'off'}">
                            <!-- 이미 등록된 커리큘럼이 있는 경우 리스트 출력 (수정은 불가) -->
                            <c:forEach var="curr" items="${curriculumList}" varStatus="status">
                                <div class="row curriculum" value="${status.index + 1}">
                                    <div class="col-1">
                                        <h5 class="mt-25 text-center"> ${status.index + 1}강 </h5>
                                    </div>
                                    <div class="col">
                                        <div class="form-group mt-3">
                                            <input type="text" name="cname" id="cname${status.index + 1}" class="form-control" placeholder="커리큘럼명을 입력해주세요" value="${curr.cname}" disabled>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="row curriculum" value="${fn:length(curriculumList) + 1}">
                                <div class="col-1">
                                    <h5 class="mt-25 text-center"> ${fn:length(curriculumList) + 1}강 </h5>
                                </div>
                                <div class="col">
                                    <div class="form-group mt-3">
                                        <input type="text" name="cname" id="cname1" class="form-control" placeholder="커리큘럼명을 입력해주세요" autocomplete="off" required>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!-- 온라인 강의인 경우 -->
                        <c:if test="${lecture.state eq 'on'}">
                            <!-- 이미 등록된 커리큘럼이 있는 경우 리스트 출력 (수정은 불가) -->
                            <c:forEach var="curr" items="${curriculumList}" varStatus="status">
                                <div class="row curriculum" value="${status.index + 1}">
                                    <div class="col-1">
                                        <h5 class="mt-25 text-center"> ${status.index + 1}강 </h5>
                                    </div>
                                    <div class="col">
                                        <div class="form-group mt-3">
                                            <input type="text" name="cname" id="cname${status.index + 1}" class="form-control" placeholder="커리큘럼명을 입력해주세요" value="${curr.cname}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="custom-file mt-3">
                                            <input type="file" name="upfile" class="custom-file-input" id="customFile${status.index + 1}" onchange="chk_file_type(this)" disabled>
                                            <label class="custom-file-label" id="file-label${status.index + 1}" for="customFile${status.index + 1}"> 업로드된 강의는 수정할 수 없습니다 </label>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="row curriculum" value="${fn:length(curriculumList) + 1}">
                                <div class="col-1">
                                    <h5 class="mt-25 text-center"> ${fn:length(curriculumList) + 1}강 </h5>
                                </div>
                                <div class="col">
                                    <div class="form-group mt-3">
                                        <input type="text" name="cname" id="cname${fn:length(curriculumList) + 1}" class="form-control" placeholder="커리큘럼명을 입력해주세요" autocomplete="off" required>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="custom-file mt-3">
                                        <input type="file" name="upfile" class="custom-file-input" id="customFile${fn:length(curriculumList) + 1}" onchange="chk_file_type(this)" required>
                                        <label class="custom-file-label" id="file-label${fn:length(curriculumList) + 1}" for="customFile${fn:length(curriculumList) + 1}"> 강의영상 선택 </label>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="text-right mt-3">
                        <button type="submit" class="btn btn-dark"> 등록하기 </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(() => {
        // 커리큘럼 추가 버튼 클릭 시 input 값 추가하기
        $("#addInput").click(() => {
            let idx = parseInt($(".curriculum:last-child").attr("value")) + 1;
            <c:if test="${lecture.state eq 'off'}">
                $("#curriculum-wrap").append('<div class="row curriculum" value="' + idx + '"><div class="col-1"><h5 class="mt-25 text-center"> ' + idx + '강 </h5></div>' +
                    '<div class="col"><div class="form-group mt-3">' +
                    '<input type="text" name="cname" id="cname' + idx + '" class="form-control" placeholder="커리큘럼명을 입력해주세요" autocomplete="off" required> </div></div> </div>');
            </c:if>
            <c:if test="${lecture.state eq 'on'}">
                $("#curriculum-wrap").append('<div class="row curriculum" value="' + idx + '"><div class="col-1"><h5 class="mt-25 text-center">' + idx + '강 </h5></div>' +
                    '<div class="col"><div class="form-group mt-3">' +
                    '<input type="text" name="cname" id="cname2" class="form-control" placeholder="커리큘럼명을 입력해주세요" autocomplete="off" required></div></div>' +
                    '<div class="col-4"><div class="custom-file mt-3">' +
                    '<input type="file" name="upfile" class="custom-file-input" id="customFile' + idx + '" onchange="chk_file_type(this)"><label class="custom-file-label" id="file-label' + idx + '" for="customFile' + idx + '"> 강의영상 선택 </label> ' +
                    '</div></div></div>');

                // 파일 선택 시 파일 이름이 나오도록 처리하는 로직도 추가
                let id = "#customFile" + idx;
                $(id).on("change", () => {
                    let fileName = '';
                    let fileLength = $(id)[0].files.length;
                    if(fileLength > 1) {
                        fileName = fileLength + "개의 파일";
                    } else {
                        fileName = $(id).val().split("\\").pop();
                    }
                    $("#file-label" + idx).text("선택한 파일 : " + fileName);
                });
            </c:if>
        });

        // 입력창 삭제 버튼 클릭 시
        $("#removeInput").on("click", function() {
            console.log($("#curriculum-wrap .curriculum").length);
            if($("#curriculum-wrap .curriculum").length > 1) {
                $("#curriculum-wrap .curriculum").last().remove();
            }
        });

        // 파일 선택 시 파일 이름이 나오도록 처리
        $("#customFile${fn:length(curriculumList) + 1}").on("change", () => {
            let fileName = '';
            let fileLength = $("#customFile${fn:length(curriculumList) + 1}")[0].files.length;
            if(fileLength > 1) {
                fileName = fileLength + "개의 파일";
            } else {
                fileName = $("#customFile${fn:length(curriculumList) + 1}").val().split("\\").pop();
            }
            $("#file-label${fn:length(curriculumList) + 1}").text("선택한 파일 : " + fileName);
        });
    });
</script>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/js/sidebarmenu.js"></script>
<script src="${path}/resources/js/app.min.js"></script>
<script src="${path}/resources/js/dashboard.js"></script>

</body>
</html>