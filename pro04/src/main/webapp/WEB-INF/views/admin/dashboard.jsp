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
    <title> Dashboard </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 CSS 적용 -->
    <link rel="stylesheet" href="${path}/resources/css/admin-style.css" />
    <link rel="stylesheet" href="${path}/resources/vendors/simplebar/dist/simplebar.css" />
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
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-end">
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="fa-solid fa-x"></i>
                </div>
            </div>
            <nav class="sidebar-nav" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
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
                        <span class="hide-menu"> Management </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/userMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-user"></i>
                            </span>
                            <span class="hide-menu"> 회원관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/qnaMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-circle-question"></i>
                            </span>
                            <span class="hide-menu"> 고객지원관리 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> 강의관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/lectureMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-photo-film"></i>
                            </span>
                            <span class="hide-menu"> 강의목록 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/closeLectureMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-circle-xmark"></i>
                            </span>
                            <span class="hide-menu"> 폐강관리 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/lectureInsert" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-file-video"></i>
                            </span>
                            <span class="hide-menu"> 강의등록 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> 강사관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/teacherMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-table-list"></i>
                            </span>
                            <span class="hide-menu"> 강사목록 </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/teacherInsert" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-chalkboard-user"></i>
                            </span>
                            <span class="hide-menu"> 강사정보 등록 </span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <span class="hide-menu"> 이벤트 관리 </span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="${path}/admin/eventMgmt" aria-expanded="false">
                            <span>
                                <i class="fa-solid fa-gifts"></i>
                            </span>
                            <span class="hide-menu"> 이벤트 관리 </span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!--  Sidebar End -->
    <div class="body-wrapper">
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 d-flex align-items-strech">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="d-block mb-9">
                                <div class="mb-3 mb-sm-0">
                                    <h5 class="card-title fw-semibold"> 월별 회원수 추이 </h5>
                                </div>
                            </div>
                            <div id="chart"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card overflow-hidden">
                                <div class="card-body p-4">
                                    <h5 class="card-title mb-9 fw-semibold">Yearly Point Earnings</h5>
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h4 class="fw-semibold mb-3" id="profit"></h4>
                                            <div class="d-flex align-items-center mb-3">
                                                <span class="me-1 rounded-circle round-20 d-flex align-items-center justify-content-center" id="yearIcon"></span>
                                                <p class="text-dark me-1 fs-3 mb-0" id="profitDiff"></p>
                                                <p class="fs-3 mb-0">last year</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <div class="me-4">
                                                    <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2 profitYear"></span>
                                                </div>
                                                <div>
                                                    <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2 profitYear"></span>
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
                            <div class="card">
                                <div class="card-body">
                                    <div class="row alig n-items-start">
                                        <div class="col-8">
                                            <h5 class="card-title mb-9 fw-semibold"> Monthly Payment Earnings </h5>
                                            <h4 class="fw-semibold mb-3" id="payProfitReport"></h4>
                                            <div class="d-flex align-items-center pb-1">
                                                <span class="me-2 rounded-circle round-20 d-flex align-items-center justify-content-center" id="payProfit"></span>
                                                <p class="text-dark me-1 fs-3 mb-0" id="payProfitDiff"></p>
                                                <p class="fs-3 mb-0">last month</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-end">
                                                <div class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
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
            <div class="card w-100">
                <div class="card-body p-4">
                    <h5 class="card-title fw-semibold mb-4"> 방문 횟수 순위 </h5>
                    <div class="table-responsive">
                        <table class="table text-nowrap mb-0 align-middle">
                            <thead class="text-dark fs-4">
                            <tr>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0"> 랭킹 </h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0"> 아이디 </h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0"> 이름 </h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0"> 방문횟수 </h6>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="rank" items="${visitRank}" varStatus="status">
                                <tr>
                                    <td class="border-bottom-0">
                                        <div class="d-flex align-items-center gap-2">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${status.index + 1}위</span>
                                        </div>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-1">${rank.id}</h6>
                                        <span class="fw-normal">${rank.email}</span>
                                    </td>
                                    <td class="border-bottom-0">
                                        <p class="mb-0 fw-normal">${rank.name}</p>
                                    </td>
                                    <td class="border-bottom-0">
                                        <h6 class="fw-semibold mb-0 fs-4">${rank.visited}번</h6>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="lecture" items="${popularLectures}">
                    <div class="col-sm-6 col-xl-3">
                        <div class="card overflow-hidden rounded-2">
                            <div class="position-relative">
                                <a href="javascript:location.href='${path}/lecture/detail?lcode=${lecture.lcode}'"><img src="${path}/resources/upload/lecture/${lecture.saveFile}" class="card-img-top rounded-0" alt="${lecture.lname} 이미지"></a>
                                <a href="javascript:location.href='${path}/lecture/detail?lcode=${lecture.lcode}'" class="bg-primary rounded-circle p-3 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3"><i class="fa-solid fa-info"></i></a>
                            </div>
                            <div class="card-body pt-3 p-4">
                                <h6 class="fw-semibold fs-4">${lecture.lname}</h6>
                                <div class="d-flex align-items-center justify-content-between">
                                    <h6 class="fw-semibold fs-4 mb-0"> ${lecture.lprice} 원 </h6>
                                    <ul class="list-unstyled d-flex align-items-center mb-0">
                                        <c:forEach begin="1" end="${lecture.star}">
                                            <li><a class="me-1" href="javascript:void(0)"><i class="fa-solid fa-star" style="color: #FFDD85;"></i></a></li>
                                        </c:forEach>
                                        <c:forEach begin="1" end="${5 - lecture.star}">
                                            <li><a class="me-1" href="javascript:void(0)"><i class="fa-regular fa-star" style="color: #FFDD85;"></i></a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(() => {
        $.ajax({
            url: "${path}/admin/userCntList",
            type: "post",
            dataType: "json",
            success: function(data) {
                const labelList = [];
                const teaCnt = [];
                const stuCnt = [];
                for(let i=0; i<data.length; i++) {
                    let temp = data[i];
                    labelList[i] = temp.label;
                    teaCnt[i] = temp.teaCnt;
                    stuCnt[i] = temp.stuCnt;
                }
                let chart = {
                    series: [
                        { name: "월별 회원가입한 학생 수", data: stuCnt },
                        { name: "월별 회원가입한 선생님 수", data: teaCnt },
                    ],
                    chart: {
                        type: "bar",
                        height: 345,
                        offsetX: -15,
                        toolbar: { show: true },
                        foreColor: "#adb0bb",
                        fontFamily: 'inherit',
                        sparkline: { enabled: false },
                    },
                    colors: ["#5D87FF", "#49BEFF"],
                    plotOptions: {
                        bar: {
                            horizontal: false,
                            columnWidth: "35%",
                            borderRadius: [6],
                            borderRadiusApplication: 'end',
                            borderRadiusWhenStacked: 'all'
                        },
                    },
                    markers: { size: 0 },
                    dataLabels: {
                        enabled: false,
                    },
                    legend: {
                        show: false,
                    },
                    grid: {
                        borderColor: "rgba(0,0,0,0.1)",
                        strokeDashArray: 3,
                        xaxis: {
                            lines: {
                                show: false,
                            },
                        },
                    },
                    xaxis: {
                        type: "category",
                        categories: labelList,
                        labels: {
                            style: { cssClass: "grey--text lighten-2--text fill-color" },
                        },
                    },
                    yaxis: {
                        show: true,
                        min: 0,
                        max: 10,
                        tickAmount: 4,
                        labels: {
                            style: {
                                cssClass: "grey--text lighten-2--text fill-color",
                            },
                        },
                    },
                    stroke: {
                        show: true,
                        width: 3,
                        lineCap: "butt",
                        colors: ["transparent"],
                    },
                    tooltip: { theme: "light" },
                    responsive: [
                        {
                            breakpoint: 600,
                            options: {
                                plotOptions: {
                                    bar: {
                                        borderRadius: 3,
                                    }
                                },
                            }
                        }
                    ]
                };
                let chartTag = new ApexCharts(document.querySelector("#chart"), chart);
                chartTag.render();
            },
            error: function (err) {
                console.log(err);
            }
        });
        $.ajax({
            url: "${path}/admin/profitYearReport",
            type: "post",
            dataType: "json",
            success: function(data) {
                const labelList = [];
                const profitList = [];
                for(let i=0; i<data.length; i++) {
                    let temp = data[i];
                    labelList[i] = temp.label;
                    profitList[i] = temp.profit;
                    $(".profitYear").eq(i).text(labelList[i]);
                }
                $("#profit").text(profitList[1] + " 포인트");
                let result = profitList[1] == 0 ? -100 : (profitList[1] - profitList[0]) / profitList[1] * 100;
                $("#profitDiff").text(result + "%");
                if(result >= 0) {
                    $("#yearIcon").html('<i class="ti ti-arrow-up-left text-success"></i>');
                    $("#yearIcon").addClass('bg-light-success');
                } else {
                    $("#yearIcon").html('<i class="ti ti-arrow-down-right text-danger"></i>');
                    $("#yearIcon").addClass('bg-light-danger');
                }
                var breakup = {
                    color: "#5D87FF",
                    series: profitList,
                    labels: labelList,
                    chart: {
                        width: 180,
                        type: "donut",
                        fontFamily: "Plus Jakarta Sans', sans-serif",
                        foreColor: "#5D87FF",
                    },
                    plotOptions: {
                        pie: {
                            startAngle: 0,
                            endAngle: 360,
                            donut: {
                                size: '75%',
                            },
                        },
                    },
                    stroke: {
                        show: false,
                    },

                    dataLabels: {
                        enabled: false,
                    },

                    legend: {
                        show: false,
                    },
                    colors: ["#5D87FF", "#ecf2ff", "#F9F9FD"],

                    responsive: [
                        {
                            breakpoint: 991,
                            options: {
                                chart: {
                                    width: 150,
                                },
                            },
                        },
                    ],
                    tooltip: {
                        theme: "dark",
                        fillSeriesColor: false,
                    },
                };

                var chart = new ApexCharts(document.querySelector("#breakup"), breakup);
                chart.render();
            },
            error: function(err) {
                console.log(err);
            }
        });
        $.ajax({
            url: "${path}/admin/profitPayReport",
            type: "post",
            dataType: "json",
            success: function(data) {
                const labelList = [];
                const profitList = [];
                for(let i=0; i<data.length; i++) {
                    let temp = data[i];
                    labelList[i] = temp.label;
                    profitList[i] = temp.profit;
                }
                $("#payProfitReport").text(profitList[1] + " 원");
                let result = profitList[1] == 0 ? -100 : (profitList[1] - profitList[0]) / profitList[1] * 100;
                $("#payProfitDiff").text(result + "%");
                if(result >= 0) {
                    $("#payProfit").html('<i class="ti ti-arrow-up-left text-success"></i>');
                    $("#payProfit").addClass('bg-light-success');
                } else {
                    $("#payProfit").html('<i class="ti ti-arrow-down-right text-danger"></i>');
                    $("#payProfit").addClass('bg-light-danger');
                }
                var earning = {
                    chart: {
                        id: "sparkline3",
                        type: "area",
                        height: 60,
                        sparkline: {
                            enabled: true,
                        },
                        group: "sparklines",
                        fontFamily: "Plus Jakarta Sans', sans-serif",
                        foreColor: "#adb0bb",
                    },
                    series: [
                        {
                            name: "Earnings",
                            color: "#49BEFF",
                            data: profitList,
                        },
                    ],
                    stroke: {
                        curve: "smooth",
                        width: 2,
                    },
                    fill: {
                        colors: ["#f3feff"],
                        type: "solid",
                        opacity: 0.05,
                    },

                    markers: {
                        size: 0,
                    },
                    tooltip: {
                        theme: "dark",
                        fixed: {
                            enabled: true,
                            position: "right",
                        },
                        x: {
                            show: false,
                        },
                    },
                };
                new ApexCharts(document.querySelector("#earning"), earning).render();
            },
            error: function(err) {
                console.log(err);
            }
        });
    });
</script>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/js/sidebarmenu.js"></script>
<script src="${path}/resources/js/app.min.js"></script>
<script src="${path}/resources/vendors/apexcharts/dist/apexcharts.min.js"></script>
<script src="${path}/resources/vendors/simplebar/dist/simplebar.js"></script>

</body>
</html>