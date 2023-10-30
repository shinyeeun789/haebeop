<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
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
    <title>회원가입</title>
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
                        <h2> Sign Up </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/user/joinType"> Sign Up </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container mt-100 mb-5 pb-5">
        <div class="text-center mt-100 mb-100">
            <h2 class="mb-5"> 회원 유형을 선택해주세요 </h2>
            <form action="${path}/user/term" method="get">
                <div class="d-flex justify-content-around">
                    <div class="rounded-circle" id="studentArea"
                         style="background-image: url('${path}/resources/img/studentType.jpg'); background-position: center; background-size: cover;
                                 width: 300px; height: 300px; border: 5px solid white; cursor: pointer;">
                        <input type="radio" class="d-none" id="student" name="userType" value="student">
                    </div>
                    <div class="rounded-circle" id="teacherArea"
                         style="background-image: url('${path}/resources/img/teacherType.jpg'); background-position: center; background-size: cover;
                                 width: 300px; height: 300px; border: 5px solid white; cursor: pointer;">
                        <input type="radio" class="d-none" id="teacher" name="userType" value="teacher">
                    </div>
                </div>
                <div class="d-flex justify-content-around">
                    <h3 class="mt-20"> 학생입니다 </h3>
                    <h3 class="mt-20"> 강사입니다 </h3>
                </div>
                <input type="submit" class="btn btn-primary btn-lg mt-5" value="다음 단계">
            </form>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

<script>
    $("#studentArea").on("click", () =>{
        $("#studentArea").css("border", "5px solid #fdc632");
        $("#teacherArea").css("border", "5px solid white");
        $("#student").prop("checked", true);
    });
    $("#teacherArea").on("click", () =>{
        $("#teacherArea").css("border", "5px solid #fdc632");
        $("#studentArea").css("border", "5px solid white");
        $("#teacher").prop("checked", true);
    });
</script>
</body>
</html>