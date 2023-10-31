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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
                <tr>
                    <td> 기본 결제금액 </td>
                    <td> 5000 원 </td>
                </tr>
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
                <form action="${path}/lecture/registerInsert" method="post">
                    <input type="hidden" id="lcode" name="lcode" value="${lecture.lcode}">
                    <input type="hidden" id="impUid" name="impUid">
                    <input type="hidden" id="merchantUid" name="merchantUid">
                    <input type="hidden" id="amount" name="amount">
                    <input type="hidden" id="applyNum" name="applyNum">
                    <c:if test="${lecture.lprice lt user.pt}">
                        <button type="button" class="btn btn-outline-dark btn-lg py-3 btn-block" id="pay"> 수강신청하기 </button>
                    </c:if>
                    <c:if test="${lecture.lprice gt user.pt}">
                        <button type="button" class="btn btn-outline-dark btn-lg py-3 btn-block" onclick="javascript: alert('보유한 포인트가 부족합니다.')" disabled> 수강신청하기 </button>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(() => {
        $("#pay").on("click", function() {
            let d = new Date();
            let date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
            let IMP = window.IMP;               // 생략가능
            IMP.init('imp73810516');            // 결제 API를 사용하기 위한 코드 입력!
            IMP.request_pay({		            //결제 요청
                pg: 'kicc',
                merchant_uid : '${lecture.lname}_' + date, //상점 거래 ID
                name :"${lecture.lname}",				    // 결제 명
                amount : 5000,				        // 결제금액
                buyer_email : "${user.email}",  // 구매자 email
                buyer_name : "${user.name}",		// 구매자 이름
                buyer_tel : "${user.tel}"		// 구매자 전화번호
            }, function(rsp){
                if(rsp.success){
                    $("#impUid").val(rsp.imp_uid);
                    $("#merchantUid").val(rsp.merchant_uid);
                    $("#amount").val(rsp.paid_amount);
                    $("#applyNum").val(rsp.apply_num);
                    document.forms[0].submit();
                } else{
                    alert('결제에 실패했습니다. 에러 내용: ' + rsp.error_msg);
                }
            });
        });
    });
</script>

<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
