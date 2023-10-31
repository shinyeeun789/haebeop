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
    <title> 당첨자 발표 목록 </title>
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
                        <h2> Event Winner </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/event/list"> Event </a>
                            <a href="${path}/winner/list"> Winner </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container p-5" style="margin: 100px auto;">
        <div class="d-flex justify-content-end">
            <!-- 검색어 입력 부분 -->
            <form action="${path}/winner/list" method="get" class="w-50 mb-5">
                <div class="row">
                    <div class="col mt-2">
                        <select id="type" name="type" class="form-select">
                            <option value="T"> 제목</option>
                            <option value="C"> 내용</option>
                        </select>
                    </div>
                    <div class="col-xl-8 col-lg-12 col-md-12 mt-2">
                        <div class="input-group">
                            <div class="input-group-prepend">

                            </div>
                            <input type="text" class="form-control" id="keyword" name="keyword"
                                   placeholder="검색어를 입력해주세요" autocomplete="off" aria-label="검색어를 입력해주세요"
                                   aria-describedby="button-addon2" value="${page.keyword}">
                            <div class="input-group-append">
                                <button class="btn btn-dark" type="submit" id="button-addon2"> 검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-2">
                <div class="list-group">
                    <a href="${path}/event/list" class="list-group-item list-group-item-action"
                       aria-current="true"> 이벤트 목록 </a>
                    <a href="${path}/winner/list" class="list-group-item list-group-item-action active">
                        당첨자 목록
                    </a>
                </div>
            </div>
            <div class="col">
                <table class="table project-table table-centered table-nowrap">
                    <thead>
                    <tr>
                        <th scope="col" class="text-center" style="width: 5%">#</th>
                        <th scope="col" class="text-center">제목</th>
                        <th scope="col" class="text-center" style="width: 15%">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${winnerList }" var="winner" varStatus="status">
                        <tr class="table-hover">
                            <th class="text-center">${winner.wno}</th>
                            <td>
                                <c:if test="${empty sid}">
                                    ${winner.title}
                                </c:if>
                                <c:if test="${!empty sid}">
                                    <a href="${path}/winner/detail?wno=${winner.wno}&page=${curPage}" class="text-dark">${winner.title}</a>
                                </c:if>
                            </td>
                            <td class="text-center">
                                <fmt:parseDate value="${winner.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty winnerList}">
                        <tr>
                            <td colspan="7" class="text-center"> 당첨자 발표가 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
                <!-- pagination -->
                <nav aria-label="Page navigation example" class="mt-25 mb-30">
                    <ul class="pagination justify-content-center">
                        <c:if test="${curPage > 5}">
                            <li class="page-item">
                                <a class="page-link" href="${path}/user/myPage?page=${page.blockStartNum - 1}"
                                   aria-label="Previous">
                                    <span aria-hidden="true"><<</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item active" aria-current="page">
                                        <a class="page-link" href="${path}/user/myPage?page=${i}">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/user/myPage?page=${i}">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <li class="page-item">
                                <a class="page-link" href="${path}/user/myPage?page=${page.blockLastNum + 1}"
                                   aria-label="Next">
                                    <span aria-hidden="true">>></span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>

</body>
</html>
