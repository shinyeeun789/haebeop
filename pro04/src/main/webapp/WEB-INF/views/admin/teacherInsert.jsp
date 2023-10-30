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
    <title> 강사관리 </title>
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
                            <a href="${path}/admin/teacherMgmt"> Teacher </a>
                            <a href="${path}/admin/teacherInsert"> Insert </a>
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
                    <li class="sidebar-item active">
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
                <h1> 강사 정보 등록하기 <i class="fa-solid fa-pencil"></i> </h1>
                <form action="${path}/admin/teacherInsert" method="post" enctype="multipart/form-data">
                    <div class="input-group">
                        <input type="text" class="form-control" id="tid" placeholder="검색할 강사명을 입력해주세요" autocomplete="off" aria-label="검색할 강사명을 입력해주세요" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-dark" type="button" id="button-addon2" onclick="findTeacher()"> 검색 </button>
                        </div>
                    </div>
                    <select class="custom-select" id="tcode" name="tcode" size="8">
                        <c:forEach var="teacher" items="${teachers}">
                            <option value="${teacher.tcode}" class="p-2"> ${teacher.tname} </option>
                        </c:forEach>
                    </select>
                    <script>
                        function findTeacher() {
                            let data = {"tname": $("#tname").val()}
                            $.ajax({
                                url: "${path}/admin/findTeacher",
                                data: data,
                                type: "post",
                                dataType: "json",
                                success: function(result) {
                                    $("#tcode option").remove();
                                    for(idx in result) {
                                        $("#tcode").append("<option value='" + result[idx].tcode + "' class='p-2'>" + result[idx].tname + "</option>");
                                    }
                                },
                                error: function(res, text) {
                                    alert("문제가 발생하였습니다. 잠시 후 다시 시도해주세요.")
                                }
                            });
                        }
                    </script>
                    <div class="form-group mt-3">
                        <label for="tname"> 강사명 </label>
                        <input type="text" name="tname" id="tname" class="form-control" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="ttel"> 강사 연락처 </label>
                        <input type="text" name="ttel" id="ttel" class="form-control" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="temail"> 강사 이메일 </label>
                        <input type="email" name="temail" id="temail" class="form-control" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="tcontent"> 강사 소개 </label>
                        <textarea name="tcontent" id="tcontent" class="form-control" cols="30" rows="10" maxlength="1400" required></textarea>
                    </div>
                    <div class="custom-file mt-3">
                        <input type="file" name="upfile" class="custom-file-input" id="customFile" onchange="chk_file_type(this)" required>
                        <label class="custom-file-label" id="file-label" for="customFile">Choose file</label>
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
        // 파일 선택 시 파일 이름이 나오도록 처리
        $("#customFile").on("change", () => {
            let fileName = '';
            let fileLength = $("#customFile")[0].files.length;
            if(fileLength > 1) {
                fileName = fileLength + "개의 파일";
            } else {
                fileName = $("#customFile").val().split("\\").pop();
            }
            $("#file-label").text("선택한 파일 : " + fileName);
        });
    });
</script>
<script>
    function chk_file_type(obj) {
        let file_kind = obj.value.lastIndexOf('.');
        let file_name = obj.value.substring(file_kind+1,obj.length);
        let file_type = file_name.toLowerCase();

        let check_file_type=['jpg','gif','png','jpeg','bmp'];

        if(check_file_type.indexOf(file_type) == -1){
            alert('이미지 파일만 선택할 수 있습니다.');
            let parent_Obj = obj.parentNode
            let node = parent_Obj.replaceChild(obj.cloneNode(true),obj);
            return false;
        }
    }
</script>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/js/sidebarmenu.js"></script>
<script src="${path}/resources/js/app.min.js"></script>
<script src="${path}/resources/js/dashboard.js"></script>

</body>
</html>