<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<footer class="footer-area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-6 single-footer-widget">
                <h4> 강의 </h4>
                <ul>
                    <li><a href="${path}/lecture/list">강의 목록</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 single-footer-widget">
                <h4> 서비스 </h4>
                <ul>
                    <li><a href="${path}/board/list"> 커뮤니티 </a></li>
                    <li><a href="${path}/attendance/check"> 출석체크 </a></li>
                    <li><a href="${path}/news/list"> 교육뉴스 </a></li>
                    <li><a href="${path}/event/list"> 이벤트 </a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 single-footer-widget">
                <h4> 고객지원 </h4>
                <ul>
                    <li><a href="${path}/notice/list"> 공지사항 </a></li>
                    <li><a href="${path}/qna/list"> Q&A </a></li>
                    <li><a href="${path}/faq/list"> FAQ </a></li>
                    <li><a href="${path}/dataRoom/list"> 자료실 </a></li>
                </ul>
            </div>
        </div>
        <div class="row footer-bottom d-flex justify-content-between">
            <p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                SHINYEEUN | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
            </p>
            <div class="col-lg-4 col-sm-12 footer-social">
                <i class="fa-brands fa-github"></i>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="${path}/resources/js/popper.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="${path}/resources/vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script src="${path}/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="${path}/resources/js/owl-carousel-thumb.min.js"></script>
<script src="${path}/resources/js/jquery.ajaxchimp.min.js"></script>

<script src="${path}/resources/js/theme.js"></script>
