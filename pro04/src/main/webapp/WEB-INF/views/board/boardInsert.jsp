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
    <title> 커뮤니티 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
    <c:if test="${not empty msg}">
        <script>
            alert("${msg}");
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
                        <h2> Notice </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/board/list"> Community </a>
                            <a href="${path}/board/insert"> Insert </a>
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
        <form action="${path}/board/insert" method="post">
            <div class="row">
                <div class="col-3">
                    <div class="form-group mt-3">
                        <label for="cate"> 카테고리 </label>
                        <select id="cate" name="cate" class="form-select">
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.cate}"> ${category.cateName} </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mt-3">
                        <label for="title"> 제목 </label>
                        <input type="text" name="title" id="title" class="form-control" autocomplete="off" required>
                    </div>
                </div>
            </div>
            <div class="form-group mt-3">
                <label for="title"> 내용 </label>
                <textarea name="content" id="content" class="form-control" cols="30" rows="10" maxlength="1400"></textarea>
                <script>
                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/board/imageUpload'});
                </script>
            </div>
            <div class="text-right">
                <button type="submit" class="btn btn-dark"> 등록하기 </button>
            </div>
        </form>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>