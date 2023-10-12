<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <title> 출석체크 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>

    <style>
        .popup-wrapper {
            position: fixed;
            z-index: 100;
            top: 50%;
            margin-top: -250px;
            left: 50%;
            margin-left: -250px;
        }
        .popup {
            position: relative;
            background-image: url("${path}/resources/img/attendPoint.jpg");
            background-size: cover;
            border-radius: 20px;
            box-shadow: 5px 5px 10px #555;
            padding: 20px;
            text-align: center;
            width: 500px;
            height: 500px;
        }
        .close-btn {
            position: absolute;
            background-color: transparent;
            border: none;
            right: 20px;
            top: 20px;
            cursor: pointer;
        }
        .point-info {
            margin-top: 130px;
            color: white;
        }
        .point {
            line-height: 100px;
            color: #ebe5e9;
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- 배너 -->
<section class="banner_area">
    <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="banner_content text-center">
                        <h2> 출석체크 </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/attendance/check"> 출석체크 </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container mt-100 text-center">
        <h3 class="mb-5" style="color: #007cf0"> 출석체크하고 포인트 받자 <i class="fa-solid fa-face-laugh-squint fa-bounce"></i> </h3>
        <c:forEach var="i" begin="0" end="5">
            <div class="row">
                <c:forEach var="j" begin="0" end="6">
                    <c:set var="date" value="${(7 * i + j) - (calendarInfo.startDayOfWeek - 1)}"></c:set>
                    <c:if test="${date < 1 or date > calendarInfo.endDay}">
                        <div class="col m-1" style="height: 80px;"></div>
                    </c:if>
                    <c:if test="${date > 0 and date <= calendarInfo.endDay and !fn:contains(list, ' '+=date+=' ')}">
                        <div class="col m-1" style="height: 80px; background-color: #EEE;">
                            <h5 class="m-3"> ${date} </h5>
                        </div>
                    </c:if>
                    <c:if test="${date > 0 and date <= calendarInfo.endDay and fn:contains(list, ' '+=date+=' ')}">
                        <div class="col m-1" style="height: 80px; background-color: #6EB3FE">
                            <h5 class="m-3"> ${date} </h5>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </c:forEach>

        <!-- 오늘 이미 출석체크를 했다면 버튼 비활성화 -->
        <div class="has-text-centered">
            <c:if test="${attendChk}">
                <button type="button" class="btn btn-primary btn-lg" style="margin-bottom: 120px" disabled> 출석체크 완료 </button>
            </c:if>
            <!-- 오늘 출석체크를 하지 않았다면 버튼 활성화 -->
            <c:if test="${!attendChk}">
                <a href="${path}/attendance/addAttend" class="btn btn-primary btn-lg" style="margin-bottom: 120px"> 출석체크 </a>
            </c:if>
        </div>
    </div>
</section>

<!-- 적립된 포인트 팝업창 -->
<c:if test="${!empty point}">
    <div class="popup-wrapper">
        <div class="popup">
            <button class="close-btn" onclick="closePopup()"><i class="fa-solid fa-x" style="color: #fff"></i></button>
            <h3 class="point-info"> 출석체크하고 </h3>
            <h2 class="point">  </h2>
            <h3 style="color: white"> 받았어요! </h3>
        </div>
    </div>
    <script>
        $(document).ready(() => {
            let beforeNum, ranNum = 0;
            let startRandom = setInterval(() => {
                let beforeNum = ranNum;
                while(true) {
                    if(beforeNum != ranNum) {
                        break;
                    }
                    ranNum = Math.floor(Math.random()*100+10);
                }
                $(".point").text(ranNum + ' point');
            }, 50);

            setTimeout(() => {
                clearInterval(startRandom);
                $(".point").text(`${point} point`);
            }, 1500);
        });

        function closePopup() {
            $(".popup-wrapper").css("display","none");
        }
    </script>
</c:if>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>