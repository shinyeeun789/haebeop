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
	<title> FAQ </title>
	<style>
		.message-header {
			display: block!important;
			padding: 10px;
			cursor: pointer;
		}
		.message-header::before {
			content: 'Q';
			padding: 3px 6px;
			margin-right: 10px;
			border-radius: 50%;
			background-color: #fff;
			color: #333;
		}

		.message-body {
			padding: 10px;
			cursor: pointer;
			display: none;
		}

		.message-body::before {
			content: 'A';
			padding: 3px 6px;
			margin-right: 10px;
			border-radius: 50%;
			background-color: #027BFB;
			color: white;
		}
	</style>
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
						<h2> FAQ </h2>
						<div class="page_link">
							<a href="${path}/"> Home </a>
							<a href="${path}/faq/list"> FAQ </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section">
	<div class="container p-5" style="margin: 100px auto;">
		<div class="d-flex justify-content-end">
			<!-- 검색어 입력 부분 -->
			<form action="${path}/faq/list" method="get" class="w-50 mb-5">
				<div class="row">
					<div class="col mt-2">
						<select id="type" name="type" class="form-select">
							<option value="T"> 제목 </option>
							<option value="C"> 내용 </option>
						</select>
					</div>
					<div class="col-xl-8 col-lg-12 col-md-12 mt-2">
						<div class="input-group">
							<div class="input-group-prepend">

							</div>
							<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" autocomplete="off" aria-label="검색어를 입력해주세요" aria-describedby="button-addon2" value="${page.keyword}">
							<div class="input-group-append">
								<button class="btn btn-dark" type="submit" id="button-addon2"> 검색 </button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<ul class="faqlist mb-30" style="list-style: none;">
			<c:if test="${!empty faqList}">
				<c:forEach items="${faqList }" var="faq" varStatus="status">
					<li class="mb-10">
						<div class="message-header">${faq.question }</div>
						<div class="message-body mb-30" style="background-color: rgb(245,245,245);">${faq.answer }</div>
					</li>
				</c:forEach>
			</c:if>
			<c:if test="${empty faqList}">
				<div class="text-center"> FAQ가 없습니다. </div>
			</c:if>
		</ul>
		<script>
			$(document).ready(function(){
				$(".faqlist li").click(function(){
					$(this).find(".message-body").slideToggle(500);
					$(this).find(".message-header").toggleClass("on");
				});
			});
		</script>
	</div>
</section>
<!-- FAQ 영역 끝-->

<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>