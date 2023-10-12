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

<div class="container ">
    <div class="text-center mt-25">
        <h3> 이벤트에 참여되었습니다. </h3>
        <button class="btn btn-dark mt-25" onclick="check()">닫기</button>
    </div>
    <script>
        function check(){ window.close(); }
    </script>
</div>
</body>
</html>