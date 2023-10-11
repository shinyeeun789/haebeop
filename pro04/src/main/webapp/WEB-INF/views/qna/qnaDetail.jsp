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
    <title> Q&A </title>
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
                        <h2> Q&A Detail </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/qna/list"> Q&A </a>
                            <a href="${path}/qna/detail?qno=${detail.qno}&page=${curPage}"> Detail </a>
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
                <a href="${path}/qna/list?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>"
                   class="btn btn-outline-dark"> 목록 </a>
                <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
                    <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-dark"> 수정 </a>
                    <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-danger"> 삭제 </a>
                </c:if>
                <c:if test="${(sid eq 'admin') and (detail.lev eq 0)}">
                    <a href="${path}/qna/answerInsert?qno=${detail.qno}" class="btn btn-dark"> 답변하기 </a>
                </c:if>
            </div>
            <div class="col-lg-12 posts-list">
                <div class="single-post row">
                    <div class="col-lg-3 col-md-3">
                        <div class="blog_info text-right">
                            <ul class="blog_meta list">
                                <li>${detail.author}<i class="ti-user"></i></li>
                                <li>${detail.resdate}<i class="ti-calendar"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2> ${detail.title} </h2>
                        <p>
                            ${detail.content}
                        </p>
                    </div>
                </div>
                <div class="navigation-area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                            <c:if test="${not empty prev}">
                                <div class="arrow">
                                    <a href="${path}/qna/detail?qno=${prev.qno}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" style="color: #333"><i class="fa-solid fa-angle-left"></i></a>
                                </div>
                            </c:if>
                            <div class="detials ml-5">
                                <p>이전 질의응답</p>
                                <c:if test="${empty prev}">
                                    <h4> 첫 번째 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty prev}">
                                    <a href="${path}/qna/detail?qno=${prev.qno}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>">
                                        <h4>${prev.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <div class="detials mr-5">
                                <p>다음 질의응답</p>
                                <c:if test="${empty next}">
                                    <h4> 마지막 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty next}">
                                    <a href="${path}/qna/detail?qno=${next.qno}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>">
                                        <h4>${next.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                            <c:if test="${not empty next}">
                                <div class="arrow">
                                    <a href="${path}/qna/detail?qno=${next.qno}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" style="color: #333"><i class="fa-solid fa-angle-right"></i></a>
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