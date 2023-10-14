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
                        <h2> Lecture Detail </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/lecture/list"> Lecture </a>
                            <a href="${path}/lecture/detail"> Detail </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="course_details_area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 course_details_left">
                <div class="main_image">
                    <img class="img-fluid" src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 이미지">
                </div>
                <div class="content_wrapper">
                    <h4 class="title"> 강의 소개 </h4>
                    <div class="content">
                        ${lecture.lcontent}
                    </div>

                    <h4 class="title"> 강사 소개 </h4>
                    <div class="content">
                        <div class="row">
                            <div class="col-4">
                                <img src="${path}/resources/upload/teacher/${teacher.saveFile}" alt="${teacher.tname} 이미지"
                                    style="width: 100%;" class="rounded">
                            </div>
                            <div class="col">
                                <ul>
                                    <li>
                                        <a class="d-flex justify-content-between">
                                            <p> 선생님 전화번호 </p>
                                            <span> ${teacher.ttel} </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="d-flex justify-content-between">
                                            <p> 선생님 이메일 </p>
                                            <span> ${teacher.temail} </span>
                                        </a>
                                    </li>
                                </ul>
                                <p> ${teacher.tcontent}</p>
                            </div>
                        </div>
                    </div>

                    <h4 class="title"> 커리큘럼 </h4>
                    <div class="content">
                        <ul class="course_list">
                            <li class="justify-content-between d-flex">
                                <p>Introduction Lesson</p>
                                <a class="btn primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Basics of HTML</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Getting Know about HTML</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Tags and Attributes</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Basics of CSS</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Getting Familiar with CSS</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Introduction to Bootstrap</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Responsive Design</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>
                            <li class="justify-content-between d-flex">
                                <p>Canvas in HTML 5</p>
                                <a class="primary-btn text-uppercase" href="#">View Details</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 right-contents">
                <ul>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 선생님 </p>
                            <span class="or"> ${lecture.tname} </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 가격 </p>
                            <span> ${lecture.lprice} 포인트 </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 수강인원 </p>
                            <span> ${lecture.maxStudent} 명 </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 타입 </p>
                            <span> ${lecture.state} </span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex">
                            <p> 수강기간 </p>
                            <span> ${lecture.sdate} ~ ${lecture.edate} </span>
                        </a>
                    </li>
                    <c:if test="${lecture.state eq 'off'}">
                        <li>
                            <a class="justify-content-between d-flex">
                                <p> 시작시간 </p>
                                <span>
                                    <fmt:parseDate value="${lecture.stime}" var="stime" pattern="HH:mm"/>
                                    <fmt:formatDate value="${stime}" pattern="HH:mm" />
                                </span>
                            </a>
                        </li>
                    </c:if>
                </ul>
                <a href="#" class="primary-btn2 text-uppercase enroll rounded-0 text-white"> 수강신청 </a>

                <h4 class="title">Reviews</h4>
                <div class="content">
                    <div class="review-top row pt-40">
                        <div class="col-lg-12">
                            <h6 class="mb-15">Provide Your Rating</h6>
                            <div class="d-flex flex-row reviews justify-content-between">
                                <span>Quality</span>
                                <div class="star">
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star"></i>
                                    <i class="ti-star"></i>
                                </div>
                                <span>Outstanding</span>
                            </div>
                            <div class="d-flex flex-row reviews justify-content-between">
                                <span>Puncuality</span>
                                <div class="star">
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star"></i>
                                    <i class="ti-star"></i>
                                </div>
                                <span>Outstanding</span>
                            </div>
                            <div class="d-flex flex-row reviews justify-content-between">
                                <span>Quality</span>
                                <div class="star">
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star checked"></i>
                                    <i class="ti-star"></i>
                                    <i class="ti-star"></i>
                                </div>
                                <span>Outstanding</span>
                            </div>
                        </div>
                    </div>
                    <div class="feedeback">
                        <h6>Your Feedback</h6>
                        <textarea name="feedback" class="form-control" cols="10" rows="10"></textarea>
                        <div class="mt-10 text-right">
                            <a href="#" class="primary-btn2 text-right rounded-0 text-white">Submit</a>
                        </div>
                    </div>
                    <div class="comments-area mb-30">
                        <div class="comment-list">
                            <div class="single-comment single-reviews justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="img/blog/c1.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">Emilly Blunt</a>
                                            <div class="star">
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star"></span>
                                                <span class="ti-star"></span>
                                            </div>
                                        </h5>
                                        <p class="comment">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                            eiusmod tempor incididunt ut labore et dolore.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comment-list">
                            <div class="single-comment single-reviews justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="img/blog/c2.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">Elsie Cunningham</a>
                                            <div class="star">
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star"></span>
                                                <span class="ti-star"></span>
                                            </div>
                                        </h5>
                                        <p class="comment">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                            eiusmod tempor incididunt ut labore et dolore.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comment-list">
                            <div class="single-comment single-reviews justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="img/blog/c3.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">Maria Luna</a>
                                            <div class="star">
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star checked"></span>
                                                <span class="ti-star"></span>
                                                <span class="ti-star"></span>
                                            </div>
                                        </h5>
                                        <p class="comment">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                            eiusmod tempor incididunt ut labore et dolore.
                                        </p>
                                    </div>
                                </div>
                            </div>
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