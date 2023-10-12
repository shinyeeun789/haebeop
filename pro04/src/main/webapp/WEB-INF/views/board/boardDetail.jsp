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
    <title> 커뮤니티 </title>
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
                        <h2> Community Detail </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/board/list"> Community </a>
                            <a href="${path}/board/detail?seq=${detail.seq}&page=${curPage}"> Detail </a>
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
                <a href="${path}/board/list?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>"
                   class="btn btn-outline-dark"> 목록 </a>
                <c:if test="${(sid eq 'admin') or (sid eq detail.nickname)}">
                    <a href="${path}/board/edit?seq=${detail.seq}" class="btn btn-outline-dark"> 수정 </a>
                    <a href="${path}/board/delete?seq=${detail.seq}" class="btn btn-danger"> 삭제 </a>
                </c:if>
            </div>
            <div class="col-lg-12 posts-list">
                <div class="single-post row">
                    <div class="col-lg-3 col-md-3">
                        <div class="blog_info text-right">
                            <div class="post-tag">
                                <p>#${detail.cateName}</p>
                            </div>
                            <ul class="blog_meta list">
                                <li>${detail.nickname} &nbsp; <i class="fa-regular fa-user"></i></li>
                                <li>
                                    <fmt:parseDate value="${detail.regdate }" var="resdate"
                                                   pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    &nbsp; <i class="fa-regular fa-calendar"></i>
                                </li>
                                <li>${detail.visited} Views &nbsp; <i class="fa-regular fa-eye"></i></li>
                                <li>${fn:length(commentList)} Comments &nbsp; <i class="fa-regular fa-comment"></i></li>
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
                                    <a href="${path}/board/detail?seq=${prev.seq}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                       style="color: #333"><i class="fa-solid fa-angle-left"></i></a>
                                </div>
                            </c:if>
                            <div class="detials ml-5">
                                <p>이전 글</p>
                                <c:if test="${empty prev}">
                                    <h4> 첫 번째 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty prev}">
                                    <a href="${path}/board/detail?seq=${prev.seq}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>">
                                        <h4>${prev.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <div class="detials mr-5">
                                <p>다음 글</p>
                                <c:if test="${empty next}">
                                    <h4> 마지막 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty next}">
                                    <a href="${path}/board/detail?seq=${next.seq}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>">
                                        <h4>${next.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                            <c:if test="${not empty next}">
                                <div class="arrow">
                                    <a href="${path}/board/detail?seq=${next.seq}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                       style="color: #333"><i class="fa-solid fa-angle-right"></i></a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="comment-form">
                    <h4> 댓글 작성하기 </h4>
                    <form action="${path}/comment/insert" method="post">
                        <div class="form-group">
                            <textarea class="form-control mb-10" rows="5" name="content" placeholder="댓글을 입력해주세요"
                                      onfocus="this.placeholder = ''" onblur="this.placeholder = '댓글을 입력해주세요'"
                                      required=""></textarea>
                            <input type="hidden" id="seq" name="seq" value="${detail.seq}">
                            <input type="hidden" id="page" name="page" value="${curPage}">
                            <c:if test="${!empty cate}">
                                <input type="hidden" id="cate" name="cate" value="${cate}">
                            </c:if>
                            <c:if test="${!empty keyword}">
                                <input type="hidden" id="type" name="type" value="${type}">
                                <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                            </c:if>
                        </div>
                        <button type="submit" class="btn primary-btn"> 작성하기</button>
                    </form>
                </div>
                <div class="comments-area">
                    <h4> ${fn:length(commentList)} Comments </h4>
                    <c:forEach var="comment" items="${commentList}">
                        <c:set var="random" value="<%= (int) (java.lang.Math.random() * 4) + 1 %>"/>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="${path}/resources/img/profile0${random}.png" alt="프로필 이미지"
                                             style="width: 60px; height: auto;">
                                    </div>
                                    <div class="desc">
                                        <h5>${comment.nickname}</h5>
                                        <p class="date"> ${comment.resdate} </p>
                                        <p class="comment">
                                                ${comment.content}
                                        </p>
                                    </div>
                                </div>
                                <c:if test="${(sid eq 'admin') or (sid eq comment.nickname)}">
                                    <div class="reply-btn">
                                        <a href="${path}/comment/delete?comNo=${comment.comNo}&seq=${detail.seq}"
                                           class="btn-reply text-uppercase">삭제</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation example" class="mt-25 mb-30">
            <ul class="pagination justify-content-center">
                <c:if test="${curPage > 5}">
                    <li class="page-item">
                        <a class="page-link"
                           href="${path}/board/list?page=${page.blockStartNum - 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li class="page-item active" aria-current="page">
                                <a class="page-link"
                                   href="${path}/board/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link"
                                   href="${path}/board/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <li class="page-item">
                        <a class="page-link"
                           href="${path}/board/list?page=${page.blockLastNum + 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>