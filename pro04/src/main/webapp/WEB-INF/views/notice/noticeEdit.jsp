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
    <title> 공지사항 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
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
                            <a href="${path}/notice/list"> Notice </a>
                            <a href="${path}/notice/edit?seq=${detail.seq}"> Edit </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="blog_area single-post-area section_gap">
    <div class="container shadow mb-30 p-5">
        <h1> 글 수정하기 <i class="fa-solid fa-pencil"></i> </h1>
        <form action="${path}/notice/edit" method="post">
            <div class="form-group mt-3">
                <label for="title"> 제목 </label>
                <input type="text" name="title" id="title" class="form-control" autocomplete="off" value="${detail.title}" required>
                <input type="hidden" name="seq" id="seq" value="${detail.seq}">
            </div>
            <div class="form-group mt-3">
                <label for="title"> 내용 </label>
                <textarea name="content" id="content" class="form-control" cols="30" rows="10">${detail.content}</textarea>
            </div>
            <div class="text-right">
                <button type="submit" class="btn btn-dark"> 수정하기 </button>
            </div>
        </form>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>