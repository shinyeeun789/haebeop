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
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
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
                        <h2> Lecture </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/admin/dashboard"> Admin </a>
                            <a href="${path}/lecture/insert"> Insert </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="blog_area single-post-area section_gap">
    <div class="container shadow mb-30 p-5">
        <h1> 강의 등록하기 <i class="fa-solid fa-pencil"></i> </h1>
        <form action="${path}/admin/lectureInsert" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-3">
                    <div class="form-group mt-3">
                        <label for="scode"> 과목명 </label>
                        <select id="scode" name="scode" class="form-select">
                            <c:forEach var="subject" items="${subjects}">
                                <option value="${subject.scode}"> ${subject.sname} </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mt-3">
                        <label for="lname"> 강의명 </label>
                        <input type="text" name="lname" id="lname" class="form-control" autocomplete="off" required>
                    </div>
                </div>
            </div>
            <div class="form-group mt-3">
                <label for="lcontent"> 강의소개 </label>
                <textarea name="lcontent" id="lcontent" class="form-control" cols="30" rows="10" maxlength="1400"></textarea>
            </div>
            <div class="form-group mt-3">
                <label for="tcode"> 강사명 </label>
                <div class="input-group">
                    <input type="text" class="form-control" id="tname" placeholder="검색할 강사명을 입력해주세요" autocomplete="off" aria-label="검색할 강사명을 입력해주세요" aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-dark" type="button" id="button-addon2" onclick="findTeacher()"> 검색 </button>
                    </div>
                </div>
                <select class="custom-select" id="tcode" name="tcode" size="8">
                    <c:forEach var="teacher" items="${teachers}">
                        <option value="${teacher.tcode}" class="p-2"> ${teacher.tname} </option>
                    </c:forEach>
                </select>
                <script>
                    function findTeacher() {
                        let data = {"tname": $("#tname").val()}
                        $.ajax({
                            url: "${path}/admin/findTeacher",
                            data: data,
                            type: "post",
                            dataType: "json",
                            success: function(result) {
                                $("#tcode option").remove();
                                for(idx in result) {
                                    console.log(result[idx].tcode);
                                    $("#tcode").append("<option value='" + result[idx].tcode + "' class='p-2'>" + result[idx].tname + "</option>");
                                }
                                console.log(result);
                            },
                            error: function(res, text) {
                                alert("문제가 발생하였습니다. 잠시 후 다시 시도해주세요.")
                            }
                        });
                    }
                </script>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group mt-3">
                        <label for="lprice"> 강의 단가 </label>
                        <input type="number" min="1000" name="lprice" id="lprice" class="form-control">
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mt-3">
                        <div class="form-group mt-3">
                            <label for="maxStudent"> 수강인원 </label>
                            <input type="number" min="0" name="maxStudent" id="maxStudent" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group mt-3">
                        <label class="sdate">시작일</label>
                        <input type="date" name="sdate" id="sdate" class="form-control" placeholder="시작일을 지정해주세요" autocomplete="off" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mt-3">
                        <label class="edate">종료일</label>
                        <input type="date" name="edate" id="edate" class="form-control" placeholder="종료일을 지정해주세요" autocomplete="off" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mt-3">
                        <label class="edate">시작시간</label>
                        <input type="time" name="stime" id="stime" class="form-control" placeholder="시작시간을 지정해주세요" autocomplete="off" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group mt-3">
                        <label for="state"> 온라인/오프라인 여부 </label>
                        <select name="state" id="state" class="form-select">
                            <option value="on"> 온라인 </option>
                            <option value="off"> 오프라인 </option>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mt-3">
                        <label for="classroom"> 강의실 </label>
                        <input type="text" name="classroom" id="classroom" class="form-control" disabled>
                    </div>
                </div>
            </div>
            <div class="custom-file mt-3">
                <input type="file" name="upfile" class="custom-file-input" id="customFile" onchange="chk_file_type(this)" required>
                <label class="custom-file-label" id="file-label" for="customFile">Choose file</label>
            </div>
            <div class="text-right mt-3">
                <button type="submit" class="btn btn-dark"> 등록하기 </button>
            </div>
        </form>
    </div>
</section>

<script>
    $(document).ready(() => {
        $("#state").change(() => {
            if($("#state").val() == "off") {
                $("#classroom").attr("disabled", false);
            } else {
                $("#classroom").attr("disabled", true);
                $("#classroom").val("");
            }
        });

        // 템플릿과 부트스트랩 간의 충돌 해결
        $(".nice-select.custom-select").addClass("d-none");

        // 시작일 변경 시 종료일 처리
        $("#sdate").change(() => {
            $("#edate").prop("min", $("#sdate").val());
            // 종료일이 변경한 시작일보다 빠른 경우
            if($("#edate").val() < $("#sdate").val()) {
                $("#edate").val($("#sdate").val());
            }
        });
        // 종료일 변경 시 시작일 처리
        $("#edate").change(() => {
            $("#sdate").prop("max", $("#edate").val());
        });

        // 파일 선택 시 파일 이름이 나오도록 처리
        $("#customFile").on("change", () => {
            let fileName = '';
            let fileLength = $("#customFile")[0].files.length;
            if(fileLength > 1) {
                fileName = fileLength + "개의 파일";
            } else {
                fileName = $("#customFile").val().split("\\").pop();
            }
            $("#file-label").text("선택한 파일 : " + fileName);
        });
    });
</script>
<script>
    function chk_file_type(obj) {
        let file_kind = obj.value.lastIndexOf('.');
        let file_name = obj.value.substring(file_kind+1,obj.length);
        let file_type = file_name.toLowerCase();

        let check_file_type=['jpg','gif','png','jpeg','bmp'];

        if(check_file_type.indexOf(file_type) == -1){
            alert('이미지 파일만 선택할 수 있습니다.');
            let parent_Obj = obj.parentNode
            let node = parent_Obj.replaceChild(obj.cloneNode(true),obj);
            return false;
        }
    }
</script>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>