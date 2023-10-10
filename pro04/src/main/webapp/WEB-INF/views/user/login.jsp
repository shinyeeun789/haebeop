<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 로그인 </title>
    <jsp:include page="../layout/head.jsp" />
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
    <div class="container">
        
    </div>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
