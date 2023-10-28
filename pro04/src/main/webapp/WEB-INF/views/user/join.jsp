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
                            <a href="${path}/user/signup"> Sign Up </a>
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
            <div class="row">
                <div class="col-4" style="background-image: url('${path}/resources/img/signup.png'); background-position: center; background-size: cover">
                </div>
                <div class="col">
                    <h2> 회원가입하기 </h2>
                    <form action="${path}/user/join" method="post" onsubmit="return joinCheck(this)">
                        <label for="id" class="label"> 아이디 </label>
                        <div class="row">
                            <div class="col-lg-9 col-md-7 col-sm-12 col-xs-12">
                                <input type="text" class="form-control" id="id" name="id" placeholder="영문 소문자, 숫자를 혼용하여 아이디를 입력해주세요"
                                       pattern="^[a-z0-9]{8,16}" maxlength="16" autocomplete="off" autofocus required>
                                <input type="hidden" name="id_chk" id="id_chk" value="no">
                            </div>
                            <div class="col">
                                <button type="button" class="btn btn-dark" style="width: 100%" onclick="idCheck()"> 중복 확인 </button>
                            </div>
                        </div>
                        <p id="msg" style="color: red"></p>

                        <label for="pw" class="label"> 비밀번호 </label>
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하"
                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>

                        <label for="pw_chk" class="label mt-3"> 비밀번호 확인 </label>
                        <input type="password" class="form-control" id="pw_chk" name="pw_chk" placeholder="비밀번호 확인을 입력해주세요"
                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                        <p id="pw_msg" style="color:red;"></p>

                        <label for="name" class="label mt-3"> 이름 </label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요" autocomplete="off" required>

                        <label for="email" class="label mt-3"> 이메일 </label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요" autocomplete="off" required>

                        <label for="tel" class="label mt-3"> 전화번호 </label>
                        <input type="tel" class="form-control" id="tel" name="tel" placeholder="000-0000-0000 형식으로 입력해주세요" autocomplete="off"
                               pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" required>

                        <label for="addr2" class="label mt-3"> 주소 </label>
                        <input type="text" class="form-control" id="addr1" name="addr1" placeholder="기본 주소를 입력해주세요" autocomplete="off" readonly>
                        <input type="text" class="form-control mt-1" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" autocomplete="off" required>
                        <div class="row">
                            <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">
                                <input type="text" class="form-control mt-1" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" autocomplete="off" readonly>
                            </div>
                            <div class="col">
                                <button type="button" class="btn btn-dark mt-1" style="width: 100%" onclick="findAddr()"> 우편번호 검색 </button>
                            </div>
                        </div>

                        <label for="tel" class="label mt-3"> 생년월일 </label>
                        <input type="date" class="form-control" max="${maxDate}" id="birth" name="birth" placeholder="생년월일을 입력해주세요" autocomplete="off" required>
                        <input type="hidden" id="userType" name="userType" value="${userType}">

                        <div class="text-right mt-4">
                            <button type="submit" class="btn btn-primary btn-lg" style="width: 100%"> 회원가입 </button>
                        </div>
                        <div class="text-center mt-3">
                            <p> 이미 회원이신가요? <a href="${path}/user/login"> 로그인하기 </a> </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    // 생년월일 max값 구하기
    let now_utc = Date.now();
    let timeOff = new Date().getTimezoneOffset() * 60000;
    let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    $("#birth").attr("max", today);
</script>
<script>
    $(document).ready(function() {
        $("#id").keyup(function() {
            $("#id_chk").val("no");
            if($(this).val() != "") {
                $("#msg").html("아이디 중복 체크를 진행해주세요");
            }
        });
        $("#pw, #pw_chk").keyup(function() {
            $("#pw_msg").html("");
        });
    });

    // 아이디 중복 체크 함수
    function idCheck() {
        if($("#id").val() == "") {
            $("#msg").html("아이디를 입력한 후 중복 체크를 진행해주세요");
            $("#id").focus();
            return;
        }

        let params = { id:$("#id").val() };
        $.ajax({
            url: "${path}/user/idCheck",
            type: "post",
            dataType: "json",
            data: params,
            success:function(data) {
                let idPass = data.result;
                if(!idPass) {
                    $("#id_chk").val("no");
                    $("#msg").text("기존에 사용되고 있는 아이디입니다.");
                    $("#id").focus();
                } else if(idPass) {
                    $("#id_chk").val("yes");
                    $("#msg").text("사용 가능한 아이디입니다.");
                } else if(idPass == "") {
                    $("#msg").text("아이디가 확인되지 않았습니다. 다시 시도해주세요.")
                }
            },
            error:function(res) {
                alert("아이디 중복 확인에 실패했습니다. 잠시 후 다시 시도해주세요.");
                console.log(res.responseText);
            }
        })
    }
</script>
<script>
    function joinCheck(f) {
        if(f.pw.value != f.pw_chk.value) {
            $("#pw_msg").html("비밀번호와 비밀번호 확인이 서로 다릅니다");
            f.pw.focus();
            return false;
        }
        if(f.id_chk.value != "yes") {
            $("#msg").html("아이디 중복 체크를 진행해주세요");
            f.id.focus();
            return false;
        }
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
