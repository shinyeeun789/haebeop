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
                            <a href="${path}/lecture/list"> Lecture </a>
                            <a href="${path}/lecture/detail"> Detail </a>
                            <a href="${path}/lecture/registerInsert"> Register </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="course_details_area section_gap">
    <div class="container">
        <div class="p-3 p-lg-5 border bg-white">
            <table class="table site-block-order-table mb-5">
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <tr height="250">
                    <td> ${lecture.lname} </td>
                    <td> ${lecture.lprice} 포인트 </td>
                </tr>
                <tr class="table-dark">
                    <td> 보유한 포인트 </td>
                    <td> ${user.pt} 포인트 </td>
                </tr>
                <c:if test="${lecture.lprice gt user.pt}">
                    <tr class="table-danger">
                        <td class="text-black font-weight-bold"><strong> 총 금액 </strong></td>
                        <td class="text-black font-weight-bold" style="color: red;"><strong> ${lecture.lprice} 포인트 </strong></td>
                    </tr>
                </c:if>
                <c:if test="${lecture.lprice lt user.pt}">
                    <tr class="table-warning">
                        <td class="text-black font-weight-bold"><strong> 총 금액 </strong></td>
                        <td class="text-black font-weight-bold"><strong> ${lecture.lprice} 포인트 </strong></td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <div class="form-group">
                <c:if test="${lecture.lprice lt user.pt}">
                    <button class="btn btn-outline-dark btn-lg py-3 btn-block" onclick="window.location='${path}/lecture/registerInsert?lcode=${lecture.lcode}'"> 수강신청하기 </button>
                </c:if>
                <c:if test="${lecture.lprice gt user.pt}">
                    <button class="btn btn-outline-dark btn-lg py-3 btn-block" onclick="javascript: alert('보유한 포인트가 부족합니다.')" disabled> 수강신청하기 </button>
                </c:if>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
