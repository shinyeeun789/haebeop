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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container p-5" style="margin: 100px auto;">
        <!-- 검색어 입력 부분 -->
        <div class="d-flex justify-content-end">
            <form action="${path}/board/list" method="get" class="w-50 mb-5">
                <div class="row">
                    <div class="col mt-2">
                        <select id="type" name="type" class="form-select">
                            <option value="T"> 제목 </option>
                            <option value="C"> 내용 </option>
                        </select>
                    </div>
                    <div class="col-xl-8 col-lg-12 col-md-12 mt-2">
                        <div class="input-group">
                            <div class="input-group-prepend">

                            </div>
                            <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" autocomplete="off" aria-label="검색어를 입력해주세요" aria-describedby="button-addon2" value="${page.keyword}">
                            <div class="input-group-append">
                                <button class="btn btn-dark" type="submit" id="button-addon2"> 검색 </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-2">
                <div class="list-group">
                    <a href="${path}/event/list" class="list-group-item list-group-item-action active" aria-current="true"> 이벤트 목록 </a>
                    <a href="${path}/winner/list" class="list-group-item list-group-item-action">
                        당첨자 목록
                    </a>
                </div>
            </div>
            <div class="col">
                <table class="table table-hover text-center">
                    <thead>
                    <tr>
                        <th width="80"> # </th>
                        <th> 제목 </th>
                        <th width="200"> 이벤트상태 </th>
                        <th width="120"> 시작일 </th>
                        <th width="120"> 종료일 </th>
                        <th width="100"> 조회수 </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="event" items="${eventList}">
                        <tr onclick="javascript: location.href='${path}/event/detail?eno=${event.eno}&page=${curPage}'" style="cursor: pointer">
                            <td> ${event.eno} </td>
                            <td class="text-left"> ${event.title} </td>
                            <c:if test='${event.status eq "1"}'>
                                <td><span class="badge badge-pill badge-success">진행 중</span></td>
                            </c:if>
                            <c:if test='${event.status eq "0"}'>
                                <td><span class="badge badge-pill badge-danger">종료</span></td>
                            </c:if>
                            <td> ${event.sdate} </td>
                            <td> ${event.edate} </td>
                            <td> ${event.cnt} </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty eventList}">
                        <tr class="text-center">
                            <td colspan="6"> 등록된 이벤트가 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- pagination -->
        <nav aria-label="Page navigation example" class="mt-25 mb-30">
            <ul class="pagination justify-content-center">
                <c:if test="${curPage > 5}">
                    <li class="page-item">
                        <a class="page-link" href="${path}/event/list?page=${page.blockStartNum - 1}" aria-label="Previous">
                            <span aria-hidden="true"><<</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="${path}/event/list?page=${i}">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${path}/event/list?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <li class="page-item">
                        <a class="page-link" href="${path}/event/list?page=${page.blockLastNum + 1}" aria-label="Next">
                            <span aria-hidden="true">>></span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>

        <c:if test="${sid eq 'admin'}">
            <div class="text-right">
                <a href="${path}/event/insert" class="btn btn-dark"> 글 작성하기 </a>
            </div>
        </c:if>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>