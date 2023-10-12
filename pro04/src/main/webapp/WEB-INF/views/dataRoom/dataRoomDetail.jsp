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
    <title> 자료실 </title>
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
                        <h2> 자료실 상세보기 </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/dataRoom/list"> 자료실 </a>
                            <a href="${path}/dataRoom/detail?articleNo=${detail.articleNo}&page=${curPage}"> Detail </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="blog_area single-post-area section_gap mb-30">
    <div class="container mb-30">
        <div class="row">
            <div class="col-lg-12 text-right">
                <a href="${path}/dataRoom/list?page=${curPage}"
                   class="btn btn-outline-dark"> 목록 </a>
                <c:if test="${sid eq 'admin'}">
                    <a href="${path}/dataRoom/edit?articleNo=${detail.articleNo}" class="btn btn-outline-dark"> 수정 </a>
                    <a href="${path}/dataRoom/delete?articleNo=${detail.articleNo}" class="btn btn-danger"> 삭제 </a>
                </c:if>
            </div>
            <div class="col-lg-12 posts-list">
                <div class="single-post row">
                    <div class="col-lg-3 col-md-3">
                        <div class="blog_info text-right">
                            <ul class="blog_meta list">
                                <li>${detail.id} &nbsp; <i class="fa-regular fa-user"></i></li>
                                <li>
                                    <fmt:parseDate value="${detail.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    &nbsp; <i class="fa-regular fa-calendar"></i>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2> ${detail.title} </h2>
                        <p>
                            ${detail.content}
                        </p>
                        <div class="mt-100">
                            <h4> 학습자료 (클릭하여 다운로드) </h4>
                            <c:forEach var="file" items="${fileList}">
                                <a href="${path}/resources/upload/dataRoom/${file.saveFolder}/${file.saveFile}" download="${file.originFile }" class="mr-3">
                                    <i class="fas fa-file"></i> ${file.originFile }
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="navigation-area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                            <c:if test="${not empty prev}">
                                <div class="arrow">
                                    <a href="${path}/dataRoom/detail?articleNo=${prev.articleNo}&page=${curPage}" style="color: #333"><i class="fa-solid fa-angle-left"></i></a>
                                </div>
                            </c:if>
                            <div class="detials ml-5">
                                <p>이전 공지사항</p>
                                <c:if test="${empty prev}">
                                    <h4> 첫 번째 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty prev}">
                                    <a href="${path}/dataRoom/detail?articleNo=${prev.articleNo}&page=${curPage}">
                                        <h4>${prev.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <div class="detials mr-5">
                                <p>다음 공지사항</p>
                                <c:if test="${empty next}">
                                    <h4> 마지막 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty next}">
                                    <a href="${path}/dataRoom/detail?articleNo=${next.articleNo}&page=${curPage}">
                                        <h4>${next.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                            <c:if test="${not empty next}">
                                <div class="arrow">
                                    <a href="${path}/dataRoom/detail?articleNo=${next.articleNo}&page=${curPage}" style="color: #333"><i class="fa-solid fa-angle-right"></i></a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>