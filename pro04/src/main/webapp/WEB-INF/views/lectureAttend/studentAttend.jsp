<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 현재 날짜 구하기 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="currentMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 나의 출결정보 </title>
    <jsp:include page="../layout/head.jsp" />
    <c:if test="${(not empty attendList) and (attendList[0].atype eq '코드오류')}">
        <script type="text/javascript">
            alert("출석이 정상적으로 처리되지 않았습니다. 다시 시도해주세요.");
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
                        <h2> 나의 출석 관리 </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/user/myPage"> MyPage </a>
                            <a href="${path}/lectureAttend/studentAttend?lcode=${lecture.lcode}"> Attendance </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="contact-area section-padding-100 mt-100 pb-0">
    <div class="container">
        <div class="section-heading text-center">
            <p> 오프라인 강의 출석하기 </p>
            <h2 class="text-dark"> ${lecture.lname} </h2>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <div class="contact-form-area">
                    <form action="${path}/lectureAttend/studentAttend" method="post">
                        <div class="row w-75" style="margin: 0 auto">
                            <div class="col-lg-8 col-md-12 form-group">
                                <input type="text" class="form-control text-center" id="attendCode" name="attendCode" placeholder="출결코드를 입력해주세요" autocomplete="off" autofocus>
                                <input type="hidden" name="lcode" id="lcode" value="${lecture.lcode}">
                            </div>
                            <div class="col-lg-4 col-md-12 text-right">
                                <button class="btn btn-primary w-100" type="submit"> Send <i class="fa fa-angle-double-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="contact-area section-padding-100 mt-5 mb-5 p-5" style="background-color: #eee">
    <div class="container w-75">
        <h3 class="mb-30"> ${calendarInfo.month}월 </h3>
        <c:forEach var="i" begin="0" end="5">
            <div class="row text-center">
                <c:forEach var="j" begin="0" end="6">
                    <c:set var="date" value="${(7 * i + j) - (calendarInfo.startDayOfWeek - 1)}"></c:set>
                    <c:if test="${not (date > calendarInfo.endDay and i eq 5)}">
                        <c:if test="${date < 1 or date > calendarInfo.endDay}">
                            <div class="bg-white col" style="height: 160px; width: 10%;"></div>
                        </c:if>
                        <c:if test="${date > 0 and date <= calendarInfo.endDay}">
                            <c:if test="${date < 10}">
                                <c:set var="date" value="0${date}"/>
                            </c:if>
                            <div class="bg-white col" id="${date}" style="height: 160px; width: 10%;">
                                <h5 class="pt-3"> ${date} </h5>
                            </div>
                        </c:if>
                    </c:if>
                </c:forEach>
            </div>
        </c:forEach>
    </div>
</section>
<section class="contact-area mb-5 pb-5">
    <div class="container text-center">
        <table class="table table-hover">
            <thead>
            <tr>
                <td width="30%"> 출석체크 일자 </td>
                <td width="30%"> 출석체크 시간 </td>
                <td> 출결 현황 </td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="attend" items="${attendList}">
                <tr>
                    <td> ${attend.adate} </td>
                    <td>
                        <c:if test="${attend.atime eq '00:00:00'}"> - </c:if>
                        <c:if test="${attend.atime ne '00:00:00'}"> ${attend.atime} </c:if>
                    </td>
                    <td> ${attend.atype} </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

<script>
    $(document).ready(function() {
        // 개강을 이번 달에 한다면 달력에 표시
        if(${fn:substring(lecture['sdate'], 5, 7) eq currentMonth}) {
            let sdate = "${fn:substring(lecture['sdate'], 8, 10)}";
            $("#"+sdate).append("<p class='bg-primary' style='color:white'> 개강 </p>");
        }

        // 종강을 이번 달에 한다면 달력에 표시
        if(${fn:substring(lecture['edate'], 5, 7) eq currentMonth}) {
            let edate = "${fn:substring(lecture['edate'], 8, 10)}";
            $("#"+edate).append("<p class='bg-primary' style='color:white'> 종강 </p>");
        }

        // 출결 사항 달력에 표시
        let date = 0;
        <c:forEach var="item" items="${attendList}">
        date = "${fn:substring(item['adate'], 8, 10)}"
        <c:if test="${item['atype'] eq '출석'}">
        $("#"+date).append("<p class='bg-success' style='color:white'> ${item['atype']} </p>");
        </c:if>
        <c:if test="${item['atype'] eq '결석'}">
        $("#"+date).append("<p class='bg-danger' style='color:white'> ${item['atype']} </p>");
        </c:if>
        <c:if test="${item['atype'] eq '지각'}">
        $("#"+date).append("<p class='bg-warning' style='color:white'> ${item['atype']} </p>");
        </c:if>
        <c:if test="${item['atype'] eq '코드오류'}">
        $("#"+date).append("<p class='bg-danger' style='color:white'> ${item['atype']} </p>");
        </c:if>
        </c:forEach>
    });
</script>
</body>
</html>
