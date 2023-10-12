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
    <title> 이벤트 </title>
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
                        <h2> Event Detail </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/event/list"> Event </a>
                            <a href="${path}/event/detail?eno=${detail.eno}&page=${curPage}"> Detail </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="blog_area single-post-area section_gap mb-30">
    <div class="container mb-30">
        <div class="row">
            <div class="col-lg-12 text-right">
                <a href="${path}/event/list?page=${curPage}"
                   class="btn btn-outline-dark"> 목록 </a>
                <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
                    <a href="${path}/event/edit?eno=${detail.eno}" class="btn btn-outline-dark"> 수정 </a>
                    <a href="${path}/event/delete?eno=${detail.eno}" class="btn btn-danger"> 삭제 </a>
                </c:if>
            </div>
            <div class="col-lg-12 posts-list">
                <div class="single-post row">
                    <div class="col-lg-3 col-md-3">
                        <div class="blog_info text-right">
                            <div class="post-tag">
                                <c:if test='${detail.status eq "1"}'>
                                    <span class="badge badge-pill badge-success">진행 중</span>
                                </c:if>
                                <c:if test='${detail.status eq "0"}'>
                                    <span class="badge badge-pill badge-danger">종료</span>
                                </c:if>
                            </div>
                            <ul class="blog_meta list">
                                <li>
                                    ${detail.sdate} ~ ${detail.edate} &nbsp; <i class="fa-regular fa-calendar"></i>
                                </li>
                                <li>${detail.cnt} Views &nbsp; <i class="fa-regular fa-eye"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2> ${detail.title} </h2>
                        <p>
                            ${detail.content}
                        </p>
                        <c:if test="${(detail.status eq '1') and (not empty sid)}">
                            <div class="text-center mt-100">
                                <input type="hidden" name="id" id="id" value="${sid}">
                                <input type="hidden" name="eno" id="eno" value="${detail.eno}">
                                <input type="hidden" name="app_chk" id="app_chk" value="no">
                                <button type="button" id="ck_btn" class="btn btn-primary btn-lg" onclick="appCheck()"> 참여하기 </button>
                            </div>
                            <script>
                                function appCheck() {
                                    var child;
                                    let params = { id: $("#id").val(), eno: $("#eno").val()};
                                    $.ajax({
                                        url: "${path}/apply/appCheck",
                                        type: "post",
                                        dataType: "json",
                                        data: params,
                                        success:function(data) {
                                            let appPass = data.result;
                                            if(!appPass) {
                                                alert("이미 신청한 회원입니다.");
                                            } else {
                                                child = window.open("${path}/apply/insert?eno="+$("#eno").val()+"&id="+$("#id").val(), "child", "width=700, height=360");
                                            }
                                        },
                                        error:function(res) {
                                            alert(" 잠시 후 다시 시도해주세요.");
                                            console.log(res.responseText);
                                        }
                                    })
                                }
                            </script>
                        </c:if>
                    </div>
                </div>
                <div class="navigation-area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                            <c:if test="${not empty prev}">
                                <div class="arrow">
                                    <a href="${path}/event/detail?eno=${prev.eno}&page=${curPage}" style="color: #333"><i class="fa-solid fa-angle-left"></i></a>
                                </div>
                            </c:if>
                            <div class="detials ml-5">
                                <p>이전 이벤트</p>
                                <c:if test="${empty prev}">
                                    <h4> 첫 번째 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty prev}">
                                    <a href="${path}/event/detail?eno=${prev.eno}&page=${curPage}">
                                        <h4>${prev.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <div class="detials mr-5">
                                <p>다음 이벤트</p>
                                <c:if test="${empty next}">
                                    <h4> 마지막 글입니다. </h4>
                                </c:if>
                                <c:if test="${not empty next}">
                                    <a href="${path}/event/detail?eno=${next.eno}&page=${curPage}">
                                        <h4>${next.title}</h4>
                                    </a>
                                </c:if>
                            </div>
                            <c:if test="${not empty next}">
                                <div class="arrow">
                                    <a href="${path}/event/detail?eno=${next.eno}&page=${curPage}" style="color: #333"><i class="fa-solid fa-angle-right"></i></a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>

</body>
</html>