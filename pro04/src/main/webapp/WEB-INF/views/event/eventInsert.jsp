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
    <title> 이벤트 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
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
                            <a href="${path}/event/list"> Event </a>
                            <a href="${path}/event/insert"> Insert </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="blog_area single-post-area section_gap">
    <div class="container shadow mb-30 p-5">
        <h1> 글 작성하기 <i class="fa-solid fa-pencil"></i> </h1>
        <form action="${path}/event/insert" method="post">
            <div class="form-group mt-3">
                <label for="title"> 제목 </label>
                <input type="text" name="title" id="title" class="form-control" autocomplete="off">
            </div>
            <div class="form-group mt-3">
                <label for="now"> 이벤트 상태 </label>
                <div class="d-flex">
                    <div class="switch-wrap d-flex">
                        <div class="primary-radio">
                            <input type="radio" id="now" value="1" name="status" checked>
                            <label for="now"></label>
                        </div>
                        <p class="ml-2"> 진행 중 </p>
                    </div>
                    <div class="switch-wrap d-flex ml-5">
                        <div class="primary-radio">
                            <input type="radio" id="end" value="0" name="status">
                            <label for="end"></label>
                        </div>
                        <p class="ml-2"> 종료 </p>
                    </div>
                </div>
            </div>
            <div class="form-group mt-3">
                <label class="sdate">시작일</label>
                <input type="date" name="sdate" id="sdate" class="form-control" placeholder="시작일 지정해주세요" autocomplete="off" required>
            </div>
            <div class="form-group mt-3">
                <label class="edate">종료일</label>
                <input type="date" name="edate" id="edate" class="form-control" placeholder="종료일 지정해주세요" autocomplete="off" required>
            </div>
            <div class="form-group mt-3">
                <label for="title"> 내용 </label>
                <textarea name="content" id="content" class="form-control" cols="30" rows="10" maxlength="1400"></textarea>
                <script>
                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/event/imageUpload'});
                </script>
            </div>
            <div class="text-right">
                <button type="submit" class="btn btn-dark"> 등록하기 </button>
            </div>
        </form>
        <script>
            // 시작일 변경 시 종료일 처리
            $("#sdate").change(() => {
                $("#edate").prop("min", $("#sdate").val());
                // 종료일이 변경한 시작일보다 빠른 경우
                if($("#edate").val() < $("#sdate").val()) {
                    $("#edate").val($("#sdate").val());
                }
            });
            // 종료일 변경 시 시작일 처리
            $("#edate").change(() => {
                $("#sdate").prop("max", $("#edate").val());
            })
        </script>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>