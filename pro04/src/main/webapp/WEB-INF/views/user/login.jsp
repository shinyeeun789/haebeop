<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:if test="${not empty cookie.userID}">
    <c:set value="checked" var="checked" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 로그인 </title>
    <jsp:include page="../layout/head.jsp" />
    <script type="text/javascript">
        $(document).ready(() => {
            <c:if test="${msg == 0}">
                $("#msg").html("<i class='fa-solid fa-circle-exclamation'></i> 아이디 또는 비밀번호가 틀렸습니다");
            </c:if>
        });
    </script>
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
                            <h2> Login </h2>
                            <div class="page_link">
                                <a href="${path}/"> Home </a>
                                <a href="${path}/user/login"> Login </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container p-5 shadow" style="margin: 150px auto; height: 600px">
        <div class="row">
            <div class="col"
                style="background-image: url('${path}/resources/img/login.png');
                        background-position: center;
                        background-size: cover">
            </div>
            <div class="col p-5">
                <h1> 로그인하기 <i class="fa-solid fa-arrow-right-to-bracket"></i> </h1>
                <form action="${path}/user/login" method="post">
                    <div class="form-group mt-3">
                        <label for="id"> ID </label>
                        <input type="text" name="id" id="id" class="form-control" autocomplete="off" value="${cookie.userID.value}">
                    </div>
                    <div class="form-group mt-3">
                        <label for="pw"> Password </label>
                        <input type="password" name="pw" id="pw" class="form-control">
                        <p id="msg" class="mt-3" style="color: red"></p>
                    </div>
                    <div class="switch-wrap d-flex mt-3">
                        <div class="primary-switch">
                            <input type="checkbox" id="default-switch" name="saveId" value="save" ${checked}>
                            <label for="default-switch"></label>
                        </div>
                        <p class="ml-2"> 아이디 기억하기 </p>
                    </div>

                    <input type="submit" value="Log In" class="btn btn-primary btn-lg">
                </form>
            </div>
        </div>
        <div class="container text-center">
            <p>회원이 아니신가요? <a href="${path}/user/term"> 회원가입하기 </a></p>
        </div>
    </div>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
