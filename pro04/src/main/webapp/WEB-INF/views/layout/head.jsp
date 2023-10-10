<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!-- 파비콘 설정 -->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" type="image/png" href="${path1}/resources/images/tspoon_favicon.png">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${path1}/resources/images/tspoon_favicon.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${path1}/resources/images/tspoon_favicon.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="${path1}/resources/images/tspoon_favicon.png" sizes="64x64">

<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${path}/resources/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="${path}/resources/vendors/nice-select/css/nice-select.css" />
<link rel="stylesheet" href="${path}/resources/css/style.css" />

<!-- JS -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>

<!-- font awesome -->
<script src="https://kit.fontawesome.com/153ada4eea.js" crossorigin="anonymous"></script>

