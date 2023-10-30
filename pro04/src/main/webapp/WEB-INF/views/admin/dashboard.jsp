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
    <title> Admin Dashboard </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>

    <!-- 관리자 페이지 CSS 적용 -->
    <link rel="stylesheet" href="${path}/resources/css/admin-style.css" />
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- banner -->
<section class="banner_area">
    <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="banner_content text-center">
                        <h2> Admin </h2>
                        <div class="page_link">
                            <a href="${path}/"> Home </a>
                            <a href="${path}/admin/dashboard"> Admin </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar p-4">
        <!-- Sidebar scroll-->
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-end">
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="fa-solid fa-x"></i>
                </div>
            </div>
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Home</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link active" href="${path}/admin/dashboard" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-chart-line"></i>
                            </span>
                            <span class="hide-menu"> Dashboard </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu"> Management </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                            <span>
                                <i class="ti ti-article"></i>
                            </span>
                            <span class="hide-menu"> 회원관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./ui-alerts.html" aria-expanded="false">
                            <span>
                                <i class="ti ti-alert-circle"></i>
                            </span>
                            <span class="hide-menu"> 고객지원관리 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu"> 강의관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/lectureMgmt" aria-expanded="false">
                            <span>
                                <i class="ti ti-article"></i>
                            </span>
                            <span class="hide-menu"> 강의목록 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/lectureInsert" aria-expanded="false">
                            <span>
                                <i class="ti ti-alert-circle"></i>
                            </span>
                            <span class="hide-menu"> 강의등록 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu"> 이벤트 관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                            <span>
                                <i class="ti ti-mood-happy"></i>
                            </span>
                            <span class="hide-menu"> 이벤트 관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                            <span>
                                <i class="ti ti-aperture"></i>
                            </span>
                            <span class="hide-menu"> 당첨자 추첨 </span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
        <!--  Header Start -->
        <header class="app-header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item d-block d-xl-none">
                        <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                            <i class="fa-solid fa-bars"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </header>
        <!--  Header End -->
        <div class="container-fluid">
            <!--  Row 1 -->
            <div class="row">
                <div class="col-lg-8 d-flex align-items-strech">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                                <div class="mb-3 mb-sm-0">
                                    <h5 class="card-title fw-semibold">Sales Overview</h5>
                                </div>
                                <div>
                                    <select class="form-select">
                                        <option value="1">March 2023</option>
                                        <option value="2">April 2023</option>
                                        <option value="3">May 2023</option>
                                        <option value="4">June 2023</option>
                                    </select>
                                </div>
                            </div>
                            <div id="chart"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Yearly Breakup -->
                            <div class="card overflow-hidden">
                                <div class="card-body p-4">
                                    <h5 class="card-title mb-9 fw-semibold">Yearly Breakup</h5>
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h4 class="fw-semibold mb-3">$36,358</h4>
                                            <div class="d-flex align-items-center mb-3">
                          <span
                                  class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-up-left text-success"></i>
                          </span>
                                                <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                                                <p class="fs-3 mb-0">last year</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <div class="me-4">
                                                    <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2">2023</span>
                                                </div>
                                                <div>
                                                    <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2">2023</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-center">
                                                <div id="breakup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <!-- Monthly Earnings -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="row alig n-items-start">
                                        <div class="col-8">
                                            <h5 class="card-title mb-9 fw-semibold"> Monthly Earnings </h5>
                                            <h4 class="fw-semibold mb-3">$6,820</h4>
                                            <div class="d-flex align-items-center pb-1">
                          <span
                                  class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-down-right text-danger"></i>
                          </span>
                                                <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                                                <p class="fs-3 mb-0">last year</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-end">
                                                <div
                                                        class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
                                                    <i class="ti ti-currency-dollar fs-6"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="earning"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-4">
                            <div class="mb-4">
                                <h5 class="card-title fw-semibold">Recent Transactions</h5>
                            </div>
                            <ul class="timeline-widget mb-0 position-relative mb-n5">
                                <li class="timeline-item d-flex position-relative overflow-hidden">
                                    <div class="timeline-time text-dark flex-shrink-0 text-end">09:30</div>
                                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                        <span class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                                        <span class="timeline-badge-border d-block flex-shrink-0"></span>
                                    </div>
                                    <div class="timeline-desc fs-3 text-dark mt-n1">Payment received from John Doe of $385.90</div>
                                </li>
                                <li class="timeline-item d-flex position-relative overflow-hidden">
                                    <div class="timeline-time text-dark flex-shrink-0 text-end">10:00 am</div>
                                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                        <span class="timeline-badge border-2 border border-info flex-shrink-0 my-8"></span>
                                        <span class="timeline-badge-border d-block flex-shrink-0"></span>
                                    </div>
                                    <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">New sale recorded <a
                                            href="javascript:void(0)" class="text-primary d-block fw-normal">#ML-3467</a>
                                    </div>
                                </li>
                                <li class="timeline-item d-flex position-relative overflow-hidden">
                                    <div class="timeline-time text-dark flex-shrink-0 text-end">12:00 am</div>
                                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                        <span class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
                                        <span class="timeline-badge-border d-block flex-shrink-0"></span>
                                    </div>
                                    <div class="timeline-desc fs-3 text-dark mt-n1">Payment was made of $64.95 to Michael</div>
                                </li>
                                <li class="timeline-item d-flex position-relative overflow-hidden">
                                    <div class="timeline-time text-dark flex-shrink-0 text-end">09:30 am</div>
                                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                        <span class="timeline-badge border-2 border border-warning flex-shrink-0 my-8"></span>
                                        <span class="timeline-badge-border d-block flex-shrink-0"></span>
                                    </div>
                                    <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">New sale recorded <a
                                            href="javascript:void(0)" class="text-primary d-block fw-normal">#ML-3467</a>
                                    </div>
                                </li>
                                <li class="timeline-item d-flex position-relative overflow-hidden">
                                    <div class="timeline-time text-dark flex-shrink-0 text-end">09:30 am</div>
                                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                        <span class="timeline-badge border-2 border border-danger flex-shrink-0 my-8"></span>
                                        <span class="timeline-badge-border d-block flex-shrink-0"></span>
                                    </div>
                                    <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">New arrival recorded
                                    </div>
                                </li>
                                <li class="timeline-item d-flex position-relative overflow-hidden">
                                    <div class="timeline-time text-dark flex-shrink-0 text-end">12:00 am</div>
                                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                        <span class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
                                    </div>
                                    <div class="timeline-desc fs-3 text-dark mt-n1">Payment Done</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-4">
                            <h5 class="card-title fw-semibold mb-4">Recent Transactions</h5>
                            <div class="table-responsive">
                                <table class="table text-nowrap mb-0 align-middle">
                                    <thead class="text-dark fs-4">
                                    <tr>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Id</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Assigned</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Name</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Priority</h6>
                                        </th>
                                        <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Budget</h6>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="border-bottom-0"><h6 class="fw-semibold mb-0">1</h6></td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1">Sunil Joshi</h6>
                                            <span class="fw-normal">Web Designer</span>
                                        </td>
                                        <td class="border-bottom-0">
                                            <p class="mb-0 fw-normal">Elite Admin</p>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="d-flex align-items-center gap-2">
                                                <span class="badge bg-primary rounded-3 fw-semibold">Low</span>
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0 fs-4">$3.9</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="border-bottom-0"><h6 class="fw-semibold mb-0">2</h6></td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1">Andrew McDownland</h6>
                                            <span class="fw-normal">Project Manager</span>
                                        </td>
                                        <td class="border-bottom-0">
                                            <p class="mb-0 fw-normal">Real Homes WP Theme</p>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="d-flex align-items-center gap-2">
                                                <span class="badge bg-secondary rounded-3 fw-semibold">Medium</span>
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0 fs-4">$24.5k</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="border-bottom-0"><h6 class="fw-semibold mb-0">3</h6></td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1">Christopher Jamil</h6>
                                            <span class="fw-normal">Project Manager</span>
                                        </td>
                                        <td class="border-bottom-0">
                                            <p class="mb-0 fw-normal">MedicalPro WP Theme</p>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="d-flex align-items-center gap-2">
                                                <span class="badge bg-danger rounded-3 fw-semibold">High</span>
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0 fs-4">$12.8k</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="border-bottom-0"><h6 class="fw-semibold mb-0">4</h6></td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-1">Nirav Joshi</h6>
                                            <span class="fw-normal">Frontend Engineer</span>
                                        </td>
                                        <td class="border-bottom-0">
                                            <p class="mb-0 fw-normal">Hosting Press HTML</p>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="d-flex align-items-center gap-2">
                                                <span class="badge bg-success rounded-3 fw-semibold">Critical</span>
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0 fs-4">$2.4k</h6>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-xl-3">
                    <div class="card overflow-hidden rounded-2">
                        <div class="position-relative">
                            <a href="javascript:void(0)"><img src="../assets/images/products/s4.jpg" class="card-img-top rounded-0" alt="..."></a>
                            <a href="javascript:void(0)" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
                        <div class="card-body pt-3 p-4">
                            <h6 class="fw-semibold fs-4">Boat Headphone</h6>
                            <div class="d-flex align-items-center justify-content-between">
                                <h6 class="fw-semibold fs-4 mb-0">$50 <span class="ms-2 fw-normal text-muted fs-3"><del>$65</del></span></h6>
                                <ul class="list-unstyled d-flex align-items-center mb-0">
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card overflow-hidden rounded-2">
                        <div class="position-relative">
                            <a href="javascript:void(0)"><img src="../assets/images/products/s5.jpg" class="card-img-top rounded-0" alt="..."></a>
                            <a href="javascript:void(0)" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
                        <div class="card-body pt-3 p-4">
                            <h6 class="fw-semibold fs-4">MacBook Air Pro</h6>
                            <div class="d-flex align-items-center justify-content-between">
                                <h6 class="fw-semibold fs-4 mb-0">$650 <span class="ms-2 fw-normal text-muted fs-3"><del>$900</del></span></h6>
                                <ul class="list-unstyled d-flex align-items-center mb-0">
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card overflow-hidden rounded-2">
                        <div class="position-relative">
                            <a href="javascript:void(0)"><img src="../assets/images/products/s7.jpg" class="card-img-top rounded-0" alt="..."></a>
                            <a href="javascript:void(0)" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
                        <div class="card-body pt-3 p-4">
                            <h6 class="fw-semibold fs-4">Red Valvet Dress</h6>
                            <div class="d-flex align-items-center justify-content-between">
                                <h6 class="fw-semibold fs-4 mb-0">$150 <span class="ms-2 fw-normal text-muted fs-3"><del>$200</del></span></h6>
                                <ul class="list-unstyled d-flex align-items-center mb-0">
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card overflow-hidden rounded-2">
                        <div class="position-relative">
                            <a href="javascript:void(0)"><img src="../assets/images/products/s11.jpg" class="card-img-top rounded-0" alt="..."></a>
                            <a href="javascript:void(0)" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
                        <div class="card-body pt-3 p-4">
                            <h6 class="fw-semibold fs-4">Cute Soft Teddybear</h6>
                            <div class="d-flex align-items-center justify-content-between">
                                <h6 class="fw-semibold fs-4 mb-0">$285 <span class="ms-2 fw-normal text-muted fs-3"><del>$345</del></span></h6>
                                <ul class="list-unstyled d-flex align-items-center mb-0">
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                    <li><a class="" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/js/sidebarmenu.js"></script>
<script src="${path}/resources/js/app.min.js"></script>
<script src="${path}/resources/vendors/apexcharts/dist/apexcharts.min.js"></script>
<script src="${path}/resources/vendors/simplebar/dist/simplebar.js"></script>
<script src="${path}/resources/js/dashboard.js"></script>
</body>
</html>
