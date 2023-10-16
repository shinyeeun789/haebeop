<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 마이페이지 </title>
    <jsp:include page="../layout/head.jsp" />
</head>
<body>
    <jsp:include page="../layout/header.jsp" />
    <section class="banner_area">
        <div class="banner_inner d-flex align-items-center">
            <div class="overlay"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="banner_content text-center">
                            <h2> MyPage </h2>
                            <div class="page_link">
                                <a href="${path}/"> Home </a>
                                <a href="${path}/user/myPage"> MyPage </a>
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
                <div class="bg-light col-3 mr-3 p-5 text-center">
                    <c:set var="random" value="<%= (int) (java.lang.Math.random() * 4) + 1 %>"/>
                    <img src="${path}/resources/img/profile0${random}.png" alt="프로필 이미지"
                         style="width: 60px; height: auto;">
                    <h3 class="mt-20 mb-4"> ${user.name} 님 </h3>
                    <hr>
                    <h4 class="d-flex justify-content-between mt-4 text-warning"> <i class="fa-solid fa-sack-dollar"></i> <span> ${user.pt} 포인트 </span></h4>
                    <hr>
                    <p class="d-flex justify-content-between mt-4"> <i class="fa-solid fa-envelope"></i> ${user.email} </p>
                    <p class="d-flex justify-content-between"> <i class="fa-solid fa-phone"></i> ${user.tel} </p>
                    <p class="d-flex justify-content-between"> <i class="fa-solid fa-cake-candles"></i> ${user.birth} </p>
                    <p class="d-flex justify-content-between"> <i class="fa-solid fa-location-dot"></i> ${user.addr1} </p>
                    <p class="d-flex justify-content-end"> ${user.addr2} </p>
                    <a href="${path}/user/edit" class="btn btn-dark"> 개인정보 변경 </a>
                </div>
                <div class="col ml-3 p-3">
                    <div class="pl-5 pr-5 pt-3">
                        <h2> <i class="fa-solid fa-pen"></i> &nbsp; 최근 학습한 강의 </h2>
                        <div class="row">
                            <c:forEach var="progress" items="${progressList}">
                                <div class="col-6 mt-3">
                                    <div class="bg-light p-4 border-bottom">
                                        <h4> 강의명 </h4>
                                        <a href="${path}/lecture/detail?lcode=${progress.lcode}"
                                           class="btn btn-link p-0"> ${progress.lname} </a>
                                        <p class="mt-3"> ${progress.lcontent} </p>
                                        <div class="progress mt-3">
                                            <div class="progress-bar color-1" role="progressbar" style="width: ${progress.progress}%" aria-valuenow="${progress.progress}" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <p class="badge pl-0"> 진도율: ${progress.stdCnt}강 / ${progress.lecCnt}강 (${progress.progress}%) </p>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${empty progressList}">
                                <p class="text-center p-3"> 최근에 학습한 강의가 없습니다. </p>
                            </c:if>
                        </div>
                    </div>

                    <div class="pl-5 pr-5 pt-3 mt-5">
                        <h2> <i class="fa-solid fa-video"></i> &nbsp; 나의 강의실 </h2>
                        <div class="popular_courses pb-2">
                            <div class="row">
                                <c:forEach var="lecture" items="${lectureList}">
                                    <div class="col-6 mt-3">
                                        <div class="single_course">
                                            <div class="course_head">
                                                <img class="img-fluid" src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 이미지" />
                                            </div>
                                            <div class="course_content">
                                                <span class="price">${lecture.sname}</span>
                                                <span class="tag mb-4 d-inline-block">
                                                    <c:if test="${lecture.state eq 'on'}">
                                                        온라인
                                                    </c:if>
                                                    <c:if test="${lecture.state eq 'off'}">
                                                        오프라인
                                                    </c:if>
                                                    <c:if test="${lecture.state eq 'close'}">
                                                        <span> 폐강 </span>
                                                    </c:if>
                                                </span>
                                                <h4 class="mb-3">
                                                    <a href="${path}/lecture/detail?lcode=${lecture.lcode}"> ${lecture.lname} </a>
                                                </h4>
                                                <p> ${lecture.lcontent} </p>
                                                <div class="course_meta">
                                                    <div class="authr_meta d-flex justify-content-between">
                                                        <i class="fa-solid fa-chalkboard-user"></i>
                                                        <span class="d-inline-block ml-2"> ${lecture.tname} </span>
                                                    </div>
                                                    <div class="mt-3 d-flex justify-content-between">
                                                        <i class="fa-regular fa-calendar"></i>
                                                        <span class="meta_info">
                                                             ${lecture.sdate} ~ ${lecture.edate}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty lectureList}">
                                    <div class="col-12 text-center mt-5">
                                        <h4> 수강신청한 강의가 없습니다. </h4>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- pagination -->
                        <nav aria-label="Page navigation example" class="mt-25 mb-30">
                            <ul class="pagination justify-content-center">
                                <c:if test="${curPage > 5}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/user/myPage?page=${page.blockStartNum - 1}" aria-label="Previous">
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
                                        <a class="page-link" href="${path}/user/myPage?page=${page.blockLastNum + 1}" aria-label="Next">
                                            <span aria-hidden="true">>></span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
