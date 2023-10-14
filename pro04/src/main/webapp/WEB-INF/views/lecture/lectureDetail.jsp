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
    <title> 강의 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <style>
        /* 리뷰 작성 시 별점 CSS */
        .my-star{
            display: inline-block;
            width: 30px;
            height: 30px;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
            font-size: 1.8em;
            box-sizing: border-box;
            cursor: pointer;
        }

        .my-star:hover {
            text-shadow: 0 0 0 #ccc;
        }

        .my-star.on{
            text-shadow: 0 0 0 #ffbc00;
        }
    </style>
    <c:if test="${not empty msg}">
        <script>
            alert("${msg}");
        </script>
    </c:if>
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
                        <h2> Lecture Detail </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/lecture/list"> Lecture </a>
                            <a href="${path}/lecture/detail"> Detail </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="course_details_area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 course_details_left">
                <div class="main_image">
                    <img class="img-fluid" src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 이미지">
                </div>
                <div class="content_wrapper">
                    <h3 class="mt-5"> ${lecture.lname} </h3>

                    <h4 class="title"> 강의 소개 </h4>
                    <div class="content">
                        ${lecture.lcontent}
                    </div>

                    <h4 class="title"> 강사 소개 </h4>
                    <div class="content">
                        <div class="row">
                            <div class="col-4">
                                <img src="${path}/resources/upload/teacher/${teacher.saveFile}" alt="${teacher.tname} 이미지"
                                    style="width: 100%;" class="rounded">
                            </div>
                            <div class="col">
                                <ul>
                                    <li>
                                        <a class="d-flex justify-content-between">
                                            <p> 선생님 전화번호 </p>
                                            <span> ${teacher.ttel} </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="d-flex justify-content-between">
                                            <p> 선생님 이메일 </p>
                                            <span> ${teacher.temail} </span>
                                        </a>
                                    </li>
                                </ul>
                                <p> ${teacher.tcontent}</p>
                            </div>
                        </div>
                    </div>

                    <h4 class="title"> 커리큘럼 </h4>
                    <div class="content">
                        <ul class="course_list">
                            <c:forEach var="curr" items="${curriculumList}">
                                <li class="justify-content-between d-flex">
                                    <p>${curr.cname}</p>
                                    <c:if test="${lecture.state eq 'on'}">
                                        <a class="btn primary-btn text-uppercase" href="#"> 강의 듣기 </a>
                                    </c:if>
                                </li>
                            </c:forEach>
                            <c:if test="${empty curriculumList}">
                                <p class="text-center"> 등록된 커리큘럼이 없습니다. </p>
                            </c:if>
                        </ul>

                        <!-- pagination -->
                        <nav aria-label="Page navigation example" class="mt-25 mb-30">
                            <ul class="pagination justify-content-center">
                                <c:if test="${curPage > 5}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/lecture/detail?page=${page.blockStartNum - 1}" aria-label="Previous">
                                            <span aria-hidden="true"><<</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                    <c:choose>
                                        <c:when test="${i == curPage}">
                                            <li class="page-item active" aria-current="page">
                                                <a class="page-link" href="${path}/lecture/detail?page=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="page-link" href="${path}/lecture/detail?page=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/lecture/detail?page=${page.blockLastNum + 1}" aria-label="Next">
                                            <span aria-hidden="true">>></span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <c:if test="${lecture.state eq 'off'}">
                        <h4 class="title"> 위치 </h4>
                        <div class="content">
                            <div class="is-center">
                                <div id="map" style="margin: 0px auto; width: 700px; height: 400px; background: white;"></div>
                            </div>
                        </div>
                        <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
                        <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
                        <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
                        <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                mapOption = {
                                    center: new daum.maps.LatLng(37.4786713,126.8864968), // 지도의 중심좌표
                                    level: 2 // 지도의 확대 레벨
                                };
                            var map = new daum.maps.Map(mapContainer, mapOption);
                            // 마커가 표시될 위치입니다
                            var markerPosition  = new daum.maps.LatLng(37.4786713,126.8864968);
                            // 마커를 생성합니다
                            var marker = new daum.maps.Marker({
                                position: markerPosition
                            });
                            // 마커가 지도 위에 표시되도록 설정합니다
                            marker.setMap(map);
                            var iwContent = '<div style="padding:5px;">마리오아울렛 2관<br><a href="" style="color:blue;" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                iwPosition = new daum.maps.LatLng(37.4786713,126.8864968); //인포윈도우 표시 위치입니다
                            // 인포윈도우를 생성합니다
                            var infowindow = new daum.maps.InfoWindow({
                                position : iwPosition,
                                content : iwContent
                            });
                            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                            infowindow.open(map, marker);
                        </script>
                    </c:if>
                </div>
            </div>

            <div class="col-lg-4 right-contents">
                <ul>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 선생님 </p>
                            <span class="or"> ${lecture.tname} </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 가격 </p>
                            <span> ${lecture.lprice} 포인트 </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 수강인원 </p>
                            <span> ${lecture.maxStudent} 명 </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 타입 </p>
                            <c:if test="${lecture.state eq 'on'}">
                                <span> 온라인 </span>
                            </c:if>
                            <c:if test="${lecture.state eq 'off'}">
                                <span> 오프라인 </span>
                            </c:if>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 수강기간 </p>
                            <span> ${lecture.sdate} ~ ${lecture.edate} </span>
                        </a>
                    </li>
                    <c:if test="${lecture.state eq 'off'}">
                        <li>
                            <a class="justify-content-between d-flex">
                                <p> 시작시간 </p>
                                <span>
                                    <fmt:parseDate value="${lecture.stime}" var="stime" pattern="HH:mm"/>
                                    <fmt:formatDate value="${stime}" pattern="HH:mm" />
                                </span>
                            </a>
                        </li>
                    </c:if>
                </ul>
                <c:if test="${(not empty sid) and isReg}">
                    <a href="${path}/lecture/register?lcode=${lecture.lcode}" class="primary-btn2 text-uppercase enroll rounded-0 text-white"> 수강신청 </a>
                </c:if>
                <c:if test="${(empty sid) or (not isReg)}">
                    <a href="javascript:alert('로그아웃 상태이거나 이미 수강신청 된 강의입니다.')" class="primary-btn2 text-uppercase enroll rounded-0 text-white" disabled> 수강신청 </a>
                </c:if>

                <h4 class="title"> 강의 리뷰 </h4>
                <div class="content">
                    <div class="review-top row pt-40">
                        <div class="col-lg-12">
                            <div class="d-flex flex-row reviews justify-content-between">
                                <span> 강의 총점 </span>
                                <div class="star">
                                    <c:forEach begin="1" end="${starAvg}">
                                        <i class="fa-solid fa-star" style="color: #FFDD85;"></i>
                                    </c:forEach>
                                    <c:forEach begin="1" end="${5 - starAvg}">
                                        <i class="fa-regular fa-star" style="color: #FFDD85;"></i>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${(not empty sid) and (not isReg)}">
                        <div class="feedeback">
                            <h6> Your Feedback </h6>
                            <form action="${path}/lecture/reviewInsert" method="post">
                                <div class="star-wrap">
                                    <span class="my-star on" value="1">⭐</span>
                                    <span class="my-star" value="2">⭐</span>
                                    <span class="my-star" value="3">⭐</span>
                                    <span class="my-star" value="4">⭐</span>
                                    <span class="my-star" value="5">⭐</span>
                                    <input type="hidden" id="star" name="star" value="1">
                                </div>
                                <textarea name="content" id="content" class="form-control" cols="10" rows="10" maxlength="900"></textarea>
                                <input type="hidden" name="lcode" id="lcode" value="${lecture.lcode}">
                                <div class="mt-10 text-right">
                                    <button type="submit" class="primary-btn2 text-right rounded-0 text-white"> 등록하기 </button>
                                </div>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${not empty reviewList}">
                        <div class="form-group mt-3 p-1">
                            <select name="type" id="type" class="form-select">
                                <option value="new" selected> 최신 순 </option>
                                <option value="desc"> 별점 높은 순 </option>
                                <option value="asc"> 별점 낮은 순 </option>
                            </select>
                        </div>
                    </c:if>
                    <c:if test="${empty reviewList}">
                        <div class="container-fluid mt-5 text-center">
                            <p> 등록된 리뷰가 없습니다. </p>
                        </div>
                    </c:if>
                    <div class="comments-area mb-30">
                        <c:forEach var="review" items="${reviewList}">
                            <c:set var="random" value="<%= (int) (java.lang.Math.random() * 4) + 1 %>"/>
                            <div class="comment-list">
                                <div class="single-comment single-reviews justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="${path}/resources/img/profile0${random}.png" alt="프로필 이미지"
                                                 style="width: 60px; height: auto;" class="rounded-circle">
                                        </div>
                                        <div class="desc">
                                            <h5>${review.id}
                                                <div class="star">
                                                    <c:forEach begin="1" end="${review.star}">
                                                        <i class="fa-solid fa-star" style="color: #FFDD85;"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="1" end="${5 - review.star}">
                                                        <i class="fa-regular fa-star" style="color: #FFDD85;"></i>
                                                    </c:forEach>
                                                </div>
                                            </h5>
                                            <p class="comment">
                                                ${review.content}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

<script>
    $(document).ready(() => {
        // Ajax를 사용하여 리뷰 목록 정렬
        $("#type").change(() => {
            let data = {"type" : $("#type").val(), "lcode" : "${lecture.lcode}"};
            $.ajax({
                url: "${path}/lecture/changeReview",
                data: data,
                type: "post",
                dataType: "json",
                success: function(result) {
                    $(".comments-area .comment-list").remove();
                    for(let idx in result) {
                        let random = parseInt(Math.random() * 4) + 1;
                        let star = result[idx].star;
                        let tag = '<div class="comment-list"><div class="single-comment single-reviews justify-content-between d-flex"><div class="user justify-content-between d-flex">' +
                            '<div class="thumb"><img src="${path}/resources/img/profile0' + random + '.png" alt="프로필 이미지" style="width: 60px; height: auto;" class="rounded-circle"></div>'+
                            '<div class="desc"><h5>'+ result[idx].id + '<div class="star">';
                        for(let idx = 0; idx < star; idx++) {
                            tag += '<i class="fa-solid fa-star ml-1" style="color: #FFDD85;"></i>';
                        }
                        for(let idx = 0; idx < (5 - star); idx++) {
                            tag += '<i class="fa-regular fa-star ml-1" style="color: #FFDD85;"></i>';
                        }
                        tag += '</div></h5><p class="comment">' + result[idx].content + '</p></div></div></div></div>';

                        $(".comments-area").append(tag);
                    }
                },
                error: function(err) {
                    console.log(err);
                }
            })
        });

        // 리뷰 별점 작성
        $(".my-star").click(function() {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            $("#star").attr("value", $(this).attr("value"));
            return false;
        });
    });
</script>

</body>
</html>