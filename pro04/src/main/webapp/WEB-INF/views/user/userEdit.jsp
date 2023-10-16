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
    <title> 개인정보 변경 </title>
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
                        <h2> Edit </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/user/myPage"> MyPage </a>
                            <a href="${path}/user/edit"> Edit </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="p-5 bg-white shadow" style="margin: 120px auto">
            <h2> 개인정보 변경 </h2>
            <form action="${path}/user/edit" method="post">
                <label for="id" class="label"> 아이디 </label>
                <input type="text" class="form-control" id="id" name="id" value="${user.id}" readonly>

                <label for="pw" class="label mt-3"> 비밀번호 </label>
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하"
                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" disabled>
                        <input type="hidden" id="pw2" name="pw2" value="${user.pw}">
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-dark" style="width: 100%" onclick="togglePw()"> 비밀번호 변경 </button>
                    </div>
                </div>
                <p id="msg" style="color: red; display: none"> 변경할 비밀번호를 입력해주세요 : ) </p>

                <label for="name" class="label mt-3"> 이름 </label>
                <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요" value="${user.name}" readonly>

                <label for="email" class="label mt-3"> 이메일 </label>
                <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요" autocomplete="off" value="${user.email}" required>

                <label for="tel" class="label mt-3"> 전화번호 </label>
                <input type="tel" class="form-control" id="tel" name="tel" placeholder="000-0000-0000 형식으로 입력해주세요" autocomplete="off"
                       pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="${user.tel}" required>

                <label for="addr2" class="label mt-3"> 주소 </label>
                <input type="text" class="form-control" id="addr1" name="addr1" placeholder="기본 주소를 입력해주세요" autocomplete="off" value="${user.addr1}" readonly>
                <input type="text" class="form-control mt-1" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" autocomplete="off" value="${user.addr2}" required>
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">
                        <input type="text" class="form-control mt-1" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" autocomplete="off" value="${user.postcode}" readonly>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-dark mt-1" style="width: 100%" onclick="findAddr()"> 우편번호 검색 </button>
                    </div>
                </div>

                <label for="tel" class="label mt-3"> 생년월일 </label>
                <input type="date" class="form-control" max="${maxDate}" id="birth" name="birth" placeholder="생년월일을 입력해주세요" autocomplete="off" value="${user.birth}" required>

                <div class="text-right mt-4">
                    <button type="submit" class="btn btn-primary btn-lg" style="width: 100%"> 개인정보 변경 </button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    // 생년월일 max값 구하기
    let now_utc = Date.now();
    let timeOff = new Date().getTimezoneOffset() * 60000;
    let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    $("#birth").attr("max", today);

    // 비밀번호 input disable Toggle
    let read_pw = true;
    function togglePw() {
        read_pw = !read_pw;
        $("#pw").attr("disabled", read_pw);
        $("#msg").slideToggle();
    }
    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("addr1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("addr1").value = jibunAddr;
                }
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>
