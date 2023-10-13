<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo_h" href="${path}/">
                    <picture>
                        <source srcset="${path}/resources/img/logo.png" media="all and (min-width: 992px)">
                        <img src="${path}/resources/img/logo2.png" alt="해법 로고 이미지" style="height: 38px">
                    </picture>
                </a>
                <button class="navbar-toggler"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="icon-bar"></span> <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html"> 강의 </a>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle"
                               data-toggle="dropdown"
                               role="button"
                               aria-haspopup="true"
                               aria-expanded="false"> 서비스 </a>
                            <ul class="dropdown-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/board/list"> 커뮤니티 </a>
                                </li>
                                <li class="nav-item">
                                    <c:if test="${not empty sid}">
                                        <a class="nav-link" href="${path}/attendance/check"> 출석체크 </a>
                                    </c:if>
                                    <c:if test="${empty sid}">
                                        <a class="nav-link" href="${path}/user/login" onclick="return alert('로그인 후 접근 가능한 페이지입니다 : )')">
                                            출석체크
                                        </a>
                                    </c:if>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/news/list"> 교육뉴스 </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/event/list"> 이벤트 </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown nav-last">
                            <a href="#"
                               class="nav-link dropdown-toggle"
                               data-toggle="dropdown"
                               role="button"
                               aria-haspopup="true"
                               aria-expanded="false">고객지원</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/notice/list">공지사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/qna/list">Q&A</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/faq/list">FAQ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/dataRoom/list">자료실</a>
                                </li>
                            </ul>
                        </li>
                        <c:if test="${empty sid}">
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/user/login">로그인</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/user/term">회원가입</a>
                            </li>
                        </c:if>
                        <c:if test="${not empty sid and sid eq 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/user/logout">로그아웃</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/admin/dashboard">관리자페이지</a>
                            </li>
                        </c:if>
                        <c:if test="${not empty sid and sid ne 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/user/logout">로그아웃</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/user/myPage">마이페이지</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
