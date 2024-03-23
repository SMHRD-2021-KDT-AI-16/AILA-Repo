<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>리뷰분석|품목선택</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../resource/assets/vendors/feather/feather.css">
    <link rel="stylesheet" href="../resource/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../resource/assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../resource/assets/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="../resource/assets/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="../resource/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../resource/assets/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../resource/assets/images/favicon.png" />
    <style>
        @media (min-width: 992px){
            .food{
                width: 20%;
            }
        }
        
        .food img{
            border-radius: 15px;
        }
       	
       	.image-with-space {
		margin-right: 13px; /* 그림의 오른쪽에 20px의 공백 추가 */
		}
    </style>
</head>
<body>
    <div class="container-scroller">
        <!-- Navbar -->
        <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                <div class="me-3">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button"
                        data-bs-toggle="minimize">
                        <span class="icon-menu"></span>
                    </button>
                </div>
                <div>
                    <a class="navbar-brand brand-logo" href="Trend.do">
                        <img src="../resource/assets/images/logo_h.png" alt="logo" />
                    </a>
                    <a class="navbar-brand brand-logo-mini" href="Trend.do">
                        <img src="../resource/assets/images/logo_mini.png" alt="logo" />
                    </a>
                </div>
            </div>
            <!-- Navbar content -->
            <div class="navbar-menu-wrapper d-flex align-items-top border-bottom">
                <ul class="navbar-nav">
                    <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                        <h1 class="welcome-text"><span class="text-black fw-bold">리뷰 분석</span></h1>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item d-none d-lg-block">
                        <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
                            <span class="input-group-addon input-group-prepend border-right">
                                <span class="icon-calendar input-group-text calendar-icon"></span>
                            </span>
                            <input type="text" class="form-control">
                        </div>
                    </li>
                    <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                        <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <img class="img-xs" src="../resource/assets/images/mggoon_logo.png" alt="Company logo"> </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                            <div class="dropdown-header text-center">
                                <img class="img-md" src="../resource/assets/images/mggoon_logo.png" alt="Company logo">
                                <p class="mb-1 mt-3 font-weight-semibold">맛꾼푸드</p>
                            </div>
                            <a href="Logout.do" class="dropdown-item"><i
                                    class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>로그아웃</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- End Navbar -->

        <div class="container-fluid page-body-wrapper">
            <!-- Settings Panel -->
            <div class="theme-setting-wrapper">
                <div id="settings-trigger"><i class="ti-settings"></i></div>
                <div id="theme-settings" class="settings-panel">
                    <i class="settings-close ti-close"></i>
                    <p class="settings-heading">SIDEBAR SKINS</p>
                    <div class="sidebar-bg-options selected" id="sidebar-light-theme">
                        <div class="img-ss rounded-circle bg-light border me-3"></div>Light
                    </div>
                    <div class="sidebar-bg-options" id="sidebar-dark-theme">
                        <div class="img-ss rounded-circle bg-dark border me-3"></div>Dark
                    </div>
                    <p class="settings-heading mt-2">HEADER SKINS</p>
                    <div class="color-tiles mx-0 px-4">
                        <div class="tiles success"></div>
                        <div class="tiles warning"></div>
                        <div class="tiles danger"></div>
                        <div class="tiles info"></div>
                        <div class="tiles dark"></div>
                        <div class="tiles default"></div>
                    </div>
                </div>
            </div>
            <!-- End Settings Panel -->

            <!-- Sidebar -->
                        <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Trend.do">
                            <i class="mdi mdi-chart-line menu-icon"></i>
                            <span class="menu-title">트렌드</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Goreview_products.do">
                            <img class="image-with-space" src="../resource/assets/images/review.png">
                            <span class="menu-title">리뷰 분석</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="News.do">
                            <img class="image-with-space" src="../resource/assets/images/news.png">
                            <span class="menu-title">뉴스</span>
                        </a>
                    </li>

                </ul>
            </nav>
            <!-- End Sidebar -->

            <!-- Main Content -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row flex-grow">
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title  card-title-dash">고구마</h4>
                                            </div>
                                            <a href="Review.do?food=고구마&review_source=쿠팡">
                                                <img src="../resource/assets/images/goguma.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">김치</h4>
                                            </div>
                                            <a href="Review.do?food=김치&review_source=쿠팡">
                                                <img src="../resource/assets/images/gimchi.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">망고</h4>
                                            </div>
                                                <img src="../resource/assets/images/mango.png" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">구운란</h4>
                                            </div>
                                                <img src="../resource/assets/images/egg.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">감자탕</h4>
                                            </div>
                                                <img src="../resource/assets/images/bonesoup.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">오렌지</h4>
                                            </div>
                                                <img src="../resource/assets/images/orange.png" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">새꼬막</h4>
                                            </div>
                                                <img src="../resource/assets/images/telltale.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">오징어</h4>
                                            </div>
                                                <img src="../resource/assets/images/Squid.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">토마토</h4>
                                            </div>
                                                <img src="../resource/assets/images/tomato.png" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 food grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body card-rounded">
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <h4 class="card-title card-title-dash">참외</h4>
                                            </div>
                                                <img src="../resource/assets/images/yellowmelon.jpg" style="width: 100%;" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a
                                    href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin
                                    template</a> from BootstrapDash.</span>
                            <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Copyright © 2021.
                                All rights reserved.</span>
                        </div>
                    </footer>
                    <!-- End Footer -->
                </div>
            </div>
            <!-- End Main Content -->
        </div>
    </div>
    
    <!-- Scripts -->
    <script src="../resource/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../resource/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="../resource/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="../resource/assets/js/off-canvas.js"></script>
    <script src="../resource/assets/js/hoverable-collapse.js"></script>
    <script src="../resource/assets/js/template.js"></script>
    <script src="../resource/assets/js/settings.js"></script>
    <script src="../resource/assets/js/todolist.js"></script>
    <script src="../resource/assets/js/chart.js"></script>
    <!-- End Scripts -->
</body>

</html>
