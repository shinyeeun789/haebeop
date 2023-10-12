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
                        <h2> Q&A </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/qna/list"> Q&A </a>
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
            <form action="${path}/board/list" method="get" class="w-50 mb-5">
                <div class="row">
                    <div class="col mt-2">
                        <select id="type" name="type" class="form-select">
                            <option value="T"> 제목 </option>
                            <option value="C"> 내용 </option>
                            <option value="W"> 작성자 </option>
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

        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th width="100"> # </th>
                <th> 제목 </th>
                <th width="210"> 작성자 </th>
                <th width="210"> 작성일 </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="qna" items="${qnaList}">
                <tr onclick="javascript: location.href='${path}/qna/detail?qno=${qna.qno}&page=${curPage}'" style="cursor: pointer">
                    <td> ${qna.qno} </td>
                    <c:if test="${qna.lev eq 0}">
                        <td class="text-left"> ${qna.title} </td>
                    </c:if>
                    <c:if test="${qna.lev eq 1}">
                        <td class="text-left">  ⌞ ${qna.title} </td>
                    </c:if>
                    <td> ${qna.author} </td>
                    <td> ${qna.resdate} </td>
                </tr>
            </c:forEach>
            <c:if test="${empty qnaList}">
                <tr class="text-center">
                    <td colspan="5"> 등록된 Q&A가 없습니다. </td>
                </tr>
            </c:if>
            </tbody>
        </table>

        <!-- pagination -->
        <nav aria-label="Page navigation example" class="mt-25 mb-30">
            <ul class="pagination justify-content-center">
                <c:if test="${curPage > 5}">
                    <li class="page-item">
                        <a class="page-link" href="${path}/qna/list?page=${page.blockStartNum - 1}" aria-label="Previous">
                            <span aria-hidden="true"><<</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="${path}/qna/list?page=${i}">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${path}/qna/list?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <li class="page-item">
                        <a class="page-link" href="${path}/qna/list?page=${page.blockLastNum + 1}" aria-label="Next">
                            <span aria-hidden="true">>></span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>

        <c:if test="${not empty sid}">
            <div class="text-right">
                <a href="${path}/qna/questionInsert" class="btn btn-dark"> 질문하기 </a>
            </div>
        </c:if>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>