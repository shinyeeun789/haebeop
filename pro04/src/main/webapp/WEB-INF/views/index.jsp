<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="icon" href="${path}/resources/img/favicon.png" type="image/png"/>
    <title> 해법 </title>
    <jsp:include page="layout/head.jsp"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <style>
        .swiper {
            z-index: 2;
        }
    </style>
</head>

<body>
<jsp:include page="layout/header.jsp"/>
<section id="slideBanner">
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="${path}/resources/img/banner01.jpg" alt="메인페이지 배너1" style="width: 100vw">
            </div>
            <div class="swiper-slide">
                <img src="${path}/resources/img/banner02.jpg" alt="메인페이지 배너2" style="width: 100vw">
            </div>
        </div>
        <div class="swiper-button-next" style="color: white"></div>
        <div class="swiper-button-prev" style="color: white"></div>
        <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>
</section>

<c:if test="${not empty sid and not empty myLectureList}">
    <section class="feature_area section_gap_top" style="background-color: #eee">
        <div class="container">
            <div class="section-heading style-2 text-center">
                <p> ${sid}님, 오늘도 해법과 함께해요 </p>
                <h2 class="mb-3"> 출석체크 </h2>
            </div>
            <div class="row">
                <c:forEach var="lecture" items="${myLectureList}">
                    <div class="col-lg-4 col-md-6">
                        <div class="single_feature">
                            <div class="icon"><span class="flaticon-student"></span></div>
                            <div class="desc">
                                <h4 class="mt-3 mb-2"> ${lecture.lname} </h4>
                                <p> 강의 시작 시간 &nbsp; ${lecture.stime} <br>
                                    강의실 &nbsp; ${lecture.classroom} </p>
                                <div class="d-flex justify-content-end">
                                    <a href="${path}/lectureAttend/studentAttend?lcode=${lecture.lcode}" class="btn btn-primary"> 출석체크하기 </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:if>

<!-- ##### Popular Lecture Area Start ##### -->
<section class="mt-5 mb-5 pt-5 pb-5 text-center" id="offline">
    <div class="container">
        <div class="section-heading style-2">
            <p> 수강생들이 추천하는 </p>
            <h2 class="mb-5"> 인기 강의 </h2>
        </div>
        <div class="row">
            <c:forEach var="lecture" items="${popularLectures}">
                <div class="col-4 text-center">
                    <a href="${path}/lecture/detail?lcode=${lecture.lcode}">
                        <img src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 커버 이미지" class="w-100">
                        <h5 class="mt-4 text-center">${lecture.lname}</h5>
                        <p class="text-center">${lecture.tname} 선생님</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ##### Popular Lecture Area End ##### -->

<!-- ##### Offline Lecture Area Start ##### -->
<section class="mt-5 mb-5 pt-5 pb-5 text-center" id="offline" style="background-color: #eee">
    <div class="container">
        <div class="section-heading style-2">
            <p> 실시간 대면을 통한 최고의 학습 경험 </p>
            <h2 class="mb-5"> 오프라인 강의 </h2>
        </div>
        <div class="row">
            <c:forEach var="lecture" items="${offLectures}">
                <div class="col-4 text-center">
                    <a href="${path}/lecture/detail?lcode=${lecture.lcode}">
                        <img src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 커버 이미지" class="w-100">
                        <h5 class="mt-4 text-center">${lecture.lname}</h5>
                        <p class="text-center">${lecture.tname} 선생님</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ##### Offline Lecture Area End ##### -->

<!-- ##### Online Lecture Area Start ##### -->
<section class="mt-5 mb-5 pt-5 pb-5 text-center" id="online">
    <div class="container">
        <div class="section-heading style-2">
            <p> 언제 어디서든 해법과 함께 </p>
            <h2 class="mb-5"> 온라인 강의 </h2>
        </div>
        <div class="row">
            <c:forEach var="lecture" items="${onLectures}">
                <div class="col-4 text-center">
                    <img src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 커버 이미지" class="w-100">
                    <a href="${path}/lecture/detail?lcode=${lecture.lcode}">
                        <h5 class="mt-4 text-center">${lecture.lname}</h5>
                    </a>
                    <p class="text-center">${lecture.tname} 선생님</p>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- ##### Online Lecture Area End ##### -->
<section class="mt-5 mb-5 pt-5 pb-5" id="location">
    <div class="content">
        <div class="text-center">
            <div id="map" style="margin: 0px auto; width: 100%; height: 600px; background: white;"></div>
        </div>
        <div class="container">
            <h3 class="mt-5"> 해법 </h3>
            <div class="row mt-30">
                <div class="col-2">
                    <h5> 오시는 길 </h5>
                </div>
                <div class="col">
                    <h5> 서울시 금천구 디지털로 9길 23 </h5>
                    <p class="mb-0"> 지하철 &nbsp; 1호선 7호선 가산디지털단지역 </p>
                    <p> 버스 &nbsp; 가산로데오거리, 한신IT타워, 이앤씨드림타워7차 정류장 하차 </p>
                </div>
            </div>
            <div class="row mt-15">
                <div class="col-2">
                    <h5> 상담운영 </h5>
                </div>
                <div class="col">
                    <h5> 02-1234-5678 </h5>
                    <p> 방문시 사전 전화예약 부탁드립니다. </p>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverMapKey}"></script>
    <script>
        let mapOptions = {
            center: new naver.maps.LatLng(37.4786713,126.8864968),
            zoom: 17,
            draggable: false,
            keyboardShortcuts: false,
            logoControl: false,
            mapDataControlOptions: false,
            scrollWheel: false
        };

        let map = new naver.maps.Map('map', mapOptions);

        let marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.4786713,126.8864968),
            map: map
        });
    </script>
</section>

<jsp:include page="layout/footer.jsp" />

</body>
</html>
