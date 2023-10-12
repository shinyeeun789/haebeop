<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 신청</title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
</head>
<body>
<div class="container" style="padding: 20px">
    <form name="child" action="${path}/apply/insert" method="post">
        <div class="text-center">
            <h3 class="mt-25"> 이벤트 신청 </h3>
        </div>
        <div class="form-group">
            <label for="name"> 이름 </label>
            <input type="text" name="name" id="name" placeholder="이름 입력" maxlength="10" class="form-control" autocomplete="off" required>
        </div>
        <div class="form-group">
            <label for="tel"> 전화번호 </label>
            <input type="tel" name="tel" id="tel" placeholder="000-0000-0000 형태로 입력해주세요" maxlength="13" class="form-control"
                   pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" autocomplete="off" required>
        </div>

        <input type="hidden" name="id" id="id" value="${sid}">
        <input type="hidden" id="eno" name="eno" value="${event.eno} ">
        <input type="submit" class="btn btn-primary" style="width: 100%" value="신청하기">
    </form>
</div>
</body>
</html>