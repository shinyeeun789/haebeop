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
    <title> 교육뉴스 </title>
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
                        <h2> News </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/news/list"> News </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container p-5" style="margin: 100px auto;">
        <div class="blog_left_sidebar">
            <c:forEach var="url" items="${urls}" varStatus="status">
                <article class="row blog_item">
                    <div class="col-md-3">
                        <div class="blog_info text-right">
                            <div class="post_tag">
                                <p>#News</p>
                            </div>
                            <ul class="blog_meta list">
                                <li>${writers[status.index]} &nbsp; <i class="fa-regular fa-newspaper"></i></li>
                                <li>${regdates[status.index]} &nbsp; <i class="fa-regular fa-clock"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="blog_post">
                            <img src="img/blog/main-blog/m-blog-1.jpg" alt="">
                            <div class="blog_details">
                                <a href="single-blog.html">
                                    <h2>${titles[status.index]}</h2>
                                </a>
                                <p>${contents[status.index]}</p>
                                <a href="${url}" class="blog_btn">View More</a>
                            </div>
                        </div>
                    </div>
                </article>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>